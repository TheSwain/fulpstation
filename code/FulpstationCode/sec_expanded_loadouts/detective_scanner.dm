#define HEALTH_SCANNER_RANGE 1


/obj/item/detective_scanner/proc/healthscan(mob/user, mob/living/M)
	if(isliving(user) && (user.incapacitated() || user.eye_blind))
		return
	scanning = TRUE
	add_log("<B>[station_time_timestamp()][get_timestamp()] - [M]: Biological Analysis:</B>", FALSE)
	var/list/damage_report = list()
	//Damage specifics
	var/oxy_loss = M.getOxyLoss()
	var/tox_loss = M.getToxLoss()
	var/fire_loss = M.getFireLoss()
	var/brute_loss = M.getBruteLoss()
	var/mob_status = (M.stat == DEAD ? "<span class='alert'><b>Deceased</b></span>" : "<b>[round(M.health/M.maxHealth,0.01)*100] % healthy</b>")

	if(HAS_TRAIT(M, TRAIT_FAKEDEATH) && !advanced)
		mob_status = "<span class='alert'><b>Deceased</b></span>"
		oxy_loss = max(rand(1, 40), oxy_loss, (300 - (tox_loss + fire_loss + brute_loss))) // Random oxygen loss

	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.undergoing_cardiac_arrest() && H.stat != DEAD)
			damage_report += "<span class='alert'>Subject suffering from heart attack: Apply defibrillation or other electric shock immediately!</span><br>"

	damage_report += "<span class='info'>Analyzing results for [M]:\n\tOverall status: [mob_status]</span><br>"

	// Damage descriptions
	if(brute_loss > 10)
		damage_report += "\t<span class='alert'>[brute_loss > 50 ? "Severe" : "Minor"] tissue damage detected.</span><br>"
	if(fire_loss > 10)
		damage_report += "\t<span class='alert'>[fire_loss > 50 ? "Severe" : "Minor"] burn damage detected.</span><br>"
	if(oxy_loss > 10)
		damage_report += "\t<span class='info'><span class='alert'>[oxy_loss > 50 ? "Severe" : "Minor"] oxygen deprivation detected.</span><br>"
	if(tox_loss > 10)
		damage_report += "\t<span class='alert'>[tox_loss > 50 ? "Severe" : "Minor"] amount of toxin damage detected.</span><br>"
	if(M.getStaminaLoss())
		damage_report += "\t<span class='alert'>Subject appears to be suffering from fatigue.</span><br>"
		if(advanced)
			damage_report +=  "\t<span class='info'>Fatigue Level: [M.getStaminaLoss()]%.</span><br>"
	if (M.getCloneLoss())
		damage_report +=  "\t<span class='alert'>Subject appears to have [M.getCloneLoss() > 30 ? "Severe" : "Minor"] cellular damage.</span><br>"
		if(advanced)
			damage_report +=  "\t<span class='info'>Cellular Damage Level: [M.getCloneLoss()].</span><br>"
	if (!M.getorgan(/obj/item/organ/brain))
		damage_report +=  "\t<span class='alert'>Subject lacks a brain.</span><br>"
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		if(LAZYLEN(C.get_traumas()))
			var/list/trauma_text = list()
			for(var/datum/brain_trauma/B in C.get_traumas())
				var/trauma_desc = ""
				switch(B.resilience)
					if(TRAUMA_RESILIENCE_SURGERY)
						trauma_desc += "severe "
					if(TRAUMA_RESILIENCE_LOBOTOMY)
						trauma_desc += "deep-rooted "
					if(TRAUMA_RESILIENCE_MAGIC, TRAUMA_RESILIENCE_ABSOLUTE)
						trauma_desc += "permanent "
				trauma_desc += B.scan_desc
				trauma_text += trauma_desc
			damage_report +=  "\t<span class='alert'>Cerebral traumas detected: subject appears to be suffering from [english_list(trauma_text)].</span><br>"
		if(C.roundstart_quirks.len)
			damage_report += "\t<span class='info'>Subject has the following physiological traits: [C.get_trait_string()].</span><br>"
	if(advanced)
		damage_report +=  "\t<span class='info'>Brain Activity Level: [(200 - M.getOrganLoss(ORGAN_SLOT_BRAIN))/2]%.</span><br>"

	if (M.radiation)
		damage_report +=  "\t<span class='alert'>Subject is irradiated.</span><br>"
		if(advanced)
			damage_report +=  "\t<span class='info'>Radiation Level: [M.radiation]%.</span><br>"

	if(advanced && M.hallucinating())
		damage_report += "\t<span class='info'>Subject is hallucinating.</span><br>"

	//Eyes and ears
	if(advanced)
		if(iscarbon(M))
			var/mob/living/carbon/C = M
			var/obj/item/organ/ears/ears = C.getorganslot(ORGAN_SLOT_EARS)
			damage_report +=  "\t<span class='info'><b>==EAR STATUS==</b></span>"
			if(istype(ears))
				var/healthy = TRUE
				if(HAS_TRAIT_FROM(C, TRAIT_DEAF, GENETIC_MUTATION))
					healthy = FALSE
					damage_report += "\t<span class='alert'>Subject is genetically deaf.</span><br>"
				else if(HAS_TRAIT(C, TRAIT_DEAF))
					healthy = FALSE
					damage_report += "\t<span class='alert'>Subject is deaf.</span><br>"
				else
					if(ears.damage)
						damage_report += "\t<span class='alert'>Subject has [ears.damage > ears.maxHealth ? "permanent ": "temporary "]hearing damage.</span><br>"
						healthy = FALSE
					if(ears.deaf)
						damage_report += "\t<span class='alert'>Subject is [ears.damage > ears.maxHealth ? "permanently ": "temporarily "] deaf.</span><br>"
						healthy = FALSE
				if(healthy)
					damage_report += "\t<span class='info'>Healthy.</span><br>"
			else
				damage_report += "\t<span class='alert'>Subject does not have ears.</span><br>"
			var/obj/item/organ/eyes/eyes = C.getorganslot(ORGAN_SLOT_EYES)
			damage_report +=  "\t<span class='info'><b>==EYE STATUS==</b></span>"
			if(istype(eyes))
				var/healthy = TRUE
				if(HAS_TRAIT(C, TRAIT_BLIND))
					damage_report +=  "\t<span class='alert'>Subject is blind.</span><br>"
					healthy = FALSE
				if(HAS_TRAIT(C, TRAIT_NEARSIGHT))
					damage_report += "\t<span class='alert'>Subject is nearsighted.</span><br>"
					healthy = FALSE
				if(eyes.damage > 30)
					damage_report +=  "\t<span class='alert'>Subject has severe eye damage.</span><br>"
					healthy = FALSE
				else if(eyes.damage > 20)
					damage_report += "\t<span class='alert'>Subject has significant eye damage.</span><br>"
					healthy = FALSE
				else if(eyes.damage)
					damage_report += "\t<span class='alert'>Subject has minor eye damage.</span><br>"
					healthy = FALSE
				if(healthy)
					damage_report += "\t<span class='info'>Healthy.</span><br>"
			else
				damage_report +=  "\t<span class='alert'>Subject does not have eyes.</span><br>"

	// Body part damage report
	if(iscarbon(M))
		var/mob/living/carbon/C = M
		var/list/damaged = C.get_damaged_bodyparts(1,1)
		if(length(damaged)>0 || oxy_loss>0 || tox_loss>0 || fire_loss>0)
			damage_report += "<table style='margin-left:33px'><tr><font face='Verdana'>\
							<td style='width: 90px;'><font color='#0000CC'>Damage:</font></td>\
							<td style='width: 55px;'><font color='red'><b>Brute</b></font></td>\
							<td style='width: 45px;'><font color='orange'><b>Burn</b></font></td>\
							<td style='width: 45px;'><font color='green'><b>Toxin</b></font></td>\
							<td style='width: 90px;'><font color='purple'><b>Suffocation</b></font></td></tr>\

							<tr><td><font color='#0000CC'>Overall:</font></td>\
							<td><font color='red'>[brute_loss]</font></td>\
							<td><font color='orange'>[fire_loss]</font></td>\
							<td><font color='green'>[tox_loss]</font></td>\
							<td><font color='purple'>[oxy_loss]</font></td></tr>"

			for(var/o in damaged)
				var/obj/item/bodypart/org = o //head, left arm, right arm, etc.
				damage_report += "<tr><td><font color='#0000CC'>[capitalize(org.name)]:</font></td>\
								<td><font color='red'>[(org.brute_dam > 0) ? "[org.brute_dam]" : "0"]</font></td>\
								<td><font color='orange'>[(org.burn_dam > 0) ? "[org.burn_dam]" : "0"]</font></td></tr>"
			damage_report += "</table><br>"

	//Organ damages report
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/minor_damage
		var/major_damage
		var/max_damage
		var/report_organs = FALSE

		//Piece together the lists to be reported
		for(var/O in H.internal_organs)
			var/obj/item/organ/organ = O
			if(organ.organ_flags & ORGAN_FAILING)
				report_organs = TRUE	//if we report one organ, we report all organs, even if the lists are empty, just for consistency
				if(max_damage)
					max_damage += ", "	//prelude the organ if we've already reported an organ
					max_damage += organ.name	//this just slaps the organ name into the string of text
				else
					max_damage = "\t<span class='alert'>Non-Functional Organs: "	//our initial statement
					max_damage += organ.name
			else if(organ.damage > organ.high_threshold)
				report_organs = TRUE
				if(major_damage)
					major_damage += ", "
					major_damage += organ.name
				else
					major_damage = "\t<span class='info'>Severely Damaged Organs: "
					major_damage += organ.name
			else if(organ.damage > organ.low_threshold)
				report_organs = TRUE
				if(minor_damage)
					minor_damage += ", "
					minor_damage += organ.name
				else
					minor_damage = "\t<span class='info'>Mildly Damaged Organs: "
					minor_damage += organ.name

		if(report_organs)	//we either finish the list, or set it to be empty if no organs were reported in that category
			if(!max_damage)
				max_damage = "\t<span class='alert'>Non-Functional Organs: </span>"
			else
				max_damage += "</span>"
			if(!major_damage)
				major_damage = "\t<span class='info'>Severely Damaged Organs: </span>"
			else
				major_damage += "</span>"
			if(!minor_damage)
				minor_damage = "\t<span class='info'>Mildly Damaged Organs: </span>"
			else
				minor_damage += "</span>"
			damage_report += "[minor_damage]<br>"
			damage_report += "[major_damage]<br>"
			damage_report += "[max_damage]<br>"

		//Genetic damage
		if(advanced && H.has_dna())
			damage_report += "\t<span class='info'>Genetic Stability: [H.dna.stability]%.</span><br>"

	// Species and body temperature
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/datum/species/S = H.dna.species
		var/mutant = FALSE
		if (H.dna.check_mutation(HULK))
			mutant = TRUE
		else if (S.mutantlungs != initial(S.mutantlungs))
			mutant = TRUE
		else if (S.mutant_brain != initial(S.mutant_brain))
			mutant = TRUE
		else if (S.mutant_heart != initial(S.mutant_heart))
			mutant = TRUE
		else if (S.mutanteyes != initial(S.mutanteyes))
			mutant = TRUE
		else if (S.mutantears != initial(S.mutantears))
			mutant = TRUE
		else if (S.mutanthands != initial(S.mutanthands))
			mutant = TRUE
		else if (S.mutanttongue != initial(S.mutanttongue))
			mutant = TRUE
		else if (S.mutanttail != initial(S.mutanttail))
			mutant = TRUE
		else if (S.mutantliver != initial(S.mutantliver))
			mutant = TRUE
		else if (S.mutantstomach != initial(S.mutantstomach))
			mutant = TRUE
		else if (S.flying_species != initial(S.flying_species))
			mutant = TRUE

		damage_report += "<span class='info'>Species: [S.name][mutant ? "-derived mutant" : ""]</span><br>"
	damage_report += "<span class='info'>Body temperature: [round(M.bodytemperature-T0C,0.1)] &deg;C ([round(M.bodytemperature*1.8-459.67,0.1)] &deg;F)</span><br>"

	// Time of death
	if(M.tod && (M.stat == DEAD || ((HAS_TRAIT(M, TRAIT_FAKEDEATH)) && !advanced)))
		add_log(user, "<span class='info'>Time of Death: [M.tod]</span>")
		var/tdelta = round(world.time - M.timeofdeath)
		if(tdelta < (DEFIB_TIME_LIMIT * 10))
			damage_report += "<span class='alert'><b>Subject died [DisplayTimeText(tdelta)] ago, defibrillation may be possible!</b></span><br>"

	for(var/thing in M.diseases)
		var/datum/disease/D = thing
		if(!(D.visibility_flags & HIDDEN_SCANNER))
			damage_report += "<span class='alert'><b>Warning: [D.form] detected</b>\nName: [D.name].\nType: [D.spread_text].\nStage: [D.stage]/[D.max_stages].\nPossible Cure: [D.cure_text]</span><br>"

	// Blood Level
	if(M.has_dna())
		var/mob/living/carbon/C = M
		var/blood_id = C.get_blood_id()
		if(blood_id)
			if(ishuman(C))
				var/mob/living/carbon/human/H = C
				if(H.bleed_rate)
					damage_report += "<span class='alert'><b>Subject is bleeding!</b></span><br>"
			var/blood_percent =  round((C.blood_volume / BLOOD_VOLUME_NORMAL)*100)   // FULPSTATION: Vamps don't show blood % when using Masquerade.
			var/blood_type = C.dna.blood_type
			if(blood_id != /datum/reagent/blood)//special blood substance
				var/datum/reagent/R = GLOB.chemical_reagents_list[blood_id]
				if(R)
					blood_type = R.name
				else
					blood_type = blood_id
			if(C.blood_volume <= BLOOD_VOLUME_SAFE && C.blood_volume > BLOOD_VOLUME_OKAY)
				damage_report += "<span class='alert'>Blood level: LOW [blood_percent] %, [C.blood_volume] cl,</span> <span class='info'>type: [blood_type]</span><br>"
			else if(C.blood_volume <= BLOOD_VOLUME_OKAY)
				damage_report +="<span class='alert'>Blood level: <b>CRITICAL [blood_percent] %</b>, [C.blood_volume] cl,</span> <span class='info'>type: [blood_type]</span><br>"
			else
				damage_report += "<span class='info'>Blood level: [blood_percent] %, [C.blood_volume] cl, type: [blood_type]</span><br>"

		var/cyberimp_detect
		for(var/obj/item/organ/cyberimp/CI in C.internal_organs)
			if(CI.status == ORGAN_ROBOTIC && !CI.syndicate_implant)
				damage_report += "[C.name] is modified with a [CI.name].<br>"
		if(cyberimp_detect)
			damage_report += "<span class='notice'>Detected cybernetic modifications:</span><br>"
			damage_report += "<span class='notice'>[cyberimp_detect]</span><br>"
	SEND_SIGNAL(M, COMSIG_NANITE_SCAN, user, FALSE)

	add_log(damage_report.Join())
	scanning = FALSE

/obj/item/detective_scanner/proc/chemscan(mob/living/user, atom/A)
	if(istype(A))
		if(A.reagents)
			scanning = TRUE
			var/list/reagent_report = list()
			add_log("<B>[station_time_timestamp()][get_timestamp()] - [A]: Chemical Analysis:</B>", FALSE)
			if(A.reagents.reagent_list.len)
				reagent_report += "<span class='notice'>Subject contains the following reagents:<br></span>"
				for(var/datum/reagent/R in A.reagents.reagent_list)
					reagent_report += "<span class='notice'>[round(R.volume, 0.001)] units of [R.name][R.overdosed == 1 && istype(A, /mob/living) ? "</span> - <span class='boldannounce'>OVERDOSING</span>" : ".</span>"]<br>"
			else
				reagent_report += "<span class='notice'>Subject contains no reagents.<br></span>"
			if(istype(A, /mob/living))
				var/mob/living/M = A
				if(M.reagents.addiction_list.len)
					reagent_report +="<span class='boldannounce'>Subject is addicted to the following reagents:<br></span>"
					for(var/datum/reagent/R in M.reagents.addiction_list)
						reagent_report += "<span class='alert'>[R.name]</span><br>"
				else
					reagent_report += "<span class='notice'>Subject is not addicted to any reagents.<br></span>"
			add_log(reagent_report.Join())
			scanning = FALSE

/obj/item/detective_scanner/proc/attack_mode(atom/A, mob/user, afterattack)
	if(!mode)
		scan(A, user)
		return

	if(get_dist(A, user) > HEALTH_SCANNER_RANGE)
		return
	if(!istype(A, /mob/living))
		to_chat(user, "<span class='warning'>Invalid target for bio-chem analyzer mode.</span>")
		return
	if(!istype(user, /mob/living/carbon/human))
		to_chat(user, "<span class='warning'>Invalid user for bio-chem analyzer mode.</span>")
		return

	healthscan(user, A)
	chemscan(user, A)


/obj/item/detective_scanner/proc/self_mode(mob/user)
	if(log.len && !scanning)
		scanning = 1
		to_chat(user, "<span class='notice'>Printing report, please wait...</span>")
		addtimer(CALLBACK(src, .proc/PrintReport), 30)
	else
		to_chat(user, "<span class='notice'>The scanner has no logs or is in use.</span>")



/obj/item/detective_scanner/verb/toggle_mode()
	set name = "Change Forensic Scanner Mode"
	set category = "Object"
	set src in view(1)

	if(!isliving(usr))
		to_chat(usr, "<span class='warning'>You can't do that!</span>")
		return

	if(usr.incapacitated())
		return

	mode = !mode
	to_chat(usr, "You change [src] to [mode ? "biochem" : "forensic"] mode.")
	update_icon()


/obj/item/detective_scanner/update_icon()
	icon_state = "forensicnew-[mode]"
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()
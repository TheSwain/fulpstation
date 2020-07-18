/datum/antagonist/traitor/infiltrator
	name = "Infiltrator"
	roundend_category = "syndicate infiltrators"
	show_to_ghosts = TRUE
	special_role = "Syndicate Infiltrator"
	job_rank = "Syndicate Infiltrator"
	should_give_codewords = FALSE //They already get syndicate comms for this.
	var/hijack_chance = 15 //Some corps are more stealthier, but standard chance is high.
	var/dagd_chance = 5 //Why would you infiltrate the station and die here?
	var/kill_chance = 70

/datum/antagonist/traitor/infiltrator/on_gain()
	equip_agent()
	move_to_spawnpoint()
	SSticker.mode.traitors += owner
	if(give_objectives)
		forge_infiltrator_objectives()
	finalize_traitor()
	//Copy from basic antag_datum.dm because ..() would call standard traitor shit and we don't need it
	if(!owner)
		CRASH("[src] ran on_gain() without a mind")
	if(!owner.current)
		CRASH("[src] ran on_gain() on a mind without a mob")
	if(!silent)
		greet()
	apply_innate_effects()
	give_antag_moodies()
	if(is_banned(owner.current) && replace_banned)
		replace_banned_player()
	else if(owner.current.client?.holder && (CONFIG_GET(flag/auto_deadmin_antagonists) || owner.current.client.prefs?.toggles & DEADMIN_ANTAGONIST))
		owner.current.client.holder.auto_deadmin()
	if(owner.current.stat != DEAD)
		owner.current.add_to_current_living_antags()

/datum/antagonist/traitor/infiltrator/proc/move_to_spawnpoint()
	var/list/spawn_locs = list()
	for(var/obj/effect/landmark/carpspawn/L in GLOB.landmarks_list)
		spawn_locs += L.loc
	owner.current.forceMove(pick(spawn_locs))
	owner.current.reagents.add_reagent(/datum/reagent/medicine/oxandrolone, 10) //Fool-Proof: They won't just die in space due to thermal regulator being turned off.
	owner.current.reagents.add_reagent(/datum/reagent/medicine/leporazine, 30)

/datum/antagonist/traitor/infiltrator/proc/equip_agent()
	var/mob/living/carbon/human/H = owner.current

	owner.special_role = special_role
	H.grant_language(/datum/language/codespeak, TRUE, TRUE, LANGUAGE_MIND)
	if(prob(18))
		owner.assigned_role = "Cybersun Infiltrator"
		hijack_chance = 5 //We don't like this loud mess of hijack here in Cybersun
		dagd_chance = 0 //Dying on a mission? Disgusting!
		if(isplasmaman(owner.current))
			H.equipOutfit(/datum/outfit/infiltrator/cybersun/plasmaman)
		else
			H.equipOutfit(/datum/outfit/infiltrator/cybersun)
	else if(prob(12)) //Quite rare, for higher hijack chance and epic gear
		owner.assigned_role = "Gorlex Infiltrator"
		hijack_chance = 20 //That's why we're here.
		if(isplasmaman(owner.current))
			H.equipOutfit(/datum/outfit/infiltrator/gorlex/plasmaman)
		else
			H.equipOutfit(/datum/outfit/infiltrator/gorlex)
	else if(prob(2)) //The rarest of them all - 100% DAGD.
		owner.assigned_role = "Tiger Co. Infiltrator"
		hijack_chance = 0 //Pffft, we don't need your SHITTY SHUTTLE, HA!
		kill_chance = 100 //RIP AND TEAR
		dagd_chance = 100 //UNTIL IT'S DONE
		if(isplasmaman(owner.current))
			H.equipOutfit(/datum/outfit/infiltrator/tiger/plasmaman)
		else
			H.equipOutfit(/datum/outfit/infiltrator/tiger)
	else
		owner.assigned_role = special_role
		if(isplasmaman(owner.current))
			H.equipOutfit(/datum/outfit/infiltrator/plasmaman)
		else
			H.equipOutfit(/datum/outfit/infiltrator)

/datum/antagonist/traitor/infiltrator/greet()
	to_chat(owner.current, "<span class='alertsyndie'>You are the [owner.assigned_role].</span>")
	owner.announce_objectives()
	if(should_give_codewords)
		give_codewords()
	if(owner.assigned_role == "Cybersun Infiltrator")
		to_chat(owner.current, "<span class='alertwarning'>As a member of our group remember: Your actions may cause unwanted attention, attempt to stay as stealthy as possible!</span>")
	if(owner.assigned_role == "Gorlex Infiltrator")
		to_chat(owner.current, "<span class='alertwarning'>As a member of our group remember: While stealth is optional, you still have to finish your mission even if it means going with a fight!</span>")
	if(owner.assigned_role == "Tiger Co. Infiltrator")
		to_chat(owner.current, "<span class='alertwarning'>As a member of our group remember: Everyone is your enemy, even the other infiltrators!</span>")
	if(owner.assigned_role != "Tiger Co. Infiltrator")
		to_chat(owner.current, "<span class='red'>Keep in mind that Tiger Co. Agents are our mutual enemies, don't try to cooperate with them!</span>")

/datum/antagonist/traitor/infiltrator/proc/forge_infiltrator_objectives()
	var/is_hijacker = FALSE
	if (GLOB.joined_player_list.len >= 50) //Requires a big pop for Hijack
		is_hijacker = prob(hijack_chance)
	var/martyr_chance = prob(dagd_chance)
	var/objective_count = is_hijacker
	var/toa = CONFIG_GET(number/traitor_objectives_amount) + 1 //Additional objective.
	for(var/i = objective_count, i < toa, i++)
		forge_single_inf_objective()

	if(is_hijacker && objective_count <= toa)
		if (!(locate(/datum/objective/hijack) in objectives))
			var/datum/objective/hijack/hijack_objective = new
			hijack_objective.owner = owner
			add_objective(hijack_objective)
			return


	var/martyr_compatibility = 1
	for(var/datum/objective/O in objectives)
		if(!O.martyr_compatible)
			martyr_compatibility = 0
			break

	if(martyr_compatibility && martyr_chance)
		var/datum/objective/martyr/martyr_objective = new
		martyr_objective.owner = owner
		add_objective(martyr_objective)
		return

	else
		if(!(locate(/datum/objective/survive) in objectives)) //Infiltrators don't have to escape on shuttle.
			var/datum/objective/survive/survive_objective = new
			survive_objective.owner = owner
			add_objective(survive_objective)
			return

/datum/antagonist/traitor/infiltrator/proc/forge_single_inf_objective()
	.=1
	if(prob(kill_chance))
		var/list/active_ais = active_ais()
		if(active_ais.len && prob(100/GLOB.joined_player_list.len))
			var/datum/objective/destroy/destroy_objective = new
			destroy_objective.owner = owner
			destroy_objective.find_target()
			add_objective(destroy_objective)
		else if(prob(30))
			if(owner.assigned_role == "Tiger Co. Infiltrator")
				var/datum/objective/assassinate/kill_objective = new
				kill_objective.owner = owner
				kill_objective.find_target_by_role("Syndicate Infiltrator", role_type=TRUE,invert=FALSE) //KILL THOSE IDIOTS TOO!
				add_objective(kill_objective)
			else
				var/datum/objective/maroon/maroon_objective = new
				maroon_objective.owner = owner
				maroon_objective.find_target_by_role("Syndicate Infiltrator", role_type=TRUE,invert=TRUE)
				add_objective(maroon_objective)
		else
			var/datum/objective/assassinate/kill_objective = new
			kill_objective.owner = owner
			kill_objective.find_target()
			add_objective(kill_objective)
	else
		if(prob(15) && !(locate(/datum/objective/download) in objectives) && !(owner.assigned_role in list("Research Director", "Scientist", "Roboticist")))
			var/datum/objective/download/download_objective = new
			download_objective.owner = owner
			download_objective.gen_amount_goal()
			add_objective(download_objective)
		else
			var/datum/objective/steal/steal_objective = new
			steal_objective.owner = owner
			steal_objective.find_target()
			add_objective(steal_objective)

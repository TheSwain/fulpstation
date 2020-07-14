/datum/antagonist/traitor/infiltrator
	name = "Infiltrator"
	roundend_category = "syndicate infiltrators"
	show_to_ghosts = TRUE
	special_role = "Syndicate Infiltrator"
	job_rank = "Syndicate Infiltrator"

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
	owner.current.reagents.add_reagent(/datum/reagent/medicine/leporazine, 20)

/datum/antagonist/traitor/infiltrator/proc/equip_agent()
	var/mob/living/carbon/human/H = owner.current

	owner.special_role = special_role
	H.grant_language(/datum/language/codespeak, TRUE, TRUE, LANGUAGE_MIND)
	H.faction |= ROLE_SYNDICATE
	if (owner.assigned_role == "Cybersun Infiltrator")
		if(isplasmaman(owner.current))
			H.equipOutfit(/datum/outfit/infiltrator/cybersun/plasmaman)
		else
			H.equipOutfit(/datum/outfit/infiltrator/cybersun)
	else
		if(isplasmaman(owner.current))
			H.equipOutfit(/datum/outfit/infiltrator/plasmaman)
		else
			H.equipOutfit(/datum/outfit/infiltrator)

/datum/antagonist/traitor/infiltrator/greet()
	to_chat(owner.current, "<span class='alertsyndie'>You are the [owner.assigned_role].</span>")
	owner.announce_objectives()
	if(should_give_codewords)
		give_codewords()

/datum/antagonist/traitor/infiltrator/proc/forge_infiltrator_objectives()
	var/is_hijacker = FALSE
	if (GLOB.joined_player_list.len >= 50) //Requires a big pop for Hijack
		is_hijacker = prob(15) //A bit higher Hijack chance.
	var/martyr_chance = prob(10) //Lower DAGD chance.
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
	if(prob(70)) //Less thefts, more blood!
		var/list/active_ais = active_ais()
		if(active_ais.len && prob(100/GLOB.joined_player_list.len))
			var/datum/objective/destroy/destroy_objective = new
			destroy_objective.owner = owner
			destroy_objective.find_target()
			add_objective(destroy_objective)
		else if(prob(30))
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

/datum/antagonist/traitor/infiltrator
	name = "Infiltrator"
	roundend_category = "syndicate infiltrators"
	show_to_ghosts = TRUE
	special_role = "Syndicate Infiltrator"
	job_rank = "Syndicate Infiltrator"

/datum/antagonist/traitor/infiltrator/on_gain()
	move_to_spawnpoint()
	SSticker.mode.traitors += owner
	owner.special_role = special_role
	if(give_objectives)
		forge_infiltrator_objectives()
	var/mob/living/carbon/human/H = owner.current
	H.equipOutfit(/datum/outfit/infiltrator)
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
	owner.current.reagents.add_reagent(/datum/reagent/medicine/omnizine, 10) //Fool-Proof: They won't just die in space due to internals being turned off.
	owner.current.reagents.add_reagent(/datum/reagent/medicine/salbutamol, 10)

/datum/antagonist/traitor/infiltrator/proc/forge_infiltrator_objectives()
	var/is_hijacker = FALSE
	if (GLOB.joined_player_list.len >= 50) //Requires a big pop for Hijack
		is_hijacker = prob(15) //A bit higher Hijack chance.
	var/martyr_chance = prob(10) //Lower DAGD chance.
	var/objective_count = is_hijacker
	var/toa = CONFIG_GET(number/traitor_objectives_amount) + 1 //Additional objective.
	for(var/i = objective_count, i < toa, i++)
		forge_single_objective()

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

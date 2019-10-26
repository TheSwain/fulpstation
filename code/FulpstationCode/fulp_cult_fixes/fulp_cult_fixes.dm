#define CULT_ZLEVEL_SACRIFICE_CHECK_COOLDOWN 30 SECONDS

/obj/screen/alert/bloodsense/proc/check_cult_target_zlevel(mob/living/carbon/human/target, datum/objective/sacrifice/sac_objective)
	if(cult_sacrifice_zlevel_check_cooldown) //Don't check if we're on cooldown.
		return
	if(!target) //Sanity check
		return
	var/turf/T = get_turf(target)
	if(!is_station_level(T.z)) //Reset if target is not on station so powergaming assholes can't play keep away by hiding in the gateway/mining.
		reset_sacrifice_objectives(target, sac_objective) //Fulp Cult Fixes PR by Surrealistik Oct 2019


/obj/screen/alert/bloodsense/proc/reset_sacrifice_objectives(mob/living/carbon/human/old_target, datum/objective/sacrifice/sac_objective)
	if(!sac_objective || !sac_objective.check_completion()) //Sanity check; either the sacrifice objective is done or there was no sacrifice objective.
		return FALSE

	//SAC OBJECTIVE , todo: move this to objective internals
	var/list/target_candidates = list()

	for(var/mob/living/carbon/human/player in GLOB.player_list)
		if(player.mind && !player.mind.has_antag_datum(/datum/antagonist/cult) && !is_convertable_to_cult(player) && player.stat != DEAD && is_station_level(get_turf(player)))
			target_candidates += player.mind

	if(target_candidates.len == 0)
		message_admins("Cult Sacrifice: Could not find unconvertible target, checking for convertible target.")
		for(var/mob/living/carbon/human/player in GLOB.player_list)
			if(player.mind && !player.mind.has_antag_datum(/datum/antagonist/cult) && player.stat != DEAD)
				target_candidates += player.mind
	listclearnulls(target_candidates)
	if(LAZYLEN(target_candidates))
		sac_objective.target = pick(target_candidates)
		sac_objective.update_explanation_text()

		var/datum/job/sacjob = SSjob.GetJob(sac_objective.target.assigned_role)
		var/datum/preferences/sacface = sac_objective.target.current.client.prefs
		var/icon/reshape = get_flat_human_icon(null, sacjob, sacface, list(SOUTH))
		reshape.Shift(SOUTH, 4)
		reshape.Shift(EAST, 1)
		reshape.Crop(7,4,26,31)
		reshape.Crop(-5,-3,26,30)
		sac_objective.sac_image = reshape

	else
		message_admins("Cult Sacrifice: Could not find new unconvertible or convertible target for cult sacrifice. Old cult target retained. Check again in [CULT_ZLEVEL_SACRIFICE_CHECK_COOLDOWN * 0.1] seconds.")
		cult_sacrifice_zlevel_check_cooldown = TRUE
		addtimer(CALLBACK(src, /obj/screen/alert/bloodsense.proc/cult_sacrifice_cooldown_end), CULT_ZLEVEL_SACRIFICE_CHECK_COOLDOWN)

/obj/screen/alert/bloodsense/proc/cult_sacrifice_cooldown_end()
	if(cult_sacrifice_zlevel_check_cooldown)
		cult_sacrifice_zlevel_check_cooldown = FALSE
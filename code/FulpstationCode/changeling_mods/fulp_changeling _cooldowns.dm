#define CRYOSTING_COOLDOWN 10 SECONDS

/datum/action/changeling/sting/cryo/proc/cryosting_cooldown_begins(mob/user)
	if(on_cooldown) //Sanity check.
		if(user)
			to_chat(user, "<span class='notice'>Your cryostinger is depleted. It will be ready in <b>[DisplayTimeText(next_cryosting - world.time)]</b>.</span>")
		return FALSE
	on_cooldown = TRUE
	next_cryosting = world.time + CRYOSTING_COOLDOWN
	button_icon_state = "sting_cryo_0"
	addtimer(CALLBACK(src, /datum/action/changeling/sting/cryo.proc/cryosting_cooldown_ends, user), CRYOSTING_COOLDOWN)
	if(user)
		user.update_action_buttons()
		to_chat(user, "<span class='notice'>Your cryostinger is depleted. It will be ready in <b>[DisplayTimeText(next_cryosting - world.time)]</b>.</span>")
	return TRUE

/datum/action/changeling/sting/cryo/proc/cryosting_cooldown_ends(mob/user)
	if(!on_cooldown) //Sanity check.
		return
	on_cooldown = FALSE
	button_icon_state = "sting_cryo_1"
	if(user)
		user.update_action_buttons()
		to_chat(user, "<span class='notice'>Your cryosting is replenished. <b>It is ready.</b></span>")
		user.playsound_local(get_turf(user), 'sound/ambience/antag/ling_aler.ogg', 30, FALSE, pressure_affected = FALSE)
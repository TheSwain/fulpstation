/datum/action/changeling/sting/cryo/proc/cryosting_cooldown_begins(mob/user)
	if(user)
		to_chat(user, "<span class='notice'>Your cryosting's chemical reserves are depleted. It will be ready in [last_cryosting + recharge_cooldown - world.time] seconds.</span>")
	if(on_cooldown) //Sanity check.
		return FALSE
	on_cooldown = TRUE
	button_icon_state = "sting_cryo_0"
	addtimer(CALLBACK(src, /datum/action/changeling/sting/cryo.proc/cryosting_cooldown_ends, user), recharge_cooldown)
	return TRUE

/datum/action/changeling/sting/cryo/proc/cryosting_cooldown_ends(mob/user)
	if(!on_cooldown) //Sanity check.
		return
	on_cooldown = FALSE
	if(user)
		to_chat(user, "<span class='notice'>Your cryosting's chemical reserves are replenished. It is ready.</span>")
	button_icon_state = "sting_cryo_1"
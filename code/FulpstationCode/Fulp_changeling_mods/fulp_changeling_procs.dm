/datum/action/changeling/sting/proc/fulp_sting_feedback(mob/user, mob/target)
	if(!target)
		return FALSE
	var/message = "<span class='notice'>We stealthily sting [target.name].</span>"

	if(istype(src, /datum/action/changeling/sting/cryo))
		to_chat(target, "<span class='warning'>You feel an icy cold prick.</span>")
		message = "<span class='notice'>We sting [target.name] with our cryostinger.</span>"

	else if(target.mind && target.mind.has_antag_datum(/datum/antagonist/changeling))
		to_chat(target, "<span class='warning'>You feel a tiny prick.</span>")

	to_chat(user, "[message]")

	return TRUE
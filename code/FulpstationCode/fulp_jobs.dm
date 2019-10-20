/datum/job/fulp
	var/id_icon = 'icons/obj/card.dmi'	// Overlay on your ID - moved from fulp_integration
	var/hud_icon = 'icons/mob/hud.dmi'	// Sec Huds see this
	var/fulp_spawn = null //give it a room's type path to spawn there


/datum/job/fulp/after_spawn(mob/living/H, mob/M, latejoin)
	if(!latejoin && fulp_spawn)
		var/turf/T = get_fulp_spawn(fulp_spawn)
		H.Move(T)


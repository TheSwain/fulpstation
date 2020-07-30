/obj/structure/resindoor/resin
	name = "resin door"
	density = TRUE
	anchored = TRUE
	opacity = TRUE
	icon = 'icons/Fulpicons/resin.dmi'
	icon_state = "resin"
	layer = CLOSED_DOOR_LAYER
	max_integrity = 200

	var/door_opened = FALSE //if it's open or not.
	var/isSwitchingStates = FALSE //don't try to change stats if we're already opening
	var/close_delay = 100 
	var/openSound = 'sound/effects/stonedoor_openclose.ogg'
	var/closeSound = 'sound/effects/stonedoor_openclose.ogg'

/obj/structure/resindoor/Initialize()
	. = ..()

	air_update_turf(TRUE)

/obj/structure/resindoor/Move()
	var/turf/T = loc
	. = ..()
	move_update_air(T)

/obj/structure/resindoor/resin/attack_alien(mob/living/carbon/alien/user)
	if(user.a_intent == INTENT_HARM)
		qdel(src)
	else
		return TryToSwitchState(user)

//clicking on resin doors attacks them, or opens them without harm intent
/obj/structure/resindoor/resin/attack_alien(mob/living/carbon/alien/user)
	var/turf/cur_loc = user.loc
	if(!istype(cur_loc))
		return FALSE //Some basic logic here
	if(user.a_intent != INTENT_HARM)
		TryToSwitchState(user)
		return TRUE

/obj/structure/resindoor/CanAllowThrough(atom/movable/mover, turf/target)
	. = ..()
	if(istype(mover, /obj/effect/beam))
		return !opacity

/obj/structure/resindoor/proc/TryToSwitchState(atom/user)
	if(isSwitchingStates || !anchored)
		return
	if(isliving(user))
		var/mob/living/M = user
		if(world.time - M.last_bumped <= 60)
			return //NOTE do we really need that?
		if(M.client)
			if(iscarbon(M))
				var/mob/living/carbon/C = M
				if(!C.handcuffed)
					SwitchState()
			else
				SwitchState()
	else if(ismecha(user))
		SwitchState()

/obj/structure/resindoor/proc/SwitchState()
	if(door_opened)
		Close()
	else
		Open()

/obj/structure/resindoor/proc/Open()
	isSwitchingStates = TRUE
	playsound(src, openSound, 100, TRUE)
	set_opacity(FALSE)
	flick("[initial(icon_state)]opening",src)
	sleep(10)
	density = FALSE
	door_opened = TRUE
	layer = OPEN_DOOR_LAYER
	air_update_turf(1)
	update_icon()
	isSwitchingStates = FALSE

	if(close_delay != -1)
		addtimer(CALLBACK(src, .proc/Close), close_delay)

/obj/structure/resindoor/proc/Close()
	if(isSwitchingStates || !door_opened)
		return
	var/turf/T = get_turf(src)
	for(var/mob/living/L in T)
		return
	isSwitchingStates = TRUE
	playsound(src, closeSound, 100, TRUE)
	flick("[initial(icon_state)]closing",src)
	sleep(10)
	density = TRUE
	set_opacity(TRUE)
	door_opened = FALSE
	layer = initial(layer)
	air_update_turf(1)
	update_icon()
	isSwitchingStates = FALSE

/obj/structure/resindoor/update_icon_state()
	icon_state = "[initial(icon_state)][door_opened ? "open":""]"
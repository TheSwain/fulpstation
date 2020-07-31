/obj/structure/resindoor
	name = "resin door"
	density = TRUE
	anchored = TRUE
	opacity = TRUE
	CanAtmosPass = ATMOS_PASS_NO
	icon = 'icons/Fulpicons/resin.dmi'
	icon_state = "resin"
	layer = CLOSED_DOOR_LAYER
	max_integrity = 200

	var/door_opened = FALSE //if it's open or not.
	var/isSwitchingStates = FALSE //don't try to change stats if we're already opening

	var/close_delay = -1 //-1 if does not auto close.
	var/openSound = 'sound/Fulpsounds/alien_resin_move1.ogg'
	var/closeSound = 'sound/Fulpsounds/alien_resin_move1.ogg'

	var/sheetType = /obj/item/stack/sheet/metal //what we're made of
	var/sheetAmount = 0 //how much we drop when deconstructed
	close_delay = 20

/obj/structure/resindoor/Initialize()
	. = ..()

	air_update_turf(TRUE)

/obj/structure/resindoor/Move()
	var/turf/T = loc
	. = ..()
	move_update_air(T)

/obj/structure/resindoor/Bumped(atom/movable/AM)
	if(isalien(usr))
		if(!door_opened)
			TryToSwitchState(AM)
		return ..()

/obj/structure/resindoor/attack_paw(mob/user)
	return attack_hand(user)

/obj/structure/resindoor/attack_hand(mob/user)
	if(user.getorgan(/obj/item/organ/alien/plasmavessel))
		TryToSwitchState(user)
	return ..()

//clicking on resin doors attacks them, or opens them without harm intent
/obj/structure/resindoor/attack_alien(mob/living/carbon/alien/user)
	if(user.a_intent != INTENT_HARM)
		TryToSwitchState(user)
	else
		return ..()

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
	CanAtmosPass = ATMOS_PASS_NO
	door_opened = FALSE
	layer = initial(layer)
	air_update_turf(1)
	update_icon()
	isSwitchingStates = FALSE

/obj/structure/resindoor/update_icon_state()
	icon_state = "[initial(icon_state)][door_opened ? "open":""]"
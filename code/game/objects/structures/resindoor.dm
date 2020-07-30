/obj/structure/mineral_door/resin
	name = "resin door"
	icon = 'icons/obj/doors/mineral_doors.dmi'
	icon_state = "metal"
	layer = CLOSED_DOOR_LAYER
	max_integrity = 200
	close_delay = 100

/obj/structure/mineral_door/resin/Initialize()
	. = ..()

/obj/structure/mineral_door/resin/attack_alien(mob/living/carbon/alien/user)
	if(user.a_intent == INTENT_HARM)
		take_damage(rand(40, 60))
	else
		return TryToSwitchState(user)

//clicking on resin doors attacks them, or opens them without harm intent
/obj/structure/mineral_door/resin/attack_alien(mob/living/carbon/alien/user)
	var/turf/cur_loc = user.loc
	if(!istype(cur_loc))
		return FALSE //Some basic logic here
	if(user.a_intent != INTENT_HARM)
		TryToSwitchState(user)
		return TRUE

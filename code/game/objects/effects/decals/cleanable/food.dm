
/obj/effect/decal/cleanable/food
	icon = 'icons/effects/tomatodecal.dmi'
	gender = NEUTER
	beauty = -100

/obj/effect/decal/cleanable/food/tomato_smudge
	name = "tomato smudge"
	desc = "It's red."
	icon_state = "tomato_floor1"
	random_icon_states = list("tomato_floor1", "tomato_floor2", "tomato_floor3")

/obj/effect/decal/cleanable/food/plant_smudge
	name = "plant smudge"
	desc = "Chlorophyll? More like borophyll!"
	icon_state = "smashed_plant"

/obj/effect/decal/cleanable/food/egg_smudge
	name = "smashed egg"
	desc = "Seems like this one won't hatch."
	icon_state = "smashed_egg1"
	random_icon_states = list("smashed_egg1", "smashed_egg2", "smashed_egg3")

/obj/effect/decal/cleanable/food/pie_smudge //honk
	name = "smashed pie"
	desc = "It's pie cream from a cream pie."
	icon_state = "smashed_pie"

/obj/effect/decal/cleanable/food/salt
	name = "salt pile"
	desc = "A sizable pile of table salt. Someone must be upset."
	icon_state = "salt_pile"
	var/safepasses = 3 //how many times can this salt pile be passed before dissipating

/obj/effect/decal/cleanable/food/salt/CanAllowThrough(atom/movable/AM, turf/target)
	. = ..()
	if(is_species(AM, /datum/species/snail))
		return FALSE

/obj/effect/decal/cleanable/food/salt/Bumped(atom/movable/AM)
	. = ..()
	if(is_species(AM, /datum/species/snail))
		to_chat(AM, "<span class='danger'>Your path is obstructed by <span class='phobia'>salt</span>.</span>")

/obj/effect/decal/cleanable/food/salt/Crossed(atom/movable/AM)
	..()
	if(!isliving(AM))
		return
	if(iscarbon(AM))
		var/mob/living/carbon/C = AM
		if(C.m_intent == MOVE_INTENT_WALK)
			return
		if(ishuman(AM))
			var/mob/living/carbon/human/H = AM
			if(is_species(AM, /datum/species/beefman) && !(H.shoes))
				to_chat(H, "<span class='warning'>AAAAAAUGH, IT BURNS, IT BUUUUUUUUUUURNS!</span>")
				H.emote("scream") //you have no skin or shoes and you just stepped in a pile of salt, you're definitely in MASSIVE amounts of pain
				H.blur_eyes(5) //it's hard to see through your tears of pain
				var/datum/species/beefman/S = B.dna.species
				S.dehydrate = min(S.dehydrate+10, 100) //yeah, you can make a pile of salt with just one unit of salt, but c'mon, just incrementing dehydrate by 1 is going to be barely noticeable
	safepasses--
	if(safepasses <= 0 && !QDELETED(src))
		qdel(src)

/obj/effect/decal/cleanable/food/flour
	name = "flour"
	desc = "It's still good. Four second rule!"
	icon_state = "flour"

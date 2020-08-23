/mob/living/simple_animal/kiwi
	name = "kiwi"
	desc = "A flightless bird. It fills you with pride from an old country that you just can't put your finger on."
	icon = 'icons/mob/animal.dmi'
	icon_state = "kiwi"
	icon_living = "kiwi"
	icon_dead = "kiwi_dead"
	speak_emote = list("yawns")
	emote_hear = list("snores.","yawns.")
	emote_see = "pecks at the ground."
	turns_per_move = 10
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 3)
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "disgraces a national icon"
	response_harm_simple = "kick"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	gold_core_spawnable = FRIENDLY_SPAWN
	melee_damage_lower = 18
	melee_damage_upper = 18
	health = 50
	maxHealth = 50
	see_in_dark = 5
	footstep_type = FOOTSTEP_MOB_CLAW

//Waddle
/mob/living/simple_animal/kiwi/Initialize()
	. = ..()
	AddElement(/datum/element/waddling)


//Personalised Mob
/mob/living/simple_animal/kiwi/marmite
	name = "Marmite"
	desc = "A pet kiwi. The medbay's pride and joy. Too shy for surgery."
	gold_core_spawnable = NO_SPAWN
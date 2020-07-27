/mob/living/simple_animal/pet/cat/cak/eclat //for a good pal, Fingus
	name = "Eclair"
	desc = "It's a cream filled cat"
	icon = 'icons/Fulpicons/fulp_mob_icons/eclat.dmi'
	icon_state = "eclat"
	icon_living = "eclat"
	icon_dead = "eclat_dead"

	health = 69
	maxHealth = 69
	gender = FEMALE
	harm_intent_damage = 10
	butcher_results = list(/obj/item/organ/brain = 1, /obj/item/organ/heart = 1, /obj/item/reagent_containers/food/snacks/donut/choco = 2,  \
	/obj/item/reagent_containers/food/snacks/meat/slab = 2)
	response_harm_continuous = "takes a bite out of"
	response_harm_simple = "take a bite out of"
	attacked_sound = 'sound/items/eatfood.ogg'
	deathmessage = "loses its false life and collapses!"
	deathsound = "bodyfall"
	held_state = "eclat"

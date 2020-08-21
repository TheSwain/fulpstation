/*
	The holodeck activates these shortly after the program loads,
	and deactivates them immediately before changing or disabling the holodeck.

	These remove snowflake code for special holodeck functions.
*/
/obj/effect/holodeck_effect
	icon = 'icons/mob/screen_gen.dmi'
	icon_state = "x2"
	invisibility = INVISIBILITY_ABSTRACT

<<<<<<< HEAD
/obj/effect/holodeck_effect/proc/activate(obj/machinery/computer/holodeck/HC)
	return

/obj/effect/holodeck_effect/proc/deactivate(obj/machinery/computer/holodeck/HC)
=======
/obj/effect/holodeck_effect/proc/activate(var/obj/machinery/computer/holodeck/HC)
	return

/obj/effect/holodeck_effect/proc/deactivate(var/obj/machinery/computer/holodeck/HC)
>>>>>>> fulpmaster
	qdel(src)
	return

// Called by the holodeck computer as long as the program is running
<<<<<<< HEAD
/obj/effect/holodeck_effect/proc/tick(obj/machinery/computer/holodeck/HC)
	return

/obj/effect/holodeck_effect/proc/safety(active)
=======
/obj/effect/holodeck_effect/proc/tick(var/obj/machinery/computer/holodeck/HC)
	return

/obj/effect/holodeck_effect/proc/safety(var/active)
>>>>>>> fulpmaster
	return


// Generates a holodeck-tracked card deck
/obj/effect/holodeck_effect/cards
	icon = 'icons/obj/toy.dmi'
	icon_state = "deck_nanotrasen_full"
	var/obj/item/toy/cards/deck/D

<<<<<<< HEAD
/obj/effect/holodeck_effect/cards/activate(obj/machinery/computer/holodeck/HC)
=======
/obj/effect/holodeck_effect/cards/activate(var/obj/machinery/computer/holodeck/HC)
>>>>>>> fulpmaster
	D = new(loc)
	safety(!(HC.obj_flags & EMAGGED))
	D.holo = HC
	return D

/obj/effect/holodeck_effect/cards/safety(active)
	if(!D)
		return
	if(active)
		D.card_hitsound = null
		D.card_force = 0
		D.card_throwforce = 0
		D.card_throw_speed = 3
		D.card_throw_range = 7
<<<<<<< HEAD
		D.card_attack_verb_continuous = list("attacks")
=======
		D.card_attack_verb = list("attacked")
>>>>>>> fulpmaster
	else
		D.card_hitsound = 'sound/weapons/bladeslice.ogg'
		D.card_force = 5
		D.card_throwforce = 10
		D.card_throw_speed = 3
		D.card_throw_range = 7
<<<<<<< HEAD
		D.card_attack_verb_continuous = list("attacks", "slices", "dices", "slashes", "cuts")


/obj/effect/holodeck_effect/sparks/activate(obj/machinery/computer/holodeck/HC)
=======
		D.card_attack_verb = list("attacked", "sliced", "diced", "slashed", "cut")


/obj/effect/holodeck_effect/sparks/activate(var/obj/machinery/computer/holodeck/HC)
>>>>>>> fulpmaster
	var/turf/T = get_turf(src)
	if(T)
		var/datum/effect_system/spark_spread/s = new
		s.set_up(3, 1, T)
		s.start()
		T.temperature = 5000
		T.hotspot_expose(50000,50000,1)



/obj/effect/holodeck_effect/mobspawner
	var/mobtype = /mob/living/simple_animal/hostile/carp/holocarp
	var/mob/mob = null

<<<<<<< HEAD
/obj/effect/holodeck_effect/mobspawner/activate(obj/machinery/computer/holodeck/HC)
=======
/obj/effect/holodeck_effect/mobspawner/activate(var/obj/machinery/computer/holodeck/HC)
>>>>>>> fulpmaster
	if(islist(mobtype))
		mobtype = pick(mobtype)
	mob = new mobtype(loc)
	mob.flags_1 |= HOLOGRAM_1

	// these vars are not really standardized but all would theoretically create stuff on death
	for(var/v in list("butcher_results","corpse","weapon1","weapon2","blood_volume") & mob.vars)
		mob.vars[v] = null
	return mob

<<<<<<< HEAD
/obj/effect/holodeck_effect/mobspawner/deactivate(obj/machinery/computer/holodeck/HC)
=======
/obj/effect/holodeck_effect/mobspawner/deactivate(var/obj/machinery/computer/holodeck/HC)
>>>>>>> fulpmaster
	if(mob)
		HC.derez(mob)
	qdel(src)

/obj/effect/holodeck_effect/mobspawner/pet
	mobtype = list(
		/mob/living/simple_animal/butterfly, /mob/living/simple_animal/chick/holo,
		/mob/living/simple_animal/pet/cat, /mob/living/simple_animal/pet/cat/kitten,
		/mob/living/simple_animal/pet/dog/corgi, /mob/living/simple_animal/pet/dog/corgi/puppy,
		/mob/living/simple_animal/pet/dog/pug, /mob/living/simple_animal/pet/fox)

/obj/effect/holodeck_effect/mobspawner/bee
	mobtype = /mob/living/simple_animal/hostile/poison/bees/toxin

/obj/effect/holodeck_effect/mobspawner/monkey
	mobtype = /mob/living/simple_animal/holodeck_monkey

/obj/effect/holodeck_effect/mobspawner/penguin
	mobtype = /mob/living/simple_animal/pet/penguin/emperor
<<<<<<< HEAD

=======
	
>>>>>>> fulpmaster
/obj/effect/holodeck_effect/mobspawner/penguin/Initialize()
	if(prob(1))
		mobtype = /mob/living/simple_animal/pet/penguin/emperor/shamebrero
	return ..()

/obj/effect/holodeck_effect/mobspawner/penguin_baby
	mobtype = /mob/living/simple_animal/pet/penguin/baby

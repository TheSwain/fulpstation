#define SUPERHULK_VALUE		1

/datum/mutation/human/hulk/proc/empowered_add_hulk(mob/living/carbon/human/owner)
	if(variant != SUPERHULK_VALUE)
		return
	ADD_TRAIT(owner, TRAIT_STUNIMMUNE, TRAIT_HULK) //FULPSTATION Hulk Nerf, Surrealistik Jan 2020
	ADD_TRAIT(owner, TRAIT_IGNOREDAMAGESLOWDOWN, TRAIT_HULK) //FULPSTATION Hulk Nerf, Surrealistik Jan 2020


/datum/mutation/human/hulk/proc/empowered_remove_hulk(mob/living/carbon/human/owner, super)
	if(variant != SUPERHULK_VALUE)
		return
	REMOVE_TRAIT(owner, TRAIT_STUNIMMUNE, TRAIT_HULK) //FULPSTATION Hulk Nerf, Surrealistik Jan 2020
	REMOVE_TRAIT(owner, TRAIT_IGNOREDAMAGESLOWDOWN, TRAIT_HULK) //FULPSTATION Hulk Nerf, Surrealistik Jan 2020

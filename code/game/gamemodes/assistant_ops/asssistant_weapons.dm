//TOOL BOX SWORD!

/obj/item/melee/transforming/energy/sword/greytide
	name = "energy toolbox"
	desc = "What could possibly go wrong?"
	attack_verb_on = list("BONKED!")
	w_class = WEIGHT_CLASS_NORMAL
	w_class_on = WEIGHT_CLASS_HUGE
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	icon_state = ""
	icon_state_on = ""
	sharpness = IS_BLUNT
	sword_color = "yellow"
	heat = 0
	light_color = "#ffff00"

/obj/item/melee/transforming/energy/sword/bananium/ignition_effect(atom/A, mob/user)
	return ""

/obj/item/melee/transforming/energy/sword/bananium/suicide_act(mob/user)
	if(!active)
		transform_weapon(user, TRUE)
	user.visible_message("<span class='suicide'>[user] is [pick("slitting [user.p_their()] stomach open with", "falling on")] [src]! It looks like [user.p_theyre()] trying to commit seppuku, but the blade slips off of [user.p_them()] harmlessly!</span>")
	var/datum/component/slippery/slipper = GetComponent(/datum/component/slippery)
	slipper.Slip(src, user)
	return SHAME

//BANANIUM SHIELD

/obj/item/shield/energy/bananium
	name = "bananium energy shield"
	desc = "A shield that stops most melee attacks, protects user from almost all energy projectiles, and can be thrown to slip opponents."
	throw_speed = 1
	clumsy_check = 0
	base_icon_state = "bananaeshield"
	force = 0
	throwforce = 0
	throw_range = 5
	on_force = 0
	on_throwforce = 0
	on_throw_speed = 1

/obj/item/shield/energy/bananium/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/slippery, 60, GALOSHES_DONT_HELP)
	var/datum/component/slippery/slipper = GetComponent(/datum/component/slippery)
	slipper.signal_enabled = active

/obj/item/shield/energy/bananium/attack_self(mob/living/carbon/human/user)
	..()
	var/datum/component/slippery/slipper = GetComponent(/datum/component/slippery)
	slipper.signal_enabled = active

/obj/item/shield/energy/bananium/throw_at(atom/target, range, speed, mob/thrower, spin=1, diagonals_first = 0, datum/callback/callback, force, gentle = FALSE, quickstart = TRUE)
	if(active)
		if(iscarbon(thrower))
			var/mob/living/carbon/C = thrower
			C.throw_mode_on() //so they can catch it on the return.
	return ..()

/obj/item/shield/energy/bananium/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	if(active)
		var/caught = hit_atom.hitby(src, FALSE, FALSE, throwingdatum=throwingdatum)
		if(iscarbon(hit_atom) && !caught)//if they are a carbon and they didn't catch it
			var/datum/component/slippery/slipper = GetComponent(/datum/component/slippery)
			slipper.Slip(src, hit_atom)
		if(thrownby && !caught)
			sleep(1)
			throw_at(thrownby, throw_range+2, throw_speed, null, TRUE)
	else
		return ..()

//GASMASK GRENADE

/obj/item/grenade/chem_grenade/teargas/moustache
	name = "gasmask grenade"
	desc = "Gasmasks, but in a grenade!"
	icon_state = "moustacheg"
	clumsy_check = GRENADE_NONCLUMSY_FUMBLE

/obj/item/grenade/chem_grenade/teargas/gasmask/prime(mob/living/lanced_by)
	var/myloc = get_turf(src)
	. = ..()
	for(var/mob/living/carbon/M in view(6, myloc))
		if(!istype(M.wear_mask, /obj/item/clothing/mask/gas/clown_hat) && !istype(M.wear_mask, /obj/item/clothing/mask/gas/mime) )
			if(!M.wear_mask || M.dropItemToGround(M.wear_mask))
				var//obj/item/clothing/mask/gas/the_mask = new /obj/item/clothing/mask/gas()
				M.equip_to_slot_or_del(the_mask, ITEM_SLOT_MASK, TRUE, TRUE, TRUE, TRUE)

/obj/item/clothing/mask/gasmask/sticky
	var/unstick_time = 600

/obj/item/clothing/mask/fakemoustache/sticky/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP)
	addtimer(CALLBACK(src, .proc/unstick), unstick_time)

/obj/item/clothing/mask/fakemoustache/sticky/proc/unstick()
	REMOVE_TRAIT(src, TRAIT_NODROP)


//TOOL BOX SWORD!

/obj/item/melee/transforming/energy/sword/greytide
	name = "energy toolbox"
	desc = "What could possibly go wrong?"
	attack_verb_on = list("BONKED!")
	w_class = WEIGHT_CLASS_HUGE
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


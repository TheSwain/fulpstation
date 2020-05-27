//assistant ops suit

/obj/item/clothing/head/helmet/space/hardsuit/assistant
	name = "Grey hardsuit helmet"
	desc = "Err, totally not Syndicate property painted grey, promise!"
	alt_desc = "Err, totally not Syndicate property painted grey, promise!"
	icon_state = "hardsuit1-assistant"
	item_state = "hardsuit1-assistant"
	hardsuit_type = "syndi"
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90)
	on = TRUE
	var/obj/item/clothing/suit/space/hardsuit/syndi/linkedsuit = null
	actions_types = list(/datum/action/item_action/toggle_helmet_mode)
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE|HIDEFACIALHAIR
	visor_flags = STOPSPRESSUREDAMAGE

/obj/item/clothing/head/helmet/space/hardsuit/assistant/update_icon_state()
	icon_state = "hardsuit[on]-[hardsuit_type]"

/obj/item/clothing/head/helmet/space/hardsuit/assistant/Initialize()
	. = ..()
	if(istype(loc, /obj/item/clothing/suit/space/hardsuit/assistant))
		linkedsuit = loc

/obj/item/clothing/head/helmet/space/hardsuit/assistant/attack_self(mob/user) //Toggle Helmet
	if(!isturf(user.loc))
		to_chat(user, "<span class='warning'>You cannot toggle your helmet while in this [user.loc]!</span>" )
		return
	on = !on
	if(on || force)
		to_chat(user, "<span class='notice'>You switch your hardsuit to EVA mode, sacrificing speed for space protection.</span>")
		name = initial(name)
		desc = initial(desc)
		set_light(brightness_on)
		clothing_flags |= visor_flags
		flags_cover |= HEADCOVERSEYES | HEADCOVERSMOUTH
		flags_inv |= visor_flags_inv
		cold_protection |= HEAD
	else
		to_chat(user, "<span class='notice'>You switch your hardsuit to combat mode and can now run at full speed.</span>")
		name += " (combat)"
		desc = alt_desc
		set_light(0)
		clothing_flags &= ~visor_flags
		flags_cover &= ~(HEADCOVERSEYES | HEADCOVERSMOUTH)
		flags_inv &= ~visor_flags_inv
		cold_protection &= ~HEAD
	update_icon()
	playsound(src.loc, 'sound/mecha/mechmove03.ogg', 50, TRUE)
	toggle_hardsuit_mode(user)
	user.update_inv_head()
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.head_update(src, forced = 1)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/clothing/head/helmet/space/hardsuit/assistant/proc/toggle_hardsuit_mode(mob/user) //Helmet Toggles Suit Mode
	if(linkedsuit)
		if(on)
			linkedsuit.name = initial(linkedsuit.name)
			linkedsuit.desc = initial(linkedsuit.desc)
			linkedsuit.slowdown = 1
			linkedsuit.clothing_flags |= STOPSPRESSUREDAMAGE
			linkedsuit.cold_protection |= CHEST | GROIN | LEGS | FEET | ARMS | HANDS
		else
			linkedsuit.name += " (combat)"
			linkedsuit.desc = linkedsuit.alt_desc
			linkedsuit.slowdown = 0
			linkedsuit.clothing_flags &= ~STOPSPRESSUREDAMAGE
			linkedsuit.cold_protection &= ~(CHEST | GROIN | LEGS | FEET | ARMS | HANDS)

		linkedsuit.icon_state = "hardsuit[on]-[hardsuit_type]"
		linkedsuit.update_icon()
		user.update_inv_wear_suit()
		user.update_inv_w_uniform()
		user.update_equipment_speed_mods()


/obj/item/clothing/suit/space/hardsuit/assistant
	name = "Grey hard suit"
	desc = "Err, totally not Syndicate property painted grey, promise!"
	alt_desc = "Err, totally not Syndicate property painted grey, promise!"
	icon_state = "hardsuit1-assistant"
	item_state = "hardsuit1-assistant"
	hardsuit_type = "syndi"
	w_class = WEIGHT_CLASS_NORMAL
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90)
	allowed = list(/obj/item/gun, /obj/item/ammo_box,/obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/transforming/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/assistant
	jetpack = /obj/item/tank/jetpack/suit
	cell = /obj/item/stock_parts/cell/hyper

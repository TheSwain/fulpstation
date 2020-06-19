//Assistant Ops' shoes.
/obj/item/clothing/shoes/sneakers/black/assistant
	name = "Combat Assistant shoes"
	icon_state = "black"
	desc = "Engineered to protect the user from slipping, sweet!"
	custom_price = 50

	cold_protection = FEET
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT
	heat_protection = FEET
	max_heat_protection_temperature = SHOES_MAX_TEMP_PROTECT
	clothing_flags = NOSLIP

//Assistant Hardsuit
/obj/item/clothing/suit/space/hardsuit/assistant
	name = "Grey hard suit"
	desc = "Err, totally not Syndicate property painted grey, promise!"
	icon = 'icons/fulpicons/Assistant Ops/clothing/AssistantSuit.dmi'
	mob_overlay_icon = 'icons/fulpicons/Assistant Ops/clothing/AssistantSuitMob.dmi'
	alt_desc = "A dual-mode advanced hardsuit designed for work in special operations. It is in combat mode. Property of Gorlex Marauders."
	icon_state = "assistanthardsuit"
	item_state = "assistanthardsuit"
	hardsuit_type = "syndi"
	w_class = WEIGHT_CLASS_NORMAL
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90)
	allowed = list(/obj/item/gun, /obj/item/ammo_box,/obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/transforming/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi
	jetpack = /obj/item/tank/jetpack/suit
	cell = /obj/item/stock_parts/cell/hyper

//Boring Assistant hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/assistant
	name = "Assistant hardsuit helmet"
	desc = "Err, totally not Syndicate property painted grey, promise!"
	icon = 'icons/fulpicons/Assistant Ops/clothing/AssistantHead.dmi'
	mob_overlay_icon = 'icons/fulpicons/Assistant Ops/clothing/AssistantHeadMob.dmi'
	icon_state = "helmetforassistant"
	hardsuit_type = "assistant"
	armor = list("melee" = 30, "bullet" = 40, "laser" = 55, "energy" = 55, "bomb" = 30, "bio" = 100, "rad" = 60, "fire" = 60, "acid" = 60)
	strip_delay = 600
	actions_types = list()

/obj/item/clothing/suit/space/hardsuit/assistant
	icon_state = "assistanthardsuit"
	item_state = "assistanthardsuit"
	icon = 'icons/fulpicons/Assistant Ops/clothing/AssistantSuit.dmi'
	mob_overlay_icon = 'icons/fulpicons/Assistant Ops/clothing/AssistantSuitMob.dmi'
	hardsuit_type = "assistant"
	name = "Assistant hardsuit"
	desc = "Err, totally not Syndicate property painted grey, promise!"
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90)
	slowdown = 0
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/assistant
	actions_types = list(/datum/action/item_action/toggle_helmet, /datum/action/item_action/toggle_spacesuit)
	jetpack = /obj/item/tank/jetpack/suit

//Elite assistant hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/eliteassistant
	name = "Elite Assistant hardsuit helmet"
	desc = "Err, totally not Syndicate property painted grey, promise!"
	icon = 'icons/fulpicons/Assistant Ops/clothing/AssistantHead.dmi'
	mob_overlay_icon = 'icons/fulpicons/Assistant Ops/clothing/AssistantHeadMob.dmi'
	icon_state = "elitehelmet"
	hardsuit_type = "eliteassistant"
	armor = list("melee" = 30, "bullet" = 40, "laser" = 55, "energy" = 55, "bomb" = 30, "bio" = 100, "rad" = 60, "fire" = 60, "acid" = 60)
	strip_delay = 600
	actions_types = list()

/obj/item/clothing/suit/space/hardsuit/eliteassistant
	icon_state = "eliteassistant"
	item_state = "eliteassistant"
	icon = 'icons/fulpicons/Assistant Ops/clothing/AssistantSuit.dmi'
	mob_overlay_icon = 'icons/fulpicons/Assistant Ops/clothing/AssistantSuitMob.dmi'
	hardsuit_type = "eliteassistant"
	name = "Elite Assistant hardsuit"
	desc = "Err, totally not Syndicate property painted grey, promise!"
	armor = list("melee" = 60, "bullet" = 60, "laser" = 50, "energy" = 60, "bomb" = 55, "bio" = 100, "rad" = 70, "fire" = 100, "acid" = 100)
	slowdown = 0
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/eliteassistant
	actions_types = list(/datum/action/item_action/toggle_helmet, /datum/action/item_action/toggle_spacesuit)
	jetpack = /obj/item/tank/jetpack/suit

//Assistant Ops
/obj/item/clothing/head/helmet/space/assistant
	name = "assistant space helmet"
	icon_state = "syndicate"
	item_state = "syndicate"
	desc = "Err, totally not Syndicate property painted grey..."
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30,"energy" = 40, "bomb" = 30, "bio" = 30, "rad" = 30, "fire" = 80, "acid" = 85)

/obj/item/clothing/suit/space/syndicate
	name = "red space suit"
	icon_state = "syndicate"
	item_state = "space_suit_syndicate"
	desc = "Err, totally not Syndicate property painted grey..."
	w_class = WEIGHT_CLASS_NORMAL
	allowed = list(/obj/item/gun, /obj/item/ammo_box, /obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/transforming/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30,"energy" = 40, "bomb" = 30, "bio" = 30, "rad" = 30, "fire" = 80, "acid" = 85)
	cell = /obj/item/stock_parts/cell/hyper
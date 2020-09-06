/datum/outfit/syndicate/plasmaman
	name = "Syndicate Operative Plasmaman - Basic"
	head = /obj/item/clothing/head/helmet/space/plasmaman/robotics/syndicate
	uniform = /obj/item/clothing/under/plasmaman/security/syndicate
	r_hand= /obj/item/tank/internals/plasmaman/belt/full
	mask = /obj/item/clothing/mask/gas/syndicate
	gloves = /obj/item/clothing/gloves/combat
	backpack_contents = list(/obj/item/paper/guides/plasmemeops)

/datum/outfit/syndicate/leader/plasmaman
	name = "Syndicate Leader Plasmaman - Basic"
	head = /obj/item/clothing/head/helmet/space/plasmaman/robotics/syndicate
	uniform = /obj/item/clothing/under/plasmaman/security/syndicate
	r_pocket= /obj/item/tank/internals/plasmaman/belt/full // They spawn with both hands busy, so they have to manually set internals
	mask = /obj/item/clothing/mask/gas/syndicate
	id = /obj/item/card/id/syndicate/nuke_leader
	gloves = /obj/item/clothing/gloves/krav_maga/combatglovesplus
	command_radio = TRUE
	backpack_contents = list(/obj/item/storage/box/survival/syndie=1,\
		/obj/item/kitchen/knife/combat/survival, /obj/item/paper/guides/plasmemeops)

/obj/item/clothing/head/helmet/space/plasmaman/robotics/syndicate
	name = "syndicate plasma envirosuit helmet"
	desc = "A plasmaman envirosuit helmet designed for syndicate operatives."

/obj/item/clothing/under/plasmaman/security/syndicate
	name = "syndicate plasma envirosuit"
	desc = "A non-descript and slightly suspicious looking plasmaman enviromental suit."
	worn_icon = 'icons/fulpicons/phoenix_nest/syndicate_suits.dmi'
	icon = 'icons/fulpicons/phoenix_nest/syndicate_suits_icons.dmi'
	icon_state = "syndicate_envirosuit"
	has_sensor = NO_SENSORS
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 100, "rad" = 0, "fire" = 95, "acid" = 95)

// Plasmeme syndi hardsuit

/obj/item/clothing/head/helmet/space/hardsuit/syndiplasmeme
	name = "plasmaman blood-red hardsuit helmet"
	desc = "An advanced helmet designed for work in special operations. Property of the Plasmaman Division of Gorlex Marauders."
	worn_icon = 'icons/fulpicons/phoenix_nest/syndicate_suits.dmi'
	icon = 'icons/fulpicons/phoenix_nest/syndicate_suits_icons.dmi'
	icon_state = "hardsuit0-plasmeme_bloodred"
	inhand_icon_state = "syndie_helm"
	hardsuit_type = "plasmeme_bloodred"
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90, "wound" = 25)
	// on = TRUE
	// var/obj/item/clothing/suit/space/hardsuit/syndi/linkedsuit = null
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE|HIDEFACIALHAIR
	visor_flags = STOPSPRESSUREDAMAGE

/obj/item/clothing/suit/space/hardsuit/syndiplasmeme
	name = "plasmaman blood-red hardsuit"
	desc = "A hardsuit designed for plasmamen operatives in the field. Property of the Plasmaman Division of Gorlex Marauders."
	worn_icon = 'icons/fulpicons/phoenix_nest/syndicate_suits.dmi'
	icon = 'icons/fulpicons/phoenix_nest/syndicate_suits_icons.dmi'
	icon_state = "plasmeme_bloodred"
	inhand_icon_state = "syndie_hardsuit"
	hardsuit_type = "plasmeme_bloodred"
	w_class = WEIGHT_CLASS_NORMAL
	slowdown = 0
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90, "wound" = 25)
	allowed = list(/obj/item/gun, /obj/item/ammo_box,/obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/transforming/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndiplasmeme
	jetpack = /obj/item/tank/jetpack/suit
	cell = /obj/item/stock_parts/cell/hyper

//Elite plasmeme Syndie suit

/obj/item/clothing/head/helmet/space/hardsuit/syndiplasmeme/elite
	name = "plasmaman elite syndicate hardsuit helmet"
	desc = "An elite version of the syndicate helmet, with improved armour and fireproofing. Property of the Plasmaman Division of Gorlex Marauders."
	worn_icon = 'icons/fulpicons/phoenix_nest/syndicate_suits.dmi'
	icon = 'icons/fulpicons/phoenix_nest/syndicate_suits_icons.dmi'
	icon_state = "hardsuit0-plasmeme_elite"
	hardsuit_type = "plasmeme_elite"
	armor = list("melee" = 60, "bullet" = 60, "laser" = 50, "energy" = 60, "bomb" = 55, "bio" = 100, "rad" = 70, "fire" = 100, "acid" = 100, "wound" = 25)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF | STOPSPRESSUREDAMAGE

/obj/item/clothing/suit/space/hardsuit/syndiplasmeme/elite
	name = "plasmaman elite syndicate hardsuit"
	desc = "An elite version of the plasmaman syndicate hardsuit, with improved armour and fireproofing."
	worn_icon = 'icons/fulpicons/phoenix_nest/syndicate_suits.dmi'
	icon = 'icons/fulpicons/phoenix_nest/syndicate_suits_icons.dmi'
	icon_state = "plasmeme_elite"
	hardsuit_type = "plasmeme_elite"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndiplasmeme/elite
	armor = list("melee" = 60, "bullet" = 60, "laser" = 50, "energy" = 60, "bomb" = 55, "bio" = 100, "rad" = 70, "fire" = 100, "acid" = 100, "wound" = 25)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF | STOPSPRESSUREDAMAGE
	cell = /obj/item/stock_parts/cell/bluespace

// Warning label for our plasmemes to know normal hardsuits will not work

/obj/item/paper/guides/plasmemeops
	name = "WARNING - Plasmaman Nuclear Operative"
	info = {"<center><b>Attention, Operative</b></center>Operative. We are sorry to inform that due to certain budget cuts regarding Gorlex Marauders,
		our standard-issue hardsuits aren't compatible with our kind. To make up for this, the Plasmaman Division has engineered two special hardsuits
		that are available exclusively to you, on your uplink.
		<br>These hardsuits will always protect you from pressure, and removing the mechanisms that let you
		change between combat mode and space-travel mode, we were able to remove the slowdown that the normal hardsuits give.
		<br>Using the standard-issued hardsuits	will most likely end with you in flames after you switch to Combat Mode.
		<br>We wish you the best of luck in your mission, Operative.
		<br>
		<br>-Signed, <i>Puccium VI, Gorlex Marauders Plasmaman Division.</i>"}

/datum/outfit/plasmaman/syndicate
	name = "Syndicate Plasmaman"

	head = /obj/item/clothing/head/helmet/space/plasmaman/robotics/syndicate
	uniform = /obj/item/clothing/under/plasmaman/security/syndicate
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	back = /obj/item/storage/backpack/fireproof
	ears = /obj/item/radio/headset/syndicate/alt
	l_pocket = /obj/item/pinpointer/nuke/syndicate
	id = /obj/item/card/id/syndicate
	belt = /obj/item/gun/ballistic/automatic/pistol
	backpack_contents = list(/obj/item/storage/box/syndie = 1,
		/obj/item/kitchen/knife/combat/survival = 1)
	var/tc = 25
	var/command_radio = FALSE
	var/uplink_type = /obj/item/uplink/nuclear

/obj/item/clothing/head/helmet/space/plasmaman/robotics/syndicate
	name = "syndicate plasma envirosuit helmet"
	desc = "A plasmaman envirosuit helmet designed for syndicate operatives."

/obj/item/clothing/under/plasmaman/security/syndicate
	name = "syndicate plasma envirosuit"
	desc = "A non-descript and slightly suspicious looking plasmaman enviormental suit."
	icon = 'icons/fulpicons/phoenix_nest/syndicate_suits_icons.dmi'
	mob_overlay_icon = 'icons/fulpicons/phoenix_nest/syndicate_suits.dmi'
	icon_state = "syndicate_envirosuit"
	item_state = "syndicate_envirosuit"
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 100, "rad" = 0, "fire" = 95, "acid" = 95)

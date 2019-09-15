/obj/machinery/vending/tool
	name = "\improper YouTool"
	desc = "Tools for tools."
	icon_state = "tool"
	icon_deny = "tool-deny"
	products = list(/obj/item/stack/cable_coil = 10,
		            /obj/item/crowbar = 5,
		            /obj/item/weldingtool = 3,
		            /obj/item/wirecutters = 5,
		            /obj/item/wrench = 5,
		            /obj/item/analyzer = 5,
		            /obj/item/t_scanner = 5,
		            /obj/item/screwdriver = 5,
		            /obj/item/flashlight/glowstick = 8, // [FULP] [PNX] Increased from 3 to 8 to allow more people to use them.
		            /obj/item/flashlight/glowstick/red = 6, // [FULP] [PNX] Increased from 3 to 6 to allow more people to use them.
								/obj/item/storage/belt/security/emerlightpouch = 2, // [FULP] [PNX]
		            /obj/item/flashlight = 5,
		            /obj/item/clothing/ears/earmuffs = 1)
	contraband = list(/obj/item/clothing/gloves/color/fyellow = 2)
	premium = list(/obj/item/storage/belt/utility = 2,
		           /obj/item/weldingtool/hugetank = 2,
		           /obj/item/clothing/head/welding = 2,
		           /obj/item/clothing/gloves/color/yellow = 1)
	armor = list("melee" = 100, "bullet" = 100, "laser" = 100, "energy" = 100, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 70)
	resistance_flags = FIRE_PROOF
	default_price = 20
	extra_price = 80
	payment_department = ACCOUNT_ENG

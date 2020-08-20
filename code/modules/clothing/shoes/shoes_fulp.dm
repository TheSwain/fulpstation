//digitigrade shoes
/obj/item/clothing/shoes/laceup/digitigrade
	name = "digitigrade laceup shoes"
	desc = "Shoes for only the coldest-blooded of lawyers."
	flags_inv = FULL_DIGITIGRADE
	fulp_item = TRUE
	icon = 'icons/obj/clothing/shoes_fulp.dmi'
	icon_state = "digi_laceups"
	worn_icon = 'icons/mob/feet_fulp.dmi'
	inhand_icon_state = "digi_laceups"

/obj/item/clothing/shoes/workboots/digitigrade
	name = "digitigrade workboots"
	desc = "Nanotrasen-issue Engineering lace-up work boots for the hardworking lizardfolk."
	flags_inv = FULL_DIGITIGRADE
	fulp_item = TRUE
	icon = 'icons/obj/clothing/shoes_fulp.dmi'
	icon_state = "digi_workboots"
	worn_icon = 'icons/mob/feet_fulp.dmi'
	inhand_icon_state = "digi_workboots"

/obj/item/clothing/shoes/digicombat
	name = "digitigrade combat boots"
	desc = "Robust combat boots especially for lizardmen. Perfect for walking over piled human corpses."
	flags_inv = FULL_DIGITIGRADE
	fulp_item = TRUE
	icon = 'icons/obj/clothing/shoes_fulp.dmi'
	icon_state = "digi_combats"
	worn_icon = 'icons/mob/feet_fulp.dmi'
	inhand_icon_state = "digi_combats"
	resistance_flags = FIRE_PROOF
	permeability_coefficient = 0.05
	armor = list("melee" = 15, "bullet" = 15, "laser" = 15, "energy" = 15, "bomb" = 20, "bio" = 5, "rad" = 0, "fire" = 40, "acid" = 20)


/obj/item/clothing/shoes/jackboots/digitigrade
	name = "digitigrade jackboots"
	desc = "Nanotrasen-issue lizard Security combat boots for lizard combat scenarios or lizard combat situations."
	flags_inv = FULL_DIGITIGRADE
	fulp_item = TRUE
	icon = 'icons/obj/clothing/shoes_fulp.dmi'
	icon_state = "digi_jackboots"
	worn_icon = 'icons/mob/feet_fulp.dmi'
	inhand_icon_state = "digi_jackboots"

/obj/item/clothing/shoes/clown_shoes/digitigrade
	name = "digitigrade clown shoes"
	desc = "Shoes of the sort made famous by acclaimed lizardman clown Pies-The-Janitor. Ctrl-click to toggle waddle dampeners."
	flags_inv = FULL_DIGITIGRADE
	fulp_item = TRUE
	icon = 'icons/obj/clothing/shoes_fulp.dmi'
	icon_state = "digi_clown"
	worn_icon = 'icons/mob/feet_fulp.dmi'
	inhand_icon_state = "digi_clown"

/obj/item/clothing/shoes/sandal/digitigrade
	name = "digitigrade sandals"
	desc = "Snugly fitting sandals for smugly dressed lizardfolk."
	flags_inv = FULL_DIGITIGRADE
	fulp_item = TRUE
	icon = 'icons/obj/clothing/shoes_fulp.dmi'
	icon_state = "digi_wizard"
	worn_icon = 'icons/mob/feet_fulp.dmi'
	inhand_icon_state = "digi_wizard"

/obj/item/clothing/shoes/sneakers/brown/digitigrade
	name = "digitigrade brown shoes"
	desc = "A pair of digitigrade brown shoes. Shame they don't come in more colours."
	flags_inv = FULL_DIGITIGRADE
	fulp_item = TRUE
	icon = 'icons/obj/clothing/shoes_fulp.dmi'
	icon_state = "digi_brown"
	worn_icon = 'icons/mob/feet_fulp.dmi'
	inhand_icon_state = "digi_brown"

// not working, will fix later
///obj/item/clothing/shoes/magboots/digitigrade
//	name = "digitigrade magboots"
//	desc = "A custom-made variant set of magnetic boots, intended to ensure lizardfolk can safely perform EVA."
//	flags_inv = FULL_DIGITIGRADE
//	fulp_item = TRUE
//	icon = 'icons/obj/clothing/shoes_fulp.dmi'
//	icon_state = "digi_magboots0"
//	alternate_worn_icon = 'icons/mob/feet_fulp.dmi'
//	item_state = "digi_magboots0"

/obj/item/clothing/shoes/sneakers/mime/digitigrade
	name = "digitigrade mime shoes"
	desc = "For the quiestest of lizardfolk."
	flags_inv = FULL_DIGITIGRADE
	fulp_item = TRUE
	icon = 'icons/obj/clothing/shoes_fulp.dmi'
	icon_state = "digi_mime"
	worn_icon = 'icons/mob/feet_fulp.dmi'
	inhand_icon_state = "digi_mime"

//this is literally the easiest way my simple brain could think of for implementing CEs magboots without having to change antag code
/obj/item/clothing/shoes/magboots/advance/digicompatable
	desc = "Advanced magnetic boots that have a lighter magnetic pull, placing less burden on the wearer. They are set to fit normal legs."
	name = "Advanced magboots"
	flags_inv = NOT_DIGITIGRADE
	icon_state = "advmag0"
	magboot_state = "advmag"
	slowdown_active = SHOES_SLOWDOWN
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF



/obj/item/clothing/shoes/magboots/advance/digicompatable/attackby(obj/item/I, mob/user, params)
	if(I.tool_behaviour == TOOL_SCREWDRIVER)
		if (flags_inv == NOT_DIGITIGRADE)
			flags_inv = FULL_DIGITIGRADE
			icon_state = "CE_digi_Magboots0"
			magboot_state = "CE_digi_Magboots1"
			desc = "Advanced magnetic boots that have a lighter magnetic pull, placing less burden on the wearer. They are set to fit digitigrade legs."
			to_chat(user, "<span class='notice'>You set the advance magboots to Digitigrade mode [src].</span>")
		else
			flags_inv = NOT_DIGITIGRADE
			icon_state = "advmag0"
			magboot_state = "advmag"
			desc = "Advanced magnetic boots that have a lighter magnetic pull, placing less burden on the wearer. They are set to fit normal legs."
			to_chat(user, "<span class='notice'>You set the advance magboots to Normal mode [src].</span>")
	. = ..()

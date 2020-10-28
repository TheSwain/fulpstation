/obj/item/clothing/under/costume/sans
	name = "a skeleton\'s hoodie"
	desc = "A baggy, comfortable combination of a hoodie, tee and shorts. You can tell if you wear this you're gonna have a good time."
	icon = 'icons/fulpicons/halloween_costumes/2019/sans_icon.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/2019/sans_worn.dmi'
	icon_state = "sans"
	fitted = FEMALE_UNIFORM_FULL
	can_adjust = FALSE

/obj/item/clothing/head/hardhat/sans
	name = "massive foam skull"
	desc = "What's this guy's name again? Sand? Sailsbury?"
	icon = 'icons/fulpicons/halloween_costumes/2019/sans_icon.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/2019/sans_worn.dmi'
	icon_state = "hardhat0_sans"
	brightness_on = 1
	on = FALSE
	hat_type = "sans"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0) //just dodge, duh
	resistance_flags = null
	flags_inv = HIDEHAIR|HIDEFACIALHAIR
	clothing_flags = SNUG_FIT
	flags_cover = HEADCOVERSEYES
	dynamic_hair_suffix = ""

/obj/item/storage/box/halloween/edition_19/sans
	theme_name = "2019's Sans"

/obj/item/storage/box/halloween/edition_19/sans/PopulateContents()
	new /obj/item/clothing/under/costume/sans(src)
	new /obj/item/clothing/head/hardhat/sans(src)

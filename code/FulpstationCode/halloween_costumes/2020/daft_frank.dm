//The Gold One
/obj/item/clothing/head/hardhat/golden_punk
	name = "Guy-Manuel Helmet"
	desc = "Give life back to music!"
	icon = 'icons/fulpicons/halloween_costumes/2020/daft_frank_item.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/2020/daft_frank_worn.dmi'
	icon_state = "hardhat0_guy"
	brightness_on = 1
	on = FALSE
	hat_type = "guy"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	resistance_flags = null
	flags_inv = HIDEHAIR|HIDEFACIALHAIR
	clothing_flags = SNUG_FIT
	flags_cover = HEADCOVERSEYES
	dynamic_hair_suffix = ""

//The Silver One
/obj/item/clothing/head/hardhat/silver_punk
	name = "Thomas Helmet"
	desc = "Reminds you of touch..."
	icon = 'icons/fulpicons/halloween_costumes/2020/daft_frank_item.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/2020/daft_frank_worn.dmi'
	icon_state = "hardhat0_thomas"
	brightness_on = 1
	on = FALSE
	hat_type = "thomas"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	resistance_flags = null
	flags_inv = HIDEHAIR|HIDEFACIALHAIR
	clothing_flags = SNUG_FIT
	flags_cover = HEADCOVERSEYES
	dynamic_hair_suffix = ""

/obj/item/clothing/under/sparky
	name = "The suit"
	desc = "Harder, Better, Faster, Stronger!"
	icon = 'icons/fulpicons/halloween_costumes/2020/daft_frank_item.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/2020/daft_frank_worn.dmi'
	icon_state = "the_suit"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	fitted = FEMALE_UNIFORM_FULL
	has_sensor = HAS_SENSORS
	random_sensor = TRUE
	can_adjust = FALSE

/obj/item/clothing/gloves/daft_golden
	name = "insert name here"
	desc = "A pair of sparkly golden gloves."
	icon = 'icons/fulpicons/halloween_costumes/2020/daft_frank_item.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/2020/daft_frank_worn.dmi'
	icon_state = "golden_gloves"

/obj/item/clothing/gloves/daft_silver
	name = "insert name here"
	desc = "A pair of sparkly silver gloves."
	icon = 'icons/fulpicons/halloween_costumes/2020/daft_frank_item.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/2020/daft_frank_worn.dmi'
	icon_state = "silver_gloves"

/obj/item/storage/box/halloween/edition_20/daft_box
	theme_name = "2020's Daft Punk Golden"

/obj/item/storage/box/halloween/edition_20/daft_box/PopulateContents()
	new /obj/item/clothing/head/hardhat/golden_punk(src)
	new /obj/item/clothing/gloves/daft_golden(src)
	new /obj/item/clothing/under/sparky(src)
	new /obj/item/clothing/shoes/cyborg(src)
	new /obj/item/instrument/eguitar(src)

/obj/item/storage/box/halloween/edition_20/daft_box/silver
	theme_name = "2020's Daft Punk Silver"

/obj/item/storage/box/halloween/edition_20/daft_box/silver/PopulateContents()
	new /obj/item/clothing/head/hardhat/silver_punk(src)
	new /obj/item/clothing/gloves/daft_silver(src)
	new /obj/item/clothing/under/sparky(src)
	new /obj/item/clothing/shoes/cyborg(src)
	new /obj/item/instrument/piano_synth(src)

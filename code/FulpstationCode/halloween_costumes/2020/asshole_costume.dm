//--Papaporo Paprito's Costume
/obj/item/clothing/under/asshole_jumpsuit
	name = "space asshole suit"
	desc = "A faint smell sulphur, mars dust and free space terrorism."
	icon = 'icons/fulpicons/halloween_costumes/2020/asshole_item.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/2020/asshole_worn.dmi'
	icon_state = "asshole_jumpsuit"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	fitted = FEMALE_UNIFORM_FULL
	can_adjust = FALSE
	alt_covers_chest = FALSE

/obj/item/clothing/suit/asshole_coat
	name = "space asshole coat"
	desc = "Covered in dust and blood. Allows for easy sledgehammer storage."
	icon = 'icons/fulpicons/halloween_costumes/2020/asshole_item.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/2020/asshole_worn.dmi'
	icon_state = "asshole_coat"

/obj/item/clothing/neck/asshole_scarf
	name = "space asshole scarf"
	desc = "Keep your neck warm on your martian guerrilla incursions."
	icon = 'icons/fulpicons/halloween_costumes/2020/asshole_item.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/2020/asshole_worn.dmi'
	icon_state = "asshole_scarf"

/obj/item/clothing/shoes/asshole_boots
	name = "space asshole boots"
	desc = "Stylish boots for stylish assholes."
	icon = 'icons/fulpicons/halloween_costumes/2020/asshole_item.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/2020/asshole_worn.dmi'
	icon_state = "asshole_boots"

/obj/item/toy/plush/sledgy
	name = "sledgy plushie"
	desc = "An adorable stuffed toy that resembles a sledgehammer for some reason..."
	icon = 'icons/fulpicons/halloween_costumes/2020/asshole_item.dmi'
	icon_state = "sledgy"
	squeak_override = list('sound/weapons/bite.ogg'=1)

/obj/item/storage/box/halloween/edition_20/space_asshole
	theme_name = "2020's Martian Revolutionary"
	illustration = "moth"

/obj/item/storage/box/halloween/edition_20/space_asshole/PopulateContents()
	new /obj/item/clothing/suit/asshole_coat(src)
	new /obj/item/clothing/under/asshole_jumpsuit(src)
	new /obj/item/clothing/shoes/asshole_boots(src)
	new /obj/item/clothing/neck/asshole_scarf(src)
	new /obj/item/clothing/gloves/color/black(src)
	new /obj/item/toy/plush/sledgy(src)


//--Under are jumpsuits and others things that go in its slot
/obj/item/clothing/under/midsommar
	name = "midsommar dress"
	desc = "A white dress that fills you with peace."
	icon = 'icons/fulpicons/halloween_costumes/2020/midsommar_item.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/2020/midsommar_worn.dmi'
	icon_state = "midsommar_dress"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	fitted = FEMALE_UNIFORM_TOP
	has_sensor = HAS_SENSORS
	random_sensor = TRUE
	can_adjust = FALSE

//--Head are hats, simple
/obj/item/clothing/head/midsommar
	name = "flower crown"
	desc = "A crown made with colorful flowers."
	icon = 'icons/fulpicons/halloween_costumes/2020/midsommar_item.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/2020/midsommar_worn.dmi'
	icon_state = "flower_crown"

/obj/item/clothing/head/midsommar_queen
	name = "May Queen crown"
	desc = "A crown made with colorful flowers. This one is only used by the queen."
	icon = 'icons/fulpicons/halloween_costumes/2020/midsommar_item.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/2020/midsommar_64.dmi'
	icon_state = "flower_crown_tall"
	worn_x_dimension = 64
	worn_y_dimension = 64
	//clothing_flags = LARGE_WORN_ICON //--This is on updated versions but not needed here for now

//--Suits, hardsuits, jackets, bodyarmor and others
/obj/item/clothing/suit/midsommar_queen
	name = "May Queen"
	desc = "A dress made with colorful flowers intended to be used by the queen."
	icon = 'icons/fulpicons/halloween_costumes/2020/midsommar_item.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/2020/midsommar_worn.dmi'
	icon_state = "may_queen"
	allowed = list(/obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)

//--Box that contains the costumes
/obj/item/storage/box/halloween/edition_20/midsommar
	theme_name = "2020's Midsommar"
	illustration = "midsommar"

/obj/item/storage/box/halloween/edition_20/midsommar/PopulateContents()
	new /obj/item/clothing/under/midsommar(src)//--Insert all the pieces of the costume here
	new /obj/item/clothing/suit/midsommar_queen(src)
	new /obj/item/clothing/head/midsommar(src)
	new /obj/item/clothing/head/midsommar_queen(src)
	new /obj/item/reagent_containers/food/snacks/grown/mushroom/libertycap(src)

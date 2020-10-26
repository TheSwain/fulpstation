//--Under are jumpsuits and others things that go in its slot
/obj/item/clothing/under/columbia
	name = "Columbia's suit"
	desc = "With a bit of a mind flip..."
	icon = 'icons/fulpicons/halloween_costumes/2020/columbia_item.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/2020/columbia_worn.dmi'
	icon_state = "columbia"
	body_parts_covered = CHEST|GROIN
	fitted = NO_FEMALE_UNIFORM
	has_sensor = HAS_SENSORS
	random_sensor = TRUE
	can_adjust = FALSE

//--Head are hats, simple
/obj/item/clothing/head/columbia
	name = "Columbia's hat"
	desc = "You're into a time slip..."
	icon = 'icons/fulpicons/halloween_costumes/2020/columbia_item.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/2020/columbia_worn.dmi'
	icon_state = "columbia_hat"

//--Suits, hardsuits, jackets, bodyarmor and others
/obj/item/clothing/suit/columbia
	name = "Columbia's jacket"
	desc = "And nothing can ever be the same."
	icon = 'icons/fulpicons/halloween_costumes/2020/columbia_item.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/2020/columbia_worn.dmi'
	icon_state = "columbia_jacket"
	allowed = list(/obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)

//--Ties and others
/obj/item/clothing/neck/columbia
	name = "Columbia's bow"
	desc = "Let's do the time warp again!"
	icon = 'icons/fulpicons/halloween_costumes/2020/columbia_item.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/2020/columbia_worn.dmi'
	icon_state = "columbia_bow"

//--Shoes... ye
/obj/item/clothing/shoes/columbia
	name = "Columbia's shoes"
	desc = "It's just a jump to the left..."
	icon = 'icons/fulpicons/halloween_costumes/2020/columbia_item.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/2020/columbia_worn.dmi'
	icon_state = "columbia_shoes"

//--Box that contains the costumes
/obj/item/storage/box/halloween/edition_20/columbia
	theme_name = "2020's Columbia"
	illustration = "columbia"

/obj/item/storage/box/halloween/edition_20/columbia/PopulateContents()
	new /obj/item/clothing/under/columbia(src)
	new /obj/item/clothing/head/columbia(src)
	new /obj/item/clothing/suit/columbia(src)
	new /obj/item/clothing/neck/columbia(src)
	new /obj/item/clothing/shoes/columbia(src)
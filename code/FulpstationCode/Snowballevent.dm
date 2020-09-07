//Coded by Homingpenguins
//carpet code
/turf/open/floor/carpet/indestructible/white
	icon = 'icons/Fulpicons/Penguins_cove/White_carpet.dmi'
	floor_tile = /obj/item/stack/tile/carpet/indestructible/white
	canSmoothWith = list(/turf/open/floor/carpet/indestructible/white, /turf/open/floor/carpet/indestructible/white/airless)

/turf/open/floor/carpet/indestructible/white/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/carpet/indestructible
	name = "floor"
	icon = 'icons/turf/floors.dmi'
	footstep = FOOTSTEP_FLOOR
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = TRUE

/turf/open/floor/carpet/indestructible/Melt()
	to_be_destroyed = FALSE
	return src

/turf/open/floor/carpet/indestructible/singularity_act()
	return

/turf/open/floor/carpet/indestructible/TerraformTurf(path, new_baseturf, flags, defer_change = FALSE, ignore_air = FALSE)
	return

/obj/item/stack/tile/carpet/indestructible/white
	name = "White carpet"
	icon = 'icons/Fulpicons/Penguins_cove/SnowBallIcons.dmi'
	icon_state = "tile-carpet-white"
	inhand_icon_state = "tile-carpet-white"
	turf_type = /turf/open/floor/carpet/indestructible/white
	tableVariant = /obj/structure/table/wood/fancy/royalblue //im not making an entire white table right now. that can come later, so it will remain royalblue

//map template + area path
/datum/map_template/SnowBall
	name = "Snow_Ballroom"
	mappath = '_maps/templates/Great_Hall.dmm'

/area/centcom/events/christmas_ball
	name = "Christmas_Ball"
	icon_state = "yellow"

//food code. sprites provided by Joyce and Bampot.

/obj/item/reagent_containers/food/snacks/christmas
	name = "???"
	desc = "Christmas spices, the worst combination of spices."
	icon = 'icons/fulpicons/Penguins_cove/SnowBallIcons.dmi'
	icon_state = "tree"
	lefthand_file = 'icons/Fulpicons/fulpitems_hold_left.dmi'
	righthand_file = 'icons/Fulpicons/fulpitems_hold_right.dmi'
	list_reagents = list(/datum/reagent/consumable/nutriment = 15)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("cheese" = 1)
	foodtype = DAIRY

/obj/item/reagent_containers/food/snacks/store/christmas
	name = "???"
	desc = "Christmas spices, the worst combination of spices."
	icon = 'icons/fulpicons/Penguins_cove/SnowBallIcons.dmi'
	icon_state = "tree"
	lefthand_file = 'icons/Fulpicons/fulpitems_hold_left.dmi'
	righthand_file = 'icons/Fulpicons/fulpitems_hold_right.dmi'
	list_reagents = list(/datum/reagent/consumable/nutriment = 15)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("cheese" = 1)
	foodtype = DAIRY

/obj/item/reagent_containers/food/snacks/store/christmas/fruitcake
	name = "Fruitcake"
	desc = "An entire frutecake! Oddly hasnt been touched yet."
	icon_state = "fruitcake"
	inhand_icon_state = "fruitcake"
	slice_path = /obj/item/reagent_containers/food/snacks/christmas/fruitcake_slice
	slices_num = 6
	list_reagents = list(/datum/reagent/consumable/nutriment = 18)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("fruitcake" = 3, "cake" = 1, "fruit" = 1)
	foodtype = DAIRY
	value = FOOD_FAST

/obj/item/reagent_containers/food/snacks/christmas/fruitcake_slice
	name = "Slice of Fruitcake"
	desc = "A slice of your grandfathers fruitcake, there are still 5 slices here, and your grandfather has the only other."
	icon_state = "fruitcake_slice"
	inhand_icon_state = "fruitcake"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	tastes = list("fruitcake" = 3, "cake" = 1, "fruit" = 1)
	foodtype = DAIRY
	value = FOOD_JUNK

/obj/item/reagent_containers/food/snacks/store/christmas/fruitcake/banana
	name = "Fruitcake"
	desc = "An entire frutecake! Oddly hasnt been touched yet. This one is banana flavered!"
	icon_state = "fruitcake_banana"
	inhand_icon_state = "fruitcake"
	slice_path = /obj/item/reagent_containers/food/snacks/christmas/fruitcake_slice_banana
	slices_num = 6
	list_reagents = list(/datum/reagent/consumable/nutriment = 18)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("fruitcake" = 3, "cake" = 1, "fruit" = 1)
	foodtype = DAIRY
	value = FOOD_FAST

/obj/item/reagent_containers/food/snacks/christmas/fruitcake_slice_banana
	name = "Slice of Fruitcake"
	desc = "A slice of your grandfathers fruitcake, there are still 5 slices here, and your grandfather has the only other. Still banana flavered!"
	icon_state = "fruitcake_banana_slice"
	inhand_icon_state = "fruitcake"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	tastes = list("fruitcake" = 3, "cake" = 1, "fruit" = 1)
	foodtype = DAIRY
	value = FOOD_JUNK

/obj/item/reagent_containers/food/snacks/store/christmas/Kings_cake
	name = "King's cake"
	desc = "Something to do with french and their cakes. Comes with a doll that you are supposed to put in it, but you cant figure out how to put it in"
	icon_state = "Kingcake"
	inhand_icon_state = "Kingcake"
	slice_path = /obj/item/reagent_containers/food/snacks/christmas/King_cake_slice
	slices_num = 6
	list_reagents = list(/datum/reagent/consumable/nutriment = 18)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("cake" = 1)
	foodtype = DAIRY
	value = FOOD_FAST

/obj/item/reagent_containers/food/snacks/christmas/King_cake_slice
	name = "Slice of King's cake"
	desc = "A slice of your french friend's weird cake, you think you can see a part of a doll in it."
	icon_state = "Kingcake_slice"
	inhand_icon_state = "Kingcake"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	tastes = list("cake" = 1)
	foodtype = DAIRY
	value = FOOD_JUNK

/obj/item/reagent_containers/food/snacks/christmas/Candycane
	name = "Candycane"
	desc = "Pepperment infused suger, what can go wrong."
	icon_state = "candycane"
	inhand_icon_state = "candycane"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/sugar = 2, /datum/reagent/consumable/coco = 2) //yep, hidden coco in your candycane, fight me
	tastes = list("pepperment" = 1, "suger" = 1)
	foodtype = JUNKFOOD | SUGAR
	value = FOOD_JUNK

/obj/item/reagent_containers/food/snacks/christmas/christmas_pudding
	name = "Christmas pudding"
	desc = "A cakelike pudding that is drizzled with a suger sauce and topped with a sprig of mistletoe."
	icon_state = "puddin"
	inhand_icon_state = "puddin"
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/sugar = 2)
	tastes = list("cake" = 1, "suger" = 1)
	foodtype = JUNKFOOD | SUGAR
	value = FOOD_JUNK

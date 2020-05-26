//Special access levels, starting from 400 so I won't fuck up anything else in the future.
#define ACCESS_MECHANICUS_BASIC 400
#define ACCESS_MECHANICUS_LEADER 401
/////////////////////////////////////

//ID
/obj/item/card/id/away/techcult
	name = "tech cult identification card"
	desc = "An ID card used by religious group praising machines."
	access = list(ACCESS_MECHANICUS_BASIC)
	icon = 'icons/Fulpicons/cards.dmi'
	icon_state = "techcult"
	uses_overlays = FALSE
	registered_age = null

//Closets
/obj/structure/closet/secure_closet/mechanicus
	name = "tech storage"
	req_access = list(ACCESS_MECHANICUS_BASIC)

/obj/structure/closet/secure_closet/mechanicus/implants
	name = "implants storage"

/obj/structure/closet/secure_closet/mechanicus/implants/PopulateContents()
	..()
	var/static/items_inside = list(
		/obj/item/organ/cyberimp/arm/toolset = 2,
		/obj/item/organ/cyberimp/arm/surgery = 2,
		/obj/item/organ/cyberimp/chest/reviver = 3,
		/obj/item/organ/cyberimp/mouth/breathing_tube = 3,
		/obj/item/organ/cyberimp/chest/nutriment/plus = 5,
		/obj/item/organ/tongue/robot = 5,
		/obj/item/organ/lungs/cybernetic/tier3 = 3,
		/obj/item/organ/heart/cybernetic/tier3 = 3)
	generate_items_inside(items_inside,src)

//Armor
/obj/item/clothing/suit/hooded/techpriest/armor
	name = "armored techpriest robes"
	desc = "An armored version of robes worn by followers of the machine god."
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/pickaxe, /obj/item/organ/regenerative_core/legion, /obj/item/kitchen/knife/combat/bone, /obj/item/kitchen/knife/combat/survival)
	armor = list("melee" = 45, "bullet" = 10, "laser" = 25, "energy" = 35, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 60, "acid" = 60)
	hoodtype = /obj/item/clothing/head/hooded/techpriest/armor

/obj/item/clothing/head/hooded/techpriest/armor
	name = "armored techpriest's hood"
	desc = "An armored version of hood worn by followers of the machine god."
	armor = list("melee" = 45, "bullet" = 10, "laser" = 25, "energy" = 35, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 60, "acid" = 60)

//Spawners
/obj/effect/mob_spawn/human/techcult
	name = "Adept of the Machine Cult"
	roundstart = FALSE
	random = TRUE
	death = FALSE
	show_flavour = TRUE
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	short_desc = "You are the member of the machine cult on Lavaland."
	flavour_text = ""
	important_info = "Listen to your leader, help those in need and cleanse this land from monsters."
	outfit = /datum/outfit/techcult
	assignedrole = "Tech Priest"

/datum/outfit/techcult
	name = "Tech Priest"
	uniform = /obj/item/clothing/under/color/black
	suit = /obj/item/clothing/suit/hooded/techpriest/armor
	shoes = /obj/item/clothing/shoes/cyborg
	gloves = /obj/item/clothing/gloves/color/black
	back = /obj/item/storage/backpack
	belt = /obj/item/storage/belt/utility/full
	id = /obj/item/card/id/away/techcult

//Ruin datum

/datum/map_template/ruin/lavaland/techcult
	name = "Adeptus Mechanicus"
	id = "techcult"
	description = "An old base, filled with religious fanatics praising the entity they call 'Machine God'."
	cost = 20
	suffix = "lavaland_surface_techcult.dmm"
	allow_duplicates = FALSE

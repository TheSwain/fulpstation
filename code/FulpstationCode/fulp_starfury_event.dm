/******************** SHUTTLE DATUM ********************/

/datum/map_template/shuttle/syndifury //Starfury Battle Cruiser event shuttles
	port_id = "syndifury"
	can_be_bought = FALSE

/datum/map_template/shuttle/syndifury/starfury
	suffix = "starfury"
	name = "Syndicate Battle Cruiser"

/datum/map_template/shuttle/syndifury/sbcfighter
	suffix = "sbcfighter"
	name = "Syndicate Fighter"

/datum/map_template/shuttle/syndifury/sbccorvette
	suffix = "sbccorvette"
	name = "Syndicate Corvette"

/******************** AREAS ********************/

/area/shuttle/sbc
	name = "SBC Starfury"
	requires_power = TRUE
	canSmoothWithAreas = /area/shuttle/sbc

/area/shuttle/sbc/starfury
	name = "Syndicate Battle Cruiser Bridge"
	icon_state = "bridge"
	ambientsounds = list('sound/ambience/signal.ogg')

/area/shuttle/sbc/med
	name = "Syndicate Battle Cruiser Medbay"
	icon_state = "medbay3"
	ambientsounds = MEDICAL

/area/shuttle/sbc/engi
	name = "Syndicate Battle Cruiser Engineering"
	icon_state = "yellow"
	ambientsounds = ENGINEERING

/area/shuttle/sbc/bay
	name = "Syndicate Battle Cruiser Shuttle Bay"
	icon_state = "cargo_bay"

/area/shuttle/sbc/armory
	name = "Syndicate Battle Cruiser Armory"
	icon_state = "brig"

/area/shuttle/sbc/crew
	name = "Syndicate Battle Cruiser Crew Area"
	icon_state = "Sleep"

/area/shuttle/sbc/supermatter
	name = "Syndicate Battle Cruiser Engine"
	icon_state = "engine_sm"

/area/shuttle/sbc/fighter1
	name = "SBC Fighter 1"

/area/shuttle/sbc/corvette
	name = "SBC corvette"

/******************** OBJECTIVE ********************/

/datum/objective/syndicatesupermatter
	name = "keep SM intact"
	explanation_text = "Keep the supermatter engine onboard the cruiser intact."

/datum/objective/syndicatesupermatter/check_completion()
	return !!GLOB.syndicate_supermatter_engine

/******************** OBJECTS & ITEMS ********************/

//Turret
/obj/machinery/porta_turret/syndicate/starfury
	shot_delay = 5
	armor = list("melee" = 20, "bullet" = 40, "laser" = 60, "energy" = 60, "bomb" = 80, "bio" = 0, "rad" = 0, "fire" = 90, "acid" = 90)

//Energy Crowbar
/obj/item/crowbar/combat
	name = "combat crowbar"
	desc = "An advanced crowbar 'borrowed' from the combined alliance."
	icon = 'icons/Fulpicons/starfury.dmi'
	lefthand_file = 'icons/Fulpicons/fulpitems_hold_left.dmi'
	righthand_file = 'icons/Fulpicons/fulpitems_hold_right.dmi'
	icon_state = "crowbar_combat"
	inhand_icon_state = "crowbar_combat"
	attack_verb = list("devastated", "brutalized", "crowbarred")
	tool_behaviour = null
	toolspeed = null
	var/on = FALSE

/obj/item/crowbar/combat/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)

/obj/item/crowbar/combat/attack_self(mob/living/user)
	on = !on
	force = on ? 18 : initial(force)
	w_class = on ? WEIGHT_CLASS_NORMAL : initial(w_class)
	throwforce = on ? 10 : initial(throwforce)
	tool_behaviour = on ? TOOL_CROWBAR : initial(tool_behaviour)
	toolspeed = on ? 0.5 : initial(toolspeed)
	hitsound = on ? 'sound/weapons/blade1.ogg' : "swing_hit"
	playsound(user, on ? 'sound/weapons/saberon.ogg' : 'sound/weapons/saberoff.ogg', 5, TRUE)
	to_chat(user, "<span class='warning'>[src] is now [on ? "active" : "concealed"].</span>")
	update_icon()

/obj/item/crowbar/combat/update_icon_state()
	icon_state = "[initial(icon_state)][on ? "_on" : ""]"
	inhand_icon_state = "[initial(inhand_icon_state)][on ? "1" : ""]"

//Engi Toolbelt
/obj/item/storage/belt/utility/syndicate/sbc/PopulateContents()
	new /obj/item/screwdriver/nuke(src)
	new /obj/item/wrench/combat(src)
	new /obj/item/weldingtool/largetank(src)
	new /obj/item/crowbar/combat(src)
	new /obj/item/wirecutters(src)
	new /obj/item/multitool(src)
	new /obj/item/inducer/syndicate(src)

//Eyepatch
/obj/item/clothing/glasses/hud/eyepatch/admiral
	name = "optical thermal eyepatch"
	desc = "An eyepatch with built-in thermal and night-vision optics."
	icon_state = "eyepatch"
	inhand_icon_state = "eyepatch"
	vision_flags = SEE_MOBS
	darkness_view = 8
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE
	glass_colour_type = /datum/client_colour/glass_colour/red
	hud_type = DATA_HUD_SECURITY_ADVANCED
	hud_trait = TRAIT_SECURITY_HUD

//Shuttle computers
/obj/machinery/computer/shuttle/starfurybc
	name = "battle cruiser console"
	shuttleId = "starfury"
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	light_color = LIGHT_COLOR_RED
	req_access = list(ACCESS_SYNDICATE)
	possible_destinations = "starfury_home;starfury_custom"

/obj/machinery/computer/camera_advanced/shuttle_docker/syndicate/starfurybc
	name = "battle cruiser navigation computer"
	desc = "Used to designate a precise transit location for the battle cruiser."
	shuttleId = "starfury"
	jumpto_ports = list("starfury_home" = 1, "syndicate_ne" = 1, "syndicate_nw" = 1, "syndicate_n" = 1, "syndicate_se" = 1, "syndicate_sw" = 1, "syndicate_s" = 1)
	shuttlePortId = "starfury_custom"
	view_range = 40
	y_offset = -30

//IDs
/obj/item/card/id/syndicate_command/crew_id/med
	assignment = "Syndicate Medical Doctor"

/obj/item/card/id/syndicate_command/crew_id/engi
	assignment = "Syndicate Engineer"

/obj/item/card/id/syndicate_command/crew_id/sec
	assignment = "Syndicate Assault Operative"

/obj/item/card/id/syndicate_command/crew_id/cap
	assignment = "Syndicate Captain"

//Decals
/obj/effect/turf_decal/starfury
	icon = 'icons/Fulpicons/starfury.dmi'

/obj/effect/turf_decal/starfury/one
	icon_state = "SBC1"

/obj/effect/turf_decal/starfury/two
	icon_state = "SBC2"

/obj/effect/turf_decal/starfury/three
	icon_state = "SBC3"

/obj/effect/turf_decal/starfury/four
	icon_state = "SBC4"

/obj/effect/turf_decal/starfury/five
	icon_state = "SBC5"

/obj/effect/turf_decal/starfury/six
	icon_state = "SBC6"

/obj/effect/turf_decal/starfury/seven
	icon_state = "SBC7"

/obj/effect/turf_decal/starfury/eight
	icon_state = "SBC8"

/obj/effect/turf_decal/starfury/nine
	icon_state = "SBC9"

/obj/effect/turf_decal/starfury/ten
	icon_state = "SBC10"

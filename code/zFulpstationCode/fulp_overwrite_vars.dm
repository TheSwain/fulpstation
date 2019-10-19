
/*
		WELCOME TO THE FULPSTATION CODE Z-LEVEL!


	Any time we want to outright overwrite a variable that is already given a value in a previously defined atom or datum, we
	can overwrite it here!

		WHY DO THIS?

	So we don't have to overwrite the variables defined in TG code.
*/





 	//antag disallowing//

/datum/game_mode/revolution
	restricted_jobs = list("Security Officer", "Warden", "Detective", "AI", "Cyborg","Captain", "Head of Personnel", "Head of Security", "Chief Engineer", "Research Director", "Chief Medical Officer", "Deputy")

/datum/game_mode/clockwork_cult
	restricted_jobs = list("Chaplain", "Captain", "Deputy")

/datum/game_mode/cult
	restricted_jobs = list("Chaplain","AI", "Cyborg", "Security Officer", "Warden", "Detective", "Head of Security", "Captain", "Head of Personnel", "Deputy")

/datum/game_mode/traitor
	restricted_jobs = list("Cyborg", "Deputy")




/obj/item/clothing/accessory
	mob_overlay_icon = 'icons/mob/clothing/accessories.dmi'

/obj/item/clothing/suit/space/hardsuit
	var/toggle_helmet_sound = 'sound/mecha/mechmove03.ogg'


//***********************************************************
//**** Security Expanded Kits BEGINS - Surrealistik, Oct 2019
//***********************************************************

/datum/outfit/job/detective
	glasses = /obj/item/clothing/glasses/detective
	backpack_contents = list(/obj/item/storage/box/evidence=1,\
		/obj/item/detective_scanner=1,\
		/obj/item/melee/classic_baton=1,\
		/obj/item/taperecorder=1,\
		/obj/item/camera/detective=1,\
		/obj/item/sensor_device=1,\
		/obj/item/pinpointer/crew=1,\
		)

/obj/item/cartridge/detective
	access = CART_SECURITY | CART_MEDICAL | CART_MANIFEST | CART_REAGENT_SCANNER | CART_ATMOS

/datum/techweb_node/integrated_HUDs
	design_ids = list("health_hud", "security_hud", "diagnostic_hud", "scigoggles", "detective_glasses")

/datum/design/detective_scanner
	desc = "Used to remotely scan objects and biomass for DNA and fingerprints, and has an integrated health and reagent analyzer. Can print a report of its findings."

/obj/item/detective_scanner
	desc = "Used to remotely scan objects and biomass for DNA and fingerprints, and has an integrated health and reagent analyzer. Can print a report of its findings."

/obj/item/detective_scanner
	var/mode
	var/advanced = TRUE
	icon = 'icons/Fulpicons/surrealistik_stuff/detective_obs.dmi'
	icon_state = "forensicnew-0"


//***********************************************************
//**** Security Expanded Kits ENDS - Surrealistik, Oct 2019
//***********************************************************

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

//*****************************************************************************
//** Engineer Borg Manipulator Improvement by Surrealistik Oct 2019 BEGINS
//** -------------------------------------------------------------------------
//** Engiborgs now start with a manipulator for wall mounted frames and basic
//** electronics which can be upgraded to hold stock parts and circuitboards
//*****************************************************************************

/obj/item/robot_module/engineering
	basic_modules = list(
		/obj/item/assembly/flash/cyborg,
		/obj/item/borg/sight/meson,
		/obj/item/construction/rcd/borg,
		/obj/item/pipe_dispenser,
		/obj/item/extinguisher,
		/obj/item/weldingtool/largetank/cyborg,
		/obj/item/screwdriver/cyborg,
		/obj/item/wrench/cyborg,
		/obj/item/crowbar/cyborg,
		/obj/item/wirecutters/cyborg,
		/obj/item/multitool/cyborg,
		/obj/item/t_scanner,
		/obj/item/analyzer,
		/obj/item/geiger_counter/cyborg,
		/obj/item/assembly/signaler/cyborg,
		/obj/item/areaeditor/blueprints/cyborg,
		/obj/item/electroadaptive_pseudocircuit,
		/obj/item/stack/sheet/metal/cyborg,
		/obj/item/stack/sheet/glass/cyborg,
		/obj/item/stack/sheet/rglass/cyborg,
		/obj/item/stack/rods/cyborg,
		/obj/item/stack/tile/plasteel/cyborg,
		/obj/item/borg/apparatus/circuit,
		/obj/item/stack/cable_coil/cyborg)

/obj/item/borg/apparatus/circuit
	name = "basic component manipulation apparatus"
	desc = "A special apparatus for carrying and manipulating engineering components like electronics and wall mounted frames. Alt-Z or right-click to drop the stored object."
	var/upgraded = FALSE
	storable = list(/obj/item/wallframe,
				/obj/item/tank,
				/obj/item/electronics)

/obj/item/borg/upgrade/circuit_app
	name = "advanced component manipulation apparatus"
	desc = "An engineering cyborg upgrade that improves the engineering cyborg manipulator, allowing it to manipulate circuitboards and stock parts."

/datum/design/borg_upgrade_circuit_app
	name = "Cyborg Upgrade (Component Manipulator Upgrade)"

//*****************************************************************************
//** Engineer Borg Manipulator Improvement by Surrealistik Oct 2019 ENDS
//*****************************************************************************
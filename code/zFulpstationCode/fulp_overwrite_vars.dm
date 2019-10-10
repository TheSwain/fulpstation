
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

//*******************************************************
///Cell Cartridge PR by Surrealistik Oct 2019 BEGINS
//*******************************************************

///DATUMS
/datum/design/cell_cartridge
	name = "Energy Weapon Cell Cartridge"
	desc = "Power cell cartridge designed for loading into certain types of energy weapons."
	id = "cell_cartridge"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 5000, /datum/material/glass = 1000, /datum/material/gold = 1000)
	build_path = /obj/item/cell_cartridge/dead
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/outfit/job/hos
	backpack_contents = list(/obj/item/melee/baton/loaded=1, /obj/item/cell_cartridge)

/datum/outfit/job/security
	backpack_contents = list(/obj/item/melee/baton/loaded=1, /obj/item/cell_cartridge)

/datum/outfit/job/warden
	backpack_contents = list(/obj/item/melee/baton/loaded=1, /obj/item/cell_cartridge)

/datum/techweb_node/electric_weapons
	design_ids = list("stunrevolver", "cell_cartridge", "ioncarbine")

///OBJECTS
/obj/item/gun/energy
	///sound when inserting cell
	var/load_sound = 'sound/weapons/gun/general/magazine_insert_full.ogg'
	///sound when inserting an empty magazine
	var/load_empty_sound = "buzz-sigh.ogg"
	///volume of loading sound
	var/load_sound_volume = 40
	///whether loading sound should vary
	var/load_sound_vary = TRUE

	///Sound of ejecting a magazine
	var/eject_sound = 'sound/weapons/gun/general/magazine_remove_full.ogg'
	///sound of ejecting an empty magazine
	var/eject_empty_sound = 'sound/weapons/gun/general/magazine_remove_empty.ogg'
	///volume of ejecting a magazine
	var/eject_sound_volume = 40
	///whether eject sound should vary
	var/eject_sound_vary = TRUE

	///empty alarm sound (if enabled)
	var/empty_alarm_sound = 'sound/weapons/gun/general/empty_alarm.ogg'
	///empty alarm volume sound
	var/empty_alarm_volume = 70
	///whether empty alarm sound varies
	var/empty_alarm_vary = TRUE

	///Whether the gun alarms when empty or not.
	var/empty_alarm = FALSE
	///Whether the gun is currently alarmed to prevent it from spamming sounds
	var/alarmed = FALSE

	///Maximum cell charge an unloadable gun will accept; 1000 by default.
	var/max_accept = 1000
	///Where the cell can accept self-charging cells.
	var/self_charge_allowed = FALSE

	///Whether the gun's cell can be unloaded
	var/can_unload = FALSE
	///Time it takes to load in deciseconds
	var/load_time = 40
	///Time it takes to unload in deciseconds
	var/unload_time = 0

	var/obj/item/cell_cartridge/cartridge //What type of power cell this uses
	var/cartridge_type = /obj/item/cell_cartridge
	var/uses_cartridge = FALSE //If this gun uses cell cartridges


/obj/item/gun/energy/disabler
	empty_alarm = TRUE
	can_unload = TRUE
	uses_cartridge = TRUE //If this gun uses cell cartridges

//*******************************************************
///Cell Cartridge PR by Surrealistik Oct 2019 ENDS
//******************************************************
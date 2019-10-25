
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

//************************************************************
//** Improved Sec Starter Gear by Surrealistik Oct 2019 BEGINS
//************************************************************

/datum/outfit/job/security
	backpack_contents = list() //Start with stun baton in belt.
	r_pocket = /obj/item/pda/security
	belt = /obj/item/storage/belt/security/fulp_starter_full
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	box = /obj/item/storage/box/security/improved
	pda_slot = SLOT_R_STORE

/datum/outfit/job/warden
	backpack_contents = list() //Start with stun baton in belt.
	r_pocket = /obj/item/pda/security
	belt = /obj/item/storage/belt/security/fulp_starter_full
	box = /obj/item/storage/box/security/improved
	pda_slot = SLOT_R_STORE

/datum/outfit/job/hos
	backpack_contents = list() //Start with stun baton in belt.
	r_pocket = /obj/item/pda/security
	belt = /obj/item/storage/belt/security/fulp_starter_full
	box = /obj/item/storage/box/security/improved
	pda_slot = SLOT_R_STORE

//************************************************************
//** Improved Sec Starter Gear by Surrealistik Oct 2019 ENDS
//************************************************************
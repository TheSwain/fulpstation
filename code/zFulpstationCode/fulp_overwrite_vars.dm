
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


/datum/techweb_node/sec_basic
	design_ids = list("seclite", "pepperspray", "bola_energy", "zipties", "evidencebag", "sec_radio", "sec_belt", "protolathe_handcuffs", "security_helmet", "security_armor", "security_uniform", "security_boots", "stun_baton")

/obj/machinery/vending/security
	products = list(/obj/item/restraints/handcuffs = 8,
					/obj/item/restraints/handcuffs/cable/zipties = 10,
					/obj/item/grenade/flashbang = 15, //Increase of flashbangs to compensate for loss of flashbangs from Sec Officer belt (Estimating ~5) and Sec lockers (~6).
					/obj/item/assembly/flash/handheld = 5,
					/obj/item/reagent_containers/food/snacks/donut = 12,
					/obj/item/storage/box/evidence = 6,
					/obj/item/flashlight/seclite = 4,
					/obj/item/radio/headset/headset_sec/alt = 6, //Compensate for loss of gear from sec-lockers (~6).
					/obj/item/clothing/glasses/hud/security/sunglasses = 6, //Compensate for loss of gear from sec-lockers (~6).
					/obj/item/restraints/legcuffs/bola/energy = 7)

/obj/machinery/vending/wardrobe/sec_wardrobe
	products = list(/obj/item/clothing/suit/hooded/wintercoat/security = 3,
					/obj/item/storage/backpack/security = 3,
					/obj/item/storage/backpack/satchel/sec = 3,
					/obj/item/storage/backpack/duffelbag/sec = 3,
					/obj/item/clothing/under/rank/security/officer = 3,
					/obj/item/clothing/suit/armor/vest/alt = 6, //Compensate for loss of gear from sec-lockers (~6).
					/obj/item/clothing/head/helmet = 6, //Compensate for loss of gear from sec-lockers (~6).
					/obj/item/clothing/shoes/jackboots = 3,
					/obj/item/clothing/head/beret/sec = 3,
					/obj/item/clothing/head/soft/sec = 3,
					/obj/item/clothing/mask/bandana/red = 3,
					/obj/item/clothing/under/rank/security/officer/skirt = 3,
					/obj/item/clothing/under/rank/security/officer/grey = 3,
					/obj/item/clothing/under/pants/khaki = 3,
					/obj/item/clothing/under/rank/security/officer/blueshirt = 3,
					/obj/item/clothing/shoes/jackboots/digitigrade = 2)

/obj/machinery/vending/wardrobe/sec_wardrobe
	req_access = list(ACCESS_SECURITY) //We can now vend armor and helmets, so we need to protect the contents.

/obj/structure/closet/secure_closet/security/PopulateContents()
	..()
	for(var/atom/movable/AM in src) //Empty to reduce locker bloat due to better on-spawn gear and expanded protolathe options; let the grand purge begin.
		qdel(AM)

//************************************************************
//** Improved Sec Starter Gear by Surrealistik Oct 2019 ENDS
//************************************************************
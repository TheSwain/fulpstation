/datum/job/fulp/emt //[FULP] [XEON] EMT job
	title = "EMT"
	flag = EMT
	department_head = list("Chief Medical Officer")
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 3
	spawn_positions = 2
	supervisors = "the chief medical officer"
	selection_color = "#ffeef0"
	outfit = /datum/outfit/job/emt
	fulp_spawn = /area/medical/sleeper
	minimal_player_age = 7
	exp_requirements = 600 // 10 Hours of Med to unlock
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_MEDICAL

	id_icon = 'icons/fulpicons/cards.dmi'
	hud_icon = 'icons/fulpicons/fulphud.dmi'

	access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY, ACCESS_CHEMISTRY, ACCESS_GENETICS, ACCESS_CLONING, ACCESS_MECH_MEDICAL, ACCESS_MINERAL_STOREROOM,ACCESS_MAINT_TUNNELS,ACCESS_MINING_STATION,ACCESS_EVA) // Skeleton Access
	minimal_access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY, ACCESS_CLONING, ACCESS_MECH_MEDICAL, ACCESS_MINERAL_STOREROOM,ACCESS_MAINT_TUNNELS,ACCESS_MINING_STATION,ACCESS_EVA) // Normal Access
	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_MED

	display_order = JOB_DISPLAY_ORDER_MEDICAL_DOCTOR

/datum/outfit/job/emt //EMT outfit
	name = "EMT"
	jobtype = /datum/job/fulp/emt
	head = /obj/item/clothing/head/soft/emt/emt
	belt = /obj/item/storage/belt/medical
	ears = /obj/item/radio/headset/headset_med
	uniform = /obj/item/clothing/under/rank/medical/emt
	shoes = /obj/item/clothing/shoes/sneakers/white
	suit =  /obj/item/clothing/suit/apron/emt
	l_hand = /obj/item/storage/firstaid/emt
	r_hand = /obj/item/book/manual/wiki/emt
	suit_store = /obj/item/flashlight/pen
	r_pocket = /obj/item/gps/medical
	l_pocket = /obj/item/pda/medical
	pda_slot = SLOT_L_STORE
	backpack_contents = list(
		/obj/item/storage/firstaid/medical = 1,
		)

	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med

	chameleon_extras = /obj/item/gun/syringe

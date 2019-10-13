/datum/job/fulp/nurse
	title = "Nurse"
	flag = NURSE
	department_head = list("Chief Medical Officer")
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 4
	spawn_positions = 3
	supervisors = "the chief medical officer"
	selection_color = "#ffeef0"
	outfit = /datum/outfit/job/nurse
	fulp_spawn = /area/medical/sleeper

	id_icon = 'icons/fulpicons/cards.dmi'
	hud_icon = 'icons/fulpicons/fulphud.dmi'

	access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY, ACCESS_CLONING, ACCESS_MECH_MEDICAL, ACCESS_MINERAL_STOREROOM) // Skeleton Access
	minimal_access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY, ACCESS_CLONING, ACCESS_MECH_MEDICAL, ACCESS_MINERAL_STOREROOM,) // Normal Access
	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_MED

	display_order = JOB_DISPLAY_ORDER_MEDICAL_DOCTOR

/datum/outfit/job/nurse
	name = "Nurse"
	jobtype = /datum/job/fulp/nurse

	belt = /obj/item/pda/medical
	ears = /obj/item/radio/headset/headset_med
	shoes = /obj/item/clothing/shoes/sneakers/white
	l_hand = /obj/item/storage/firstaid/medical
	suit_store = /obj/item/flashlight/pen

	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med

/datum/outfit/job/nurse/pre_equip(mob/living/carbon/human/H) // Nurses get their uniform equipped prior to being equiped. This allows us to randomize their uniform.
	..()
	if(H.jumpsuit_style == PREF_SUIT)
		uniform = pick(/obj/item/clothing/under/rank/medical/doctor/blue, /obj/item/clothing/under/rank/medical/doctor/green, /obj/item/clothing/under/rank/medical/doctor/purple) // 50% Blue, 25% Green, 25% Red.
	else
		uniform = /obj/item/clothing/under/rank/medical/doctor/nurse

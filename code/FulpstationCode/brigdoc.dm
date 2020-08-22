/datum/job/fulp/brigdoc
	title = "Brig Physician"
	flag = BRIGDOC
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	department_head = list("Head of Security", "Chief Medical Officer")
	faction = "Station"
	total_positions = 2
	spawn_positions = 1
	supervisors = "the head of security and the chief medical officer"
	selection_color = "#ffeef0"
	minimal_player_age = 14
	exp_requirements = 300
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_SECURITY
	id_icon = 'icons/Fulpicons/cards.dmi'
	hud_icon = 'icons/Fulpicons/fulphud.dmi'
	fulp_spawn = /area/security/brig

	outfit = /datum/outfit/job/brigdoc

	access = list(ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY, ACCESS_PHARMACY, ACCESS_CHEMISTRY, ACCESS_MECH_MEDICAL, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY, ACCESS_MECH_MEDICAL, ACCESS_MINERAL_STOREROOM)
	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_SEC
	mind_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_SECURITY_OFFICER
	bounty_types = CIV_JOB_SEC

/datum/outfit/job/brigdoc
	name = "Brig Physician"
	jobtype = /datum/job/fulp/brigdoc

	belt = /obj/item/storage/belt/medical
	ears = /obj/item/radio/headset/headset_sec/alt/department/med
	uniform = /obj/item/clothing/under/rank/security/officer
	shoes = /obj/item/clothing/shoes/jackboots
	suit =  /obj/item/clothing/suit/toggle/labcoat/armored
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	glasses = /obj/item/clothing/glasses/hud/health/sunglasses
	head = /obj/item/clothing/head/beret/sec/medical
	l_hand = /obj/item/storage/firstaid/medical
	l_pocket = /obj/item/pda/medical
	r_pocket = /obj/item/melee/classic_baton/telescopic
	suit_store = /obj/item/flashlight/pen
	backpack_contents = list(/obj/item/storage/pill_bottle/paxpsych=1)

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	box = /obj/item/storage/box/survival/medical

	implants = list(/obj/item/implant/mindshield)

/obj/item/clothing/suit/toggle/labcoat/armored
	name = "armored labcoat"
	desc = "A specialized labcoat with kevlar treading as to provide protection to field doctors."
	worn_icon = 'icons/Fulpicons/brigdoccoat.dmi'
	icon = 'icons/Fulpicons/brigdoccoat.dmi'
	icon_state = "labcoat_brigdoc"
	inhand_icon_state = "labcoat"
	blood_overlay_type = "coat"
	body_parts_covered = CHEST|ARMS|GROIN
	allowed = list(/obj/item/analyzer, /obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/hypospray, /obj/item/healthanalyzer, /obj/item/flashlight/pen, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/melee/classic_baton/telescopic, /obj/item/soap, /obj/item/sensor_device, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 30, "bomb" = 20, "bio" = 50, "rad" = 0, "fire" = 50, "acid" = 50, "wound" = 10)


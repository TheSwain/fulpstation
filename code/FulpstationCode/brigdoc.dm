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
	fulp_spawn = /obj/effect/landmark/start/brigdoc

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

	belt = /obj/item/storage/belt/medical/surgeryfilled
	ears = /obj/item/radio/headset/headset_sec/alt/department/med
	uniform = /obj/item/clothing/under/rank/medical/brigdoc
	shoes = /obj/item/clothing/shoes/jackboots
	suit =  /obj/item/clothing/suit/toggle/labcoat/armored
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	glasses = /obj/item/clothing/glasses/hud/health/sunglasses
	head = /obj/item/clothing/head/beret/sec/medical
	l_hand = /obj/item/storage/firstaid/regular
	l_pocket = /obj/item/pda/medical
	r_pocket = /obj/item/melee/classic_baton/telescopic/medical_baton
	suit_store = /obj/item/flashlight/pen
	backpack_contents = list(/obj/item/storage/pill_bottle/paxpsych=1, /obj/item/reagent_containers/glass/bottle/formaldehyde=1)

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	box = /obj/item/storage/box/survival/medical

	implants = list(/obj/item/implant/mindshield)

/datum/outfit/plasmaman/brigdoc // Ports Skyrat's Brigdoc's plasmeme outfit
	name = "Plasmaman Brig Physician"

	head = /obj/item/clothing/head/helmet/space/plasmaman/brigdoc
	uniform = /obj/item/clothing/under/plasmaman/brigdoc
	gloves = /obj/item/clothing/gloves/color/plasmaman/white

/datum/job/fulp/brigdoc/after_spawn(mob/living/H, mob/M, latejoin)
	if(!latejoin && fulp_spawn)
		var/turf/T = get_fulp_spawn(fulp_spawn)
		H.Move(T)

//Here we try to get that brig doc landmark
/obj/effect/landmark/start/security_officer/Initialize()
	..()
	var/turf/T = get_turf(src)
	new /obj/effect/landmark/start/brigdoc(T)
	qdel(src)


// Brig Doctor clothing and stuff

/obj/item/clothing/suit/toggle/labcoat/armored
	name = "armored labcoat"
	desc = "A specialized labcoat with kevlar treading as to provide protection to field doctors."
	worn_icon = 'icons/Fulpicons/enricode_icons/brigdoccoat.dmi'
	icon = 'icons/Fulpicons/enricode_icons/brigdoccoat.dmi'
	icon_state = "labcoat_brigdoc"
	inhand_icon_state = "labcoat"
	blood_overlay_type = "coat"
	body_parts_covered = CHEST|ARMS|GROIN
	allowed = list(/obj/item/analyzer, /obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/hypospray, /obj/item/healthanalyzer, /obj/item/flashlight/pen, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/melee/classic_baton/telescopic, /obj/item/soap, /obj/item/sensor_device, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 30, "bomb" = 20, "bio" = 50, "rad" = 0, "fire" = 50, "acid" = 50, "wound" = 10)

/obj/item/storage/belt/medical/surgeryfilled/PopulateContents() // Exclusive to Brig Doctor
	new /obj/item/healthanalyzer(src)
	new /obj/item/scalpel(src)
	new /obj/item/hemostat(src)
	new /obj/item/retractor(src)
	new /obj/item/circular_saw(src)
	new /obj/item/cautery(src)
	new /obj/item/surgical_drapes(src)

/obj/item/clothing/under/rank/medical/brigdoc // God bless Mith -SgtHunk
	name = "brig physician's jumpsuit"
	desc = "It's made of a special fiber that provides minor protection against biohazards and Close Quarters weaponry. It has a brig physician stripe on it."
	worn_icon = 'icons/fulpicons/enricode_icons/brigdocjumpsuit.dmi'
	icon = 'icons/fulpicons/enricode_icons/brigdocsuiticon.dmi'
	icon_state = "jumpsuit_brigdoc"
	permeability_coefficient = 0.5
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 30, "acid" = 30)
	can_adjust = FALSE
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE
	fulp_item = TRUE
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/medical/brigdoc/skirt
	name = "brig physician's jumpskirt"
	worn_icon = 'icons/fulpicons/enricode_icons/brigdocjumpsuit.dmi'
	icon_state = "jumpskirt_brigdoc"
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION

// BRIG PHYSICIAN PLASMAMAN CLOTHING BEGINS

/obj/item/clothing/under/plasmaman/brigdoc
	name = "brig physician's envirosuit"
	desc = "A lightly armoured envirosuit for our plasmamen Brig Physicians."
	worn_icon = 'icons/fulpicons/enricode_icons/brigdocjumpsuit.dmi'
	icon = 'icons/fulpicons/enricode_icons/brigdocsuiticon.dmi'
	icon_state = "envirosuit_brigdoc"
	permeability_coefficient = 0.5
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 100, "rad" = 0, "fire" = 95, "acid" = 95)
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE
	fulp_item = TRUE

/obj/item/clothing/head/helmet/space/plasmaman/brigdoc
	name = "brig physician's plasma envirosuit helmet"
	desc = "A plasmaman containment helmet for brig physicians."
	icon = 'icons/fulpicons/enricode_icons/plasmabrigdoc.dmi'
	worn_icon = 'icons/fulpicons/enricode_icons/pbrigdoc.dmi'
	icon_state = "brigdoc_envirohelm"
	inhand_icon_state = "security_envirohelm"

// BRIG PHYSICIAN PLASMAMAN CLOTHING ENDS

// Medical Baton

/obj/item/melee/classic_baton/telescopic/medical_baton
	name = "medical baton"
	desc = "A compact, specialised baton assigned to Brig Physicians. Applies light, harmless disciplining shocks to patients. It could potentially be used to jumpstart a brain with surgery."
	icon = 'icons/Fulpicons/enricode_icons/medbaton.dmi'
	icon_state = "medical_baton_0"
	lefthand_file = 'icons/Fulpicons/enricode_icons/melee_lefthand.dmi'
	righthand_file = 'icons/Fulpicons/enricode_icons/melee_righthand.dmi'
	inhand_icon_state = null
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	item_flags = NONE
	force = 0

	cooldown = 30
	stamina_damage = 40
	knockdown_time_carbon = 5
	on = FALSE
	on_sound = 'sound/weapons/batonextend.ogg'
	on_stun_sound = 'sound/effects/contractorbatonhit.ogg'

	on_icon_state = "medical_baton_1"
	off_icon_state = "medical_baton_0"
	on_inhand_icon_state = "medical_baton"
	force_on = 10
	force_off = 0
	weight_class_on = WEIGHT_CLASS_BULKY
	bare_wound_bonus = 5

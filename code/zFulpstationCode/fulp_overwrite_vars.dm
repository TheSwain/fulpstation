
/*
		WELCOME TO THE FULPSTATION CODE Z-LEVEL!


	Any time we want to outright overwrite a variable that is already given a value in a previously defined atom or datum, we
	can overwrite it here!

		WHY DO THIS?

	So we don't have to overwrite the variables defined in TG code.
*/





 	//antag disallowing//

/datum/game_mode/revolution
	restricted_jobs = list("Security Officer", "Warden", "Detective", "AI", "Cyborg","Captain", "Head of Personnel", "Head of Security", "Chief Engineer", "Research Director", "Chief Medical Officer", "Deputy", "Brig Doctor")

/datum/game_mode/clockwork_cult
	restricted_jobs = list("Chaplain", "Captain", "Deputy")

/datum/game_mode/cult
	restricted_jobs = list("Chaplain","AI", "Cyborg", "Security Officer", "Warden", "Detective", "Head of Security", "Captain", "Head of Personnel", "Deputy", "Brig Doctor")

/datum/game_mode/traitor
	restricted_jobs = list("Cyborg", "Deputy")

/obj/item/clothing/accessory
	mob_overlay_icon = 'icons/mob/clothing/accessories.dmi'

/obj/item/clothing/suit/space/hardsuit
	var/toggle_helmet_sound = 'sound/mecha/mechmove03.ogg'

 	// Job changes //

/datum/job/doctor
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_MEDICAL
	exp_requirements = 240 // 4 Hours as Nurse to unlock.

/datum/job/chemist
	minimal_player_age = 3 // Player have started playing on Fulp two or more days ago.
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_MEDICAL
	exp_requirements = 360 // 6 Hours as Medical to unlock.
	
/datum/job/virologist
	minimal_player_age = 3
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_MEDICAL
	exp_requirements = 360
	
/datum/job/geneticist
	minimal_player_age = 3
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_MEDICAL
	exp_requirements = 360

/datum/outfit/job/security
	l_pocket = /obj/item/storage/belt/pouch/firstaid/ifak // [FULP] [PNX]
	backpack_contents = list(/obj/item/melee/baton/loaded=1, /obj/item/restraints/handcuffs =1) // [FULP] [PNX]

 	// Medkit changes //
	
/obj/item/storage/firstaid/fire/PopulateContents() // Classic Fire Specialized Kit
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/pill/patch/silversulfadiazine = 3,	//FULP
		/obj/item/reagent_containers/spray/rhigoxane = 1,
		/obj/item/reagent_containers/hypospray/medipen/oxandrolone = 1,
		/obj/item/reagent_containers/hypospray/medipen = 1,
		/obj/item/healthanalyzer = 1)
	generate_items_inside(items_inside,src)
	
/obj/item/storage/firstaid/toxin/PopulateContents() // Classic Toxin Specialized Kit
	if(empty)
		return
	var/static/items_inside = list(
	    /obj/item/storage/pill_bottle/charcoal/less = 1,	//FULP
		/obj/item/reagent_containers/syringe/syriniver = 3,
		/obj/item/storage/pill_bottle/potassiodide = 1,
		/obj/item/reagent_containers/hypospray/medipen/penacid = 1,
		/obj/item/healthanalyzer = 1)
	generate_items_inside(items_inside,src)
	
/obj/item/storage/firstaid/o2/PopulateContents() // Classic Suffocation Specialized Kit
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/syringe/convermol = 3,
		/obj/item/reagent_containers/hypospray/medipen/salbutamol = 1,
		/obj/item/reagent_containers/hypospray/medipen = 1,
		/obj/item/storage/pill_bottle/iron = 1,
		/obj/item/healthanalyzer = 1)
	generate_items_inside(items_inside,src)
	
/obj/item/storage/firstaid/brute/PopulateContents() // Classic Bruite Specialized Kit
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/pill/patch/stypticpowder = 3,	//FULP
		/obj/item/stack/medical/gauze = 1,
		/obj/item/storage/pill_bottle/trophazole = 1,
		/obj/item/reagent_containers/hypospray/medipen/salacid = 1,
		/obj/item/healthanalyzer = 1)
	generate_items_inside(items_inside,src)

/obj/item/storage/firstaid/advanced/PopulateContents() // Fancy Advanced First-Aid Kit
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/pill/patch/instabitaluri = 1, //CobbSynthflesh, to be changed to old Synthflesh
		/obj/item/reagent_containers/hypospray/medipen/atropine = 2,
		/obj/item/stack/medical/gauze = 1,
		/obj/item/reagent_containers/medigel/stypticpowder = 1,	//FULP
		/obj/item/reagent_containers/medigel/silversulfadiazine = 1,	//FULP
		/obj/item/storage/pill_bottle/penacid = 1)
	generate_items_inside(items_inside,src)
	
/obj/item/storage/firstaid/tactical/PopulateContents() // Syndicate Nuclear Operative First-Aid Kit
	if(empty)
		return
	new /obj/item/stack/medical/gauze(src)
	new /obj/item/defibrillator/compact/combat/loaded(src)
	new /obj/item/reagent_containers/hypospray/combat(src)
	new /obj/item/reagent_containers/pill/patch/stypticpowder(src) // [FULP]
	new /obj/item/reagent_containers/pill/patch/stypticpowder(src) // [FUL]
	new /obj/item/reagent_containers/pill/patch/silversulfadiazine(src) // [FULP]
	new /obj/item/reagent_containers/pill/patch/silversulfadiazine(src) // [FULP]
	new /obj/item/clothing/glasses/hud/health/night(src)
	
	// Vendor changes //
	
/obj/machinery/vending/tool
	products = list(/obj/item/stack/cable_coil = 10,
		            /obj/item/crowbar = 5,
		            /obj/item/weldingtool = 3,
		            /obj/item/wirecutters = 5,
		            /obj/item/wrench = 5,
		            /obj/item/analyzer = 5,
		            /obj/item/t_scanner = 5,
		            /obj/item/screwdriver = 5,
		            /obj/item/flashlight/glowstick = 8, // [FULP] [PNX] Increased from 3 to 8 to allow more people to use them.
		            /obj/item/flashlight/glowstick/red = 6, // [FULP] [PNX] Increased from 3 to 6 to allow more people to use them.
					/obj/item/storage/belt/pouch/lights = 2, // [FULP] [PNX]
					/obj/item/storage/belt/pouch/firstaid = 2, // [FULP] [PNX]
		            /obj/item/flashlight = 5,
		            /obj/item/clothing/ears/earmuffs = 1)

/obj/machinery/vending/engivend
	products = list(/obj/item/clothing/glasses/meson/engine = 2,
					/obj/item/clothing/glasses/welding = 3,
					/obj/item/multitool = 4,
					/obj/item/construction/rcd/loaded = 3,
					/obj/item/grenade/chem_grenade/smart_metal_foam = 10,
					/obj/item/geiger_counter = 5,
					/obj/item/stock_parts/cell/high = 10,
					/obj/item/electronics/airlock = 10,
					/obj/item/electronics/apc = 10,
					/obj/item/electronics/airalarm = 10,
					/obj/item/electronics/firealarm = 10,
					/obj/item/electronics/firelock = 10,
					/obj/item/storage/belt/pouch/lights = 4, // [FULP] [PNX]
					/obj/item/flashlight/glowstick/ultra/orange = 8, // [FULP] [PNX]
					/obj/item/flashlight/glowstick/high/white = 8, // [FULP] [PNX]
					/obj/item/flashlight/glowstick/high/orange = 8, // [FULP] [PNX]
					/obj/item/flashlight/glowstick/orange = 8) // [FULP] [PNX]
					
/obj/machinery/vending/medical
	product_ads = "Go save some lives!;The best stuff for your medbay.;Only the finest tools.;Natural chemicals!;This stuff saves lives.;Don't you want some?;Ping!;Brand new items straight from CentCom!"
	products = list(/obj/item/stack/medical/gauze = 8,
					/obj/item/reagent_containers/syringe = 12,
					/obj/item/reagent_containers/dropper = 3,
					/obj/item/healthanalyzer = 4,
					/obj/item/reagent_containers/pill/patch/stypticpowder = 5,	//FULP
					/obj/item/reagent_containers/pill/patch/silversulfadiazine = 5,	//FULP
					/obj/item/reagent_containers/syringe/convermol = 2,
					/obj/item/reagent_containers/pill/insulin = 5,
					/obj/item/reagent_containers/glass/bottle/multiver = 4,
					/obj/item/reagent_containers/glass/bottle/epinephrine = 3,
					/obj/item/reagent_containers/glass/bottle/morphine = 4,
					/obj/item/reagent_containers/glass/bottle/potass_iodide = 1,
					/obj/item/reagent_containers/glass/bottle/salglu_solution = 3,
					/obj/item/reagent_containers/glass/bottle/toxin = 3,
					/obj/item/reagent_containers/syringe/antiviral = 6,
				    /obj/item/reagent_containers/medigel/stypticpowder = 2,	//FULP
				    /obj/item/reagent_containers/medigel/silversulfadiazine = 2,	//FULP
					/obj/item/reagent_containers/medigel/sterilizine = 1,
					/obj/item/reagent_containers/medigel/thin/silversulfadiazine = 2, // [FULP] [PNX]
					/obj/item/reagent_containers/medigel/thin/stypticpowder = 2, // [FULP] [PNX]
					/obj/item/sensor_device = 2,
					/obj/item/pinpointer/crew = 2,
					/obj/item/flashlight/glowstick/cyan = 3, // [FULP] [PNX]
					/obj/item/storage/belt/pouch/medical = 1) // [FULP] [PNX] This totally won't be abused...
					
/obj/machinery/vending/security
	product_ads = "Crack capitalist skulls!;Beat some heads in!;Don't forget - harm is good!;Your weapons are right here.;Handcuffs!;Freeze, scumbag!;Don't tase me bro!;Tase them, bro.;Why not have a donut?;Brand new items straight from CentCom!"
	req_access = list(ACCESS_SECURITY)
	products = list(/obj/item/restraints/handcuffs = 8,
					/obj/item/restraints/handcuffs/cable/zipties = 10,
					/obj/item/grenade/flashbang = 4,
					/obj/item/assembly/flash/handheld = 5,
					/obj/item/reagent_containers/food/snacks/donut = 12,
					/obj/item/storage/box/evidence = 6,
					/obj/item/flashlight/seclite = 4,
					/obj/item/restraints/legcuffs/bola/energy = 7,
					/obj/item/flashlight/glowstick/military = 10, // [FULP] [PNX] Start
					/obj/item/flashlight/glowstick/military/red = 10,
					/obj/item/flashlight/glowstick/military/cyan = 10,
					/obj/item/flashlight/glowstick/military/yellow = 10,
					/obj/item/storage/belt/pouch/lights/security = 5,
					/obj/item/storage/belt/pouch/firstaid/ifak = 3) // [FULP] [PNX] End	
					
/obj/machinery/vending/wardrobe/bar_wardrobe
	product_ads = "Guaranteed to prevent stains from spilled drinks!; Save a patron's life with the new Antihol Medkit!"
	products = list(/obj/item/clothing/head/that = 2,
					/obj/item/radio/headset/headset_srv = 2,
					/obj/item/clothing/under/suit/sl = 2,
					/obj/item/clothing/under/rank/civilian/bartender = 2,
					/obj/item/clothing/under/rank/civilian/bartender/purple = 2,
					/obj/item/clothing/under/rank/civilian/bartender/skirt = 2,
					/obj/item/clothing/accessory/waistcoat = 2,
					/obj/item/clothing/suit/apron/purple_bartender = 2,
					/obj/item/clothing/head/soft/black = 2,
					/obj/item/clothing/shoes/sneakers/black = 2,
					/obj/item/reagent_containers/glass/rag = 2,
					/obj/item/storage/firstaid/alcohol = 1, // [FULP] [PNX] Instead of giving it directly to the Bartender it can go in here.
					/obj/item/storage/box/beanbag = 1,
					/obj/item/clothing/suit/armor/vest/alt = 1,
					/obj/item/circuitboard/machine/dish_drive = 1,
					/obj/item/clothing/glasses/sunglasses/reagent = 1,
					/obj/item/clothing/neck/petcollar = 1,
					/obj/item/clothing/shoes/laceup/digitigrade = 1,
					/obj/item/storage/belt/bandolier = 1,
					/obj/item/storage/pill_bottle/dice/hazard = 1,
					/obj/item/storage/bag/money = 2)
					
					
/*

	FULP MEDICAL

*/


// =================================================
// Medical Items

/obj/item/reagent_containers/medigel/salicyclic_acid //[FULP] [PNX] Made as a replacement for the old Styptic Powder gel bottles.
	name = "medical gel (salicyclic acid)"
	//desc = "A medical gel applicator bottle, designed for precision application, with an unscrewable cap. This one used to contain Styptic Powder but since NT has suddenly outlawed and replaced it with the inferior Libital to cut costs this dispensor now contains Salicyclic Acid."
	desc = "A medical gel applicator bottle, designed for precision application, with an unscrewable cap. This one contains Salicyclic Acid."
	icon_state = "brutegel"
	list_reagents = list(/datum/reagent/medicine/sal_acid = 60)

/obj/item/reagent_containers/medigel/oxandrolone //[FULP] [PNX] Made as a replacement for the old Silver Sulfadiazine gel bottles.
	name = "medical gel (oxandrolone)"
	//desc = "A medical gel applicator bottle, designed for precision application, with an unscrewable cap. This one used to contain Silver Sulfadiazine but since NT has suddenly outlawed and replaced it with the inferior Aiuri to cut costs this dispensor now contains Oxandrolone."
	desc = "A medical gel applicator bottle, designed for precision application, with an unscrewable cap. This one contains Oxandrolone."
	icon_state = "burngel"
	list_reagents = list(/datum/reagent/medicine/oxandrolone = 60)

/obj/item/storage/pill_bottle/penacid
	name = "bottle of pentetic acid pills"
	desc = "Contains seven pills used to counter toxins and radiation."
/obj/item/storage/pill_bottle/multiver/PopulateContents()
	for(var/i in 1 to 7)
	new /obj/item/reagent_containers/pill/penacid(src)

/obj/item/storage/pill_bottle/salbutamol
	name = "bottle of salbutamol pills"
	desc = "Contains seven pills used to stop suffocation and stabalize a patient."
/obj/item/storage/pill_bottle/salbutamol/PopulateContents()
	for(var/i in 1 to 7)
	new /obj/item/reagent_containers/pill/salbutamol(src)

/obj/item/stack/medical/ointment/compact
	name = "compact ointment"
	desc = "A small compact tube of ointment used to treat burn wounds."
	gender = PLURAL
	icon = 'icons/obj/stack_objects.dmi'
	amount = 2
	max_amount = 2
	heal_burn = 25 // Heals 25 damage instead of 40
	self_delay = 15 // Is a little quicker to apply though
	singular_name = "compact ointment"
	icon_state = "ointment"

/obj/item/stack/medical/bruise_pack/compact
	name = "compact bruise pack"
	singular_name = "bruise pack"
	icon = 'icons/obj/stack_objects.dmi'
	desc = "A small compact therapeutic gel pack and with bandages designed to treat blunt-force trauma."
	icon_state = "brutepack"
	heal_brute = 25
	self_delay = 15
	amount = 2
	max_amount = 2

/obj/item/stack/medical/gauze/compact
	name = "compact medical gauze"
	desc = "A compact roll of elastic cloth that is extremely effective at stopping bleeding, but does not heal wounds."
	gender = PLURAL
	icon = 'icons/obj/stack_objects.dmi'
	singular_name = "compact medical gauze"
	icon_state = "gauze"
	self_delay = 15
	amount = 3
	max_amount = 3

/obj/item/reagent_containers/medigel/thin/stypticpowder
	name = "thin medical gel bottle (styptic)"
	desc = "Heals bruises"
	icon = 'icons/fulpicons/phoenix_nest/medigel.dmi'
	volume = 30
	list_reagents = list(/datum/reagent/medicine/CF/styptic = 30)
	icon_state = "brutegelthin"

/obj/item/reagent_containers/medigel/thin/silversulfadiazine
	name = "thin medical gel bottle (silver sulf)"
	desc = "Heals burns"
	icon = 'icons/fulpicons/phoenix_nest/medigel.dmi'
	volume = 30
	list_reagents = list(/datum/reagent/medicine/CF/silver_sulfadiazine = 30)
	icon_state = "burngelthin"

/obj/item/gps/medical
	icon = 'icons/fulpicons/phoenix_nest/gps.dmi'
	icon_state = "gps-med"
	desc = "Helping EMTs locate unfortunate spaced individuals since 2019."
	gpstag = "EMT0"
	desc = "A positioning system helpful for finding spaced individuals who were smart enough to take a GPS with them. Carrying this with you might just save your corpse too."


// =================================================
// Medical Kits

/obj/item/storage/firstaid/combatmedic //[FULP] [PNX] The Brig Doc's "bread and butter" "GET THE F*** BACK UP AND SAVE ME" kit
	name = "combat medical kit"
	desc = "For when you need to quickly save a life while getting shot at."
	icon_state = "radfirstaid" // This makes it look like the fancy red Advanced Medical Kit
	item_state = "firstaid-rad"
/obj/item/storage/firstaid/combatrmedic/suicide_act(mob/living/carbon/user) // Game might crash without this, no idea.
	user.visible_message("<span class='suicide'>[user] begins bashing [user.p_them()]self with \the [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return BRUTELOSS
/obj/item/storage/firstaid/combatmedic/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/medigel/salicyclic_acid = 1, // For Brute damage
		/obj/item/reagent_containers/medigel/oxandrolone = 1, // For Burn damage
		/obj/item/storage/pill_bottle/penacid = 1, // For Toxin damage
		/obj/item/storage/pill_bottle/salbutamol = 1, // For O2 damage
		/obj/item/reagent_containers/hypospray/medipen/atropine = 2, // For "Shit's hit the fan" damage
		/obj/item/healthanalyzer = 1) // For seeing "Where're you hurt?" damage
		// /obj/item/stack/medical/gauze = 0, // We ain't gonna' need no gauze where you're goin' pardner
	generate_items_inside(items_inside,src)


// =================================================
// Medical Equipment

/obj/item/radio/headset/headset_medsec //[FULP] [PNX] Brig Doc's headset to listen to both the Security and Medical channels
	name = "medsec radio headset"
	desc = "A headset for the poor medical doctor assigned to the elite security force."
	icon_state = "med_headset"
	keyslot = new /obj/item/encryptionkey/headset_med
	keyslot2 = new /obj/item/encryptionkey/headset_sec



/obj/item/clothing/accessory/armband/medsec //[FULP] [PNX] An armband showing a Medical Doctor is working for Security
	name = "security medic armband"
	desc = "An armband, worn by medical doctors assigned to security as a medic."



/obj/item/storage/belt/medsec //[FULP] [XEON] [PNX] Brig Doc's MedSec belt
	name = "medsec belt"
	desc = "Can hold various medical supplies along with some security equipment"
	icon_state = "medicalbelt"
	item_state = "medical"
/obj/item/storage/belt/medsec/ComponentInitialize() // MedSec belt storage
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_BULKY
	STR.set_holdable(list(
		/obj/item/healthanalyzer,
		/obj/item/dnainjector,
		/obj/item/reagent_containers/dropper,
		/obj/item/reagent_containers/glass/beaker,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/pill,
		/obj/item/reagent_containers/syringe,
		/obj/item/reagent_containers/medigel,
		/obj/item/lighter,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/flashlight/pen,
		/obj/item/extinguisher/mini,
		/obj/item/reagent_containers/hypospray,
		/obj/item/sensor_device,
		/obj/item/radio,
		/obj/item/clothing/gloves/,
		/obj/item/lazarus_injector,
		/obj/item/bikehorn/rubberducky,
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/mask/breath,
		/obj/item/clothing/mask/breath/medical,
		/obj/item/surgical_drapes, // For the special Brig Surgeon. Or for the Brig Doc who needs to heal because of questionable balancing changes.
		/obj/item/scalpel,
		/obj/item/circular_saw,
		/obj/item/surgicaldrill,
		/obj/item/retractor,
		/obj/item/cautery,
		/obj/item/hemostat,
		/obj/item/geiger_counter,
		/obj/item/clothing/neck/stethoscope,
		/obj/item/stamp,
		/obj/item/clothing/glasses,
		/obj/item/wrench/medical,
		/obj/item/clothing/mask/muzzle,
		/obj/item/storage/bag/chemistry,
		/obj/item/storage/bag/bio,
		/obj/item/reagent_containers/blood,
		/obj/item/tank/internals/emergency_oxygen,
		/obj/item/gun/syringe/syndicate,
		/obj/item/implantcase,
		/obj/item/implant,
		/obj/item/implanter,
		/obj/item/pinpointer/crew,
		/obj/item/holosign_creator/medical, // Medical items end here and Sec items start.
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/restraints/handcuffs,
		/obj/item/reagent_containers/food/snacks/donut, // I don't think this is a clean way of storing food...
		/obj/item/assembly/flash/handheld,
		/obj/item/flashlight/seclite,
		/obj/item/restraints/legcuffs/bola,
		/obj/item/melee/baton,
		/obj/item/melee/classic_baton,
		/obj/item/melee/classic_baton/telescopic,
	))

/*

	FULP MEDICAL

*/


// =================================================
// Medical Items

/obj/item/reagent_containers/medigel/salicyclic_acid //[FULP] [PNX] It's better than a Styptic Powder gel bottle. Originally made to repalce CobbChem bottles, they're now a core part of the kit.
	name = "medical gel (salicyclic acid)"
	desc = "A medical gel applicator bottle, designed for precision application, with an unscrewable cap. This one contains Salicyclic Acid."
	icon_state = "brutegel"
	list_reagents = list(/datum/reagent/medicine/sal_acid = 60)

/obj/item/reagent_containers/medigel/oxandrolone //[FULP] [PNX] It's better than a Silver Sulfadiazine gel bottle. Originally made to repalce CobbChem bottles, they're now a core part of the kit.
	name = "medical gel (oxandrolone)"
	desc = "A medical gel applicator bottle, designed for precision application, with an unscrewable cap. This one contains Oxandrolone."
	icon_state = "burngel"
	list_reagents = list(/datum/reagent/medicine/oxandrolone = 60)


/obj/item/reagent_containers/pill/corazone_bar
	name = "corazone pill"
	desc = "A medication used to treat pain, fever, and inflammation, along with heart attacks. Or, in this case, liver failure."
	icon_state = "pill19"
	list_reagents = list(/datum/reagent/medicine/corazone = 10)


/obj/item/storage/pill_bottle/penacid/full
	name = "bottle of pentetic acid pills"
	desc = "Contains seven pills used to counter toxins and radiation."
/obj/item/storage/pill_bottle/penacid/full/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/pill/penacid(src)

/obj/item/storage/pill_bottle/salbutamol
	name = "bottle of salbutamol pills"
	desc = "Contains seven pills used to stop suffocation and stabalize a patient."
/obj/item/storage/pill_bottle/salbutamol/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/pill/salbutamol(src)

/obj/item/storage/pill_bottle/charcoal
	name = "bottle of charcoal pills"
	desc = "Contains seven charcoal pills to counter toxins."
/obj/item/storage/pill_bottle/charcoal/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/pill/charcoal(src)

/obj/item/storage/pill_bottle/charcoal/less
	desc = "Contains three charcoal pills to counter toxins."
/obj/item/storage/pill_bottle/charcoal/less/PopulateContents()
	for(var/i in 1 to 3)
		new /obj/item/reagent_containers/pill/charcoal(src)

/obj/item/storage/pill_bottle/barman
	desc = "Contains a couple pills used to deal with alcohol poisoning."
/obj/item/storage/pill_bottle/barman/PopulateContents()
	for(var/i in 1 to 2)
		new /obj/item/reagent_containers/pill/charcoal(src)
	for(var/i in 3 to 4)
		new /obj/item/reagent_containers/pill/corazone_bar(src)

/obj/item/stack/medical/ointment/compact
	name = "compact ointment"
	desc = "A small compact tube of ointment used to treat burn wounds."
	gender = PLURAL
	icon = 'icons/fulpicons/phoenix_nest/medical.dmi'

	amount = 2
	max_amount = 2
	heal_burn = 25 // Heals 25 damage instead of 40
	self_delay = 15 // It's a little quicker to apply though
	singular_name = "compact ointment"
	icon_state = "ointment"

/obj/item/stack/medical/bruise_pack/compact
	name = "compact bruise pack"
	singular_name = "compact bruise pack"
	icon = 'icons/fulpicons/phoenix_nest/medical.dmi'
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
	icon = 'icons/fulpicons/phoenix_nest/medical.dmi'
	singular_name = "compact medical gauze"
	icon_state = "gauze"
	self_delay = 15
	amount = 3
	max_amount = 3

/obj/item/reagent_containers/medigel/thin/stypticpowder
	name = "thin medical gel bottle (styptic)"
	desc = "A small compact medigel bottle containing Styptic Powder. This is small enough to fit into a pouch."
	icon = 'icons/fulpicons/phoenix_nest/medical.dmi'
	volume = 30
	list_reagents = list(/datum/reagent/medicine/CF/styptic = 30)
	icon_state = "brutegelthin"

/obj/item/reagent_containers/medigel/thin/silversulfadiazine
	name = "thin medical gel bottle (silver sulf)"
	desc = "A small compact medigel bottle containing Silver Sulfadiazine. This is small enough to fit into a pouch."
	icon = 'icons/fulpicons/phoenix_nest/medical.dmi'
	volume = 30
	list_reagents = list(/datum/reagent/medicine/CF/silver_sulfadiazine = 30)
	icon_state = "burngelthin"

/obj/item/gps/medical
	icon = 'icons/fulpicons/phoenix_nest/gps.dmi'
	icon_state = "gps-med"
	desc = "Helping EMTs locate unfortunate spaced individuals since 2019."
	gpstag = "EMT0"
	desc = "A positioning system helpful for finding spaced individuals who were smart enough to take a GPS with them. Carrying this with you might just save your corpse too."

/obj/item/reagent_containers/hypospray/medipen/penacid/antihol
	name = "antihol medipen"
	desc = "An autoinjector containing antihol, used to purge alcohol out of someone's system."
	list_reagents = list(/datum/reagent/medicine/antihol = 10)

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
		/obj/item/storage/pill_bottle/penacid/full = 1, // For Toxin damage
		/obj/item/storage/pill_bottle/salbutamol = 1, // For O2 damage
		/obj/item/reagent_containers/hypospray/medipen/atropine = 2, // For "Shit's hit the fan" damage
		/obj/item/healthanalyzer = 1) // For seeing "Where're you hurt?" damage
		// /obj/item/stack/medical/gauze = 0, // We ain't gonna' need no gauze where you're goin' pardner
	generate_items_inside(items_inside,src)


/obj/item/storage/firstaid/emt
	name = "emergency medical technician kit"
	desc = "A specialized medical kit given to Emergency Medical Technicians to allow them to easily stabalize patients."
	icon_state = "purplefirstaid" // This makes it appear as the unused purple Medkit.
	item_state = "firstaid-purple" // Custom sprite since there isn't an in-hand purple one.
	lefthand_file = 'icons/fulpicons/phoenix_nest/firstaidkits_lefthand.dmi'
	righthand_file = 'icons/fulpicons/phoenix_nest/firstaidkits_righthand.dmi'
	damagetype_healed = OXY
/obj/item/storage/firstaid/emt/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/stack/medical/gauze = 2, // 12 chunks of gauze bandaging people up.
		/obj/item/reagent_containers/hypospray/medipen/synthpen = 1, // The EMT's unique Synthpen. Coded by Mithrandalf.
		/obj/item/reagent_containers/hypospray/medipen = 2, // For when you can't wait for the Synthpen to come back online.
		/obj/item/storage/pill_bottle/iron = 1, // For handling bloodloss.
		/obj/item/storage/pill_bottle/penacid = 1, // For purging some toxins and high rads.
		/obj/item/healthanalyzer = 1)
	generate_items_inside(items_inside,src)


/obj/item/storage/firstaid/alcohol
	name = "bar medical kit"
	desc = "A specialized medical kit used by the Bartender when a patron drinks so much they've started killing themselves or when someone gets hit by a chair."
	icon = 'icons/fulpicons/phoenix_nest/medical.dmi'
	icon_state = "alcoholfirstaid"
	item_state = "firstaid-alcohol"
	lefthand_file = 'icons/fulpicons/phoenix_nest/firstaidkits_lefthand.dmi'
	righthand_file = 'icons/fulpicons/phoenix_nest/firstaidkits_righthand.dmi'
	damagetype_healed = TOX
/obj/item/storage/firstaid/alcohol/PopulateContents()
	if(empty)
		return
	var/static/items_inside = list(
		/obj/item/reagent_containers/hypospray/medipen/penacid/antihol = 2,
		/obj/item/storage/pill_bottle/barman = 1,
		/obj/item/stack/medical/gauze = 1,
		/obj/item/stack/medical/bruise_pack = 1,
		/obj/item/healthanalyzer = 1)
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

// =================================================
// Medical Clothing


/obj/item/clothing/under/rank/medical/emt //EMT suit and skirt
	name = "Emergency Medical Technician's jumpsuit"
	desc = "It's made of a special fiber that provides minor protection against biohazards. This one is a high-visibility blue to allow EMTs to easily be recognized."
	mob_overlay_icon = 'icons/fulpicons/phoenix_nest/clothes_overlay.dmi' // worn clothing sprites.
	icon = 'icons/fulpicons/phoenix_nest/clothes_icons.dmi' // inventory and floor sprites.
	//item = 'icons/fulpicons/phoenix_nest/clothes_items.dmi' // in-hand sprites.
	icon_state = "jumpsuit_emt" // Big sprite and overlay
	item_state = "jumpsuit_emt" // In-hand sprites
	permeability_coefficient = 0.5
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 10, "acid" = 0)
	can_adjust = FALSE
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/medical/emt/skirt
	name = "Emergency Medical Technician's jumpskirt"
	icon_state = "jumpskirt_emt"
	item_state = "jumpskirt_emt"
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION

/obj/item/clothing/head/soft/emt/emt // Yes. This is a child of the already existing EMT hat.
	name = "emergency medical technician's hat"
	desc = "It's a baseball hat with a turquoise color and a reflective cross on the top."
	mob_overlay_icon = 'icons/fulpicons/phoenix_nest/clothes_overlay.dmi'
	icon = 'icons/fulpicons/phoenix_nest/clothes_icons.dmi'
	icon_state = "hat_emt"
	soft_type = "hat_emt" // This is for flipping it around
	dog_fashion = null // Sadly

/obj/item/clothing/suit/apron/emt // Child of the Botanist apron :P
	name = "emergency medical technician's vest"
	desc = "A highly reflective vest worn by Emergency Medical Technicians."
	mob_overlay_icon = 'icons/fulpicons/phoenix_nest/clothes_overlay.dmi'
	icon = 'icons/fulpicons/phoenix_nest/clothes_icons.dmi'
	icon_state = "vest_emt"
	item_state = "vest_emt"
	allowed = list(/obj/item/analyzer, /obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/hypospray, /obj/item/healthanalyzer, /obj/item/flashlight/pen, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/melee/classic_baton/telescopic, /obj/item/soap, /obj/item/sensor_device, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 50, "rad" = 0, "fire" = 50, "acid" = 50)


/obj/item/clothing/under/rank/medical/brigdoc // The Brig Doc's very own custom jumpsuit! Special thanks to Mithrandalf for the sprites and Xeon for the code template.
	name = "brig doctor's jumpsuit"
	desc = "It's made of a special fiber that provides minor protection against biohazards. It has a brig doctor stripe on it."
	mob_overlay_icon = 'icons/fulpicons/phoenix_nest/clothes_overlay.dmi'
	icon = 'icons/fulpicons/phoenix_nest/clothes_icons.dmi'
	//item = 'icons/fulpicons/phoenix_nest/clothes_items.dmi'
	icon_state = "jumpsuit_brigdoc"
	item_state = "jumpsuit_brigdoc"
	permeability_coefficient = 0.5
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 10, "rad" = 0, "fire" = 0, "acid" = 0)
	can_adjust = FALSE
	mutantrace_variation = MUTANTRACE_VARIATION

/obj/item/clothing/under/rank/medical/brigdoc/skirt
	name = "brig doctor's jumpskirt"
	icon_state = "jumpskirt_brigdoc"
	item_state = "jumpskirt_brigdoc"
	fitted = FEMALE_UNIFORM_TOP
	mutantrace_variation = NO_MUTANTRACE_VARIATION






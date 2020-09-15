/////////////////////////////////////////////////////
// DEPARTMENTAL ERT - SgtHunk
/////////////////////////////////////////////////////

//
// ERT Datums
//

/datum/ert/medical
	roles = list(/datum/antagonist/ert/medic/specialized)
	leader_role = /datum/antagonist/ert/commander/medical
	rename_team = "Medical ERT"
	mission = "Assist your assigned Department."
	polldesc = "a Medical Nanotrasen Emergency Response Team"

/datum/ert/security
	roles = list(/datum/antagonist/ert/security/specialized)
	leader_role = /datum/antagonist/ert/commander/security
	rename_team = "Security ERT"
	mission = "Assist your assigned Department."
	polldesc = "a Security Nanotrasen Emergency Response Team"

/datum/ert/engineer
	roles = list(/datum/antagonist/ert/engineer/specialized)
	leader_role = /datum/antagonist/ert/commander/engineer
	rename_team = "Engineer ERT"
	mission = "Assist your assigned Department."
	polldesc = "an Engineering Nanotrasen Emergency Response Team"

/datum/ert/clown
	roles = list(/datum/antagonist/ert/clown/honk)
	leader_role = /datum/antagonist/ert/clown/commander
	rename_team = "Clown ERT"
	mission = "Honk the crew!"
	polldesc = "a Code HONK Nanotrasen Emergency Response Team"

/datum/ert/mining
	roles = list(/datum/antagonist/ert/miner)
	leader_role = /datum/antagonist/ert/commander/miner
	rename_team = "Mining ERT"
	mission = "Assist Mining Operations, along with neutralization of Fauna either on Station or Lavaland."
	polldesc = "a Mining Nanotrasen Emergency Response Team"

//
// ERT Antagonist Datums
//

/datum/antagonist/ert/medic/specialized
	role = "Specialized Medical Officer"
	outfit = /datum/outfit/centcom/ert/medic/specialized

/datum/antagonist/ert/commander/medical
	role = "Chief Medical Officer"
	outfit = /datum/outfit/centcom/ert/commander/medical // This and Specialized MD are actually handled by a Proc, it's just there to show off outfit

/datum/antagonist/ert/security/specialized
	role = "Specialized Security Officer"
	outfit = /datum/outfit/centcom/ert/security/specialized

/datum/antagonist/ert/commander/security
	role = "Head Of Security"
	outfit = /datum/outfit/centcom/ert/commander/security

/datum/antagonist/ert/engineer/specialized
	role = "Specialized Engineering Officer"
	outfit = /datum/outfit/centcom/ert/engineer/specialized

/datum/antagonist/ert/commander/engineer
	role = "Chief Engineer"
	outfit = /datum/outfit/centcom/ert/commander/engineer

/datum/antagonist/ert/clown/honk
	role = "Clown"
	outfit = /datum/outfit/centcom/ert/clown/honk

/datum/antagonist/ert/clown/commander
	role = "Honk Prime"
	outfit = /datum/outfit/centcom/ert/clown/commander

/datum/antagonist/ert/miner
	role = "Mining Officer"
	outfit = /datum/outfit/centcom/ert/miner

/datum/antagonist/ert/commander/miner
	role = "Mining Commander"
	outfit = /datum/outfit/centcom/ert/commander/miner

//
// ERT Outfits
//

// MEDICAL ERT OUTFITS

/datum/outfit/centcom/ert/medic/specialized
	name = "ERT Medic - Specialized"

	belt = /obj/item/storage/belt/medical/advanced
	gloves = /obj/item/clothing/gloves/color/latex/nitrile/infiltrator/medical

/datum/outfit/centcom/ert/commander/medical
	name = "ERT Commander - Medical"

	belt = /obj/item/storage/belt/medical/advanced
	suit = /obj/item/clothing/suit/space/hardsuit/ert/commandermed
	back = /obj/item/storage/backpack/ert/medical
	glasses = /obj/item/clothing/glasses/hud/health/sunglasses
	gloves = /obj/item/clothing/gloves/color/latex/nitrile/infiltrator/medical
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/melee/baton/loaded=1,\
		/obj/item/gun/energy/e_gun=1,\
		/obj/item/reagent_containers/hypospray/combat/nanites=1,\
		/obj/item/gun/medbeam=1)

/datum/outfit/centcom/ert/medic/specialized/alien
	name = "ERT Medic - Alien"

	uniform = /obj/item/clothing/under/abductor
	belt = /obj/item/storage/belt/medical/alien
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/gun/energy/alien = 1,\
		/obj/item/melee/baton/loaded=1,\
		/obj/item/reagent_containers/hypospray/combat=1,\
		/obj/item/gun/medbeam=1)

/datum/outfit/centcom/ert/medic/specialized/oath
	name = "ERT Medic - Oath"

	r_hand = /obj/item/rod_of_asclepius
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/reagent_containers/hypospray/combat=1,\
		/obj/item/gun/medbeam=1)

/datum/outfit/centcom/ert/commander/medical/alien
	name = "ERT Commander - Medical Alien"

	uniform = /obj/item/clothing/under/abductor
	belt = /obj/item/storage/belt/medical/alien
	suit_store = /obj/item/gun/energy/alien
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/melee/baton/loaded=1,\
		/obj/item/reagent_containers/hypospray/combat/nanites=1,\
		/obj/item/gun/medbeam=1)

/datum/outfit/centcom/ert/commander/medical/oath
	name = "ERT Commander - Medical Oath"

	r_hand = /obj/item/rod_of_asclepius
	l_pocket = /obj/item/flashlight/pen/paramedic
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/reagent_containers/hypospray/combat/nanites=1,\
		/obj/item/gun/medbeam=1)

// SECURITY ERT OUTFITS

/datum/outfit/centcom/ert/security/specialized
	name = "ERT Security - Specialized"

	belt = /obj/item/storage/belt/security/webbing/full
	mask = /obj/item/clothing/mask/gas/sechailer

/datum/outfit/centcom/ert/commander/security
	name = "ERT Commander - Security"

	belt = /obj/item/storage/belt/security/webbing/full
	suit = /obj/item/clothing/suit/space/hardsuit/ert/commandersec
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	glasses = /obj/item/clothing/glasses/thermal/eyepatch
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	back = /obj/item/storage/backpack/ert/security
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/storage/box/handcuffs=1,\
		/obj/item/gun/energy/e_gun/stun=1,\
		/obj/item/melee/baton/loaded=1)

// ENGINEERING ERT OUTFITS

/datum/outfit/centcom/ert/engineer/specialized
	name = "ERT Engineer - Specialized"

	belt = /obj/item/storage/belt/utility/advanced
	mask = /obj/item/clothing/mask/gas
	suit_store = /obj/item/tank/internals/oxygen
	r_hand = /obj/item/analyzer

/datum/outfit/centcom/ert/commander/engineer
	name = "ERT Commander - Engineer"

	belt = /obj/item/storage/belt/utility/advanced
	suit = /obj/item/clothing/suit/space/hardsuit/ert/commandereng
	mask = /obj/item/clothing/mask/gas
	glasses =  /obj/item/clothing/glasses/meson/engine
	back = /obj/item/storage/backpack/ert/engineer
	suit_store = /obj/item/tank/internals/oxygen
	r_pocket = /obj/item/rcd_ammo/large
	backpack_contents = list(/obj/item/storage/box/survival/engineer=1,\
		/obj/item/melee/baton/loaded=1,\
		/obj/item/gun/energy/e_gun=1,\
		/obj/item/construction/rcd/combat=1)

// CLOWN ERT OUTFITS

/datum/outfit/centcom/ert/clown/honk
	name = "ERT Clown - Specialized"

	glasses = /obj/item/clothing/glasses/night
	backpack_contents = list(/obj/item/storage/box/hug/survival=1,\
		/obj/item/melee/transforming/energy/sword/bananium=1,\
		/obj/item/shield/energy/bananium=1)

/datum/outfit/centcom/ert/clown/honk/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE) // Just to make sure
	..()
	if(visualsOnly)
		return
	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/headset_service
	R.recalculateChannels()
	ADD_TRAIT(H, TRAIT_NAIVE, INNATE_TRAIT)
	H.dna.add_mutation(CLOWNMUT)
	for(var/datum/mutation/human/clumsy/M in H.dna.mutations)
		M.mutadone_proof = TRUE

/datum/outfit/centcom/ert/clown/commander
	name = "ERT Commander - Clown"

	glasses = /obj/item/clothing/glasses/night
	shoes = /obj/item/clothing/shoes/clown_shoes/banana_shoes/combat
	suit = /obj/item/clothing/suit/space/hardsuit/ert/clown/commander
	suit_store = /obj/item/pneumatic_cannon/pie/selfcharge
	backpack_contents = list(/obj/item/storage/box/hug/survival=1,\
		/obj/item/melee/transforming/energy/sword/bananium=1,\
		/obj/item/shield/energy/bananium=1,\
		/obj/item/storage/box/fireworks=2)

/datum/outfit/centcom/ert/clown/commander/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE) // Same here
	..()
	if(visualsOnly)
		return
	var/obj/item/radio/R = H.ears
	R.keyslot = new /obj/item/encryptionkey/headset_service
	R.recalculateChannels()
	ADD_TRAIT(H, TRAIT_NAIVE, INNATE_TRAIT)
	H.dna.add_mutation(CLOWNMUT)
	for(var/datum/mutation/human/clumsy/M in H.dna.mutations)
		M.mutadone_proof = TRUE

// MINER ERT OUTFITS

/datum/outfit/centcom/ert/miner
	name = "ERT Miner"

	id = /obj/item/card/id/ert/miner
	glasses = /obj/item/clothing/glasses/meson/night
	shoes = /obj/item/clothing/shoes/bhop/combat
	suit = /obj/item/clothing/suit/space/hardsuit/ert/miner
	suit_store = /obj/item/tank/internals/oxygen
	belt = /obj/item/storage/belt/mining/advanced
	mask = /obj/item/clothing/mask/gas/explorer
	back = /obj/item/storage/backpack/ert/engineer
	l_pocket = /obj/item/gps/mining
	r_pocket = /obj/item/storage/bag/ore/holding
	backpack_contents = list(/obj/item/t_scanner/adv_mining_scanner=1,\
		/obj/item/gun/energy/kinetic_accelerator=1,\
		/obj/item/gun/energy/plasmacutter/adv=1,\
		/obj/item/storage/firstaid/regular=1,\
		/obj/item/hivelordstabilizer=3,\
		/obj/item/kitchen/knife/combat=1,\
		/obj/item/storage/box/ka_mods=1)

/datum/outfit/centcom/ert/commander/miner
	name = "ERT Commander - Mining"

	glasses = /obj/item/clothing/glasses/meson/night
	shoes = /obj/item/clothing/shoes/bhop/combat
	suit = /obj/item/clothing/suit/space/hardsuit/ert/minercommander
	suit_store = /obj/item/tank/internals/oxygen
	belt = /obj/item/storage/belt/mining/advanced
	mask = /obj/item/clothing/mask/gas/explorer
	back = /obj/item/storage/backpack/ert/engineer
	l_pocket = /obj/item/gps/mining
	r_pocket = /obj/item/storage/bag/ore/holding
	l_hand = /obj/item/kinetic_crusher
	backpack_contents = list(/obj/item/t_scanner/adv_mining_scanner=1,\
		/obj/item/gun/energy/kinetic_accelerator=1,\
		/obj/item/gun/energy/plasmacutter/adv=1,\
		/obj/item/storage/firstaid/regular=1,\
		/obj/item/hivelordstabilizer=3,\
		/obj/item/kitchen/knife/combat=1,\
		/obj/item/storage/box/kc_mods=1)

//
// ERT DEPARTMENTAL EXCLUSIVE BELTS
//

/obj/item/storage/belt/medical/advanced/PopulateContents()
	new /obj/item/surgical_drapes(src)
	new /obj/item/healthanalyzer/advanced(src)
	new /obj/item/scalpel/advanced(src)
	new /obj/item/retractor/advanced(src)
	new /obj/item/surgicaldrill/advanced(src)
	new /obj/item/bonesetter(src)
	new /obj/item/stack/medical/gauze/twelve(src)
	update_icon()

/obj/item/storage/belt/security/webbing/full/PopulateContents()
	new /obj/item/reagent_containers/spray/pepper(src)
	new /obj/item/restraints/handcuffs(src)
	new /obj/item/grenade/flashbang(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/melee/baton/loaded(src)
	new	/obj/item/holosign_creator/security(src)
	update_icon()

/obj/item/storage/belt/utility/advanced/PopulateContents()
	new /obj/item/screwdriver/power(src)
	new /obj/item/crowbar/power(src)
	new /obj/item/weldingtool/experimental(src)
	new /obj/item/multitool(src)
	new /obj/item/stack/cable_coil(src)
	new /obj/item/pipe_dispenser(src)
	new /obj/item/inducer(src)
	update_icon()

/obj/item/storage/belt/mining/advanced/PopulateContents()
	new /obj/item/reagent_containers/hypospray/medipen/survival/luxury(src)
	new /obj/item/reagent_containers/hypospray/medipen/survival/luxury(src)
	new /obj/item/reagent_containers/hypospray/medipen/survival/luxury(src)
	new /obj/item/organ/regenerative_core/legion(src)
	new /obj/item/organ/regenerative_core/legion(src)
	new /obj/item/organ/regenerative_core/legion(src)
	update_icon()

/obj/item/storage/belt/medical/alien/PopulateContents()
	new /obj/item/surgical_drapes(src)
	new /obj/item/healthanalyzer/advanced(src)
	new /obj/item/scalpel/alien(src)
	new /obj/item/retractor/alien(src)
	new /obj/item/hemostat/alien(src)
	new /obj/item/circular_saw/alien(src)
	new /obj/item/cautery/alien(src)
	update_icon()

//
// ERT COMMANDER HARDSUITS
//

// Medical

/obj/item/clothing/head/helmet/space/hardsuit/ert/commandermed
	name = "medical emergency response team commander helmet"
	desc = "The integrated helmet of an ERT hardsuit, belonging to a Specialized Chief Medical Officer. It has a built-in Security hud."
	worn_icon = 'icons/Fulpicons/fulpclothing_worn.dmi'
	icon = 'icons/Fulpicons/fulpclothing.dmi'
	icon_state = "hardsuit0-medert_commander"
	hardsuit_type = "medert_commander"

/obj/item/clothing/head/helmet/space/hardsuit/ert/commandermed/equipped(mob/living/carbon/human/user, slot)
	..()
	to_chat(user, "Your helmet's visor activates its integrated HUD, revealing information around you.")
	ADD_TRAIT(user, TRAIT_SECURITY_HUD, HELMET_TRAIT)
	var/datum/atom_hud/H = GLOB.huds[DATA_HUD_SECURITY_ADVANCED]
	H.add_hud_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/ert/commandermed/dropped(mob/living/carbon/human/user)
	..()
	to_chat(user, "You remove your helmet, disabling its integrated hud.")
	REMOVE_TRAIT(user, TRAIT_SECURITY_HUD, HELMET_TRAIT)
	var/datum/atom_hud/H = GLOB.huds[DATA_HUD_SECURITY_ADVANCED]
	H.remove_hud_from(user)

/obj/item/clothing/suit/space/hardsuit/ert/commandermed
	name = "medical emergency response team commander hardsuit"
	desc = "The standard issue hardsuit of the ERT, belonging to a Specialized Chief Medical Officer. Offers superb protection against environmental hazards."
	worn_icon = 'icons/Fulpicons/fulpclothing_worn.dmi'
	icon = 'icons/Fulpicons/fulpclothing.dmi'
	inhand_icon_state = "ert_medical"
	icon_state = "medert_commander"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/commandermed

// Security

/obj/item/clothing/head/helmet/space/hardsuit/ert/commandersec
	name = "security emergency response team commander helmet"
	desc = "The integrated helmet of an ERT hardsuit, belonging to a Specialized Head of Security. It has a built-in Security hud."
	worn_icon = 'icons/Fulpicons/fulpclothing_worn.dmi'
	icon = 'icons/Fulpicons/fulpclothing.dmi'
	icon_state = "hardsuit-secert_commander"
	hardsuit_type = "secert_commander"
	actions_types = list()

/obj/item/clothing/head/helmet/space/hardsuit/ert/commandersec/equipped(mob/living/carbon/human/user, slot)
	..()
	to_chat(user, "Your helmet's visor activates its integrated HUD, revealing information around you.")
	ADD_TRAIT(user, TRAIT_SECURITY_HUD, HELMET_TRAIT)
	var/datum/atom_hud/H = GLOB.huds[DATA_HUD_SECURITY_ADVANCED]
	H.add_hud_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/ert/commandersec/dropped(mob/living/carbon/human/user)
	..()
	to_chat(user, "You remove your helmet, disabling its integrated hud.")
	REMOVE_TRAIT(user, TRAIT_SECURITY_HUD, HELMET_TRAIT)
	var/datum/atom_hud/H = GLOB.huds[DATA_HUD_SECURITY_ADVANCED]
	H.remove_hud_from(user)

/obj/item/clothing/suit/space/hardsuit/ert/commandersec
	name = "security emergency response team commander hardsuit"
	desc = "The standard issue hardsuit of the ERT, belonging to a Specialized Head of Security. Offers protection against enviromental hazards, along with protection to shoves."
	worn_icon = 'icons/Fulpicons/fulpclothing_worn.dmi'
	icon = 'icons/Fulpicons/fulpclothing.dmi'
	inhand_icon_state = "ert_security"
	icon_state = "secert_commander"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/commandersec
	clothing_flags = BLOCKS_SHOVE_KNOCKDOWN

// Engineering

/obj/item/clothing/head/helmet/space/hardsuit/ert/commandereng
	name = "engineering emergency response team commander helmet"
	desc = "The integrated helmet of an ERT hardsuit, belonging to a Specialized Chief Engineer. It has a built-in Security hud."
	worn_icon = 'icons/Fulpicons/fulpclothing_worn.dmi'
	icon = 'icons/Fulpicons/fulpclothing.dmi'
	icon_state = "hardsuit0-engert_commander"
	hardsuit_type = "engert_commander"

/obj/item/clothing/head/helmet/space/hardsuit/ert/commandereng/equipped(mob/living/carbon/human/user, slot)
	..()
	to_chat(user, "Your helmet's visor activates its integrated HUD, revealing information around you.")
	ADD_TRAIT(user, TRAIT_SECURITY_HUD, HELMET_TRAIT)
	var/datum/atom_hud/H = GLOB.huds[DATA_HUD_SECURITY_ADVANCED]
	H.add_hud_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/ert/commandereng/dropped(mob/living/carbon/human/user)
	..()
	to_chat(user, "You remove your helmet, disabling its integrated hud.")
	REMOVE_TRAIT(user, TRAIT_SECURITY_HUD, HELMET_TRAIT)
	var/datum/atom_hud/H = GLOB.huds[DATA_HUD_SECURITY_ADVANCED]
	H.remove_hud_from(user)

/obj/item/clothing/suit/space/hardsuit/ert/commandereng
	name = "engineering emergency response team commander hardsuit"
	desc = "The standard issue hardsuit of the ERT, belonging to a Specialized Chief Engineer. Offers superb protection against environmental hazards."
	worn_icon = 'icons/Fulpicons/fulpclothing_worn.dmi'
	icon = 'icons/Fulpicons/fulpclothing.dmi'
	inhand_icon_state = "ert_engineer"
	icon_state = "engert_commander"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/commandereng

// Clown

/obj/item/clothing/head/helmet/space/hardsuit/ert/clown/commander
	name = "clown emergency response team commander helmet"
	desc = "The integrated helmet of an ERT hardsuit, this one is colourful, with a green visor!"
	worn_icon = 'icons/Fulpicons/fulpclothing_worn.dmi'
	icon = 'icons/Fulpicons/fulpclothing.dmi'
	icon_state = "hardsuit0-clownert_commander"
	hardsuit_type = "clownert_commander"

/obj/item/clothing/suit/space/hardsuit/ert/clown/commander
	name = "clown emergency response team commander hardsuit"
	desc = "The non-standard issue hardsuit of the Honk Prime, this one is colourful! Offers superb protection against environmental hazards. Does not offer superb protection against a ravaging crew."
	worn_icon = 'icons/Fulpicons/fulpclothing_worn.dmi'
	icon = 'icons/Fulpicons/fulpclothing.dmi'
	icon_state = "clownert_commander"
	inhand_icon_state = "ert_clown"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/clown/commander
	allowed = list(/obj/item/tank/internals, /obj/item/bikehorn, /obj/item/instrument, /obj/item/reagent_containers/food/snacks/grown/banana, /obj/item/grown/bananapeel, /obj/item/pneumatic_cannon/pie)

// Mining

/obj/item/clothing/head/helmet/space/hardsuit/ert/miner
	name = "mining emergency response team helmet"
	desc = "The integrated helmet of an ERT hardsuit, built around the several Lavaland hazards."
	worn_icon = 'icons/Fulpicons/fulpclothing_worn.dmi'
	icon = 'icons/Fulpicons/fulpclothing.dmi'
	icon_state = "hardsuit-mining_ert"
	hardsuit_type = "mining_ert"
	actions_types = list()
	armor = list("melee" = 80, "bullet" = 35, "laser" = 35, "energy" = 40, "bomb" = 70, "bio" = 100, "rad" = 100, "fire" = 80, "acid" = 80)

/obj/item/clothing/suit/space/hardsuit/ert/miner
	name = "emergency response team mining hardsuit"
	desc = "The standard issue hardsuit of the ERT. Offers superb protection against Lavaland hazards."
	worn_icon = 'icons/Fulpicons/fulpclothing_worn.dmi'
	icon = 'icons/Fulpicons/fulpclothing.dmi'
	icon_state = "mining_ert"
	inhand_icon_state = "ert_engineer"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/miner
	armor = list("melee" = 80, "bullet" = 35, "laser" = 35, "energy" = 40, "bomb" = 70, "bio" = 100, "rad" = 100, "fire" = 80, "acid" = 80)

/obj/item/clothing/head/helmet/space/hardsuit/ert/minercommander
	name = "commander emergency response team mining helmet"
	desc = "The integrated helmet of an ERT hardsuit, built around the several Lavaland hazards and belonging to a Mining Commander."
	worn_icon = 'icons/Fulpicons/fulpclothing_worn.dmi'
	icon = 'icons/Fulpicons/fulpclothing.dmi'
	icon_state = "hardsuit-miningert_commander"
	hardsuit_type = "miningert_commander"
	actions_types = list()
	armor = list("melee" = 80, "bullet" = 35, "laser" = 35, "energy" = 40, "bomb" = 70, "bio" = 100, "rad" = 100, "fire" = 80, "acid" = 80)

/obj/item/clothing/head/helmet/space/hardsuit/ert/minercommander/equipped(mob/living/carbon/human/user, slot)
	..()
	to_chat(user, "Your helmet's visor activates its integrated HUD, revealing information around you.")
	ADD_TRAIT(user, TRAIT_MEDICAL_HUD, HELMET_TRAIT)
	var/datum/atom_hud/H = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
	H.add_hud_to(user)

/obj/item/clothing/head/helmet/space/hardsuit/ert/minercommander/dropped(mob/living/carbon/human/user)
	..()
	to_chat(user, "You remove your helmet, disabling its integrated hud.")
	REMOVE_TRAIT(user, TRAIT_MEDICAL_HUD, HELMET_TRAIT)
	var/datum/atom_hud/H = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
	H.remove_hud_from(user)

/obj/item/clothing/suit/space/hardsuit/ert/minercommander
	name = "emergency response team mining hardsuit"
	desc = "The standard issue hardsuit of the ERT. Offers superb protection against Lavaland hazards."
	worn_icon = 'icons/Fulpicons/fulpclothing_worn.dmi'
	icon = 'icons/Fulpicons/fulpclothing.dmi'
	icon_state = "miningert_commander"
	inhand_icon_state = "ert_engineer"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/minercommander
	armor = list("melee" = 80, "bullet" = 35, "laser" = 35, "energy" = 40, "bomb" = 70, "bio" = 100, "rad" = 100, "fire" = 80, "acid" = 80)

// Engi ERT RARE Theme

/datum/antagonist/ert/engineer/specialized/on_gain()
	engi_ert_alert()
	. = ..()

/datum/antagonist/ert/commander/engineer/on_gain()
	engi_ert_alert()
	. = ..()

/datum/antagonist/ert/proc/engi_ert_alert()
	if(prob(5))
		owner.current.playsound_local(get_turf(owner.current), 'sound/Fulpsounds/home_depot.ogg', 100, FALSE, pressure_affected = FALSE)

// Med ERT Rarity

/datum/antagonist/ert/medic/specialized/on_gain()
	. = ..()
	choose_medert_outfit()

/datum/antagonist/ert/commander/medical/on_gain()
	. = ..()
	choose_commedert_outfit()

/datum/antagonist/ert/proc/choose_medert_outfit()
	var/mob/living/carbon/human/H = owner.current
	var/normal_outfit = /datum/outfit/centcom/ert/medic/specialized
	var/alien_outfit = /datum/outfit/centcom/ert/medic/specialized/alien
	var/oath_outfit = /datum/outfit/centcom/ert/medic/specialized/oath
	var/specialty = pickweight(list("Default" = 85, "Alien" = 5, "Oath" = 10)) // Thank you Egor
	H.delete_equipment() //To prevent double equipment shenanigans

	switch(specialty)
		if("Alien")
			H.set_species(/datum/species/abductor)
			H.equipOutfit(alien_outfit)

		if("Oath")
			H.equipOutfit(oath_outfit)

		else
			H.equipOutfit(normal_outfit)

/datum/antagonist/ert/proc/choose_commedert_outfit()
	var/mob/living/carbon/human/H = owner.current
	var/normal_outfit = /datum/outfit/centcom/ert/commander/medical
	var/alien_outfit = /datum/outfit/centcom/ert/commander/medical/alien
	var/oath_outfit = /datum/outfit/centcom/ert/commander/medical/oath
	var/specialty = pickweight(list("Default" = 85, "Alien" = 5, "Oath" = 10))
	H.delete_equipment()

	switch(specialty)
		if("Alien")
			H.set_species(/datum/species/abductor)
			H.equipOutfit(alien_outfit)

		if("Oath")
			H.equipOutfit(oath_outfit)

		else
			H.equipOutfit(normal_outfit)

// Sec ERT random Race

/datum/antagonist/ert/security/specialized/on_gain()
	. = ..()
	choose_secert_race()

/datum/antagonist/ert/commander/security/on_gain()
	. = ..()
	choose_secert_race()

/datum/antagonist/ert/proc/choose_secert_race()
	var/mob/living/carbon/human/H = owner.current
	var/synth = /datum/species/synth
	var/mil_synth = /datum/species/synth/military
	var/race = pickweight(list("Default" = 90, "Military" = 1, "Synth" = 9)) // VERY low chance to become a Military Synth, 1/10 chance to become a synth

	switch(race)
		if("Military")
			H.set_species(mil_synth)

		if("Synth")
			H.set_species(synth)

		else
			return FALSE


// A few other ERT-specific items

// Medical

/obj/item/clothing/gloves/color/latex/nitrile/infiltrator/medical
	name = "insulated nitrile gloves"
	desc = "Very pricy Specialized gloves, thicker than latex. Transfers intimate paramedic knowledge into the user via nanochips, along with providing insulation."
	icon_state = "nitrile"
	inhand_icon_state = "nitrilegloves"

// Mining

/obj/item/clothing/shoes/bhop/combat
	name = "combat jump boots"
	desc = "A specialized pair of protective combat boots with a built-in propulsion system for rapid foward movement."
	icon_state = "jetboots"
	inhand_icon_state = "jetboots"
	resistance_flags = FIRE_PROOF
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/shoes
	actions_types = list(/datum/action/item_action/bhop)
	permeability_coefficient = 0.01
	strip_delay = 30
	clothing_flags = NOSLIP
	armor = list("melee" = 40, "bullet" = 20, "laser" = 15, "energy" = 15, "bomb" = 50, "bio" = 30, "rad" = 30, "fire" = 90, "acid" = 50)

/obj/item/storage/box/ka_mods
	name = "kinetic accelerator upgrades box"
	desc = "It's a box commonly given to Mining Emergency Response Team Units, filled with upgrades for their Kinetic Accelerators."

/obj/item/storage/box/ka_mods/PopulateContents()
	new /obj/item/borg/upgrade/modkit/damage(src)
	new /obj/item/borg/upgrade/modkit/damage(src)
	new /obj/item/borg/upgrade/modkit/range(src)
	new /obj/item/borg/upgrade/modkit/range(src)
	new /obj/item/borg/upgrade/modkit/cooldown(src)
	new /obj/item/borg/upgrade/modkit/cooldown(src)
	new /obj/item/borg/upgrade/modkit/chassis_mod(src)

/obj/item/storage/box/kc_mods
	name = "kinetic crusher trophy box"
	desc = "It's a box, given to the Mining Commander to outfit his Kinetic Crusher."

/obj/item/storage/box/kc_mods/PopulateContents()
	new	/obj/item/crusher_trophy/goliath_tentacle(src)
	new	/obj/item/crusher_trophy/watcher_wing(src)
	new	/obj/item/crusher_trophy/legion_skull(src)
	new	/obj/item/crusher_trophy/miner_eye(src)
	new	/obj/item/crusher_trophy/demon_claws(src)
	new /obj/item/crusher_trophy/vortex_talisman(src)

/obj/item/card/id/ert/miner
	registered_name = "Mining Response Officer"
	assignment = "Mining Response Officer"
	icon = 'icons/Fulpicons/cards.dmi'
	icon_state = "miningresponseofficer"

/obj/item/card/id/ert/miner/Initialize()
	access = get_all_accesses()
	. = ..()

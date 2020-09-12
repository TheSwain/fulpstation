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

//
// ERT Antagonist Datums
//

/datum/antagonist/ert/medic/specialized
	role = "Specialized Medical Officer"
	outfit = /datum/outfit/centcom/ert/medic/specialized

/datum/antagonist/ert/commander/medical
	role = "Chief Medical Officer"
	outfit = /datum/outfit/centcom/ert/commander/medical

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

/obj/item/storage/belt/utility/advanced/PopulateContents()
	new /obj/item/screwdriver/power(src)
	new /obj/item/crowbar/power(src)
	new /obj/item/weldingtool/experimental(src)
	new /obj/item/multitool(src)
	new /obj/item/stack/cable_coil(src)
	new /obj/item/extinguisher/mini(src)
	new /obj/item/inducer(src)
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

// Insulated Latex Gloves for Med ERT

/obj/item/clothing/gloves/color/latex/nitrile/infiltrator/medical
	name = "insulated nitrile gloves"
	desc = "Very pricy Specialized gloves, thicker than latex. Transfers intimate paramedic knowledge into the user via nanochips, along with providing insulation."
	icon_state = "nitrile"
	inhand_icon_state = "nitrilegloves"

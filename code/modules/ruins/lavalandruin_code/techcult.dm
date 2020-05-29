//Special access levels, starting from 400 so I won't fuck up anything else in the future.
#define ACCESS_MECHANICUS_BASIC 400
#define ACCESS_MECHANICUS_LEADER 401
/////////////////////////////////////

/***************** ID *****************/

/obj/item/card/id/away/techcult
	name = "tech cult identification card"
	desc = "An ID card used by religious group praising misterious machine god."
	access = list(ACCESS_MECHANICUS_BASIC, ACCESS_ROBOTICS)
	icon = 'icons/Fulpicons/cards.dmi'
	icon_state = "techcult"
	uses_overlays = FALSE
	registered_age = null

/***************** Closets *****************/

/obj/structure/closet/secure_closet/mechanicus
	name = "tech storage"
	req_access = list(ACCESS_MECHANICUS_BASIC)

/obj/structure/closet/secure_closet/mechanicus/implants
	name = "implants storage"

/obj/structure/closet/secure_closet/mechanicus/implants/PopulateContents()
	..()
	var/static/items_inside = list(
		/obj/item/organ/cyberimp/arm/toolset = 1,
		/obj/item/organ/cyberimp/arm/surgery = 1,
		/obj/item/organ/cyberimp/chest/reviver = 3,
		/obj/item/organ/cyberimp/mouth/breathing_tube = 3,
		/obj/item/organ/cyberimp/chest/nutriment/plus = 3,
		/obj/item/organ/tongue/robot = 3,
		/obj/item/organ/lungs/cybernetic/tier4 = 3,
		/obj/item/organ/heart/cybernetic/tier4 = 3)
	generate_items_inside(items_inside,src)

/***************** Armor *****************/

/obj/item/clothing/suit/hooded/techpriest/armor
	name = "armored techpriest robes"
	desc = "An armored version of robes worn by followers of the machine god."
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/pickaxe, /obj/item/organ/regenerative_core/legion, /obj/item/kitchen/knife/combat/bone, /obj/item/kitchen/knife/combat/survival)
	armor = list("melee" = 45, "bullet" = 10, "laser" = 25, "energy" = 35, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 60, "acid" = 60)
	hoodtype = /obj/item/clothing/head/hooded/techpriest/armor

/obj/item/clothing/head/hooded/techpriest/armor
	name = "armored techpriest's hood"
	desc = "An armored version of hood worn by followers of the machine god."
	armor = list("melee" = 45, "bullet" = 10, "laser" = 25, "energy" = 35, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 60, "acid" = 60)

/***************** Spawners *****************/

/obj/effect/mob_spawn/human/techcult
	name = "Adept of the Machine Cult"
	roundstart = FALSE
	random = TRUE
	death = FALSE
	show_flavour = TRUE
	mob_name = "tech priest"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	short_desc = "You are the member of the machine cult on Lavaland."
	flavour_text = ""
	important_info = "Listen to your leader, help those in need and cleanse this land from monsters."
	outfit = /datum/outfit/techcult
	assignedrole = "Tech Priest"

/obj/effect/mob_spawn/human/techcult/special(mob/living/new_spawn)
	new_spawn.grant_language(/datum/language/machine, TRUE, TRUE, LANGUAGE_MIND)

/datum/outfit/techcult
	name = "Tech Priest"
	uniform = /obj/item/clothing/under/color/black
	suit = /obj/item/clothing/suit/hooded/techpriest/armor
	shoes = /obj/item/clothing/shoes/cyborg
	gloves = /obj/item/clothing/gloves/color/black
	glasses = /obj/item/clothing/glasses/hud/diagnostic
	back = /obj/item/storage/backpack
	belt = /obj/item/storage/belt/utility/full
	l_pocket = /obj/item/kitchen/knife/combat/survival
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double
	id = /obj/item/card/id/away/techcult

/obj/effect/mob_spawn/human/techcult/leader
	name = "Leader of the Machine Cult"
	roundstart = FALSE
	random = TRUE
	death = FALSE
	show_flavour = TRUE
	mob_name = "the leader of a tech cult"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	short_desc = "You are the leader of the machine cult on Lavaland."
	flavour_text = ""
	important_info = "Lead your cult to the perfection, help those in need."
	outfit = /datum/outfit/techcult/lead
	assignedrole = "Tech Cult Leader"

/obj/effect/mob_spawn/human/techcult/leader/special(mob/living/new_spawn)
	..()
	new_spawn.mind.holy_role = HOLY_ROLE_PRIEST

/datum/outfit/techcult/lead
	name = "Tech Cult Leader"
	uniform = /obj/item/clothing/under/rank/civilian/chaplain
	gloves = /obj/item/clothing/gloves/combat
	glasses = /obj/item/clothing/glasses/hud/diagnostic/night
	r_hand = /obj/item/gun/energy/sniper/pin
	back = /obj/item/storage/backpack/cultpack
	backpack_contents = list(/obj/item/storage/book/bible/omnissiah, /obj/item/book/granter/spell/omnissiah)

/***************** Credo Omnissiah *****************/

/obj/item/storage/book/bible/omnissiah
	name = "Credo Omnissiah"
	desc = "The holy book of Cult Mechanicum."
	deity_name = "Omnissiah"
	icon_state = "scientology"
	item_state = "scientology"

/***************** Spell *****************/

/obj/item/book/granter/spell/omnissiah
	name = "Misterious book"
	desc = "The sacred texts, allowing a higher tech priests to directly communicate with what is believed to be the Machine God itself."
	spell = /obj/effect/proc_holder/spell/aoe_turf/conjure/tech
	spellname = "holy gift"
	icon_state ="bookcharge"
	remarks = list("But will it make me a mech?", "I could've just use the exosuit fabricator, huh?", "All powerful god, send me a honkbot!", "So it is a pocket robotic factory.", "This page is just full of binary code...", "Can it give me a laser arm?", "But can I get combat implants from here?")

/obj/item/book/granter/spell/omnissiah/recoil(mob/living/user)
	..()
	to_chat(user,"<span class='warning'>You're knocked down!</span>")
	user.Paralyze(100)

/obj/effect/proc_holder/spell/aoe_turf/conjure/tech
	name = "Gift of the Omnissiah"
	desc = "This spell allows the user to receive a gift from the unknown dimension."
	school = "conjuration"
	charge_max = 1800
	clothes_req = FALSE
	invocation = "BI NAY RE"
	invocation_type = "shout"
	range = 0
	summon_type = list(/obj/effect/spawner/lootdrop/omnissiah)
	action_icon_state = "emp"
	cast_sound = 'sound/magic/disable_tech.ogg'

/obj/effect/spawner/lootdrop/omnissiah
	name = "omnissiah gift spawner"
	lootdoubles = FALSE
	loot = list(/obj/item/robot_suit = 80,
				/obj/item/stack/sheet/metal/twenty = 68,
				/mob/living/simple_animal/bot/medbot = 60,
				/mob/living/simple_animal/bot/cleanbot = 56,
				/obj/item/paicard = 52,
				/mob/living/simple_animal/bot/honkbot = 48,
				/obj/item/robot_suit/prebuilt = 40,
				/obj/item/mmi/posibrain = 34,
				/obj/item/stock_parts/cell/bluespace = 28,
				/obj/item/stock_parts/cell/quantum = 14,
				/obj/item/organ/cyberimp/arm/gun/laser = 2,
				/obj/item/organ/cyberimp/arm/combat = 1,)

/***************** Areas *****************/

/area/ruin/powered/mechanicus
	name = "Mechanicum Chapel"
	icon_state = "chapel"
	ambientsounds = HOLY

/area/ruin/powered/mechanicus/robotics
	name = "Mechanicum Robotics"
	icon_state = "science"

/area/ruin/powered/mechanicus/surgery
	name = "Mechanicum Surgery"
	icon_state = "surgery"

/area/ruin/powered/mechanicus/dorms
	name = "Mechanicum Dormitories"
	icon_state = "dorms"

/area/ruin/powered/mechanicus/vault
	name = "Mechanicum Storage"
	icon_state = "mining_storage"

//Ruin datum

/datum/map_template/ruin/lavaland/techcult
	name = "Adeptus Mechanicus"
	id = "techcult"
	description = "An old base, filled with religious fanatics praising the entity they call 'Machine God'."
	cost = 20
	suffix = "lavaland_surface_techcult.dmm"
	allow_duplicates = FALSE

/***************** Researches *****************/

/datum/techweb_node/mars_tech
	id = "mars_tech"
	display_name = "Marsian Technology"
	description = "A complicated technology, used my Marsian scientists and soldiers alike."
	boost_item_paths = list(/obj/item/gun/energy/sniper, /obj/item/organ/heart/cybernetic/tier4)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 10000)
	export_price = 10000
	hidden = TRUE

/datum/techweb_node/energy_sniper
	id = "energy_sniper"
	display_name = "Energy Sniper Rifle"
	description = "An advanced piece of weaponry, used by highly advanced group of religious fanatics on Mars."
	prereq_ids = list("adv_beam_weapons", "mars_tech")
	design_ids = list("energysniper")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	export_price = 5000

/datum/design/energysniper
	name = "Energy Sniper Rifle"
	desc = "An advanced piece of weaponry used by soldiers of Mars and misterious followers of Machine God."
	id = "energysniper"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 12000, /datum/material/glass = 8000, /datum/material/diamond = 5000, /datum/material/uranium = 10000, /datum/material/silver = 5000, /datum/material/gold = 5000)
	build_path = /obj/item/gun/energy/sniper
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/techweb_node/cyber_organs_ultra
	id = "cyber_organs_ultra"
	display_name = "Energy Sniper Rifle"
	description = "An advanced piece of weaponry, used by highly advanced group of religious fanatics on Mars."
	prereq_ids = list("cyber_organs_upgraded", "mars_tech")
	design_ids = list("cybernetic_heart_tier4")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	export_price = 5000

/datum/design/cybernetic_heart/tier4
	name = "Quadro-Cybernetic Heart"
	desc = "An experimental quadro-cybernetic heart."
	id = "cybernetic_heart_tier4"
	construction_time = 60
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 1000, /datum/material/silver=500, /datum/material/gold=500, /datum/material/uranium=500)
	build_path = /obj/item/organ/heart/cybernetic/tier4

/datum/design/cybernetic_lungs/tier4
	name = "Quadro-Cybernetic Lungs"
	desc = "An experimental quadro-cybernetic lungs."
	id = "cybernetic_lungs_tier4"
	construction_time = 60
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 1000, /datum/material/silver=500, /datum/material/gold=500, /datum/material/uranium=500)
	build_path = /obj/item/organ/lungs/cybernetic/tier4

/***************** T4 cybernetics *****************/

//Heart

/obj/item/organ/heart/cybernetic/tier4
	name = "quadro-cybernetic heart"
	desc = "An electronic device designed to mimic the functions of an organic human heart. Can inject with set of chemicals when user enter critical condition and regenerate the dose later."
	icon = 'icons/Fulpicons/tier4_organs.dmi'
	icon_state = "heart-c-u3"
	maxHealth = 3 * STANDARD_ORGAN_THRESHOLD
	dose_available = TRUE
	emp_vulnerability = 0

/obj/item/organ/heart/cybernetic/tier4/on_life()
	. = ..()
	if(dose_available && owner.health <= owner.crit_threshold)
		used_dose()

/obj/item/organ/heart/cybernetic/tier4/used_dose()
	. = ..()
	owner.reagents.add_reagent(/datum/reagent/medicine/atropine, 5)
	owner.reagents.add_reagent(/datum/reagent/medicine/sal_acid, 3)
	owner.reagents.add_reagent(/datum/reagent/medicine/oxandrolone, 3)
	addtimer(VARSET_CALLBACK(src, dose_available, TRUE), 2 MINUTES)

//Lungs

/obj/item/organ/lungs/cybernetic/tier4
	name = "quadro-cybernetic lungs"
	desc = "Advanced set of cybernetic lungs capable of filtering high amounts of toxins, cold and heat in the air. This one is capable of working with as low as 6KPa of oxygen. Supplies the body with salbutamol, should the user enter critical condition."
	icon_state = "lungs-c-u2"
	safe_toxins_max = 50
	safe_co2_max = 50
	safe_oxygen_min = 6
	maxHealth = 3 * STANDARD_ORGAN_THRESHOLD
	emp_vulnerability = 0

	var/dose_available = TRUE

	cold_level_1_threshold = 140
	cold_level_2_threshold = 80
	cold_level_3_threshold = 30
	heat_level_1_threshold = 800
	heat_level_2_threshold = 1600
	heat_level_3_threshold = 2400

/obj/item/organ/lungs/cybernetic/tier4/on_life()
	. = ..()
	if(dose_available && owner.health <= owner.crit_threshold)
		used_dose()

/obj/item/organ/lungs/cybernetic/tier4/proc/used_dose()
	owner.reagents.add_reagent(/datum/reagent/medicine/salbutamol, 10)
	dose_available = FALSE
	addtimer(VARSET_CALLBACK(src, dose_available, TRUE), 1 MINUTES)

// Reviver Implant PLUS
/obj/item/organ/cyberimp/chest/reviver/plus
	name = "Reviver implant PLUS"
	desc = "This implant will attempt to heal you REALLY FAST if you lose consciousness. For the true warriors!"
	icon_state = "chest_implant"
	implant_color = "#CC0605"
	slot = ORGAN_SLOT_HEART_AID

/obj/item/organ/cyberimp/chest/reviver/plus/on_life()
	if(reviving)
		if(owner.stat == UNCONSCIOUS)
			addtimer(CALLBACK(src, .proc/heal), 15) //Fast
		else
			cooldown = revive_cost + world.time
			reviving = FALSE
			to_chat(owner, "<span class='notice'>Your reviver implant shuts down and starts recharging. It will be ready again in [DisplayTimeText(revive_cost)].</span>")
		return

	if(cooldown > world.time)
		return
	if(owner.stat != UNCONSCIOUS)
		return
	if(owner.suiciding)
		return

	revive_cost = 0
	reviving = TRUE
	to_chat(owner, "<span class='notice'>You feel a faint buzzing as your reviver implant starts patching your wounds...</span>")

/obj/item/organ/cyberimp/chest/reviver/plus/heal()
	if(owner.getOxyLoss())
		owner.adjustOxyLoss(-10) //REAL fast
		revive_cost += 5
	if(owner.getBruteLoss())
		owner.adjustBruteLoss(-5)
		revive_cost += 30
	if(owner.getFireLoss())
		owner.adjustFireLoss(-5)
		revive_cost += 30
	if(owner.getToxLoss())
		owner.adjustToxLoss(-3)
		revive_cost += 30

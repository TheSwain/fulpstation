/datum/uplink_item/role_restricted/bag_of_encounters
	name = "Bag of Encounters"
	desc = "An inconspicious bag of dice, recovered from a Space Wizard's dungeon. Each dice within will summon a challenge for the crew: 1d4 Bears, 1d6 Space Carp or 1d20 angry Bees!\
			Be sure to give the bag a shake before use, so that the creatures will recognise you as their true dungeon master, no matter who rolls the dice."
	item = /obj/item/storage/pill_bottle/encounter_dice
	cost = 8
	restricted_roles = list("Curator")
	limited_stock = 1 //for testing at least


/datum/uplink_item/badass/balloongold
	name = "Golden Syndicate Balloons"
	desc = "For showing that you and two other Syndies are true genuine 100% BAD ASS SYNDIES."
	item = /obj/item/storage/box/syndieballoons
	cost = 60
	cant_discount = TRUE
	illegal_tech = FALSE

/datum/uplink_item/role_restricted/susp_bowler
	name = "Suspicious Bowler"
	desc = "A strange, deep black bowler with an extremely sharp, weighted brim. The material used to make the brim of the bowler allows for it to pierce armor, often embeding within the designated target."
	item = /obj/item/clothing/head/susp_bowler
	cost = 5
	cant_discount = FALSE
	illegal_tech = TRUE
	restricted_roles = list("Bartender")

/datum/uplink_item/role_restricted/mech_firing_pin
	name = "Concealed Weapon Bay (Mech Firing Pin Included)"
	desc = "A concealed weapon bay that hides an equipped mech weapon from plain sight. \
			Only one can fit on a mecha. \
			This one comes complete with a handy firing pin that can only be installed into mech weapons."
	item = /obj/item/storage/box/syndicate/bundle_mech
	cost = 7 //So you cannot use it to get 3 unlocked mech weapons.
	restricted_roles = list("Roboticist", "Research Director")

/datum/uplink_item/role_restricted/sith_starter_kit
	name = "Sith Starter Kit"
	desc = "Has everything you need to get started with the Dark Side! \
			Includes smelly old man robes, snazzy red light saber and genuine Sith sacred texts \
			describing the secrets of saber fighting, force lightning and force push."
	item = /obj/item/storage/box/syndicate/bundle_sith
	cost = 19
	restricted_roles = list("Chaplain", "Curator")

/datum/uplink_item/role_restricted/laser_tag_kit_red
	name = "X-TREME Laser Tag Kit (RADICAL RED)"
	desc = "New X-TREME laser tag kit for when you want to play for keeps! \
			Now with SUPER stun and RADICAL lethal mode! \
			Comes complete with gun and reflective laser vest. Adult supervision recommended. \
			Swipe gun with ID to toggle state of the art stealth parental locks!"
	item = /obj/item/storage/box/syndicate/laser_tag_kit_red
	cost = 14
	restricted_roles = list("Clown", "Mime", "Assistant")

/datum/uplink_item/role_restricted/laser_tag_kit_blue
	name = "X-TREME Laser Tag Kit (BITCHIN' BLUE)"
	desc = "New X-TREME laser tag kit for when you want to play for keeps! \
			Now with SUPER stun and RADICAL lethal mode! \
			Comes complete with gun and reflective laser vest. Adult supervision recommended. \
			Swipe gun with ID to toggle state of the art stealth parental locks!"
	item = /obj/item/storage/box/syndicate/laser_tag_kit_blue
	cost = 14
	restricted_roles = list("Clown", "Mime", "Assistant")

/datum/uplink_item/role_restricted/laser_tag_partypack_red
	name = "X-TREME Laser Tag Party Pack (RADICAL RED)"
	desc = "The new X-TREME laser tag party pack is deadly fun for the whole family! \
			Now with SUPER stun and RADICAL lethal mode! \
			Comes complete with 4 guns and reflective laser vests. Adult supervision recommended. \
			Swipe gun with ID to toggle state of the art stealth parental locks!"
	include_modes = list(/datum/game_mode/nuclear/clown_ops)
	item = /obj/structure/closet/crate/laser_tag_partypack_red
	cost = 50

/datum/uplink_item/role_restricted/laser_tag_partypack_blue
	name = "X-TREME Laser Tag Party Pack (BITCHIN' BLUE)"
	desc = "The new X-TREME laser tag party pack is deadly fun for the whole family! \
			Now with SUPER stun and RADICAL lethal mode! \
			Comes complete with 4 guns and reflective laser vests. Adult supervision recommended. \
			Swipe gun with ID to toggle state of the art stealth parental locks!"
	include_modes = list(/datum/game_mode/nuclear/clown_ops)
	item = /obj/structure/closet/crate/laser_tag_partypack_blue
	cost = 50

/datum/uplink_item/device_tools/budget_emag
	name = "Budget Cryptographic Sequencer"
	desc = "The cryptographic sequencer, electromagnetic card, or emag, is a small card that unlocks hidden functions \
			in electronic devices, subverts intended functions, and easily breaks security mechanisms.  \
			This is a cheap knockoff Space-China budget version that holds 2 charges, and regains 1 charge every 30 seconds."
	item = /obj/item/card/emag/budget
	cost = 6

/datum/uplink_item/race_restricted/diginoslip
	name = "No-Slip Digitigrade Shoes"
	desc = "Simple as that - Robust shoes for lizardmen aiming to control the galaxy. \
		Now nothing can stop you, our friend. \
		No longer the soap will ruin your villainous plans. \
		No longer the clown will HONK you with banana by-products!"
	cost = 2
	item = /obj/item/clothing/shoes/digicombat/noslip
	restricted_species = list("lizard")

/obj/item/clothing/shoes/digicombat/noslip
	desc = "Robust combat boots especially for lizardmen. Perfect for walking over piled human corpses. This pair of shoes is specifically designed to prevent slipping on wet surfaces."
	clothing_flags = NOSLIP

////////////// INFILTRATION GAMEMODE ITEMS //////////////
#define INFILTRATION_FACTIONS list("Syndicate Infiltrator", "Cybersun Infiltrator", "Gorlex Infiltrator", "Tiger Co. Infiltrator")
//This define exists for midround spawned infiltrators.

/datum/uplink_item/role_restricted/cybersunsuit
	name = "Cybersun Hardsuit"
	desc = "A long forgotten hardsuit made by Cybersun industries. \
			Offers ROBUST protection against laser-based weapons, while still giving somewhat good chances \
			to survive assault from a toolbox or shotgun. \
			Not to mention, it doesn't slow you down and contains an integrated jetpack that runs on standard tanks."
	item = /obj/item/clothing/suit/space/hardsuit/cybersun
	cost = 10
	cant_discount = FALSE
	restricted_roles = list("Cybersun Infiltrator")

/datum/uplink_item/role_restricted/gorlex
	cant_discount = FALSE
	restricted_roles = list("Gorlex Infiltrator")

/datum/uplink_item/role_restricted/gorlex/glovesplus
	name = "Combat Gloves Plus"
	desc = "A pair of gloves that are fireproof and electrically insulated, however unlike the regular Combat Gloves these use nanotechnology \
			to teach the martial art of krav maga to the wearer."
	item = /obj/item/clothing/gloves/krav_maga/combatglovesplus
	cost = 6 //Nuke Ops get it for 5.

/datum/uplink_item/role_restricted/gorlex/flukeop
	name = "Nuclear Operative Bundle"
	desc = "A starting kit for wannabe nuclear operatives. \
	Comes with a tactical duffelbag filled with: \
	blood-red hardsuit, micro-bomb implant, night vision googles, bowman headset, combat gloves and Makarov pistol."
	item = /obj/item/storage/backpack/duffelbag/syndie/flukeop
	cost = 15 //Would cost 18
	cant_discount = TRUE

/obj/item/storage/backpack/duffelbag/syndie/flukeop/PopulateContents()
	new /obj/item/clothing/suit/space/hardsuit/syndi(src) //8 TC
	new /obj/item/storage/box/syndie_kit/imp_microbomb(src) //2 TC
	new /obj/item/clothing/glasses/night(src)
	new /obj/item/radio/headset/syndicate/alt(src)
	new /obj/item/clothing/gloves/combat(src) //1 TC?
	new /obj/item/gun/ballistic/automatic/pistol(src) //7 TC

/datum/uplink_item/role_restricted/tiger //That's where crazy stuff begins
	cant_discount = FALSE
	restricted_roles = list("Tiger Co. Infiltrator")

/datum/uplink_item/role_restricted/tiger/macrobomb
	name = "Macrobomb Implant"
	desc = "An implant injected into the body, and later activated either manually or automatically upon death. \
			Upon death, releases a massive explosion that will wipe out everything nearby."
	item = /obj/item/storage/box/syndie_kit/imp_macrobomb
	cost = 15 //Yes, nukies get it for 20, but let our dude infiltrate the station and finish his objectives first.

/datum/uplink_item/role_restricted/tiger/manhacks
	name = "Viscerator Delivery Grenade"
	desc = "A unique grenade that deploys a swarm of viscerators upon activation, which will chase down and shred \
			any non-operatives in the area."
	item = /obj/item/grenade/spawnergrenade/manhacks
	cost = 5 //Same as nukies

/datum/uplink_item/race_restricted/plasmemesuit
	name = "Surplus Envirosuit"
	desc = "We heard that plasmamen don't have their own cool stations filled with plasma on Nanotrasen territory. \
		So we decided to let you get one set from our storage, just in case you don't want to use your space suit 24/7. \
		This box is designed to store any kind of EVA equipment in it, as long as it is not too big.\
		Comes with standard plasmaman uniform, helmet and special lightweight version of plasmamen' EVA suit."
	cost = 4
	item = /obj/item/storage/box/syndie_kit/plasmeme
	restricted_species = list("plasmaman")
	restricted_roles = INFILTRATION_FACTIONS

/obj/item/clothing/suit/space/eva/plasmaman/infiltrator
	desc = "A special syndicate version of plasma containment suit. Capable of everything it's smaller version can do and offers a good protection against hostile environment."
	w_class = WEIGHT_CLASS_NORMAL
	slowdown = 0.2
	armor = list("melee" = 20, "bullet" = 30, "laser" = 20,"energy" = 20, "bomb" = 30, "bio" = 100, "rad" = 50, "fire" = 80, "acid" = 80)
	cell = /obj/item/stock_parts/cell/hyper

/obj/item/storage/box/syndie_kit/plasmeme/ComponentInitialize()
	. = ..()
	desc = "Box with unique design allowing it to store any sort of lightweight EVA equipment."
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.set_holdable(list(/obj/item/clothing/suit/space, /obj/item/clothing/head/helmet/space, /obj/item/clothing/under/plasmaman))

/obj/item/storage/box/syndie_kit/plasmeme/PopulateContents()
	new /obj/item/clothing/under/plasmaman(src)
	new /obj/item/clothing/suit/space/eva/plasmaman/infiltrator(src)
	new /obj/item/clothing/head/helmet/space/plasmaman(src)

/datum/uplink_item/stealthy_tools/adv_mulligan
	name = "Advanced Mulligan"
	desc = "An advanced form of toxin created in one of our laboratories using \
	technology created with help of changeling operatives. \
	This item allows you to change your appearance, race and DNA to completely different one. \
	To use it - stab another person with it and then inject yourself, you will transform into the person you stabbed earlier. \n \
	Be aware that it can't be used more than once on yourself."
	item = /obj/item/adv_mulligan
	cost = 7
	restricted_roles = INFILTRATION_FACTIONS

/obj/item/adv_mulligan
	name = "Advanced Mulligan"
	desc = "Toxin that permanently changes your DNA into the one of last injected person."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "dnainjector0"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	var/used = FALSE
	var/mob/living/carbon/human/stored

/obj/item/adv_mulligan/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	return //Stealth

/obj/item/adv_mulligan/afterattack(atom/movable/AM, mob/living/carbon/human/user, proximity)
	. = ..()
	if(!proximity)
		return
	if(!istype(user))
		return
	if(used)
		to_chat(user, "<span class='warning'>[src] has been already used, you can't activate it again!</span>")
		return
	if(ishuman(AM))
		var/mob/living/carbon/human/H = AM
		if(user.real_name != H.dna.real_name)
			stored = H
			to_chat(user, "<span class='notice'>You stealthly stab [H.name] with [src].</span>")
			desc = "Toxin that permanently changes your DNA into the one of last injected person. It has DNA of <span class='blue'>[stored.dna.real_name]</span> inside."
			icon_state = "dnainjector"
		else
			if(stored)
				mutate(user)
			else
				to_chat(user, "<span class='warning'>You can't stab yourself with [src]!</span>")

/obj/item/adv_mulligan/attack_self(mob/living/carbon/user)
	mutate(user)

/obj/item/adv_mulligan/proc/mutate(mob/living/carbon/user)
	if(used)
		to_chat(user, "<span class='warning'>[src] has been already used, you can't activate it again!</span>")
		return
	if(!used)
		if(stored)
			user.real_name = stored.real_name
			stored.dna.transfer_identity(user, transfer_SE=1)
			user.updateappearance(mutcolor_update=1)
			user.domutcheck()
			used = TRUE

			user.visible_message("<span class='warning'>[user.name] shivers in pain and soon transform into [stored.dna.real_name]!</span>", \
			"<span class='notice'>You inject yourself with [src] and suddenly become a copy of [stored.dna.real_name].</span>")
			icon_state = "dnainjector0"
			desc = "Toxin that permanently changes your DNA into the one of last injected person. This one is used up."

		else
			to_chat(user, "<span class='warning'>[src] doesn't have any DNA loaded in it!</span>")

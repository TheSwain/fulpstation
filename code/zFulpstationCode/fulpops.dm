/datum/antagonist/nukeop
	name = "Nuclear Operative"
	roundend_category = "syndicate operatives"
	antagpanel_category = "NukeOp"
	job_rank = ROLE_OPERATIVE
	antag_moodlet = /datum/mood_event/focused
	var/nukeop_outfit_plasmaman = /datum/outfit/plasmaman/syndicate
	can_hijack = HIJACK_HIJACKER


/datum/antagonist/nukeop/proc/equip_op_fulp()
	if(!ishuman(owner.current)) // If you're not a carbon, go away.
		return
	var/mob/living/carbon/human/H = owner.current // What your species? It's now a variable, that's what it is.
	//H.set_species(/datum/species/human) // We ain't setting species to Human any more
	if(isplasmaman(owner.current)) // Are you a plasma man? If so, do this.
		H.equipOutfit(nukeop_outfit_plasmaman)
	else // Not a plasma man? Okay I guess. Do this instead.
		H.equipOutfit(nukeop_outfit)
	return TRUE

/datum/antagonist/nukeop/on_gain()
	give_alias()
	forge_objectives()
	. = ..()
	equip_op_fulp() // This has been changed from equip_op() to equip_op_fulp()
	memorize_code()
	if(send_to_spawnpoint)
		move_to_spawnpoint()
		// grant extra TC for the people who start in the nukie base ie. not the lone op
		var/extra_tc = CEILING(GLOB.joined_player_list.len/5, 5)
		var/datum/component/uplink/U = owner.find_syndicate_uplink()
		if (U)
			U.telecrystals += extra_tc


/datum/outfit/plasmaman/syndicate
	name = "Syndicate Plasmaman"

	head = /obj/item/clothing/head/helmet/space/plasmaman/robotics/syndicate
	uniform = /obj/item/clothing/under/plasmaman/security/syndicate
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	back = /obj/item/storage/backpack/fireproof
	ears = /obj/item/radio/headset/syndicate/alt
	l_pocket = /obj/item/pinpointer/nuke/syndicate
	id = /obj/item/card/id/syndicate
	belt = /obj/item/gun/ballistic/automatic/pistol
	backpack_contents = list(/obj/item/storage/box/syndie = 1,
		/obj/item/kitchen/knife/combat/survival = 1)
	var/tc = 25
	var/command_radio = FALSE
	var/uplink_type = /obj/item/uplink/nuclear

/obj/item/clothing/head/helmet/space/plasmaman/robotics/syndicate
	name = "syndicate plasma envirosuit helmet"
	desc = "A plasmaman envirohelmet designed for syndicate operatives."

/obj/item/clothing/under/plasmaman/security/syndicate
	name = "syndicate plasma envirosuit"
	desc = "A non-descript and slightly suspicious looking plasmaman enviormental suit."
	icon = 'icons/fulpicons/phoenix_nest/syndicate_suits.dmi'
	icon_state = "syndicate_envirosuit"
	item_state = "syndicate_envirosuit"
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 100, "rad" = 0, "fire" = 95, "acid" = 95)

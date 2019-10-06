/datum/antagonist/nukeop
	name = "Nuclear Operative"
	roundend_category = "syndicate operatives"
	antagpanel_category = "NukeOp"
	job_rank = ROLE_OPERATIVE
	antag_moodlet = /datum/mood_event/focused
	var/nukeop_outfit_plasmaman = /datum/outfit/plasmaman/syndicate
	can_hijack = HIJACK_HIJACKER

/datum/antagonist/nukeop/proc/equip_op()
	if(!ishuman(owner.current)) // If you're not a carbon, go away.
		return
	var/mob/living/carbon/human/H = owner.current // What's your species? It's now a variable, that's what it is.
	//H.set_species(/datum/species/human) // We ain't setting species to Human any more
	if(isplasmaman(owner.current)) // Are you a plasma man? If so, do this.
		H.equipOutfit(nukeop_outfit_plasmaman)
	else // Not a plasma man? Okay I guess. Do this instead.
		H.equipOutfit(nukeop_outfit)
	return TRUE

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

/datum/antagonist/nukeop/on_gain() // This doesn't seem to actual be used sadly.
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
		
/datum/antagonist/nukeop
	var/nukeop_outfit_plasmaman = /datum/outfit/syndicate/plasmaman

/datum/antagonist/nukeop/leader
	nukeop_outfit_plasmaman = /datum/outfit/syndicate/leader/plasmaman


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

/datum/antagonist/nukeop/proc/move_to_spawnpoint()
	var/team_number = 1
	if(nuke_team)
		team_number = nuke_team.members.Find(owner)
	owner.current.forceMove(GLOB.nukeop_start[((team_number - 1) % GLOB.nukeop_start.len) + 1])
	owner.current.reagents.add_reagent(/datum/reagent/medicine/salbutamol, 15) // because beefmen and plasmemes are very unstable when it comes to that
	owner.current.reagents.add_reagent(/datum/reagent/iron, 15)                // they quite literally bleed out 20ish seconds after spawning

/datum/antagonist/nukeop/leader/move_to_spawnpoint()
	owner.current.forceMove(pick(GLOB.nukeop_leader_start))
	owner.current.reagents.add_reagent(/datum/reagent/medicine/salbutamol, 15) // because beefmen and plasmemes are very unstable when it comes to that
	owner.current.reagents.add_reagent(/datum/reagent/iron, 15)                // they quite literally bleed out 20ish seconds after spawning

///////////////////// OBJECTS /////////////////////

/obj/item/survivalcapsule/fulp
	icon = 'icons/obj/mining.dmi'

/obj/item/survivalcapsule/fulp/traitor
	name = "metal capsule"
	desc = "Ominous capsule made out of metal."
	template_id = "shelter_traitor"
	icon_state = "nuke"
	icon = 'icons/Fulpicons/mining_capsules.dmi'

/obj/item/survivalcapsule/fulp/traitor/nuke
	name = "tactical bluespace capsule"
	desc = "A highly tactical object, reverse-engineered from Nanotrasen capsules. Fire power might not be included."
	template_id = "shelter_nuke"

/obj/structure/sign/mining/syndicate
	name = "\improper Syndicate mining corps sign"
	desc = "A sign claiming that this SPECIFIC chunk of earth/space is being controlled by Syndicate."
	icon = 'icons/Fulpicons/mining_signs.dmi'
	icon_state = "syndipod"

/obj/structure/sign/mining/syndicate/stripe
	name = "\improper mining stripe"
	desc = "A simple stripe on a wall."
	icon_state = "stripe"

/obj/machinery/smartfridge/survival_pod/syndi
	name = "spec ops storage"
	desc = "Superior fridge containing all you need to OPERATE."

/obj/machinery/smartfridge/survival_pod/syndi/Initialize(mapload)
	. = ..()
	if(empty)
		return
	for(var/i in 1 to 2)
		var/obj/item/reagent_containers/food/snacks/donkpocket/warm/W = new(src)
		var/obj/item/reagent_containers/food/snacks/syndicake/X = new(src)
		load(W)
		load(X)
	if(prob(50))
		var/obj/item/storage/pill_bottle/dice/hazard/D = new(src)
		load(D)
	else
		var/obj/item/instrument/eguitar/G = new(src)
		load(G)

/obj/machinery/porta_turret/syndicate/pod/capsule
	shot_delay = 25 //One shot every 2.5 seconds
	stun_projectile = /obj/projectile/bullet/syndicate_turret
	lethal_projectile = /obj/projectile/bullet/syndicate_turret

////////////////// MAP TEMPLATES //////////////////

/datum/map_template/shelter/traitor
	name = "Tacticool Shelter"
	shelter_id = "shelter_traitor"
	description = "Fairly simple bluespace pod to show that YOU are the BOSS here!"
	mappath = "_maps/templates/fulp_shelter_traitor.dmm"

/datum/map_template/shelter/traitor/New()
	. = ..()
	whitelisted_turfs = typecacheof(/turf/closed/mineral)
	banned_objects = typecacheof(/obj/structure/stone_tile)

/datum/map_template/shelter/nuke
	name = "Tactical Shelter"
	shelter_id = "shelter_nuke"
	description = "Highly tactical object reverse engineered from ones of Nanotrasen. \
		While it is small, it contains everything real operative needs - \
		FIRE POWER AND COVER! \
		With this - you will be able to destroy those fools easily! \
		(Fire Power not included)"
	mappath = "_maps/templates/fulp_shelter_nuke.dmm"

/datum/map_template/shelter/nuke/New()
	. = ..()
	whitelisted_turfs = typecacheof(/turf/closed/mineral)
	banned_objects = typecacheof(/obj/structure/stone_tile)

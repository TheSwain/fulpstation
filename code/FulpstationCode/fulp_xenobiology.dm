/obj/item/slime_extract/green
	name = "green slime extract"
	icon_state = "green slime extract"
	effectmod = "mutative"
	activate_reagents = list(/datum/reagent/blood,/datum/reagent/toxin/plasma,/datum/reagent/uranium/radium,/datum/reagent/liquidgibs)
	research = SLIME_RESEARCH_TIER_4


/datum/chemical_reaction/slime/slimebeef
	results = list(/datum/reagent/mutationtoxin/meatman = 1)
	required_reagents = list(/datum/reagent/liquidgibs = 1)
	required_other = TRUE
	required_container = /obj/item/slime_extract/green

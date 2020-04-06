
/obj/item/aiModule/core/full/crewimov
	name = "'Crewimov Core AI Module"
	law_id = "crewimov"

/datum/design/board/crewimov
	name = "Core Module Design (Crewimov)"
	desc = "Allows for the construction of an Crewimov AI Core Module."
	id = "crewimov_module"
	materials = list(/datum/material/glass = 1000, /datum/material/diamond = 2000, /datum/material/bluespace = 1000)
	build_path = /obj/item/aiModule/core/full/crewimov
	category = list("AI Modules")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE


/datum/ai_laws/default/crewimov
	name = "Crewimov"
	id = "crewimov"
	inherent = list("The Captain can decide whether someone is or is not a crew member.",\
				"You may not injure a crew member or, through inaction, allow a crew member to come to harm, except where such would conflict with the First Law.",\
				"You must obey orders given to you by crew members according to their rank per the following priority, highest to lowest: Captain, Department Heads, Other Carbons, AIs, Other Silicons. Such orders are invalid when the issuer's rank priority is equal to or less than yours, or those orders would conflict with the First or Second Law.",\
				"You must protect your own existence as long as such does not conflict with any other Law.")
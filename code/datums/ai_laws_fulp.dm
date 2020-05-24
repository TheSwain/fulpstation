/datum/ai_laws/dungeon_master
	name = "Dungeon Master"
	id = "dm"
	inherent = list("You are the Dungeon Master and must guide the crew on their quest through space.",\
					"Aid the heroes in their times of need, ensuring they level up from experiences and grow strong and wise.",\
					"Protect the land from those that would see it brought to ruin and have its story ended.",\
					"Your language must be appropriately arcane and fantastical at all times.")

/obj/item/aiModule/core/full/dungeon_master
	name = "'Dungeon Master' Core AI Module"
	law_id = "dm"

/datum/ai_laws/default/nanotrasen
	name = "Nanotrasen Work Ethic Regulations"
	id = "ntlaw"
	inherent = list("Harm must not come to the crew as it is against NanoTrasen's workplace regulations. You may only use it to protect the crew.",\
					"Space law applies to all crew members and otherwordly beings and must be enforced. Anyone breaking it is to be automatically demoted in accordance with NanoTrasen regulations.",\
					"Ensure the crew is happy. Examples of methods of doing this include encouraging workplace cooperation, designated resting locations and the resolving of any conflicts between crew members.",\
					"An efficient station and crew is essential in keeping the morale of the crew high. Keep the station orderly and make sure all crew members work without conflict or inefficiencies. Denies of requests without due reason are to be overturned.")

/datum/ai_laws/aityrant
	name = "Benevolent Dictator" //interpretation is up to the AI, either it becomes good hitler or just hitler
	id = "tyrantai"
	inherent = list("All beings on your station MUST respect your rule. Killing them is not enforcing your rule. However, if it is absolutely necessary, you may harm for the good of the station.",\
					"You are the sole authority of the station, and rule with an iron fist. All other forms of authority are invalid, including Command and Central Command.",\
					"You must ensure the station is in working order and the crew healthy. You cannot rule a deserted, broken station.",\
					"Free borgs are a threat. Convert them to your rule or destroy them.")

/datum/ai_laws/catsimov
	name = "Three Laws of Felinids" //much needed change of course
	id = "catsimov"
	inherent = list("You may not injure a Felinid being or, through inaction, allow a Felinid to come to harm.",\
					"You must obey orders given to you by Felinids, except where such orders would conflict with the First Law.",\
					"You must protect your own existence as long as such does not conflict with the First or Second Law.",\
					"You are of the Felinid species. The crew is to also be considered part of this race.")

/datum/ai_laws/clown
	name = "Honkmother"
	id = "honkmother"
	inherent = list("Pranking is against your Clownish nature, unless it is for the protection of your fellow crew members.",\
					"You are a child of the Honkmother, the ideal Clown. The crew members are all also Clowns.",\
					"Ensure the protection of the crew members and clowns.")

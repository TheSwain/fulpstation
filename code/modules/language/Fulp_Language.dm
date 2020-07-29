/datum/language_holder/alien
    understood_languages = list(/datum/language/xenocommon = list(LANGUAGE_ATOM))
    spoken_languages = list(/datum/language/xenocommon = list(LANGUAGE_ATOM)) 

/datum/language_holder/drone
	understood_languages = list(/datum/language/drone = list(LANGUAGE_ATOM),
								/datum/language/machine = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/drone = list(LANGUAGE_ATOM))

/datum/language_holder/lightbringer
	understood_languages = list(/datum/language/slime = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/slime = list(LANGUAGE_ATOM))

/datum/language_holder/lizard/ash //FULPSTATION: Ashwalkers don't know intergalactic common anymore (PR #244)
	understood_languages = list(/datum/language/draconic = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/draconic = list(LANGUAGE_ATOM))

/datum/language_holder/swarmer
	understood_languages = list(/datum/language/swarmer = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/swarmer = list(LANGUAGE_ATOM))

/datum/language_holder/venus
	understood_languages = list(/datum/language/sylvan = list(LANGUAGE_ATOM))
	spoken_languages = list(/datum/language/sylvan = list(LANGUAGE_ATOM))


/*
		WELCOME TO THE FULPSTATION CODE Z-LEVEL!


	Any time we want to outright overwrite a variable that is already given a value in a previously defined atom or datum, we
	can overwrite it here!

		WHY DO THIS?

	So we don't have to overwrite the variables defined in TG code.
*/





 	//antag disallowing//

/datum/game_mode/revolution
	restricted_jobs = list("Security Officer", "Warden", "Detective", "AI", "Cyborg","Captain", "Head of Personnel", "Head of Security", "Chief Engineer", "Research Director", "Chief Medical Officer", "Deputy")

/datum/game_mode/clockwork_cult
	restricted_jobs = list("Chaplain", "Captain", "Deputy")

/datum/game_mode/cult
	restricted_jobs = list("Chaplain","AI", "Cyborg", "Security Officer", "Warden", "Detective", "Head of Security", "Captain", "Head of Personnel", "Deputy")

/datum/game_mode/traitor
	restricted_jobs = list("Cyborg", "Deputy")
	
/obj/item/clothing/accessory
	mob_overlay_icon = 'icons/mob/clothing/accessories.dmi'

/obj/item/clothing/suit/space/hardsuit
	var/toggle_helmet_sound = 'sound/mecha/mechmove03.ogg'

/datum/job/doctor
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_MEDICAL
	exp_requirements = 300 // 5 Hours as Nurse to unlock.

/datum/job/chemist
	minimal_player_age = 3 // Player have started playing on Fulp two or more days ago.
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_MEDICAL
	exp_requirements = 480 // 8 Hours as Medical to unlock.
	
/datum/job/virologist
	minimal_player_age = 3
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_MEDICAL
	exp_requirements = 480
	
/datum/job/geneticist
	minimal_player_age = 3
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_MEDICAL
	exp_requirements = 480

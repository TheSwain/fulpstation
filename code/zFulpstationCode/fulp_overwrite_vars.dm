
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

/datum/game_mode/traitor
	restricted_jobs = list("Cyborg", "Deputy")




/obj/item/clothing/accessory
	mob_overlay_icon = 'icons/mob/clothing/accessories.dmi'

/obj/item/clothing/suit/space/hardsuit
	var/toggle_helmet_sound = 'sound/mecha/mechmove03.ogg'


//**************************************************
//** NO HEAD OR DEPUTY ANTAG PR - Surrealistik Oct 2019 BEGINS
//**************************************************

/datum/outfit/job/hop
	implants = list(/obj/item/implant/mindshield)

/datum/outfit/job/cmo
	implants = list(/obj/item/implant/mindshield)

/datum/outfit/job/ce
	implants = list(/obj/item/implant/mindshield)

/datum/outfit/job/rd
	implants = list(/obj/item/implant/mindshield)

/datum/game_mode/traitor
	protected_jobs = list("Security Officer", "Warden", "Detective", "Head of Security", "Captain", "Head of Personnel", "Research Director", "Chief Medical Officer", "Chief Engineer", "Deputy")

/datum/game_mode/clockwork_cult
	protected_jobs = list("AI", "Cyborg", "Security Officer", "Warden", "Detective", "Head of Security", "Captain", "Head of Personnel", "Research Director", "Chief Medical Officer", "Chief Engineer", "Deputy")

/datum/game_mode/changeling
	protected_jobs = list("Security Officer", "Warden", "Detective", "Head of Security", "Captain", "Head of Personnel", "Research Director", "Chief Medical Officer", "Chief Engineer", "Deputy")

/datum/game_mode/bloodsucker
	protected_jobs = list("Security Officer", "Warden", "Detective", "Head of Security", "Captain", "Head of Personnel", "Research Director", "Chief Medical Officer", "Chief Engineer", "Deputy")

/datum/game_mode/cult
	restricted_jobs = list("Chaplain","AI", "Cyborg", "Security Officer", "Warden", "Detective", "Head of Security", "Captain", "Head of Personnel", "Research Director", "Chief Medical Officer", "Chief Engineer", "Deputy")

/datum/dynamic_ruleset/midround/autotraitor
	protected_roles = list("Security Officer", "Warden", "Detective", "Head of Security", "Captain", "Head of Personnel", "Research Director", "Chief Medical Officer", "Chief Engineer", "Deputy")

/datum/dynamic_ruleset/latejoin/infiltrator
	protected_roles = list("Security Officer", "Warden", "Detective", "Head of Security", "Captain", "Head of Personnel", "Research Director", "Chief Medical Officer", "Chief Engineer", "Deputy")

/datum/dynamic_ruleset/roundstart/traitorbro
	protected_roles = list("Security Officer", "Warden", "Detective", "Head of Security", "Captain", "Head of Personnel", "Research Director", "Chief Medical Officer", "Chief Engineer", "Deputy")


//**************************************************
//** NO ANTAG HOP PR - Surrealistik Oct 2019 ENDS
//**************************************************
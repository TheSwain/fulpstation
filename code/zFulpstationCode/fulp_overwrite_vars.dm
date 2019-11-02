
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


//*****************************************************************************************
//** Fulpstation Possessed Cult Sword PR by Surrealistik. Sprites by Jo from Discord BEGINS
//**---------------------------------------------------------------------------------------
//** Allows blood cult to empower eldritch swords with a sacrifice, and then use them at an
//** Empowering rune to have the sword possessed by a ghost. The ghost will then choose a
//** name and enhancement for the sword, and can communicate via cult chat.
//*****************************************************************************************

/obj/item/melee/cultblade
	var/empowered = FALSE //If we're empowered and ready to summon a ghos.
	var/possessed //If we're possessed, and the identity of our possession power.
	var/possessor //The name of the thing possessing it
	var/cooldown //Whether cooldown is active for the sword's ability if applicable

//*****************************************************************************************
//** Fulpstation Possessed Cult Sword PR by Surrealistik. Sprites by Jo from Discord ENDS
//*****************************************************************************************
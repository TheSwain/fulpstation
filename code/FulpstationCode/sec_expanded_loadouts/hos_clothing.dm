// Readds the Jensen outfit for HOS. -SgtHunk

/obj/item/clothing/under/rank/security/head_of_security/jensen
	desc = "You never asked for anything that stylish."
	name = "head of security's dermal jumpsuit"
	worn_icon = 'icons/Fulpicons/fulpclothing_worn.dmi'
	icon = 'icons/Fulpicons/fulpclothing.dmi'
	icon_state = "jensen"
	can_adjust = 0

/obj/item/clothing/head/hos/dermal
	name = "Dermal Armor Patch"
	desc = "An armored implant that automatically integrates just below the scalp for robust protection without sacrificing style."
	worn_icon = 'icons/Fulpicons/fulpclothing_worn.dmi'
	icon = 'icons/Fulpicons/fulpclothing.dmi'
	icon_state = "dermal"
	flags_inv = 0

/datum/outfit/job/hos/jensen // For when you didn't ask for this
	name = "Head of Security (Jensen)"

	uniform = /obj/item/clothing/under/rank/security/head_of_security/jensen
	head = /obj/item/clothing/head/hos/dermal
	glasses = /obj/item/clothing/glasses/detective

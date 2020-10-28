//Vae's Costumes
/obj/item/clothing/suit/werewolfdress
	name = "Werewolf's dress"
	desc = "A simple dress worn by the last werewolf in Japan. Smells faintly of bamboo and fish."
	icon = 'icons/fulpicons/halloween_costumes/2020/werewolfdress_item.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/2020/werewolfdress_worn.dmi'
	icon_state = "werewolfdress_suit"
	allowed = list(/obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)

/obj/item/storage/box/halloween/edition_20/werewolfdress
	theme_name = "2020's Kagerou's dress"
	illustration = "werewolf"

/obj/item/storage/box/halloween/edition_20/werewolfdress/PopulateContents()
	new /obj/item/clothing/suit/werewolfdress(src)
	new /obj/item/toy/plush/carpplushie(src)
	new /obj/item/stack/sheet/mineral/bamboo(src)

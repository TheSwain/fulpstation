/obj/item/clothing/suit/zombie_rider //Spookz
	name = "Zombie Rider"
	desc = "Tired of walking? Have your friendly slave zombie waddle you around!"
	fulp_item = TRUE //I don't know if this is necessary but WHATEVER
	icon = 'icons/fulpicons/halloween_costumes/2019/zrider_icon.dmi'
	icon_state = "zombie_rider"
	worn_icon = 'icons/fulpicons/halloween_costumes/2019/zrider_worn.dmi'
	lefthand_file = 'icons/fulpicons/halloween_costumes/2019/zrheld_l.dmi'
	righthand_file = 'icons/fulpicons/halloween_costumes/2019/zrheld_r.dmi'


/obj/item/storage/box/halloween/edition_19/zombie
	theme_name = "2019's Zombie"

/obj/item/storage/box/halloween/edition_19/zombie/PopulateContents()
	new /obj/item/clothing/suit/zombie_rider(src)
	
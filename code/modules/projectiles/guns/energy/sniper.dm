/obj/item/gun/energy/sniper
	name = "energy sniper rifle"
	desc = "And advanced piece of weaponry forged on Mars in 40th Millenia."
	icon_state = "sniper"
	item_state = "sniper"
	icon = 'icons/Fulpicons/energy_sniper.dmi'
	//lefthand_file = 'icons/Fulpicons/energy_sniper_l.dmi'
	//righthand_file = 'icons/Fulpicons/energy_sniper_r.dmi'
	fire_sound = 'sound/weapons/laser3.ogg'
	fire_sound_volume = 90
	vary_fire_sound = FALSE
	recoil = 0.3
	weapon_weight = WEAPON_HEAVY
	can_flashlight = FALSE
	ammo_x_offset = 3
	ammo_y_offset = 3
	w_class = WEIGHT_CLASS_BULKY
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	actions_types = list()
	ammo_type = list(/obj/item/ammo_casing/energy/sniper)

/obj/item/gun/energy/sniper/Initialize()
	. = ..()
	fire_delay = 30

/obj/item/ammo_casing/energy/sniper
	projectile_type = /obj/projectile/beam/laser/sniper
	select_name = "anti-vehicle"
	fire_sound = 'sound/weapons/lasercannonfire.ogg'

/obj/projectile/beam/laser/sniper
	damage = 80
	speed = 0.4
	name = "energy_sniper"
	icon = 'icons/Fulpicons/energy_sniper.dmi'
	icon_state = "blue_bullet"
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = LIGHT_COLOR_BLUE
	dismemberment = 30
	armour_penetration = 40

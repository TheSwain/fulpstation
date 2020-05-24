/obj/item/gun/energy/sniper
	name = "energy sniper rifle"
	desc = "And advanced piece of weaponry forged on Mars in 40th Millenia."
	icon_state = "sniper"
	item_state = "sniper"
	icon = 'icons/Fulpicons/energy_sniper.dmi'
	fire_sound = 'sound/weapons/laser3.ogg'
	cell_type = /obj/item/stock_parts/cell/high
	fire_sound_volume = 90
	vary_fire_sound = FALSE
	recoil = 0.3
	weapon_weight = WEAPON_HEAVY
	can_flashlight = FALSE
	fire_delay = 30
	burst_size = 1
	w_class = WEIGHT_CLASS_NORMAL
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	actions_types = list()
	ammo_type = list(/obj/item/ammo_casing/energy/sniper)

/obj/item/ammo_casing/energy/sniper
	projectile_type = /obj/projectile/beam/laser/sniper
	select_name = "anti-vehicle"
	fire_sound = 'sound/weapons/lasercannonfire.ogg'

/obj/projectile/beam/laser/sniper
	damage = 80
	speed = 2
	name = "energy_sniper"
	icon_state = "blue_laser"
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = LIGHT_COLOR_BLUE
	paralyze = 40
	dismemberment = 30
	armour_penetration = 50

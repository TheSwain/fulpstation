<<<<<<< HEAD
/obj/projectile/neurotoxin
=======
/obj/projectile/bullet/neurotoxin
>>>>>>> fulpmaster
	name = "neurotoxin spit"
	icon_state = "neurotoxin"
	damage = 5
	damage_type = TOX
<<<<<<< HEAD
	nodamage = FALSE
	paralyze = 100
	flag = "bio"
	impact_effect_type = /obj/effect/temp_visual/impact_effect/neurotoxin

/obj/projectile/neurotoxin/on_hit(atom/target, blocked = FALSE)
=======
	paralyze = 100

/obj/projectile/bullet/neurotoxin/on_hit(atom/target, blocked = FALSE)
>>>>>>> fulpmaster
	if(isalien(target))
		paralyze = 0
		nodamage = TRUE
	return ..()

// This starts all the weapons and grenades added by assistant ops.

//Greybull Grenade
/obj/item/grenade/frag/assistant
	name = "Greybull Grenade"
	desc = "Hidden in a greybull, ready to explode!"
	w_class = WEIGHT_CLASS_SMALL
	icon = 'icons/fulpicons/Assistant Ops/weapons/Grenade.dmi'
	icon_state = "energy_drink"
	item_state = "energy_drink"
	lefthand_file = 'icons/mob/inhands/equipment/security_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/security_righthand.dmi'

//E SPEAR
/obj/item/spear/espear
	name = "\improper E-Spear"
	desc = "Some crafty greytider decided his spear just wasn't powerful enough, and made it burn at over 3500 Kelvins!"
	icon = 'icons/fulpicons/Assistant Ops/weapons/ItemsWeapons.dmi'
	icon_state = "espear0"
	item_state = "espear0"
	lefthand_file = 'icons/Fulpicons/Assistant Ops/inhands/Spearleft.dmi'
	righthand_file = 'icons/Fulpicons/Assistant Ops/inhands/Spearright.dmi'
	attack_verb = list("gored")
	hitsound = 'sound/weapons/blade1.ogg'
	force=20

/obj/item/spear/espear/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=20, force_wielded=30, icon_wielded="[icon_prefix]1")

/obj/item/spear/espear/afterattack(atom/movable/AM, mob/living/user, proximity)
	. = ..()
	if(!proximity)
		return
	user.faction |= "greytide([REF(user)])"
	if(isliving(AM))
		var/mob/living/L = AM
		if(istype (L, /mob/living/simple_animal/hostile/illusion))
			return
		if(!L.stat && prob(50))
			var/mob/living/simple_animal/hostile/illusion/M = new(user.loc)
			M.faction = user.faction.Copy()
			M.Copy_Parent(user, 100, user.health/2.5, 12, 30)
			M.GiveTarget(L)

//i dont know what this is, but its a toolbox, and im just moving stuff over to fulp folders
/obj/item/storage/toolbox/greytide
	name = "Greytide compact toolbox"
	icon_state = "blue"
	item_state = "toolbox_blue"
	material_flags = NONE
	force = 15
	throwforce = 18
	w_class = WEIGHT_CLASS_SMALL

//better stunprod
/obj/item/melee/baton/cattleprod/assistant
	name = "Assistant Stunprod"
	desc = "A superior Stunprod."
	icon_state = "stunprod"
	item_state = "prod"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	force = 5
	throwforce = 7
	stun_time = 10 SECONDS
	cell_hit_cost = 500
	throw_stun_chance = 100

/*
		Fulpstation Cult Override

	This was brought to you by the person who has no idea what the hell he's doing, with the help of a few people.

	Enjoy!
*/

/datum/action/innate/cult/blood_spell/stun
	name = "Stun"
	desc = "Empowers your hand to stun and mute a victim on contact."
	button_icon_state = "hand"
	magic_path = "/obj/item/melee/blood_magic/stunfulp"
	health_cost = 10

/obj/item/melee/blood_magic/stunfulp
	name = "Stunning Aura"
	desc = "Will stun and mute a weak-minded victim on contact."
	color = RUNE_COLOR_RED
	invocation = "Fuu ma'jin!"

/obj/item/melee/blood_magic/stunfulp/afterattack(atom/target, mob/living/carbon/user, proximity)
	if(!isliving(target) || !proximity)
		return
	var/mob/living/L = target
	if(iscultist(target))
		return
	if(iscultist(user))
		user.visible_message("<span class='warning'>[user] holds up [user.p_their()] hand, which explodes in a flash of red light!</span>", \
							"<span class='cultitalic'>You attempt to stun [L] with the spell!</span>")

		user.mob_light(_color = LIGHT_COLOR_BLOOD_MAGIC, _range = 3, _duration = 2)

		var/anti_magic_source = L.anti_magic_check()
		if(anti_magic_source)

			L.mob_light(_color = LIGHT_COLOR_HOLY_MAGIC, _range = 2, _duration = 100)
			var/mutable_appearance/forbearance = mutable_appearance('icons/effects/genetics.dmi', "servitude", -MUTATIONS_LAYER)
			L.add_overlay(forbearance)
			addtimer(CALLBACK(L, /atom/proc/cut_overlay, forbearance), 100)

			if(istype(anti_magic_source, /obj/item))
				var/obj/item/ams_object = anti_magic_source
				target.visible_message("<span class='warning'>[L] starts to glow in a halo of light!</span>", \
									   "<span class='userdanger'>Your [ams_object.name] begins to glow, emitting a blanket of holy light which surrounds you and protects you from the flash of light!</span>")
			else
				target.visible_message("<span class='warning'>[L] starts to glow in a halo of light!</span>", \
									   "<span class='userdanger'>A feeling of warmth washes over you, rays of holy light surround your body and protect you from the flash of light!</span>")

		else
			if(HAS_TRAIT(target, TRAIT_MINDSHIELD))
				var/mob/living/carbon/C = L
				to_chat(user, "<span class='cultitalic'>Their mind is too strong, resisting the spell, but it did some damage nonetheless!</span>")
				C.stuttering += 8
				C.dizziness += 20
				C.Jitter(6)
				C.drop_all_held_items()
				C.bleed(30)
				C.apply_damage(60, STAMINA, BODY_ZONE_CHEST)
			else
				to_chat(user, "<span class='cultitalic'>In a brilliant flash of red, [L] falls to the ground!</span>")
				L.Paralyze(160)
				L.flash_act(1,1)
				if(issilicon(target))
					var/mob/living/silicon/S = L
					S.emp_act(EMP_HEAVY)
				else if(iscarbon(target))
					var/mob/living/carbon/C = L
					C.silent += 6
					C.stuttering += 15
					C.cultslurring += 15
					C.Jitter(15)
		uses--
	..()

//This is a new item, the Influencer's blindfold. It's the Zealot's blindfold but with Security huds rather than Medical.

/obj/item/clothing/glasses/hud/security/night/cultblind/fulp
    desc = "may Nar'Sie guide you through the darkness and show you those strong of mind."
    name = "Influencer's blindfold"
    icon_state = "blindfold"
    inhand_icon_state = "blindfold"
    flash_protect = FLASH_PROTECTION_FLASH

/obj/item/clothing/glasses/hud/security/night/cultblind/fulp/equipped(mob/living/user, slot)
    ..()
    if(!iscultist(user))
        to_chat(user, "<span class='cultlarge'>\"You want to be blind, do you?\"</span>")
        user.dropItemToGround(src, TRUE)
        user.Dizzy(30)
        user.Paralyze(100)
        user.blind_eyes(30)

/obj/structure/destructible/cult/tome/attack_hand(mob/living/user)
    . = ..()
    if(.)
        return
    if(!iscultist(user))
        to_chat(user, "<span class='warning'>These books won't open and it hurts to even try and read the covers.</span>")
        return
    if(!anchored)
        to_chat(user, "<span class='cultitalic'>You need to anchor [src] to the floor with your dagger first.</span>")
        return
    if(cooldowntime > world.time)
        to_chat(user, "<span class='cult italic'>The magic in [src] is weak, it will be ready to use again in [DisplayTimeText(cooldowntime - world.time)].</span>")
        return
    var/list/items = list(
        "Zealot's Blindfold" = image(icon = 'icons/obj/clothing/glasses.dmi', icon_state = "blindfold"),
        "Shuttle Curse" = image(icon = 'icons/obj/cult.dmi', icon_state = "shuttlecurse"),
        "Veil Walker Set" = image(icon = 'icons/obj/cult.dmi', icon_state = "shifter"),
        "Influencer's Blindfold" = image(icon = 'icons/obj/clothing/glasses.dmi', icon_state = "securityhudnight")
        )
    var/choice = show_radial_menu(user, src, items, custom_check = CALLBACK(src, .proc/check_menu, user), require_near = TRUE, tooltips = TRUE)
    var/list/pickedtype = list()
    switch(choice)
        if("Zealot's Blindfold")
            pickedtype += /obj/item/clothing/glasses/hud/health/night/cultblind
        if("Shuttle Curse")
            pickedtype += /obj/item/shuttle_curse
        if("Veil Walker Set")
            pickedtype += /obj/item/cult_shift
            pickedtype += /obj/item/flashlight/flare/culttorch
        if("Influencer's Blindfold")
            pickedtype += /obj/item/clothing/glasses/hud/security/night/cultblindfulp
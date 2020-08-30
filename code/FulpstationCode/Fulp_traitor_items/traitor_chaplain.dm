/obj/item/storage/box/syndicate/bundle_sith/PopulateContents()
	new /obj/item/book/granter/spell/force_lightning(src)
	new /obj/item/book/granter/martial/starter_sith(src)
	new /obj/item/clothing/suit/armor/riot/chaplain/sith(src)
	new /obj/item/clothing/head/helmet/chaplain/sith(src)
	new /obj/item/melee/transforming/energy/sword/saber/sith(src)


/obj/item/book/granter/spell/force_lightning
	spell = /obj/effect/proc_holder/spell/targeted/force_lightning
	name = "Sith Sacred Texts (Vol. 1)"
	desc = "This book seems to crackle with electric malevolence. It depicts lightning coursing from arched finger tips."
	spellname = "Force Lightning"
	icon_state ="bookcharge"
	oneuse = TRUE
	remarks = list("Oh, I'm afraid the force lightning will be quite operational when security arrives...","UNNNNNNNLIMITED POWAH!!!", "Let the hate flow through me...", "GooOood... GOOooOod...", "All is proceeding exactly as I have foreseen.", "The Dark Side is a pathway to many abilities some consider to be... unnatural...", "They will pay the price for their lack of vision...", "Execute Order 66...", "It seems it is me who is mistaken about a great. Many. Things.", "This space station is nothing compared to the power of the Dark Side...", "The tragedy of Darth Plaguis the Wise is not a tale the Jedi would tell me...", "Only now, at the end, do I understand.")

/obj/item/book/granter/spell/force_lightning/onlearned(mob/user)
	..()
	sith_one_use(user)

/obj/item/book/granter/martial/starter_sith
	martial = /datum/martial_art/starter_sith
	name = "Sith Sacred Texts (Vol. 2)"
	martialname = "Sith Starter Secrets"
	desc = "This book seems to crackle with electric malevolence. It depicts an old robed weirdo flinging pods at a peculiar green midget and fighting with an energy sword."
	greet = "<span class='sciradio'>You have learned some of the ancient mysteries of the Sith! You can now move objects with the power of the Dark Side and deflect projectiles with energy swords.</span>"
	icon_state ="bookcharge"
	remarks = list("Oh, I'm afraid the force lightning will be quite operational when security arrives...","UNNNNNNNLIMITED POWAH!!!", "Let the hate flow through me...", "GooOood... GOOooOod...", "All is proceeding exactly as I have foreseen.", "The Dark Side is a pathway to many abilities some consider to be... unnatural...", "They will pay the price for their lack of vision...", "Execute Order 66...", "It seems it is me who is mistaken about a great. Many. Things.", "This space station is nothing compared to the power of the Dark Side...", "The tragedy of Darth Plaguis the Wise is not a tale the Jedi would tell me...", "Only now, at the end, do I understand.")

/obj/item/book/granter/martial/starter_sith/onlearned(mob/living/carbon/user)
	..()
	sith_one_use(user)


/datum/martial_art/starter_sith
	name = "Sith Starter Secrets"
	id = MARTIALART_STARTERSITH
	allow_temp_override = FALSE
	help_verb = /mob/living/carbon/human/proc/starter_sith_help
	var/mob/living/carbon/human/owner


/mob/living/carbon/human/proc/starter_sith_help()
	set name = "Recall Sith Teachings"
	set desc = "Remember the ancient secrets of the Sith."
	set category = "Sith Starter Kit"

	to_chat(usr, "<b><i>You retreat inward and recall the teachings of the Sith...</i></b>")

	to_chat(usr, "<span class='notice'>Force Lightning</span>: Fires a bolt of force lightning at a random target within 4 tiles (sacred text sold separately!).")
	to_chat(usr, "<span class='notice'>Force Push</span>: Move things around with the power of the Force.")
	to_chat(usr, "<span class='notice'>Light Saber Training</span>: You can deflect most projectiles and melee attacks while holding an activated energy sword.")


///Triggers on COMSIG_MOB_ATTACK_RANGED. Usually handles stuff like picking up items at range.
/datum/martial_art/starter_sith/proc/on_ranged_attack(datum/source, atom/target)
	if(owner.dna.check_mutation(TK)) //FULPSTATION Chaplain Starter Sith PR by Surrealistik Jan 2020; no stacking with Telekinesis
		return
	target.attack_tk(owner)

/datum/martial_art/starter_sith/teach(mob/living/carbon/human/H, make_temporary = FALSE)
	. = ..()
	if(!.)
		return
	owner = H
	RegisterSignal(H, COMSIG_MOB_ATTACK_RANGED, .proc/on_ranged_attack)


/datum/martial_art/starter_sith/on_remove(mob/living/carbon/human/H)
	. = ..()
	UnregisterSignal(H, COMSIG_MOB_ATTACK_RANGED)

/obj/item/melee/transforming/energy/sword/saber/sith
	name = "Sith Lightsaber"
	possible_colors = list("red" = LIGHT_COLOR_RED)
	desc = "A deadly and ancient energy sword hailing from an equally deadly and ancient religion."
	armour_penetration = 100 //Cuts through anything.
	force_on = 35 //Slightly better than standard.
	throwforce_on = 30 //Better than standard.

/obj/item/melee/transforming/energy/sword/saber/sith/IsReflect(mob/living/user)
	if(!user.mind.has_martialart(MARTIALART_STARTERSITH))
		return FALSE

	if (!user.incapacitated() && prob(FORCETRAINING_BLOCKCHANCE)) //30% chance to reflect if we have sith training
		spark_system.start()
		playsound(src, pick('sound/weapons/blade1.ogg'), 75, TRUE)
		return TRUE

/obj/item/melee/transforming/energy/sword/proc/deflect_check(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(owner.mind.has_martialart(MARTIALART_STARTERSITH))
		final_block_chance += FORCETRAINING_BLOCKCHANCE //+30% for having Sith training
	SEND_SIGNAL(src, COMSIG_ITEM_HIT_REACT, args)
	if(prob(final_block_chance))
		spark_system.start()
		playsound(src, pick('sound/weapons/blade1.ogg'), 75, TRUE)
		owner.visible_message("<span class='danger'>[owner] deflects [attack_text] with [src]!</span>")
		return TRUE
	return FALSE


/obj/item/melee/transforming/energy/sword/proc/spark_setup()
	spark_system = new /datum/effect_system/spark_spread()
	spark_system.set_up(5, 0, src)
	spark_system.attach(src)



/obj/item/book/granter/proc/sith_one_use(mob/user)
	if(!oneuse)
		return FALSE
	var/datum/effect_system/spark_spread/spark_system = new /datum/effect_system/spark_spread()
	spark_system.set_up(5, 0, src)
	spark_system.attach(src)
	spark_system.start()
	if(isliving(user))
		var/mob/living/L = user
		L.electrocute_act(5,"Force Lightning",1,SHOCK_NOSTUN) //Snappy zappy.
	to_chat(user,"<span class='warning'>In a flash of lightning, [src] suddenly crumbles to dust! No! The sacred texts!</span>")
	playsound(src,'sound/magic/lightningbolt.ogg', 30, TRUE)
	new /obj/effect/decal/cleanable/ash(get_turf(src))
	qdel(src)

#define FORCELIGHTNING_REFLECT_MULTIPLIER	0.25

/obj/effect/proc_holder/spell/targeted/force_lightning
	name = "Force Lightning"
	desc = "Release a blast of force lightning at a random target within 4 tiles. Arcs between targets, and decays in power with each arc."
	charge_type = "recharge"
	charge_max	= 10
	clothes_req = FALSE
	range = 4
	cooldown_min = 10
	selection_type = "view"
	random_target = TRUE
	invocation = null
	invocation_type = null
	var/static/mutable_appearance/halo
	var/sound/Snd // so far only way i can think of to stop a sound, thank MSO for the idea.
	var/bolt_flags = SHOCK_NOGLOVES | SHOCK_NOSTUN
	var/max_bounces = 10
	var/bolt_decay_per_bounce = 4 //How much damage does the bolt lose when it bounces.
	var/min_damage = 5
	var/max_damage = 20
	var/stamina_damage_multiplier = 0.5
	var/datum/effect_system/spark_spread/spark_system
	var/list/existing_targets = list()

	action_icon_state = "lightning"

/obj/item/clothing/head/helmet/chaplain/sith
	name = "sith hood"
	desc = "It stinks of old man, ozone and the Dark Side."
	icon_state = "crusader"
	inhand_icon_state = "crusader"
	flags_cover = HEADCOVERSEYES
	flags_inv = HIDEHAIR|HIDEFACE|HIDEEARS

/obj/item/clothing/suit/armor/riot/chaplain/sith
	name = "sith robes"
	desc = "They stink of old man, ozone and the Dark Side."
	icon_state = "crusader"
	inhand_icon_state = "crusader"


/obj/effect/proc_holder/spell/targeted/force_lightning/proc/spark_setup()
	spark_system = new /datum/effect_system/spark_spread()
	spark_system.set_up(5, 0, src)


/obj/effect/proc_holder/spell/targeted/force_lightning/cast(list/targets, mob/user = usr)
	if(user.incapacitated())
		to_chat(user, "<span class='warning'>You're in no condition to use [src]!</span>")
		return

	var/mob/living/L
	if(isliving(user))
		L = user
		if(!L.get_bodypart(BODY_ZONE_R_ARM) && !L.get_bodypart(BODY_ZONE_R_ARM))
			to_chat(user, "<span class='warning'>You need at least one hand to use [src]!</span>")
			return

		if(iscarbon(user))
			var/mob/living/carbon/C = user
			if(C.handcuffed)
				to_chat(user, "<span class='warning'>You can't use [src] while handcuffed!</span>")
				return

	existing_targets = list()
	existing_targets += user

	if(!targets.len)
		to_chat(user, "<span class='warning'>No target found in range!</span>")
		return
	spark_setup()
	user.say(pick("It's treason then!", "So be it... Jedi.", "NO. NO. NO... <i>YOU</i> WILL DIE!!", "You underestimate the power of the Dark Side!", "My hate has made me powerful...","I AM THE SENATE!!", "If you will not be turned... you will be destroyed!!", "You will pay the price for your lack of vision!!", "Young fool, only now, at the end, do you understand.", "Your feeble skills are no match for the power of the Dark Side!", "POWAAHHH!!", "UNNNNLIMITEDDDD POWAHHHH!!", "And now, young Skywalker, you will die."))
	var/mob/living/target = targets[1]
	if(get_dist(user,target)>range)
		to_chat(user, "<span class='warning'>[target.p_theyre(TRUE)] too far away!</span>")
		return

	playsound(get_turf(user), 'sound/magic/lightningbolt.ogg', 50, TRUE)
	user.Beam(target,icon_state="lightning[rand(1,12)]",time=5)

	var/damage = rand(min_damage,max_damage)

	if(L)
		L.adjustStaminaLoss(damage * stamina_damage_multiplier) //Take stamina damage equal to half the amount of electrical damage.
		if(L.getStaminaLoss() >= 100)
			user.say(pick("I'm weak... too weak...", "Nooo... please...", "Don't let him kill me...", "Please! Don't!", "I can't hold on any longer...", "Help me! HELP ME!", "I was right, the Jedi are taking over!"))

	Bolt(user, target,damage,max_bounces,range, user)

/obj/effect/proc_holder/spell/targeted/force_lightning/proc/Bolt(mob/origin, mob/target, bolt_energy, bounces, bolt_range, mob/user = usr)

	if(bolt_energy < 1) //Stop if we would do no damage.
		return

	origin.Beam(target,icon_state="lightning[rand(1,12)]",time=5)
	var/mob/living/current = target

	playsound(get_turf(current), 'sound/magic/lightningshock.ogg', 50, TRUE, -1)

	var/obj/item/melee/transforming/energy/sword/S = current.get_active_held_item() //Check if we have an esword
	if(!current.incapacitated() && istype(S, /obj/item/melee/transforming/energy/sword)) //Can block force lightning with light sabers
		var/final_block_chance = S.block_chance
		if(current.mind.has_martialart(MARTIALART_STARTERSITH)) //We get bonuses from force training if we have it.
			final_block_chance += FORCETRAINING_BLOCKCHANCE
		if(prob(final_block_chance)) //Final chance of deflecting or reflecting.
			S.spark_system.start()
			playsound(S, pick('sound/weapons/blade1.ogg'), 75, TRUE)
			if(prob(final_block_chance * FORCELIGHTNING_REFLECT_MULTIPLIER)) //This is a % of your final block chance; on a success we reflect instead of just deflect.
				current.visible_message("<span class='warning'>[current] reflects the [src] with [S] back at [origin]!</span>", "<span class='userdanger'>You reflect the [src] with [S] back at [origin]!</span>")
				existing_targets -= origin //So we can always reflect back at the source.
				Bolt(current,origin,bolt_energy,bounces,bolt_range, user)
				return
			else
				current.visible_message("<span class='warning'>[current] deflects the [src] with [S], remaining unharmed!</span>", "<span class='userdanger'>You deflect the [src] with [S], remaining unharmed!</span>")
				return

	if(current.anti_magic_check())
		current.visible_message("<span class='warning'>[current] absorbs the [src], remaining unharmed!</span>", "<span class='userdanger'>You absorb the [src], remaining unharmed!</span>")
	else
		current.electrocute_act(bolt_energy,"Force Lightning",1,bolt_flags)
		if(!iscarbon(current)) //So we affect borgs and simple mobs properly.
			current.adjustFireLoss(bolt_energy)
		spark_system.attach(target)
		spark_system.start()

	if(bounces < 1)
		return

	existing_targets += current

	//if(current in existing_targets) //DEBUG
	//	to_chat(world, "[current] in existing targets.") //DEBUG

	var/list/possible_targets = list()
	for(var/mob/living/M in view(bolt_range,current))
		/*
		if(user == M) //Don't ask me why I have to arrange the conditional gates in this way; it just does not work if it they're all in the same row with || separators.
			//to_chat(world, "Target [M] skipped. [M] is caster: [user]") //DEBUG
			continue*/
		if (!los_check(current,M) )
			//to_chat(world, "Target [M] skipped; LoS check to [current] failed.") //DEBUG
			continue
		else if (origin == M)
			//to_chat(world, "Target [M] skipped; [M] is origin: [origin].") //DEBUG
			continue
		else if (M in existing_targets)
			//to_chat(world, "Target [M] skipped; [M] is in existing targets.") //DEBUG
			continue
		else
			possible_targets += M
			//to_chat(world, "Target [M] added.") //DEBUG
	if(!possible_targets.len)
		return
	var/mob/living/next = pick(possible_targets)
	//to_chat(world, "Target [next]. Possible targets: [possible_targets]. Bolt Energy [bolt_energy]. User: [user]") //DEBUG
	var/new_damage = bolt_energy - bolt_decay_per_bounce
	if(next && new_damage >= 1)
		Bolt(current,next,new_damage,bounces - 1,bolt_range - 1, user)

#undef FORCELIGHTNING_REFLECT_MULTIPLIER

// SITH LORD ENDS

// JUSTICIAR'S FOLLOWER BEGINS

// hey, this one is called traitor_chaplain. might as well, right? -SgtHunk

// Traitor Kit. 20TC, Chaplain only.

/obj/item/storage/box/syndicate/bundle_clock/PopulateContents()
	new /obj/item/clothing/suit/space/clockwork(src)
	new /obj/item/clothing/gloves/combat/clockwork(src)
	new /obj/item/clothing/shoes/combat/swat/bronze(src)
	new /obj/item/clothing/glasses/hud/clock(src)
	new /obj/item/clothing/head/helmet/space/clockwork(src)
	new /obj/item/book/granter/martial/justiciar_hand(src)

// Whole set of Armor.

/obj/item/clothing/head/helmet/space/clockwork
	name = "brass hardsuit helmet"
	desc = "Ancient helmet made out of brass. It seems to provide robust protection against most damage types. It glows with a golden, ancient and forgotten energy."
	worn_icon = 'icons/Fulpicons/clockchap.dmi'
	icon = 'icons/obj/clothing/clockwork_garb.dmi'
	icon_state = "clockwork_helmet"
	inhand_icon_state = "clockwork_helmet"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 20, "energy" = 20, "bomb" = 30, "bio" = 100, "rad" = 30, "fire" = 100, "acid" = 100)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	actions_types = list()

/obj/item/clothing/gloves/combat/clockwork
	name = "brass gauntlets"
	desc = "Strong gauntlets, that offer protection from weaponry at ease."
	worn_icon = 'icons/Fulpicons/clockchap.dmi'
	icon = 'icons/obj/clothing/clockwork_garb.dmi'
	icon_state = "clockwork_gauntlets"
	inhand_icon_state = "clockwork_gauntlets"
	clothing_flags = NOSLIP
	armor = list("melee" = 15, "bullet" = 15, "laser" = 10, "energy" = 10, "bomb" = 20, "bio" = 10, "rad" = 0, "fire" = 80, "acid" = 50)

/obj/item/clothing/shoes/combat/swat/bronze
	name = "brass boots"
	desc = "A giant pair of shoes made out of enchanted bronze."
	worn_icon = 'icons/Fulpicons/clockchap.dmi'
	icon = 'icons/obj/clothing/clockwork_garb.dmi'
	icon_state = "clockwork_treads"
	armor = list("melee" = 15, "bullet" = 15, "laser" = 10, "energy" = 10, "bomb" = 50, "bio" = 10, "rad" = 0, "fire" = 70, "acid" = 50)

/obj/item/clothing/glasses/hud/clock
	name = "Malfunctioning Judicial Visor"
	desc = "An ancient visor. Looks like it's malfunctioning, but it still functions to see those unworthy."
	worn_icon = 'icons/Fulpicons/clockchap.dmi'
	icon ='icons/obj/clothing/clockwork_garb.dmi'
	icon_state = "judicial_visor_1"
	vision_flags = SEE_MOBS
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE

/obj/item/clothing/suit/space/clockwork // Clockwork suits were caracterized by their extreme brute and bullet resistance, yet still weak to lasers.
	inhand_icon_state = "clockwork_cuirass"
	worn_icon = 'icons/Fulpicons/clockchap.dmi'
	icon = 'icons/obj/clothing/clockwork_garb.dmi'
	icon_state = "clockwork_cuirass"
	name = "Clockwork Cuirass"
	desc = "Ancient suit made out of brass. It seems to provide robust protection against most damage types. It glows with a golden, ancient and forgotten energy."
	armor = list("melee" = 50, "bullet" = 50, "laser" = 20, "energy" = 20, "bomb" = 30, "bio" = 100, "rad" = 30, "fire" = 100, "acid" = 100)
	slowdown = 0
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS // The martial art is literally based around fire JFC do you want to burn?
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	actions_types = list(/datum/action/item_action/toggle_spacesuit, /datum/action/item_action/initialize_clock_suit)

	//Using ninja's suit code to make the Cuirass lock onto you
	var/mob/living/carbon/human/affecting = null
	var/s_initialized = 0
	var/s_busy = FALSE
	var/s_delay = 40
	var/obj/item/clothing/shoes/combat/swat/bronze/c_shoes
	var/obj/item/clothing/head/helmet/space/clockwork/c_helmet
	var/obj/item/clothing/gloves/combat/clockwork/c_gauntlets
	var/obj/item/clothing/glasses/hud/clock/c_visor

/datum/action/item_action/initialize_clock_suit
	name = "Activate Cuirass"

#define CLOCK_SUIT_TRAIT "clockwork-cuirass"

// Initiailizing it gives you NODROP

/obj/item/clothing/suit/space/clockwork/proc/lock_suit(mob/living/carbon/human/H)
	if(!istype(H))
		return FALSE
	if(!istype(H.head, /obj/item/clothing/head/helmet/space/clockwork))
		to_chat(H, "<span class='userdanger'/span> The Justiciar requires you to have your helmet to unlock your potential.")
		return FALSE
	if(!istype(H.shoes, /obj/item/clothing/shoes/combat/swat/bronze))
		to_chat(H, "<span class='userdanger'/span> The clockwork Justiciar requires you to wear his treads.")
		return FALSE
	if(!istype(H.gloves, /obj/item/clothing/gloves/combat/clockwork))
		to_chat(H, "<span class='userdanger'/span> Brass gauntlets are essential to enable your power.")
		return FALSE
	if(!istype(H.glasses, /obj/item/clothing/glasses/hud/clock))
		to_chat(H, "<span class='userdanger'/span> Unlock your True Sight through my visor before activating this.")
		return FALSE
	affecting = H
	ADD_TRAIT(src, TRAIT_NODROP, CLOCK_SUIT_TRAIT)
	c_helmet = H.head
	ADD_TRAIT(c_helmet, TRAIT_NODROP, CLOCK_SUIT_TRAIT)
	c_shoes = H.shoes
	ADD_TRAIT(c_shoes, TRAIT_NODROP, CLOCK_SUIT_TRAIT)
	c_gauntlets = H.gloves
	ADD_TRAIT(c_gauntlets, TRAIT_NODROP, CLOCK_SUIT_TRAIT)
	c_visor = H.glasses
	ADD_TRAIT(c_visor, TRAIT_NODROP, CLOCK_SUIT_TRAIT)
	return TRUE

/obj/item/clothing/suit/space/clockwork/proc/unlock_suit()
	affecting = null
	REMOVE_TRAIT(src, TRAIT_NODROP, CLOCK_SUIT_TRAIT)
	if(c_helmet)//Should be attached, might not be attached.
		REMOVE_TRAIT(c_helmet, TRAIT_NODROP, CLOCK_SUIT_TRAIT)
	if(c_shoes)
		REMOVE_TRAIT(c_shoes, TRAIT_NODROP, CLOCK_SUIT_TRAIT)
	if(c_gauntlets)
		REMOVE_TRAIT(c_gauntlets, TRAIT_NODROP, CLOCK_SUIT_TRAIT)

// Initialize messages

#define CLOCK_LOCK_PHASE 				1
#define CLOCK_COMPLETE_PHASE	 		6
#define CLOCK_DEINIT_LOGOFF_PHASE		1

GLOBAL_LIST_INIT(clock_initialize_messages, list(
	"Redirecting the remains of the Justiciar...",
	"Securing hardsuit...\nConnection established.",
	"Finding Reebee...",
	"Connection with Reebee failed.",
	"Siphoning remains of power into suit...",
	"Ratvar's last efforts located.",
	"All systems operational, "
))

GLOBAL_LIST_INIT(clock_deinitialize_messages, list(
	"Now de-initializing...",
	"Shutting down connection with the <B>Justiciar</B>.",
	"Using the Justiciar's spare power...",
	"Repelling Repulsive Nar'Sian influences...",
	"Purifying suit from unholy influences.",
	"Purification complete.",
	"Unsecuring hardsuit mechanism."
))


/obj/item/clothing/suit/space/clockwork/proc/toggle_on_off()
	. = TRUE
	if(s_busy)
		to_chat(loc, "<span class='warning'/span> The Justiciar's power must wait.")
		return FALSE
	s_busy = TRUE
	if(s_initialized)
		deinitialize()
	else
		cinitialize()

/obj/item/clothing/suit/space/clockwork/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/initialize_clock_suit))
		toggle_on_off()
		return TRUE

/obj/item/clothing/suit/space/clockwork/proc/cinitialize(delay = s_delay, mob/living/carbon/human/U = loc, phase = 0)
	if(!U || !U.mind)
		s_busy = FALSE
		return
	if (phase > CLOCK_LOCK_PHASE && (U.stat == DEAD || U.health <= 0))
		to_chat(U, "<span class='danger'><B>ơ͙͈̻n̵̘̦l̫̬̀ͅyͅ ̲ò̮̤n̼̻̼̖̭̪͠ͅe̬͚͕̲̻̰ ҉͚̞͙̞̭̼s̡͖h̜̻̞̣̩̟ͅa̴͉͍̯̟͎̠l̳̝̖̫͞ḷ͔̘̞͞ ̯̞̥̱̲͙̕ͅe̛̙m̦̻̗̹̝̹͘e͈r̫g͕͉̠e͢ ̮͎̗̮̭̭̝a̱͍͍ͅl͙̗͔̹̻̗͈i͕͕̣̫̳̞v̗͈͍͝e</B>F̶o̷r̸ ̶t̸h̷e̸ ̴J̵u̴s̷t̴i̶c̸i̴a̷r̶-̶!̸!̶̨͖̭̜̱̼̺̘̙͇̦̲̬̱͊̏͒͛̍</span>")
		unlock_suit()
		s_busy = FALSE
		return

	var/message = GLOB.clock_initialize_messages[phase + 1]
	switch(phase)
		if (CLOCK_LOCK_PHASE)
			if(!lock_suit(U))//To lock the suit onto wearer.
				s_busy = FALSE
				return
		if (CLOCK_COMPLETE_PHASE)
			message += "Make the Justiciar proud, [U.real_name]."
			s_initialized = TRUE
			s_busy = FALSE

	to_chat(U, "<span class='notice'>[message]</span>")
	playsound(U, 'sound/effects/sparks1.ogg', 10, TRUE)

	if (phase < CLOCK_COMPLETE_PHASE)
		addtimer(CALLBACK(src, .proc/cinitialize, delay, U, phase + 1), delay)

/obj/item/clothing/suit/space/clockwork/proc/deinitialize(delay = s_delay, mob/living/carbon/human/U = affecting == loc ? affecting : null, phase = 0)
	if (!U || !U.mind)
		s_busy = FALSE
		return
	if (phase == 0 && alert("Do you really wish to drive away the Justiciar's remaining power?",,"Yes","No") == "No")
		s_busy = FALSE
		return

	var/message = GLOB.clock_deinitialize_messages[phase + 1]
	switch(phase)
		if(CLOCK_DEINIT_LOGOFF_PHASE)
			message = "Shutting off,, [U.real_name]. " + message
	to_chat(U, "<span class='notice'>[message]</span>")
	playsound(U, 'sound/items/deconstruct.ogg', 10, TRUE)

	if (phase < CLOCK_COMPLETE_PHASE)
		addtimer(CALLBACK(src, .proc/deinitialize, delay, U, phase + 1), delay)
	else
		unlock_suit()
		s_initialized = FALSE
		s_busy = FALSE

#undef CLOCK_LOCK_PHASE
#undef CLOCK_COMPLETE_PHASE
#undef CLOCK_DEINIT_LOGOFF_PHASE

// Ratv' Maga martial art (I know, Awful joke)

/obj/item/book/granter/martial/justiciar_hand
	martial = /datum/martial_art/justiciar_hand
	name = "Ancient Brass Book"
	martialname = "Justiciar Hand"
	desc = "This book seems to depict an ancient War Machine, labeled 'The Clockwork Justiciar'."
	greet = "<span class='sciradio'>You have learned Ratvar's martial art, Justiciar's Hand!</span>"
	icon = 'icons/obj/library_fulp.dmi'
	icon_state ="book_ratvar"
	remarks = list("Wait, these guys made a brass wall and still lost?","For the Justiciar!", "The Ancient God...", "Nar'Sie was kinda mean...", "This space station will be met with its acolytes...", "His remains are at Lavaland?")

#define REPULSIVE_FORCE "DGH"
#define BRAIN_TAZE "GGH"
#define FIREY_TOUCH "HG"
#define TIMESTOP_CRUSH "HHD"

/datum/martial_art/justiciar_hand
	name = "Justiciar's Hand"
	id = MARTIALART_JUSTICIARHAND
	allow_temp_override = FALSE
	help_verb = /mob/living/carbon/human/proc/justiciar_hand_help

/datum/martial_art/justiciar_hand/grab_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	add_to_streak("G",D)
	if(check_streak(A,D))
		return TRUE
	log_combat(A, D, "grabbed (Justiciar's Hand)")
	return ..()

/datum/martial_art/justiciar_hand/harm_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	add_to_streak("H",D)
	if(check_streak(A,D))
		return TRUE
	var/obj/item/bodypart/affecting = D.get_bodypart(ran_zone(A.zone_selected))
	A.do_attack_animation(D, ATTACK_EFFECT_PUNCH)
	var/atk_verb = pick("burn", "incinerate", "strike", "cremate")
	D.visible_message("<span class='danger'>[A] [atk_verb]s [D]!</span>", \
					"<span class='userdanger'>[A] [atk_verb]s you!</span>", null, null, A)
	to_chat(A, "<span class='danger'>You [atk_verb] [D]!</span>")
	D.apply_damage(rand(10,15), BURN, affecting, wound_bonus = CANT_WOUND)
	playsound(get_turf(D), 'sound/weapons/punch1.ogg', 25, TRUE, -1)
	log_combat(A, D, "punched (Justiciar's Hand)")
	return TRUE

/datum/martial_art/justiciar_hand/disarm_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	add_to_streak("D",D)
	if(check_streak(A,D))
		return TRUE
	log_combat(A, D, "disarmed (Justiciar's Hand)")
	return ..()


/datum/martial_art/justiciar_hand/proc/check_streak(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(!can_use(A))
		return FALSE
	if(findtext(streak,REPULSIVE_FORCE))
		streak = ""
		Repulse(A,D)
		return TRUE
	if(findtext(streak,FIREY_TOUCH))
		streak = ""
		Firetouch(A,D)
		return TRUE
	if(findtext(streak,BRAIN_TAZE))
		streak = ""
		Braintaze(A,D)
		return TRUE
	if(findtext(streak,TIMESTOP_CRUSH))
		streak = ""
		Timestop(A,D)
		return TRUE
	return FALSE

/datum/martial_art/justiciar_hand/proc/Repulse(mob/living/carbon/human/A, mob/living/carbon/human/D)
	A.do_attack_animation(D, ATTACK_EFFECT_KICK)
	to_chat(A, "<span class='danger'>You repulse [D]!</span>")
	D.visible_message("<span class='warning'>[A] extends out his hand to [D], a force repulsing them!</span>", \
					"<span class='userdanger'>[A] extends his hand to you, sending you flying!</span>", "<span class='hear'>You hear a sickening sound of flesh hitting flesh!</span>", COMBAT_MESSAGE_RANGE, A)
	playsound(get_turf(A), 'sound/magic/fireball.ogg', 100, TRUE)
	var/atom/throw_target = get_edge_target_turf(D, A.dir)
	D.throw_at(throw_target, 7, 14, A)
	D.apply_damage(15, BURN)
	D.Paralyze(20)
	D.fire_stacks += 8
	D.IgniteMob()
	log_combat(A, D, "Repulsed (Justiciar's Hand)")
	return

/datum/martial_art/justiciar_hand/proc/Firetouch(mob/living/carbon/human/A, mob/living/carbon/human/D)
	A.do_attack_animation(D, ATTACK_EFFECT_PUNCH)
	to_chat(A, "<span class='danger'>You burn [D] with your hand!</span>")
	D.visible_message("<span class='warning'>[A] burns [D] with his glowing hand!</span>", \
					"<span class='userdanger'>[A] burns you with a glowing hand!</span>", "<span class='hear'>You hear a sickening sound of flesh hitting flesh!</span>", COMBAT_MESSAGE_RANGE, A)
	playsound(get_turf(A), 'sound/magic/clockwork/ratvar_attack.ogg', 100, TRUE)
	D.apply_damage(30, BURN)
	D.fire_stacks += 3
	D.IgniteMob()
	log_combat(A, D, "Firey Touch (Justiciar's Hand)")
	return

/datum/martial_art/justiciar_hand/proc/Braintaze(mob/living/carbon/human/A, mob/living/carbon/human/D)
	A.do_attack_animation(D, ATTACK_EFFECT_PUNCH)
	to_chat(A, "<span class='danger'>You invade [D]'s mind!</span>")
	D.visible_message("<span class='warning'>[A] influences [D] with his hands!</span>", \
					"<span class='userdanger'>[A] invades your mind!</span>", "<span class='hear'>You hear a sickening sound of flesh hitting flesh!</span>", COMBAT_MESSAGE_RANGE, A)
	playsound(get_turf(A), 'sound/magic/clockwork/invoke_general.ogg', 100, TRUE)
	D.apply_damage(10, BURN, BODY_ZONE_HEAD)
	D.adjustOrganLoss(ORGAN_SLOT_BRAIN, 40, 150)
	D.adjustStaminaLoss(80)
	D.Paralyze(4 SECONDS)
	D.stuttering += 15
	D.Jitter(1.5 SECONDS)
	D.fire_stacks += 4
	D.IgniteMob()
	log_combat(A, D, "Braintazed (Justiciar's Hand)")
	return

/datum/martial_art/justiciar_hand/proc/Timestop(mob/living/carbon/human/A, mob/living/carbon/human/D)
	A.do_attack_animation(D, ATTACK_EFFECT_KICK)
	to_chat(A, "<span class='danger'>The Justiciar aids you for a brief second, stopping time while you kick [D]!</span>")
	D.visible_message("<span class='warning'>[A] briefly stops time as he kicks [D]!</span>", \
					"<span class='userdanger'>[A] kicks you in almost instantly!</span>", "<span class='hear'>You hear a sickening sound of flesh hitting flesh!</span>", COMBAT_MESSAGE_RANGE, A)
	playsound(get_turf(A), 'sound/magic/timeparadox2.ogg', 100, TRUE)
	D.apply_damage(40, BURN)
	D.fire_stacks += 4
	D.IgniteMob()
	log_combat(A, D, "Crushed (Justiciar's Hand)")
	return

/mob/living/carbon/human/proc/justiciar_hand_help()
	set name = "Recall Teachings"
	set desc = "You recall the Justiciar's teachings."
	set category = "Justiciar's Hand"
	to_chat(usr, "<b><i>The Justiciar refreshes your memory.</i></b>")

	to_chat(usr, "<span class='notice'>Repulse</span>: Disarm Grab Harm. Repulse an enemy, briefly paralyzing, tossing them away and igniting flames.")
	to_chat(usr, "<span class='notice'>Firey Touch</span>: Harm Grab. Burn an opponent with your hand.")
	to_chat(usr, "<span class='notice'>Braintaze</span>: Grab Grab Harm. Invade an opponent's mind, causing brain damage.")
	to_chat(usr, "<span class='notice'>Timestop Crush</span>: Harm Harm Disarm. Kick someone. Decent Burn damage.")

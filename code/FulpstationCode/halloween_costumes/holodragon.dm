// Unstagravs holodragon PR, also my first PR, so please don't bully me too bad.

// 20 TC, atmospheric technician traitor exclusive kit.  Fireproof suit that makes
// you LOOK like a dragon with no movement debuff.  THIS IS NOT SPACE WORTHY.  Comes
// with a flamethrower free of charge.  Very mild melee/laser protection on the suit.

// updates atmospheric technician jumpsuit to not take fire damage. YOU STILL BURN TO DEATH
// updated atmos jumpskirt to have same resistances and flags as jumpsuit (idk why it wasn't like that)
// makes ian say silly things if you put this hat on his head. lol

// fulp_overwrite_vars.dm, holodragon.dm, costumes_worn.dmi, costumes_icon.dmi

/obj/item/clothing/suit/holodragon
	name = "experimental T5 holographic emitter suit"
	desc = "Is that a roomba on a cardboard suit? It's got a port for an HDMI cable near the top, aren't those outdated?"
	icon = 'icons/fulpicons/halloween_costumes/costumes_icon.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/costumes_worn.dmi'
	icon_state = "holodragon_s"
	body_parts_covered = CHEST|GROIN
	flags_inv = HIDEJUMPSUIT
	dog_fashion = /datum/dog_fashion/back
	armor = list("melee" = 20, "bullet" = 0, "laser" = 20, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 0, "wound" = 0)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/holodragon/equipped(mob/living/user, slot)
	..()
	if(slot == ITEM_SLOT_OCLOTHING)
		disguise(user)

/obj/item/clothing/suit/holodragon/dropped(mob/living/user)
	..()
	user.remove_alt_appearance("standard_spacedragon_disguise")

/obj/item/clothing/suit/holodragon/proc/disguise(mob/living/carbon/human/H, obj/item/clothing/head/holodragon/dragonhead)
	if(istype(H))
		if(!dragonhead)
			dragonhead = H.head
		if(istype(dragonhead, /obj/item/clothing/head/holodragon))
			var/image/I = image(icon = 'icons/mob/spacedragon.dmi' , icon_state = "spacedragon", loc = H)
			I.override = 1
			I.add_overlay(mutable_appearance('icons/mob/spacedragon.dmi', "spacedragon")) //gotta look realistic
			add_alt_appearance(/datum/atom_hud/alternate_appearance/basic/silicons, "standard_spacedragon_disguise", I) //space dragoooooooooon

/obj/item/clothing/head/holodragon
	name = "experimental T5 projection tower"
	desc = "Please tell me that isn't a solar panel on a helmet. Theres an HDMI cable on the bottom and you're not sure what do to with ancient tech."
	icon = 'icons/fulpicons/halloween_costumes/costumes_icon.dmi'
	worn_icon = 'icons/fulpicons/halloween_costumes/costumes_worn.dmi'
	icon_state = "holodragon_h"
	clothing_flags = SNUG_FIT
	flags_cover = HEADCOVERSEYES
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	armor = list("melee" = 20, "bullet" = 0, "laser" = 20, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 0, "wound" = 0)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF

	dog_fashion = /datum/dog_fashion/head/holodragon

/obj/item/clothing/head/holodragon/equipped(mob/living/user, slot)
	..()
	if(ishuman(user) && slot == ITEM_SLOT_HEAD)
		var/mob/living/carbon/human/H = user
		if(istype(H.wear_suit, /obj/item/clothing/suit/holodragon))
			var/obj/item/clothing/suit/holodragon/CB = H.wear_suit
			CB.disguise(user, src)

/obj/item/clothing/head/holodragon/dropped(mob/living/user)
	..()
	user.remove_alt_appearance("standard_spacedragon_disguise")

/datum/dog_fashion/head/holodragon
	name = "Dragi"
	speak = list("Roar!","Hiss!","Woof!")
	emote_see = list("gibs the shuttle.", "omnoms the humans.")
	desc = "That doesn't look like a dragon..."

///////////////// TRAITOR UPLINK CODE BELOW (: //////////////

/datum/uplink_item/role_restricted/holodragon
	name = "Holographic Dragon Costume"
	desc = "Hey boss, one of our scientists at the communications base stole the AIs holo emitter to make a halloween costume, ain't that great?  He strapped it to some fire-proof cardboard and anyways its for sale.  You interested?  I'll throw in some pyromaniac gear if you do, just don't talk about it back at base."
	item = /obj/item/storage/box/syndie_kit/holodragon
	cost = 20
	restricted_roles = list("Atmospheric Technician")
	include_modes = list(/datum/game_mode/traitor)

/obj/item/storage/box/syndie_kit/holodragon
	name = "holographic dragon suit"

/obj/item/storage/box/syndie_kit/holodragon/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 10

/obj/item/storage/box/syndie_kit/holodragon/PopulateContents()
	new /obj/item/clothing/suit/holodragon(src)
	new /obj/item/clothing/head/holodragon(src)
	new /obj/item/clothing/mask/gas/atmos(src)
	new /obj/item/clothing/shoes/workboots/mining(src)
	new /obj/item/flamethrower(src)
	new /obj/item/assembly/igniter(src)
	new /obj/item/screwdriver(src)
	new /obj/item/tank/internals/plasma(src)
	new /obj/item/tank/internals/plasma(src)
	new /obj/item/paper/guides/antag/holodragon(src)

/obj/item/paper/guides/antag/holodragon
	name = "Syndicate Guidelines & Kit Instructions"
	info = {"<b>Glory to atmosia!</b><br>

 <br>
 <b>Wow a Flamethrower!! and I'm fireproof?!! Yipee-</b>: ***MESSAGE REDACTED**** <br>
 <br>
 <b>*SYNDICATE COMMAND INJECTED MESSAGE*</b>:Whoah whoah slowdown partner.  How did you get all this crap..?  It's not even on our bulkhead inventory.. Whatever, just remember we put you here to accomplish your objectives.  Make sure to focus on those and not burning the station down or there'll be trouble, got it?  The last thing we need is a media coverage of some AWOL operative responsible for syndicate war crimes. We're gonna talk about who sent you this crap after the operation.  Command out.<br>
 <br>
 <b>Ancient flamethrower assembly</b>: Screwdriver on igniter, igniter on flamethrower, and click flamethrower with screwdriver. Add plasma tank, and click flamethrower. You're locked and loaded.<br>
 <br>
 <b>Ew whos shoes are those?</b>: I'm not sure! you know how I like collecting things... anyways they're fireproof.<br>
 <br>
"}

//////////////////////////////////////////////////////////////

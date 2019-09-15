/obj/item/storage/belt/security/emerlightpouch
	name = "emergency light pouch"
	desc = "A pouch specially designed to contain flares and glowsticks."
	icon_state = "securitybelt"
	item_state = "security"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_POCKET
	content_overlays = FALSE

/obj/item/storage/belt/security/emerlightpouch/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 4 // Not gonna' let y'all hoard them for yourself. Four lights is enough.
	STR.max_w_class = WEIGHT_CLASS_SMALL //Better fit in my pockets and belt slot!
	STR.set_holdable(list(
    /obj/item/flashlight/flare,
    /obj/item/flashlight/flare/classic,
    /obj/item/flashlight/glowstick,
    /obj/item/flashlight/glowstick/military, // Military designates that Sec uses it. Lasts longer than a civilian glowstick.
    /obj/item/flashlight/glowstick/red,
    /obj/item/flashlight/glowstick/military/red,
    /obj/item/flashlight/glowstick/blue,
    /obj/item/flashlight/glowstick/cyan,
    /obj/item/flashlight/glowstick/military/cyan,
    /obj/item/flashlight/glowstick/orange,
    /obj/item/flashlight/glowstick/high/orange, // High designates that it's high power. Brighter than a civilian glowstick but lasts a bit shorter.
    /obj/item/flashlight/glowstick/ultra/orange, // Ultra designates that it's ULTRA BRIGHT and lasts a very short time. Used to light and mark dangerous areas under repair.
    /obj/item/flashlight/glowstick/yellow,
    /obj/item/flashlight/glowstick/military/yellow,
    /obj/item/flashlight/glowstick/high/white,
    /obj/item/flashlight/glowstick/pink
		))


/obj/item/flashlight/glowstick/military
    	name = "military glowstick"
    	desc = "A military-grade glowstick. Has a longer life spawn than its' civilian counterpart."
    	custom_price = 20
    	brightness_on = 4

/obj/item/flashlight/glowstick/military/Initialize()
      	fuel = rand(1400, 1800)
      	light_color = color
      	. = ..()

/obj/item/flashlight/glowstick/military/red
        	name = "red military glowstick"
        	color = LIGHT_COLOR_RED

/obj/item/flashlight/glowstick/military/cyan
        	name = "cyan military glowstick"
        	color = LIGHT_COLOR_CYAN

/obj/item/flashlight/glowstick/military/yellow
        	name = "yellow military glowstick"
        	color = LIGHT_COLOR_YELLOW


/obj/item/flashlight/glowstick/high
        name = "high-power glowstick"
        desc = "A high-power civilian-grade glowstick. Emits a brighter light at the cost of a shorter life span."
        custom_price = 20
        brightness_on = 4

/obj/item/flashlight/glowstick/high/Initialize()
        fuel = rand(700, 900)
        light_color = color
        . = ..()

/obj/item/flashlight/glowstick/high/orange
        	name = "orange high-power glowstick"
        	color = LIGHT_COLOR_ORANGE

/obj/item/flashlight/glowstick/high/white
					name = "white high-power glowstick"
					color = LIGHT_COLOR_WHITE


/obj/item/flashlight/glowstick/ultra
        name = "ultra-bright glowstick"
        desc = "An ultra-bright civilian-grade glowstick used by Engineers to mark hazardous areas under repair. Emits a very bright light at the cost of a shorter life span."
        custom_price = 20
        brightness_on = 5
        flashlight_power = 2

/obj/item/flashlight/glowstick/ultra/Initialize()
					fuel = rand(450, 550)
					light_color = color
					. = ..()

/obj/item/flashlight/glowstick/ultra/orange
      	name = "orange ultra-bright glowstick"
      	color = LIGHT_COLOR_ORANGE


/*
    THE HOLY RED FLARE!!!!
*/
/obj/item/flashlight/flare/classic
	name = "flare"
	desc = "An old red Nanotrasen issued flare. There are instructions on the side, it reads 'pull cord, make light'. These were discontinued in favor of the new white flare." // [PNX] Muh lore!
	w_class = WEIGHT_CLASS_SMALL
	brightness_on = 7 // Pretty bright.
	icon_state = "flare"
	item_state = "flare"
	actions_types = list()
	heat = 1000
	light_color = LIGHT_COLOR_FLARE // Oh yeah baby give me that classic red~!
	grind_results = list(/datum/reagent/sulfur = 15)

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

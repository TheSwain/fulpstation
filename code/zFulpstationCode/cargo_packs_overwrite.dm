//Overwrites to cargo packs without touching TG files
//As this overwrite the original files, any change on this packs on TG should be ported here.

/datum/supply_pack/engine/particle_accelerator
	name = "Particle Accelerator Crate"
	desc = "A supermassive black hole or hyper-powered teslaball are the perfect way to spice up any party! This \"My First Apocalypse\" kit contains everything you need to build your own Particle Accelerator! Ages 10 and up."
	cost = 3000
	access = ACCESS_CE // Added 
	contains = list(/obj/structure/particle_accelerator/fuel_chamber,
					/obj/machinery/particle_accelerator/control_box,
					/obj/structure/particle_accelerator/particle_emitter/center,
					/obj/structure/particle_accelerator/particle_emitter/left,
					/obj/structure/particle_accelerator/particle_emitter/right,
					/obj/structure/particle_accelerator/power_box,
					/obj/structure/particle_accelerator/end_cap)
	crate_name = "particle accelerator crate"
	dangerous = TRUE // Added

/datum/supply_pack/security/armory/ballistic
	name = "Combat Shotguns Crate"
	desc = "For when the enemy absolutely needs to be replaced with lead. Contains three Aussec-designed Combat Shotguns, and three Shotgun Bandoliers. Requires Armory access to open."
	cost = 8000
	contains = list(/obj/item/gun/ballistic/shotgun/automatic/combat,
					/obj/item/gun/ballistic/shotgun/automatic/combat,
					/obj/item/gun/ballistic/shotgun/automatic/combat,
					/obj/item/storage/belt/bandolier,
					/obj/item/storage/belt/bandolier,
					/obj/item/storage/belt/bandolier)
	crate_name = "combat shotguns crate"
	dangerous = TRUE // Added

/datum/supply_pack/security/armory/energy
	name = "Energy Guns Crate"
	desc = "Contains two Energy Guns, capable of firing both nonlethal and lethal blasts of light. Requires Armory access to open."
	cost = 2500
	contains = list(/obj/item/gun/energy/e_gun,
					/obj/item/gun/energy/e_gun)
	crate_name = "energy gun crate"
	crate_type = /obj/structure/closet/crate/secure/plasma
	dangerous = TRUE // Added

/datum/supply_pack/security/armory/russian
	name = "Russian Surplus Crate"
	desc = "Hello Comrade, we have the most modern russian military equipment the black market can offer, for the right price of course. Sadly we couldnt remove the lock so it requires Armory access to open."
	cost = 5000
	contraband = TRUE
	contains = list(/obj/item/reagent_containers/food/snacks/rationpack,
					/obj/item/ammo_box/a762,
					/obj/item/storage/toolbox/ammo,
					/obj/item/clothing/suit/armor/vest/russian,
					/obj/item/clothing/head/helmet/rus_helmet,
					/obj/item/clothing/shoes/russian,
					/obj/item/clothing/gloves/tackler/combat,
					/obj/item/clothing/under/syndicate/rus_army,
					/obj/item/clothing/under/costume/soviet,
					/obj/item/clothing/mask/russian_balaclava,
					/obj/item/clothing/head/helmet/rus_ushanka,
					/obj/item/clothing/suit/armor/vest/russian_coat,
					/obj/item/gun/ballistic/rifle/boltaction,
					/obj/item/gun/ballistic/rifle/boltaction)
	crate_name = "surplus military crate"
	dangerous = TRUE // Added

/datum/supply_pack/security/armory/wt550
	name = "WT-550 Auto Rifle Crate"
	desc = "Contains two high-powered, semiautomatic rifles chambered in 4.6x30mm. Requires Armory access to open."
	cost = 3500
	contains = list(/obj/item/gun/ballistic/automatic/wt550,
					/obj/item/gun/ballistic/automatic/wt550)
	crate_name = "auto rifle crate"
	dangerous = TRUE // Added

//Goodies overwrite to remove lethals from the list

/datum/supply_pack/goody/dumdum38
	name = ".38 DumDum Speedloader"
	desc = "Contains one speedloader of .38 DumDum ammunition, good for embedding in soft targets."
	cost = 350
	contains = list(/obj/item/ammo_box/c38/dumdum)
	special = TRUE // Adding the special = TRUE makes it unable to be bought, to prevent crew with sec gear

/datum/supply_pack/goody/match38
	name = ".38 Match Grade Speedloader"
	desc = "Contains one speedloader of match grade .38 ammunition, perfect for showing off trickshots."
	cost = 350
	contains = list(/obj/item/ammo_box/c38/match)
	special = TRUE // Adding the special = TRUE makes it unable to be bought, to prevent crew with sec gear

/datum/supply_pack/goody/rubber
	name = ".38 Rubber Speedloader"
	desc = "Contains one speedloader of bouncy rubber .38 ammunition, for when you want to bounce your shots off anything and everything."
	cost = 350
	contains = list(/obj/item/ammo_box/c38/match/bouncy)
	special = TRUE // Adding the special = TRUE makes it unable to be bought, to prevent crew with sec gear

/datum/supply_pack/goody/stingbang
	name = "Stingbang Single-Pack"
	desc = "Contains one \"stingbang\" grenade, perfect for playing meanhearted pranks."
	cost = 700
	contains = list(/obj/item/grenade/stingbang)
	special = TRUE // Adding the special = TRUE makes it unable to be bought, to prevent crew with sec gear

/datum/supply_pack/goody/combatknives_single
	name = "Combat Knife Single-Pack"
	desc = "Contains one sharpened combat knive. Guaranteed to fit snugly inside any Nanotrasen-standard boot."
	cost = 1250
	contains = list(/obj/item/kitchen/knife/combat)
	special = TRUE // Adding the special = TRUE makes it unable to be bought, to prevent crew with sec gear

/datum/supply_pack/goody/ballistic_single
	name = "Combat Shotgun Single-Pack"
	desc = "For when the enemy absolutely needs to be replaced with lead. Contains one Aussec-designed Combat Shotgun, and one Shotgun Bandolier."
	cost = 4000
	contains = list(/obj/item/gun/ballistic/shotgun/automatic/combat, /obj/item/storage/belt/bandolier)
	special = TRUE // Adding the special = TRUE makes it unable to be bought, to prevent crew with sec gear

/datum/supply_pack/goody/energy_single
	name = "Energy Gun Single-Pack"
	desc = "Contains one energy gun, capable of firing both nonlethal and lethal blasts of light."
	cost = 1500
	contains = list(/obj/item/gun/energy/e_gun)
	special = TRUE // Adding the special = TRUE makes it unable to be bought, to prevent crew with sec gear

/datum/supply_pack/goody/hell_single
	name = "Hellgun Single-Pack"
	desc = "Contains one hellgun, an old pattern of laser gun infamous for its ability to horribly disfigure targets with burns. Technically violates the Space Geneva Convention when used on humanoids."
	cost = 2000
	contains = list(/obj/item/gun/energy/laser/hellgun)
	special = TRUE // Adding the special = TRUE makes it unable to be bought, to prevent crew with sec gear

/datum/supply_pack/goody/wt550_single
	name = "WT-550 Auto Rifle Single-Pack"
	desc = "Contains one high-powered, semiautomatic rifles chambered in 4.6x30mm." // "high-powered" lol yea right
	cost = 2000
	contains = list(/obj/item/gun/ballistic/automatic/wt550)
	special = TRUE // Adding the special = TRUE makes it unable to be bought, to prevent crew with sec gear

/datum/supply_pack/goody/wt550ammo_single
	name = "WT-550 Auto Rifle Ammo Single-Pack"
	desc = "Contains a 20-round magazine for the WT-550 Auto Rifle. Each magazine is designed to facilitate rapid tactical reloads."
	cost = 900
	contains = list(/obj/item/ammo_box/magazine/wt550m9)
	special = TRUE // Adding the special = TRUE makes it unable to be bought, to prevent crew with sec gear
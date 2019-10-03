/datum/job/fulp/brigdoc //[FULP] [XEON] [PNX] Brig Doctor job, a modified version Xeon's EMT job.
	title = "Brig Doctor" // Files modified for this job are: code/modules/jobs/jobs.dm, code/modules/jobs/access.dm, code/__DEFINES/jobs.dm
	flag = BRIG_DOC
	department_head = list("Warden")
	department_flag = MEDSCI // Gives Med experience. I think. This line might actually do nothing.
	faction = "Station"
	total_positions = 1 // You get one. Treat them nicely please.
	spawn_positions = 1 
	supervisors = "the warden; and the chief medical officer if needed. As the Brig Doctor you have been entrusted with the health of the Security staff stationed in the Brig and any prisoners. If tending to a prisoner ensure you have a Officer or the Warden with you. Should you need to conduct surgery in the Brig there is a set of surgucal tools down the perma hallway."
	//supervisors = "the warden; and the chief medical officer if needed." // Short one for once people get used to the Brig Doctor job.
	selection_color = "#ffeef0"
	minimal_player_age = 7 // Requires the player to have been playing on Fulp for 7 days
	exp_requirements = 480 // Requires 8 or so hours of playtime on medical and security. I think.
	exp_type = EXP_TYPE_CREW
	exp_type_department = list(EXP_TYPE_MEDICAL, EXP_TYPE_SECURITY) // Shot in the dark tbh. This probably does nothing.
	outfit = /datum/outfit/job/brigdoc
	fulp_spawn = /area/security/brig
	id_icon = 'icons/fulpicons/cards.dmi'
	hud_icon = 'icons/fulpicons/fulphud.dmi'

	access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY, ACCESS_CHEMISTRY, ACCESS_GENETICS, ACCESS_CLONING, ACCESS_VIROLOGY, ACCESS_MECH_MEDICAL, ACCESS_MINERAL_STOREROOM, // Skeleton Medical access
									ACCESS_SECURITY, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_COURT, ACCESS_MAINT_TUNNELS, ACCESS_MECH_SECURITY, ACCESS_WEAPONS, ACCESS_FORENSICS_LOCKERS, // Skeleton Security access
									ACCESS_TECH_STORAGE) // Skeleton Engineering access
	minimal_access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY, ACCESS_CLONING, ACCESS_MECH_MEDICAL, // Normal Medical access
									ACCESS_MINERAL_STOREROOM, ACCESS_SEC_DOORS, ACCESS_BRIG, ACCESS_COURT, ACCESS_TECH_STORAGE) // Normal Security and "Engineering" access
	paycheck = PAYCHECK_MEDIUM // I'd say high/hard but that feels a bit too nice. MD with extra responsibility without extra pay; The NT way!
	paycheck_department = ACCOUNT_MED

	display_order = JOB_DISPLAY_ORDER_WARDEN // Mith did it so I'll do it too :P

/datum/outfit/job/brigdoc //Brig Doc outfit
	name = "Brig Doctor"
	jobtype = /datum/job/fulp/brigdoc

	//head = /obj/item/clothing/head/helmet/sec // Uncomment if you want the Brig Doc to have a helmet.
	belt = /obj/item/storage/belt/medsec // Gives the Brig Doc the newly created MedSec belt
	ears = /obj/item/radio/headset/headset_medsec // Gives the Brig Doc the newly created MedSec headset
	mask = /obj/item/clothing/mask/surgical // Gives the Brig Doc a sterile mask as this doesn't always spawn
	glasses = /obj/item/clothing/glasses/hud/health // Allows the Brig Doc to quickly see who's hurt
	uniform = /obj/item/clothing/under/rank/medical/brigdoc // Just the Brig Doc their own unique jumpsuit
	accessory = /obj/item/clothing/accessory/armband/medsec // Gives the Brig Dog the newly created MedSec armband
	gloves = /obj/item/clothing/gloves/color/latex // Give the Brig Doc latex gloves as this doesn't always spawn
	shoes = /obj/item/clothing/shoes/sneakers/white // Default medical shoes
	suit =  /obj/item/clothing/suit/armor/vest // Gives the Brig Doc a 'slim Type I armor vest' found in Sec lockers
	l_hand = /obj/item/storage/firstaid/combatmedic // Gives the Brig Doc a combat first aid kit in their hand
	l_pocket = /obj/item/pda/medical // Belt slot is already occupied so the PDA has to go into a pocket.
	backpack_contents = list(
		/obj/item/storage/firstaid/toxin = 1, // Gives the Brig Doc a kit to deal with toxins. Otherwise they have to raid Medbay for a kit.
		/obj/item/storage/firstaid/o2 = 1, // Given for the same reason as the toxin kit.
		/obj/item/storage/firstaid/medical = 1, // Given so the Brig Doc spawns with some surgery tools.
		) // Not given any Sec equipment as they should ask the Warden for that. Encourages the Brig Doc and Warden to acknowledge each other's existance.

	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med

	implants = list(/obj/item/implant/mindshield) //Comment this line out if you'd like Brig Docs to not have a mindshield implant at round start.

	chameleon_extras = /obj/item/gun/syringe
	pda_slot = SLOT_L_STORE // Makes the game assign the PDA in this slot to the player rather than the Belt slot pda.


// Brig Doc Equipment and Medical Supplies.
// Moved to fulp_medical.dm

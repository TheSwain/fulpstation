/***************** EMP-Proof Robotic Limbs *****************/

/obj/item/bodypart/chest/robot/empproof
	name = "emp-proof cyborg chest"
	empproof = TRUE //EMP PROOF HAHA

/obj/item/bodypart/head/robot/empproof
	name = "emp-proof cyborg head"
	empproof = TRUE //Well, actually it's EMP - RESISTANT, your limbs will still take damage from it.

/obj/item/bodypart/l_arm/robot/empproof
	name = "emp-proof cyborg left arm"
	empproof = TRUE //But hey, no stun.

/obj/item/bodypart/l_leg/robot/empproof
	name = "emp-proof cyborg left leg"
	empproof = TRUE

/obj/item/bodypart/r_arm/robot/empproof
	name = "emp-proof cyborg right arm"
	empproof = TRUE

/obj/item/bodypart/r_leg/robot/empproof
	name = "emp-proof cyborg right leg"
	empproof = TRUE

/obj/item/bodypart/Initialize()
	..()
	if(empproof)
		desc += " This one is EMP-Proof, though it only protects against paralizing effects of EMP."

/***************** EMP Proof limbs - Tech *****************/

/datum/techweb_node/mars_robotics_empproof
	id = "mars_robotics_empproof"
	display_name = "EMP-Proof Augmentation"
	description = "Advanced research that prevents robotic limbs from overloading when affected by electromagnetic pulse. Doesn't work with Cyborgs."
	prereq_ids = list("adv_robotics", "emp_super", "mars_tech") //Must use unlockable tech from random lavaland ruin.
	design_ids = list("borg_chest_empproof", "borg_head_empproof", "borg_l_arm_empproof", "borg_r_arm_empproof", "borg_l_leg_empproof", "borg_r_leg_empproof")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)
	export_price = 5000

/datum/design/borg_chest/emp
	name = "EMP-Proof Cyborg Torso"
	id = "borg_chest_empproof"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/bodypart/chest/robot/empproof
	materials = list(/datum/material/iron=40000, /datum/material/plasma=20000, /datum/material/uranium=10000)
	construction_time = 150
	category = list("Misc", "Medical Designs")

/datum/design/borg_head/emp
	name = "EMP-Proof Cyborg Head"
	id = "borg_head_empproof"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/bodypart/head/robot/empproof
	materials = list(/datum/material/iron=5000, /datum/material/plasma=2500, /datum/material/uranium=1250)
	construction_time = 150
	category = list("Misc", "Medical Designs")

/datum/design/borg_l_arm/emp
	name = "EMP-Proof Cyborg Left Arm"
	id = "borg_l_arm_empproof"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/bodypart/l_arm/robot/empproof
	materials = list(/datum/material/iron=10000, /datum/material/plasma=5000, /datum/material/uranium=2500)
	construction_time = 100
	category = list("Misc", "Medical Designs")

/datum/design/borg_r_arm/emp
	name = "EMP-Proof Cyborg Right Arm"
	id = "borg_r_arm_empproof"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/bodypart/r_arm/robot/empproof
	materials = list(/datum/material/iron=10000, /datum/material/plasma=5000, /datum/material/uranium=2500)
	construction_time = 100
	category = list("Misc", "Medical Designs")

/datum/design/borg_l_leg/emp
	name = "EMP-Proof Cyborg Left Leg"
	id = "borg_l_leg_empproof"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/bodypart/l_leg/robot/empproof
	materials = list(/datum/material/iron=10000, /datum/material/plasma=5000, /datum/material/uranium=2500)
	construction_time = 100
	category = list("Misc", "Medical Designs")

/datum/design/borg_r_leg/emp
	name = "EMP-Proof Cyborg Right Leg"
	id = "borg_r_leg_empproof"
	build_type = PROTOLATHE | MECHFAB
	build_path = /obj/item/bodypart/r_leg/robot/empproof
	materials = list(/datum/material/iron=10000, /datum/material/plasma=5000, /datum/material/uranium=2500)
	construction_time = 100
	category = list("Misc", "Medical Designs")

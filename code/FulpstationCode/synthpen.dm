/obj/item/reagent_containers/hypospray/medipen/synthpen
	name = "epinephrine synthpen"
	desc = "An advanced self-synthesizing epinephrine auto-injector for stabilizing people at death's door again and again."
	icon_state = "synthpen"
	icon = 'icons/fulpicons/synthpen/floorsprite.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	var/filled_state = 10
	var/cooling_down = 0
	var/refill_rate = 8 //lower is faster

/obj/item/reagent_containers/hypospray/medipen/synthpen/Initialize()
	..()
	update_fillstate()
	init_refill()

/obj/item/reagent_containers/hypospray/medipen/synthpen/proc/init_refill()
	START_PROCESSING(SSobj, src)

/obj/item/reagent_containers/hypospray/medipen/synthpen/process()
	if(reagents.total_volume < volume)
		cooling_down -= 1
		if(cooling_down <= 0)
			refill()

/obj/item/reagent_containers/hypospray/medipen/synthpen/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/reagent_containers/hypospray/medipen/synthpen/inject(mob/living/M, mob/user)
	if(reagents.total_volume != volume)
		to_chat(user, "<span class='warning'>[src] isn't refilled yet!</span>")
		return FALSE
	. = ..()
	if(.)
		filled_state = 2
		reagents.maximum_volume = volume //to undo the code that renders epipens single use
		update_fillstate()

/obj/item/reagent_containers/hypospray/medipen/synthpen/proc/refill()
	reagents.add_reagent(/datum/reagent/medicine/epinephrine, 1)
	if(filled_state <= reagents.total_volume)
		update_fillstate()
		cooling_down = refill_rate

/obj/item/reagent_containers/hypospray/medipen/synthpen/proc/update_fillstate()
	switch(reagents.total_volume)
		if(0 to 2)
			filled_state = 2
		if(2.1 to 4)
			filled_state = 4
		if(4.1 to 6)
			filled_state = 6
		if(6.1 to INFINITY)
			filled_state = 8
	if(reagents.total_volume == volume) //this is absolutely shitcode, but the switch statement wont accept the volume var and I dont want varediting to break everything
		filled_state = 10
	icon_state = "[initial(icon_state)]_[filled_state]"


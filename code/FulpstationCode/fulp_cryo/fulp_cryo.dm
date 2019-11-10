/obj/machinery/atmospherics/components/unary/cryo_cell/proc/fulp_ui_data()
	var/list/data = list()
	data["isOperating"] = on
	data["hasOccupant"] = occupant ? TRUE : FALSE
	data["isOpen"] = state_open
	data["autoEject"] = autoeject
	data["lockDown"] = lockdown

	data["occupant"] = list()
	if(occupant)
		var/mob/living/mob_occupant = occupant
		data["occupant"]["name"] = mob_occupant.name
		switch(mob_occupant.stat)
			if(CONSCIOUS)
				data["occupant"]["stat"] = "Conscious"
				data["occupant"]["statstate"] = "good"
			if(SOFT_CRIT)
				data["occupant"]["stat"] = "Conscious"
				data["occupant"]["statstate"] = "average"
			if(UNCONSCIOUS)
				data["occupant"]["stat"] = "Unconscious"
				data["occupant"]["statstate"] = "average"
			if(DEAD)
				data["occupant"]["stat"] = "Dead"
				data["occupant"]["statstate"] = "bad"
		data["occupant"]["health"] = round(mob_occupant.health, 1)
		data["occupant"]["maxHealth"] = mob_occupant.maxHealth
		data["occupant"]["minHealth"] = HEALTH_THRESHOLD_DEAD
		data["occupant"]["bruteLoss"] = round(mob_occupant.getBruteLoss_nonProsthetic(), 1) // FULP: Don't count Prosthetics.
		data["occupant"]["oxyLoss"] = round(mob_occupant.getOxyLoss(), 1)
		data["occupant"]["toxLoss"] = round(mob_occupant.getToxLoss(), 1)
		data["occupant"]["fireLoss"] = round(mob_occupant.getFireLoss_nonProsthetic(), 1) // FULP: Don't count Prosthetics.
		data["occupant"]["bodyTemperature"] = round(mob_occupant.bodytemperature, 1)
		if(mob_occupant.bodytemperature < TCRYO)
			data["occupant"]["temperaturestatus"] = "good"
		else if(mob_occupant.bodytemperature < T0C)
			data["occupant"]["temperaturestatus"] = "average"
		else
			data["occupant"]["temperaturestatus"] = "bad"

	var/datum/gas_mixture/air1 = airs[1]
	data["cellTemperature"] = round(air1.temperature, 1)

	data["isBeakerLoaded"] = beaker ? TRUE : FALSE
	var/beakerContents = list()
	if(beaker && beaker.reagents && beaker.reagents.reagent_list.len)
		for(var/datum/reagent/R in beaker.reagents.reagent_list)
			beakerContents += list(list("name" = R.name, "volume" = R.volume))
	data["beakerContents"] = beakerContents
	return data

/obj/machinery/atmospherics/components/unary/cryo_cell/proc/fulp_ui_act(action, params)

	var/mob/M = usr
	var/obj/item/card/id/I = M.get_idcard(TRUE)
	if(lockdown && (!I || !check_access(I)) ) //If we're in lockdown mode we check for medical access
		to_chat(M, "<span class='danger'>[src] in lockdown mode; medical authorization required. Access denied.</span>")
		playsound(src, 'sound/machines/buzz-two.ogg', volume)
		return FALSE

	playsound(src, 'sound/machines/beep.ogg', volume)
	switch(action)
		if("power")
			if(on)
				on = FALSE
			else if(!state_open)
				on = TRUE
			update_icon()
			return TRUE
		if("door")
			if(state_open)
				close_machine()
			else
				open_machine()
			return TRUE
		if("autoeject")
			autoeject = !autoeject
			return TRUE
		if("ejectbeaker")
			if(beaker)
				beaker.forceMove(drop_location())
				if(Adjacent(usr) && !issilicon(usr))
					usr.put_in_hands(beaker)
				beaker = null
				return TRUE
		if("lockdown")
			if(!I || !check_access(I))
				to_chat(M, "<span class='danger'>Medical authorization required to toggle lockdown mode. Access denied.</span>")
				playsound(src, 'sound/machines/buzz-two.ogg', volume)
				return FALSE
			lockdown = !lockdown
			return TRUE

	return FALSE

/obj/machinery/atmospherics/components/unary/cryo_cell/proc/check_id(obj/item/I, mob/user, params)
	var/obj/item/card/id/C
	if (istype(I, /obj/item/card/id))
		C = I
	else if (istype(I, /obj/item/pda))
		var/obj/item/pda/P = I
		C = P.id

	if(!C)
		return FALSE

	if(check_access(C))
		lockdown = !lockdown
		playsound(src, 'sound/machines/beep.ogg', volume)
		to_chat(user, "<span class='notice'>You toggle [src]'s lockdown mode [lockdown ? "on" : "off"]</span>")
		return TRUE

	else
		playsound(src, 'sound/machines/buzz-two.ogg', volume)
		to_chat(user, "<span class='notice'>You lack sufficient access to toggle [src]'s lockdown mode.</span>")

	return FALSE


/obj/machinery/atmospherics/components/unary/cryo_cell/emag_act(mob/user) //Emag turns off the lockdown mode
	if(lockdown)
		lockdown = FALSE
		to_chat(user, "<span class='danger'>You disable [src]'s lockdown mode.</span>")
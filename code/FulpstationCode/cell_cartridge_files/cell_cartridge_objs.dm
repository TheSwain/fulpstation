

/obj/item/gun/energy/afterattack()
	. = ..() //The gun actually firing
	postfire_empty_checks()


///postfire empty checks for sound alarms
/obj/item/gun/energy/proc/postfire_empty_checks()
	if (!can_shoot() || !ammo_type[select])
		if (!alarmed && empty_alarm)
			playsound(src, empty_alarm_sound, empty_alarm_volume, empty_alarm_vary)
			alarmed = TRUE
			update_icon()


/obj/item/gun/energy/proc/eject_cartridge(mob/user, display_message = TRUE, replace_cell = FALSE)
	if(!can_unload) //Sanity check
		return
	if(!cartridge) //Sanity check
		return
	var/obj/item/cell_cartridge/C = cartridge
	if(unload_time)
		to_chat(user, "<span class='warning'>You start ejecting \the [C]...</span>")
		if(!do_after(user, unload_time, target = user)) //Slight delay before the cell is unloaded; must stand still.
			to_chat(user, "<span class='warning'>You stop ejecting \the [C].</span>")
			return
	C.forceMove(drop_location())
	user.put_in_hands(C)
	C.update_icon()
	if(C.cell)
		if (C.cell.charge)
			playsound(src, load_sound, load_sound_volume, load_sound_vary)
		else
			playsound(src, load_empty_sound, load_sound_volume, load_sound_vary)
	else
		playsound(src, load_empty_sound, load_sound_volume, load_sound_vary)
	cell = null
	cartridge = null
	if (display_message)
		to_chat(user, "<span class='warning'>You pull [C] out of \the [src].</span>")
	update_icon(TRUE, user)


/obj/item/gun/energy/proc/load_cartridge(obj/item/cell_cartridge/C, mob/user)
	if(load_time)
		to_chat(user, "<span class='warning'>You start loading \the [C] into \the [src].</span>")
		if(!do_after(user, load_time, target = user)) //Slight delay before the cell is loaded; must stand still.
			to_chat(user, "<span class='warning'>You stop loading \the [C] into \the [src].</span>")
			return
	if(!user.transferItemToLoc(C, src))
		return
	cartridge = C
	var/obj/item/stock_parts/cell/power_cell
	power_cell = C.cell
	if(power_cell)
		cell = power_cell
		alarmed = FALSE
	playsound(src, load_sound, load_sound_volume, load_sound_vary)
	to_chat(user, "<span class='warning'>You install [C] in [src].</span>")
	update_icon(TRUE, user)
	return TRUE


/obj/item/gun/energy/attack_hand(mob/user)
	if(!can_unload) //Only relevant for energy guns that can unload their cell
		return ..()
	if(can_charge && loc == user && user.is_holding(src) && cartridge)
		eject_cartridge(user)
		return
	return ..()


/obj/item/gun/energy/attackby(obj/item/W, mob/user, params)
	if(!can_charge || !can_unload)
		return ..()

	if(istype(W, /obj/item/cell_cartridge))
		var/obj/item/cell_cartridge/C
		C = W
		var/obj/item/stock_parts/cell/power_cell
		power_cell = C.cell

		if(power_cell)
			if(power_cell.self_recharge && !self_charge_allowed)
				to_chat(user, "<span class='warning'>[src] cannot accept self-recharging cells.</span>")
				return

			if(power_cell.maxcharge > max_accept) //Check that we're not trying to install anything crazy like a bluespace/quantum battery or whatever.
				to_chat(user, "<span class='warning'>[src] cannot accept cells with a higher capacity than [max_accept].</span>")
				return

		if(cartridge && C) //Where we remove the cell.
			eject_cartridge(user, TRUE, TRUE) //Remove the cell, then replace it.

		if(!cartridge && C)
			load_cartridge(C, user)

	else
		return ..()


/obj/item/gun/energy/proc/cell_cartridge_gun_initialize()
	if(uses_cartridge)
		cartridge = new cartridge_type
		if(cell_type && !cartridge.cell)
			cartridge.cell = new cell_type(src)

		else
			cartridge.cell = new(src)
		cell = cartridge.cell
		return TRUE

	return FALSE


/obj/machinery/recharger/proc/fulp_recharger_charge_check()
	var/message = ""
	var/obj/item/stock_parts/cell/C = charging.get_cell()
	if(istype(charging, /obj/item/gun/energy))
		var/obj/item/gun/energy/E = charging
		if(E.cartridge)
			C = E.cartridge.get_cell() //If the gun uses a power cell cartridge, get the cartridge

	if(C)
		return message = "<span class='notice'>- \The [charging]'s cell is at <b>[C.percent()]%</b>.</span>"

	else
		return message = "<span class='notice'>- \The [charging] has no cell loaded.</b>.</span>"

	return
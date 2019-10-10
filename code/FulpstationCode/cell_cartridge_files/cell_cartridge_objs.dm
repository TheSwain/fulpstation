
/obj/item/gun/energy/examine(mob/user)
	. = ..()
	var/obj/item/stock_parts/cell/C
	var/obj/item/ammo_casing/energy/shot = ammo_type[select]
	var/shots_remaining = 0
	if(cell)
		C = cell
		. += "It has a cell loaded."

	else if(cartridge)
		. += "It has a cartridge loaded."
		if(cartridge.cell)
			C = cartridge.cell

	else
		. += "It has no cell or cartridge loaded."

	if(C)
		shots_remaining = round(C.charge / max(1, shot.e_cost))

	. += "The meter reads <b>[shots_remaining] shots remaining</b>."

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


/obj/item/gun/energy/proc/fulp_update_icon(force_update, mob/user)
	var/charge = 0
	var/maxcharge = 1
	if(cell)
		charge = cell.charge
		maxcharge = cell.maxcharge
	var/ratio = CEILING(CLAMP(charge / maxcharge, 0, 1) * charge_sections, 1)
	if(ratio == old_ratio && !force_update)
		return
	old_ratio = ratio
	cut_overlays()
	var/obj/item/ammo_casing/energy/shot = ammo_type[select]
	var/iconState = "[icon_state]_charge"
	var/itemState = null
	if(!initial(item_state))
		itemState = icon_state
	if (modifystate)
		add_overlay("[icon_state]_[shot.select_name]")
		iconState += "_[shot.select_name]"
		if(itemState)
			itemState += "[shot.select_name]"
	if(charge < shot.e_cost)
		add_overlay("[icon_state]_empty")
	else
		if(!shaded_charge)
			var/mutable_appearance/charge_overlay = mutable_appearance(icon, iconState)
			for(var/i = ratio, i >= 1, i--)
				charge_overlay.pixel_x = ammo_x_offset * (i - 1)
				charge_overlay.pixel_y = ammo_y_offset * (i - 1)
				add_overlay(charge_overlay)
		else
			add_overlay("[icon_state]_charge[ratio]")
	if(itemState)
		itemState += "[ratio]"
		item_state = itemState
	if(user)
		user.update_inv_hands()

/obj/item/gun/energy/proc/fulp_egun_alarm()
	if (!alarmed && empty_alarm)
		playsound(src, empty_alarm_sound, empty_alarm_volume, empty_alarm_vary)
		alarmed = TRUE
		update_icon()

/obj/item/gun/energy/proc/fulp_egun_suicide_ecost(obj/item/ammo_casing/energy/shot)
	if(cartridge)
		cartridge.cell.use(shot.e_cost)
	else
		cell.use(shot.e_cost)



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


/obj/machinery/recharger/proc/fulp_recharger_gun_cartridge_check(mob/user, obj/item/gun/energy/E)
	if(E.cartridge)
		var/obj/item/cell_cartridge/EC = E.cartridge
		if(!EC.can_charge)
			to_chat(user, "<span class='notice'>Your [E]'s [EC] has no external power connector.</span>")
			return FALSE
		if(!EC.cell)
			to_chat(user, "<span class='notice'>Your [E]'s [EC] has no power cell loaded.</span>")
			return FALSE
	if(!E.can_charge)
		to_chat(user, "<span class='notice'>Your [E] has no external power connector.</span>")
		return FALSE

	return TRUE

/obj/machinery/recharger/proc/fulp_recharger_cell_cartridge_check(mob/user, obj/item/G)
	if (istype(G, /obj/item/cell_cartridge))
		var/obj/item/cell_cartridge/CC = G
		if(!CC.can_charge)
			to_chat(user, "<span class='notice'>Your [G] has no external power connector.</span>")
			return FALSE
		if(!CC.cell)
			to_chat(user, "<span class='notice'>Your [G] has no power cell loaded.</span>")
			return FALSE

	return TRUE

/obj/machinery/recharger/proc/fulp_recharger_emp_act(severity)
	if(istype(charging,  /obj/item/gun/energy))
		var/obj/item/gun/energy/E = charging
		if(E.cell)
			E.cell.emp_act(severity)

	else if(istype(charging, /obj/item/melee/baton))
		var/obj/item/melee/baton/B = charging
		if(B.cell)
			B.cell.charge = 0

	else if(istype(charging, /obj/item/cell_cartridge))
		var/obj/item/cell_cartridge/C = charging
		if(C.cell)
			C.cell.charge = 0


/obj/machinery/recharger/proc/fulp_process(using_power)
	var/obj/item/stock_parts/cell/C
	C = charging.get_cell()
	if(istype(charging, /obj/item/gun/energy))
		var/obj/item/gun/energy/E = charging
		if(E.cartridge)
			C = E.cartridge.get_cell() //If the gun uses a power cell cartridge, get the cartridge

	if(C)
		if(C.charge < C.maxcharge)
			C.give(C.chargerate * recharge_coeff)
			use_power(250 * recharge_coeff)
			using_power = 1
		update_icon(using_power)

	if(istype(charging, /obj/item/ammo_box/magazine/recharge))
		var/obj/item/ammo_box/magazine/recharge/R = charging
		if(R.stored_ammo.len < R.max_ammo)
			R.stored_ammo += new R.ammo_type(R)
			use_power(200 * recharge_coeff)
			using_power = 1
		update_icon(using_power)
		return


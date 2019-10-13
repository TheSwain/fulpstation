/obj/machinery/recharger
	name = "recharger"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "recharger0"
	desc = "A charging dock for energy based weaponry."
	use_power = IDLE_POWER_USE
	idle_power_usage = 4
	active_power_usage = 250
	circuit = /obj/item/circuitboard/machine/recharger
	pass_flags = PASSTABLE
	var/obj/item/charging = null
	var/recharge_coeff = 1

	var/static/list/allowed_devices = typecacheof(list(
		/obj/item/gun/energy,
		/obj/item/melee/baton,
		/obj/item/ammo_box/magazine/recharge,
		/obj/item/cell_cartridge, ///FULP, Cell Cartridge PR - Surrealistik Oct 2019
		/obj/item/modular_computer))

/obj/machinery/recharger/RefreshParts()
	for(var/obj/item/stock_parts/capacitor/C in component_parts)
		recharge_coeff = C.rating

/obj/machinery/recharger/examine(mob/user)
	. = ..()
	if(!in_range(user, src) && !issilicon(user) && !isobserver(user))
		. += "<span class='warning'>You're too far away to examine [src]'s contents and display!</span>"
		return

	if(charging)
		. += {"<span class='notice'>\The [src] contains:</span>
		<span class='notice'>- \A [charging].</span>"}

	if(!(stat & (NOPOWER|BROKEN)))
		. += "<span class='notice'>The status display reads:</span>"
		. += "<span class='notice'>- Recharging <b>[recharge_coeff*10]%</b> cell charge per cycle.</span>"
		if(charging)
			. += fulp_recharger_charge_check() ///FULP, Cell Cartridge PR - Surrealistik Oct 2019


/obj/machinery/recharger/proc/setCharging(new_charging)
	charging = new_charging
	if (new_charging)
		START_PROCESSING(SSmachines, src)
		use_power = ACTIVE_POWER_USE
		update_icon(scan = TRUE)
	else
		use_power = IDLE_POWER_USE
		update_icon()

/obj/machinery/recharger/attackby(obj/item/G, mob/user, params)
	if(G.tool_behaviour == TOOL_WRENCH)
		if(charging)
			to_chat(user, "<span class='notice'>Remove the charging item first!</span>")
			return
		setAnchored(!anchored)
		power_change()
		to_chat(user, "<span class='notice'>You [anchored ? "attached" : "detached"] [src].</span>")
		G.play_tool_sound(src)
		return

	var/allowed = is_type_in_typecache(G, allowed_devices)

	if(allowed)
		if(anchored)
			if(charging || panel_open)
				return 1

			//Checks to make sure he's not in space doing it, and that the area got proper power.
			var/area/a = get_area(src)
			if(!isarea(a) || a.power_equip == 0)
				to_chat(user, "<span class='notice'>[src] blinks red as you try to insert [G].</span>")
				return 1

			if (istype(G, /obj/item/gun/energy))
				var/obj/item/gun/energy/E = G
				if(!fulp_recharger_gun_cartridge_check(user, E))  ///FULP, Cell Cartridge PR - Surrealistik Oct 2019
					return 1

			if(!fulp_recharger_cell_cartridge_check(user, G))  ///FULP, Cell Cartridge PR - Surrealistik Oct 2019
				return 1

			if(!user.transferItemToLoc(G, src))
				return 1
			setCharging(G)

		else
			to_chat(user, "<span class='notice'>[src] isn't connected to anything!</span>")
		return 1

	if(anchored && !charging)
		if(default_deconstruction_screwdriver(user, "rechargeropen", "recharger0", G))
			return

		if(panel_open && G.tool_behaviour == TOOL_CROWBAR)
			default_deconstruction_crowbar(G)
			return

	return ..()

/obj/machinery/recharger/attack_hand(mob/user)
	. = ..()
	if(.)
		return

	add_fingerprint(user)
	if(charging)
		charging.update_icon()
		charging.forceMove(drop_location())
		user.put_in_hands(charging)
		setCharging(null)

/obj/machinery/recharger/attack_tk(mob/user)
	if(charging)
		charging.update_icon()
		charging.forceMove(drop_location())
		setCharging(null)

/obj/machinery/recharger/process()
	if(stat & (NOPOWER|BROKEN) || !anchored)
		return PROCESS_KILL

	var/using_power = 0
	if(charging)
		fulp_process(using_power) ///FULP, Cell Cartridge PR - Surrealistik Oct 2019

	else
		return PROCESS_KILL

/obj/machinery/recharger/emp_act(severity)
	. = ..()
	if (. & EMP_PROTECT_CONTENTS)
		return
	if(!(stat & (NOPOWER|BROKEN)) && anchored)
		fulp_recharger_emp_act(severity) ///FULP, Cell Cartridge PR - Surrealistik Oct 2019


/obj/machinery/recharger/update_icon(using_power = 0, scan)	//we have an update_icon() in addition to the stuff in process to make it feel a tiny bit snappier.
	if(stat & (NOPOWER|BROKEN) || !anchored)
		icon_state = "rechargeroff"
		return
	if(scan)
		icon_state = "rechargeroff"
		return
	if(panel_open)
		icon_state = "rechargeropen"
		return
	if(charging)
		if(using_power)
			icon_state = "recharger1"
		else
			icon_state = "recharger2"
		return
	icon_state = "recharger0"

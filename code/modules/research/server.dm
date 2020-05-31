/**
 * R&D Research Point Hardware
 *
 * These machines are responsible for the passive creation of research points.
 * Servers consume energy and produce heat. Hot machines have reduced effeciency.
 * Multiple servers help, but only one block can be mined at a time. The Birthday Paradox implies diminishing returns.
 */
/obj/machinery/rnd/server
	name = "\improper R&D Server"
	desc = "A computer system running a deep neural network that processes arbitrary information to produce data useable in the development of new technologies. In layman's terms, it makes research points."
	icon = 'icons/obj/machines/research.dmi'
	icon_state = "RD-server-on"
	req_access = list(ACCESS_RD)
	var/datum/techweb/stored_research
	// Point mining
	var/working = TRUE
	var/research_disabled = FALSE
	var/server_id = 0
	var/total_mining_income = 0
	var/part_efficiency = 1 // Bonus from higher parts.
	var/pool_efficiency = 1 // Updated by the Research controller.
	var/department_pool = TECHWEB_POINT_TYPE_GENERIC
	// Heat Management
	var/current_temp = T20C
	var/temp_per_cycle = 10 // n degC per second
	var/temp_tolerance_low = T0C
	var/temp_tolerance_high = T0C + 60 // 60C, maximum comfortable temperature before effeciency loss
	var/temp_tolerance_max = T0C + 100 // 100C, maximum temperature before the RD server shuts itself off
	var/temp_penalty_coefficient = 0.025 // Reduces effeciency by n% per degree Celsius over temp_tolerance_high
	// Antagonist Fun
	var/total_syndicate_income = 0
	var/malf_ai_slave = FALSE
	// Communication
	var/obj/item/radio/radio
	var/radio_key = /obj/item/encryptionkey/headset_sci
	var/science_channel = RADIO_CHANNEL_SCIENCE
	var/syndicate_channel = RADIO_CHANNEL_SYNDICATE

/obj/machinery/rnd/server/Initialize()
	. = ..()
	name += " [num2hex(rand(1,65535), -1)]" //gives us a random four-digit hex number as part of the name. Y'know, for fluff.
	SSresearch.servers |= src
	stored_research = SSresearch.science_tech
	var/obj/item/circuitboard/machine/B = new /obj/item/circuitboard/machine/rdserver(null)
	B.apply_default_parts(src)
	// default temp is turf
	var/turf/L = loc
	if(isturf(L))
		current_temp = L.temperature
	// radio
	radio = new(src)
	radio.keyslot = new radio_key
	radio.listening = 0
	radio.recalculateChannels()

/obj/machinery/rnd/server/Destroy()
	SSresearch.servers -= src
	return ..()

/obj/machinery/rnd/server/RefreshParts()
	// 3% effeciency per capcaitor per tier after 1, so 16% at T5
	part_efficiency = 1
	for(var/obj/item/stock_parts/capacitor/C in src)
		part_efficiency += (C.rating - 1) * 0.03
	// -2C heat per laser tier after 1, so 2C total at T5
	temp_per_cycle = 10
	for(var/obj/item/stock_parts/micro_laser/ML in src)
		temp_per_cycle -= (ML.rating - 1) * 2
	temp_per_cycle = max(temp_per_cycle, 0) // just in case we get more ridiculous parts


/obj/machinery/rnd/server/update_icon_state()
	if(machine_stat & EMPED || machine_stat & NOPOWER)
		icon_state = "RD-server-off"
	else if(research_disabled)
		icon_state = "RD-server-halt"
	else
		icon_state = "RD-server-on"

/obj/machinery/rnd/server/power_change()
	. = ..()
	refresh_working()
	return

/obj/machinery/rnd/server/proc/refresh_working()
	if(machine_stat & EMPED || research_disabled || machine_stat & NOPOWER)
		working = FALSE
	else
		working = TRUE
	update_icon()

/obj/machinery/rnd/server/proc/mine(base_income, base_effeciency)
	var/penalty = get_temp_effeciency()
	var/income = base_income * base_effeciency * part_efficiency * penalty
	. = list()
	.[department_pool] = income
	produce_heat()

/obj/machinery/rnd/server/proc/get_department_name()
	if(machine_stat & EMAGGED)
		return "UNKNOWN"
	return SSresearch.point_types[department_pool];

/obj/machinery/rnd/server/emag_act(mob/user)
	if(machine_stat & EMAGGED)
		return
	machine_stat |= EMAGGED
	playsound(src, "sparks", 75, TRUE)
	to_chat(user, "<span class='notice'>The [name] is now slaved to Syndicate research posts.</span>")

/obj/machinery/rnd/server/emp_act()
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	machine_stat |= EMPED
	addtimer(CALLBACK(src, .proc/unemp), 600)
	refresh_working()

/obj/machinery/rnd/server/proc/unemp()
	machine_stat &= ~EMPED
	refresh_working()

/obj/machinery/rnd/server/proc/toggle_disable()
	research_disabled = !research_disabled
	refresh_working()

/obj/machinery/rnd/server/proc/change_department()
	if(machine_stat & EMAGGED) // Emagged RD servers have to be broken down and rebuilt.
		return
	switch(department_pool)
		if(TECHWEB_POINT_TYPE_GENERIC)
			department_pool = TECHWEB_POINT_TYPE_SECURITY
		if(TECHWEB_POINT_TYPE_SECURITY)
			department_pool = TECHWEB_POINT_TYPE_MEDICAL
		if(TECHWEB_POINT_TYPE_MEDICAL)
			department_pool = TECHWEB_POINT_TYPE_SCIENCE
		if(TECHWEB_POINT_TYPE_SCIENCE)
			department_pool = TECHWEB_POINT_TYPE_ENGINEERING
		if(TECHWEB_POINT_TYPE_ENGINEERING)
			department_pool = TECHWEB_POINT_TYPE_SERVICE
		else
			department_pool = TECHWEB_POINT_TYPE_GENERIC
	refresh_working()

/obj/machinery/rnd/server/proc/get_temp_color()
	var/green = 1;
	var/red = 1;
	var/overheat = max((current_temp - temp_tolerance_high), 0)
	if(overheat > 0)
		green = 1 - (overheat * temp_penalty_coefficient)
	else
		var/underheat = max((current_temp - temp_tolerance_low), 0)
		red = underheat / (temp_tolerance_high - temp_tolerance_low)
	red *= 255
	green *= 255
	return "rgb([red],[green],0)"

/obj/machinery/rnd/server/proc/get_temp_effeciency()
	return 1 - (max((current_temp - temp_tolerance_high), 0) * temp_penalty_coefficient)

/obj/machinery/rnd/server/proc/produce_heat()
	if(machine_stat & (NOPOWER|BROKEN) || !working)
		return PROCESS_KILL
	var/turf/L = loc
	if(!isturf(L))
		return
	var/datum/gas_mixture/env = L.return_air()
	// The RD Server will crease 1degC of heat in a normal atmosphere of moles.
	// 0.5 if turf is twice as dense as normal, 2 if twice as thin
	var/heatFactor = max(MOLES_CELLSTANDARD / env.total_moles(), 0)
	// Adjust external temperature by cycle energy and mole heat factor
	env.temperature += temp_per_cycle * heatFactor
	// If our air is hotter than the CPU, we bump the CPU's internal temperature as well.
	if (env.temperature > current_temp + temp_per_cycle)
		current_temp += temp_per_cycle
	// If our air is cooler than the CPU, we drop the CPU's internal temperature.
	else if (env.temperature < current_temp - temp_per_cycle)
		current_temp = max(current_temp - temp_per_cycle, temp_tolerance_low) // we never run cooler than freezing.
	air_update_turf()
	if(current_temp > temp_tolerance_max)
		radio.talk_into(src, "Terminating research work due to unsafe processor temperatures.", science_channel, language = get_selected_language())
		research_disabled = TRUE
		refresh_working()
		return

/proc/fix_noid_research_servers()
	var/list/no_id_servers = list()
	var/list/server_ids = list()
	for(var/obj/machinery/rnd/server/S in GLOB.machines)
		switch(S.server_id)
			if(-1)
				continue
			if(0)
				no_id_servers += S
			else
				server_ids += S.server_id

	for(var/obj/machinery/rnd/server/S in no_id_servers)
		var/num = 1
		while(!S.server_id)
			if(num in server_ids)
				num++
			else
				S.server_id = num
				server_ids += num
		no_id_servers -= S


/obj/machinery/computer/rdservercontrol
	name = "R&D Server Controller"
	desc = "Used to manage access to research and manufacturing databases."
	icon_screen = "rdcomp"
	icon_keyboard = "rd_key"
	var/screen = 0
	var/obj/machinery/rnd/server/temp_server
	var/list/servers = list()
	var/list/consoles = list()
	req_access = list(ACCESS_RD)
	var/badmin = 0
	circuit = /obj/item/circuitboard/computer/rdservercontrol

/obj/machinery/computer/rdservercontrol/Topic(href, href_list)
	if(..())
		return

	var/emagged = obj_flags & EMAGGED

	add_fingerprint(usr)
	if(!allowed(usr) && !emagged)
		to_chat(usr, "<span class='danger'>Access Denied.</span>")
		return

	if(href_list["server"])
		var/obj/machinery/rnd/server/S = locate(href_list["server"]) in SSresearch.servers
		if(href_list["toggle"])
			S.toggle_disable()
		else if(href_list["department"])
			S.change_department()
	else if(href_list["access"])
		switch(href_list["access"])
			if("rd")
				SSresearch.techweb_access = list(ACCESS_RD)
			if("command")
				SSresearch.techweb_access = list(ACCESS_RD, ACCESS_HEADS)
			if("science")
				SSresearch.techweb_access = list(ACCESS_RD, ACCESS_HEADS, ACCESS_TOX)
			else
				SSresearch.techweb_access = list()

	if(!issilicon(usr))
		playsound(src, "terminal_type", 50, FALSE)
	updateUsrDialog()
	return

/obj/machinery/computer/rdservercontrol/ui_interact(mob/user)
	. = ..()
	var/list/dat = list()

	dat += "<h2>Research &amp; Development Console Access</h2>"
	dat += "<a href='?src=[REF(src)];access=rd' style='color:[(ACCESS_RD in SSresearch.techweb_access)==1?"red":"white"];'>Research Director</a>"
	dat += "<a href='?src=[REF(src)];access=command' style='color:[(ACCESS_HEADS in SSresearch.techweb_access)==1?"red":"white"];'>Command Staff</a>"
	dat += "<a href='?src=[REF(src)];access=science' style='color:[(ACCESS_TOX in SSresearch.techweb_access)==1?"red":"white"];'>Science Department</a>"
	dat += "<a href='?src=[REF(src)];access=public' style='color:[SSresearch.techweb_access.len==0?"red":"white"];'>Public Access</a>"

	dat += "<h2>Connected Servers</h2>"
	dat += "<table style='width:100%;'>"
	dat += "<thead><tr>"
	dat += "<th style='width:auto;text-align:left;'>Server</th>"
	dat += "<th style='width:auto;text-align:left;'>Room</th>"
	dat += "<th style='width:120px;text-align:left;'>Operating Temp</th>"
	dat += "<th style='width:80px;text-align:left;'>Effeciency</th>"
	dat += "<th style='width:100px;text-align:left;'>Total Points</th>"
	dat += "<th style='width:160px;text-align:left;'>Department</th>"
	dat += "<th style='width:80px;text-align:left;'>Status</th>"
	dat += "</tr></thead><tbody>"
	for(var/obj/machinery/rnd/server/S in GLOB.machines)
		var/area/A = get_area(S)
		dat += "<tr>"
		dat += "<td style='font-weight: bold;'>[S.name]</td>"
		dat += "<td>[A.name]</td>"
		dat += "<td style='color: [S.get_temp_color()]'>[S.current_temp]°K</td>"
		dat += "<td>[round(S.pool_efficiency * 100)]%</td>"
		dat += "<td>[round(S.total_mining_income)]</td>"
		dat += "<td><a href='?src=[REF(src)];server=[REF(S)];department=1'>"
		if (obj_flags & EMAGGED)
			dat += "<span class='syndradio'>[S.get_department_name()]</span>"
		else
			dat += "<span class='[SSresearch.get_point_css_class(S.department_pool)]'>[S.get_department_name()]</span>"
		dat += "</a></td>"
		dat += "<td>"
		if(S.machine_stat & EMPED || S.machine_stat & NOPOWER)
			dat += "Offline"
		else
			dat += "<a href='?src=[REF(src)];server=[REF(S)];toggle=1'>("
			if (S.research_disabled)
				dat += "<span style='color:red;'>Disabled</span>"
			else
				dat += "<span style='color:lightgreen;'>Online</span>"
			dat += ")</a>"
		dat += "</td>"
		dat += "</tr>"
	dat += "</tbody></table></br>"

	dat += "<h2>Research Log</h2>"
	var/datum/techweb/stored_research
	stored_research = SSresearch.science_tech
	if(stored_research.research_logs.len)
		dat += "<table BORDER=\"1\">"
		dat += "<tr><td><b>Entry</b></td><td><b>Research Name</b></td><td><b>Cost</b></td><td><b>Researcher Name</b></td><td><b>Console Location</b></td></tr>"
		for(var/i=stored_research.research_logs.len, i>0, i--)
			dat += "<tr><td>[i]</td>"
			for(var/j in stored_research.research_logs[i])
				dat += "<td>[j]</td>"
			dat +="</tr>"
		dat += "</table>"

	else
		dat += "</br>No history found."

	var/datum/browser/popup = new(user, "server_com", src.name, 900, 620)
	popup.set_content(dat.Join())
	popup.set_title_image(user.browse_rsc_icon(src.icon, src.icon_state))
	popup.open()

/obj/machinery/computer/rdservercontrol/attackby(obj/item/D, mob/user, params)
	. = ..()
	src.updateUsrDialog()

/obj/machinery/computer/rdservercontrol/emag_act(mob/user)
	if(obj_flags & EMAGGED)
		return
	playsound(src, "sparks", 75, TRUE)
	obj_flags |= EMAGGED
	to_chat(user, "<span class='notice'>You disable the security protocols.</span>")

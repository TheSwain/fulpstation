/proc/count_unique_techweb_nodes()
	var/static/list/L = typesof(/datum/techweb_node)
	return L.len

/proc/count_unique_techweb_designs()
	var/static/list/L = typesof(/datum/design)
	return L.len

/proc/node_boost_error(id, message)
	WARNING("Invalid boost information for node \[[id]\]: [message]")
	SSresearch.invalid_node_boost[id] = message

/proc/techweb_item_boost_check(obj/item/I)			//Returns an associative list of techweb node datums with values of the boost it gives.	var/list/returned = list()
	if(SSresearch.techweb_boost_items[I.type])
		return SSresearch.techweb_boost_items[I.type]		//It should already be formatted in node datum = list(point type = value)

/proc/techweb_item_point_check(obj/item/I)
	if(SSresearch.techweb_point_items[I.type])
		return SSresearch.techweb_point_items[I.type]

/proc/techweb_point_display_generic(pointlist)
	var/list/ret = list()
	for(var/i in pointlist)
		if(SSresearch.point_types[i])
			ret += "[SSresearch.point_types[i]]: [pointlist[i]]"
		else
			ret += "ERRORED POINT TYPE: [pointlist[i]]"
	return ret.Join("<br/>")

/proc/techweb_point_display_rdconsole(pointlist, last_pointlist)
	var/list/ret = list()
	for(var/i in pointlist)
		var/research_line = "[SSresearch.point_types[i] || "ERRORED POINT TYPE"]: [pointlist[i]]"
		if(last_pointlist[i] > 0)
			research_line += " (+[(last_pointlist[i]) * ((SSresearch.flags & SS_TICKER)? (600 / (world.tick_lag * SSresearch.wait)) : (600 / SSresearch.wait))]/ minute)"
		ret += "<span style='color: [techweb_department_color(SSresearch.point_types[i])]'>" + research_line + "</span>"
	return ret.Join(", ")

/proc/techweb_department_color(pointtype)
	switch(pointtype)
		if(TECHWEB_POINT_TYPE_GENERIC)
			return "#FFFFFF"
		if(TECHWEB_POINT_TYPE_SECURITY)
			return JOB_COLOR_SECURITY
		if(TECHWEB_POINT_TYPE_MEDICAL)
			return JOB_COLOR_MEDICAL
		if(TECHWEB_POINT_TYPE_SUPPLY)
			return JOB_COLOR_SUPPLY
		if(TECHWEB_POINT_TYPE_SCIENCE)
			return JOB_COLOR_SCIENCE
		if(TECHWEB_POINT_TYPE_ENGINEERING)
			return JOB_COLOR_ENGINEERING
		if(TECHWEB_POINT_TYPE_SERVICE)
			return JOB_COLOR_SERVICE
		else
			return COLOR_WHITE

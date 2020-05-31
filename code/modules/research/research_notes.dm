/**
 * Research notes are the byproduct of active research that can be redeemed at the R&D Console for spendable research points.
 */
/obj/item/research_notes
	name = "research notes"
	desc = "Valuable scientific data. Use it in a research console to scan it."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "paper"
	item_state = "paper"
	w_class = WEIGHT_CLASS_SMALL
	// List of research points the notes have.
	var/list/points = list() // SEE: research.dm constants
	var/value = 0
	// Origin of the research. For flavor and point bonuses when merging.
	var/origin_type = "debug"
	// If it was merged with different origins to apply a bonus
	var/origin_mixed = FALSE

/obj/item/research_notes/Initialize(mapload, _points, _origin_type)
	. = ..()
	if(_points)
		points = _points
		for(var/i in points)
			value += points[i]
	if(_origin_type)
		origin_type = _origin_type
	change_vol()

/obj/item/research_notes/examine(mob/user)
	. = ..()
	. += "<span class='notice'>It is worth [value] research points.</span>"

/// proc that changes name and icon depending on value
/obj/item/research_notes/proc/change_vol()
	if(value >= 10000)
		name = "revolutionary discovery in the field of [origin_type]"
		icon_state = "docs_verified"
		return
	else if(value >= 2500)
		name = "essay about [origin_type]"
		icon_state = "paper_words"
		return
	else if(value >= 100)
		name = "notes of [origin_type]"
		icon_state = "paperslip_words"
		return
	else
		name = "fragmentary data of [origin_type]"
		icon_state = "scrap"
		return

/// proc when you slap research notes into another one, it applies a bonus if they are of different origin (only applied once)
/obj/item/research_notes/proc/merge(obj/item/research_notes/new_paper)
	var/bonus = 1
	if(origin_type != new_paper.origin_type && !origin_mixed)
		origin_type = "[origin_type] and [new_paper.origin_type]"
		origin_mixed = TRUE
		bonus = 1.3
	value = 0
	for(var/i in new_paper.points)
		if (points[i])
			points[i] += new_paper.points[i] * bonus
		else
			points[i] = new_paper.points[i] * bonus
		value += points[i];
	change_vol()
	qdel(new_paper)

/obj/item/research_notes/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(istype(I, /obj/item/research_notes))
		var/obj/item/research_notes/R = I
		merge(R)
		return TRUE

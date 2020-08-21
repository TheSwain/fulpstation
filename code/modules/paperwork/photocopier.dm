<<<<<<< HEAD

/// For use with the `color_mode` var. Photos will be printed in greyscale while the var has this value.
#define PHOTO_GREYSCALE	"Greyscale"
/// For use with the `color_mode` var. Photos will be printed in full color while the var has this value.
#define PHOTO_COLOR		"Color"

/// How much toner is used for making a copy of a paper.
#define PAPER_TONER_USE		0.125
/// How much toner is used for making a copy of a photo.
#define PHOTO_TONER_USE		0.625
/// How much toner is used for making a copy of a document.
#define DOCUMENT_TONER_USE	0.75
/// How much toner is used for making a copy of an ass.
#define ASS_TONER_USE		0.625
/// The maximum amount of copies you can make with one press of the copy button.
#define MAX_COPIES_AT_ONCE	10

=======
/*	Photocopiers!
 *	Contains:
 *		Photocopier
 *		Toner Cartridge
 */

/*
 * Photocopier
 */
>>>>>>> fulpmaster
/obj/machinery/photocopier
	name = "photocopier"
	desc = "Used to copy important documents and anatomy studies."
	icon = 'icons/obj/library.dmi'
	icon_state = "photocopier"
	density = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 30
	active_power_usage = 200
	power_channel = AREA_USAGE_EQUIP
	max_integrity = 300
	integrity_failure = 0.33
<<<<<<< HEAD
	/// A reference to an `/obj/item/paper` inside the copier, if one is inserted. Otherwise null.
	var/obj/item/paper/paper_copy
	/// A reference to an `/obj/item/photo` inside the copier, if one is inserted. Otherwise null.
	var/obj/item/photo/photo_copy
	/// A reference to an `/obj/item/documents` inside the copier, if one is inserted. Otherwise null.
	var/obj/item/documents/document_copy
	/// A reference to a mob on top of the photocopier trying to copy their ass. Null if there is no mob.
	var/mob/living/ass
	/// A reference to the toner cartridge that's inserted into the copier. Null if there is no cartridge.
	var/obj/item/toner/toner_cartridge
	/// How many copies will be printed with one click of the "copy" button.
	var/num_copies = 1
	/// Used with photos. Determines if the copied photo will be in greyscale or color.
	var/color_mode = PHOTO_COLOR
	/// Indicates whether the printer is currently busy copying or not.
=======
	var/obj/item/paper/copy = null	//what's in the copier!
	var/obj/item/photo/photocopy = null
	var/obj/item/documents/doccopy = null
	var/copies = 1	//how many copies to print!
	var/toner = 40 //how much toner is left! woooooo~
	var/maxcopies = 10	//how many copies can be copied at once- idea shamelessly stolen from bs12's copier!
	var/greytoggle = "Greyscale"
	var/mob/living/ass //i can't believe i didn't write a stupid-ass comment about this var when i first coded asscopy.
>>>>>>> fulpmaster
	var/busy = FALSE

/obj/machinery/photocopier/Initialize()
	. = ..()
	AddComponent(/datum/component/payment, 5, SSeconomy.get_dep_account(ACCOUNT_CIV), PAYMENT_CLINICAL)
<<<<<<< HEAD
	toner_cartridge = new(src)

/obj/machinery/photocopier/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Photocopier")
		ui.open()

/obj/machinery/photocopier/ui_data(mob/user)
	var/list/data = list()
	data["has_item"] = !copier_empty()
	data["num_copies"] = num_copies

	if(photo_copy)
		data["is_photo"] = TRUE
		data["color_mode"] = color_mode

	if(isAI(user))
		data["isAI"] = TRUE
		data["can_AI_print"] = toner_cartridge ? toner_cartridge.charges >= PHOTO_TONER_USE : FALSE
	else
		data["isAI"] = FALSE

	if(toner_cartridge)
		data["has_toner"] = TRUE
		data["current_toner"] = toner_cartridge.charges
		data["max_toner"] = toner_cartridge.max_charges
		data["has_enough_toner"] = has_enough_toner()
	else
		data["has_toner"] = FALSE
		data["has_enough_toner"] = FALSE

	return data

/obj/machinery/photocopier/ui_act(action, list/params)
	if(..())
		return

	switch(action)
		// Copying paper, photos, documents and asses.
		if("make_copy")
			if(busy)
				to_chat(usr, "<span class='warning'>[src] is currently busy copying something. Please wait until it is finished.</span>")
				return FALSE
			if(paper_copy)
				if(!length(paper_copy.info))
					to_chat(usr, "<span class='warning'>An error message flashes across [src]'s screen: \"The supplied paper is blank. Aborting.\"</span>")
					return FALSE
				// Basic paper
				if(istype(paper_copy, /obj/item/paper))
					do_copy_loop(CALLBACK(src, .proc/make_paper_copy), usr)
					return TRUE
				// Devil contract paper.
				if(istype(paper_copy, /obj/item/paper/contract/employment))
					do_copy_loop(CALLBACK(src, .proc/make_devil_paper_copy), usr)
					return TRUE
			// Copying photo.
			if(photo_copy)
				do_copy_loop(CALLBACK(src, .proc/make_photo_copy), usr)
				return TRUE
			// Copying Documents.
			if(document_copy)
				do_copy_loop(CALLBACK(src, .proc/make_document_copy), usr)
				return TRUE
			// ASS COPY. By Miauw
			if(ass)
				do_copy_loop(CALLBACK(src, .proc/make_ass_copy), usr)
				return TRUE

		// Remove the paper/photo/document from the photocopier.
		if("remove")
			if(paper_copy)
				remove_photocopy(paper_copy, usr)
				paper_copy = null
			else if(photo_copy)
				remove_photocopy(photo_copy, usr)
				photo_copy = null
			else if(document_copy)
				remove_photocopy(document_copy, usr)
				document_copy = null
			else if(check_ass())
				to_chat(ass, "<span class='notice'>You feel a slight pressure on your ass.</span>")
			return TRUE

		// AI printing photos from their saved images.
		if("ai_photo")
			if(busy)
				to_chat(usr, "<span class='warning'>[src] is currently busy copying something. Please wait until it is finished.</span>")
				return FALSE
			var/mob/living/silicon/ai/tempAI = usr
			if(!length(tempAI.aicamera.stored))
				to_chat(usr, "<span class='boldannounce'>No images saved.</span>")
				return
			var/datum/picture/selection = tempAI.aicamera.selectpicture(usr)
			var/obj/item/photo/photo = new(loc, selection) // AI prints color photos only.
			give_pixel_offset(photo)
			toner_cartridge.charges -= PHOTO_TONER_USE
			return TRUE

		// Switch between greyscale and color photos
		if("color_mode")
			if(params["mode"] in list(PHOTO_GREYSCALE, PHOTO_COLOR))
				color_mode = params["mode"]
			return TRUE

		// Remove the toner cartridge from the copier.
		if("remove_toner")
			if(issilicon(usr) || (ishuman(usr) && !usr.put_in_hands(toner_cartridge)))
				toner_cartridge.forceMove(drop_location())
			toner_cartridge = null
			return TRUE

		// Set the number of copies to be printed with 1 click of the "copy" button.
		if("set_copies")
			num_copies = clamp(text2num(params["num_copies"]), 1, MAX_COPIES_AT_ONCE)
			return TRUE

/**
 * Determines if the photocopier has enough toner to create `num_copies` amount of copies of the currently inserted item.
 */
/obj/machinery/photocopier/proc/has_enough_toner()
	if(paper_copy)
		return toner_cartridge.charges >= (PAPER_TONER_USE * num_copies)
	else if(document_copy)
		return toner_cartridge.charges >= (DOCUMENT_TONER_USE * num_copies)
	else if(photo_copy)
		return toner_cartridge.charges >= (PHOTO_TONER_USE * num_copies)
	else if(ass)
		return toner_cartridge.charges >= (ASS_TONER_USE * num_copies)
	return FALSE

/**
 * Will invoke the passed in `copy_cb` callback in 1 second intervals, and charge the user 5 credits for each copy made.
 *
 * Arguments:
 * * copy_cb - a callback for which proc to call. Should only be one of the `make_x_copy()` procs, such as `make_paper_copy()`.
 * * user - the mob who clicked copy.
 */
/obj/machinery/photocopier/proc/do_copy_loop(datum/callback/copy_cb, mob/user)
	busy = TRUE
	var/i
	for(i in 1 to num_copies)
		if(attempt_charge(src, user) & COMPONENT_OBJ_CANCEL_CHARGE)
			break
		addtimer(copy_cb, i SECONDS)
	addtimer(CALLBACK(src, .proc/reset_busy), i SECONDS)

/**
 * Sets busy to `FALSE`. Created as a proc so it can be used in callbacks.
 */
/obj/machinery/photocopier/proc/reset_busy()
	busy = FALSE

/**
 * Gives items a random x and y pixel offset, between -10 and 10 for each.
 *
 * This is done that when someone prints multiple papers, we dont have them all appear to be stacked in the same exact location.
 *
 * Arguments:
 * * copied_item - The paper, document, or photo that was just spawned on top of the printer.
 */
/obj/machinery/photocopier/proc/give_pixel_offset(obj/item/copied_item)
	copied_item.pixel_x = rand(-10, 10)
	copied_item.pixel_y = rand(-10, 10)

/**
 * Handles the copying of devil contract paper. Transfers all the text, stamps and so on from the old paper, to the copy.
 *
 * Checks first if `paper_copy` exists. Since this proc is called from a timer, it's possible that it was removed.
 * Does not check if it has enough toner because devil contracts cost no toner to print.
 */
/obj/machinery/photocopier/proc/make_devil_paper_copy()
	if(!paper_copy)
		return
	var/obj/item/paper/contract/employment/E = paper_copy
	var/obj/item/paper/contract/employment/C = new(loc, E.target.current)
	give_pixel_offset(C)

/**
 * Handles the copying of paper. Transfers all the text, stamps and so on from the old paper, to the copy.
 *
 * Checks first if `paper_copy` exists. Since this proc is called from a timer, it's possible that it was removed.
 */
/obj/machinery/photocopier/proc/make_paper_copy()
	if(!paper_copy)
		return
	var/obj/item/paper/copied_paper = new(loc)
	give_pixel_offset(copied_paper)
	if(toner_cartridge.charges > 10) // Lots of toner, make it dark.
		copied_paper.info = "<font color = #101010>"
	else // No toner? shitty copies for you!
		copied_paper.info = "<font color = #808080>"

	var/copied_info = paper_copy.info
	copied_info = replacetext(copied_info, "<font face=\"[PEN_FONT]\" color=", "<font face=\"[PEN_FONT]\" nocolor=")	//state of the art techniques in action
	copied_info = replacetext(copied_info, "<font face=\"[CRAYON_FONT]\" color=", "<font face=\"[CRAYON_FONT]\" nocolor=")	//This basically just breaks the existing color tag, which we need to do because the innermost tag takes priority.
	copied_paper.info += copied_info
	copied_paper.info += "</font>"
	copied_paper.name = paper_copy.name
	copied_paper.update_icon()
	copied_paper.stamps = paper_copy.stamps
	if(paper_copy.stamped)
		copied_paper.stamped = paper_copy.stamped.Copy()
	copied_paper.copy_overlays(paper_copy, TRUE)
	toner_cartridge.charges -= PAPER_TONER_USE

/**
 * Handles the copying of photos, which can be printed in either color or greyscale.
 *
 * Checks first if `photo_copy` exists. Since this proc is called from a timer, it's possible that it was removed.
 */
/obj/machinery/photocopier/proc/make_photo_copy()
	if(!photo_copy)
		return
	var/obj/item/photo/copied_pic = new(loc, photo_copy.picture.Copy(color_mode == PHOTO_GREYSCALE ? TRUE : FALSE))
	give_pixel_offset(copied_pic)
	toner_cartridge.charges -= PHOTO_TONER_USE

/**
 * Handles the copying of documents.
 *
 * Checks first if `document_copy` exists. Since this proc is called from a timer, it's possible that it was removed.
 */
/obj/machinery/photocopier/proc/make_document_copy()
	if(!document_copy)
		return
	var/obj/item/documents/photocopy/copied_doc = new(loc, document_copy)
	give_pixel_offset(copied_doc)
	toner_cartridge.charges -= DOCUMENT_TONER_USE

/**
 * Handles the copying of an ass photo.
 *
 * Calls `check_ass()` first to make sure that `ass` exists, among other conditions. Since this proc is called from a timer, it's possible that it was removed.
 * Additionally checks that the mob has their clothes off.
 */
/obj/machinery/photocopier/proc/make_ass_copy()
	if(!check_ass())
		return
	if(ishuman(ass) && (ass.get_item_by_slot(ITEM_SLOT_ICLOTHING) || ass.get_item_by_slot(ITEM_SLOT_OCLOTHING)))
		to_chat(usr, "<span class='notice'>You feel kind of silly, copying [ass == usr ? "your" : ass][ass == usr ? "" : "\'s"] ass with [ass == usr ? "your" : "[ass.p_their()]"] clothes on.</span>" )
		return

	var/icon/temp_img
	if(isalienadult(ass) || istype(ass, /mob/living/simple_animal/hostile/alien)) //Xenos have their own asses, thanks to Pybro.
		temp_img = icon('icons/ass/assalien.png')
	else if(ishuman(ass)) //Suit checks are in check_ass
		temp_img = icon(ass.gender == FEMALE ? 'icons/ass/assfemale.png' : 'icons/ass/assmale.png')
	else if(isdrone(ass)) //Drones are hot
		temp_img = icon('icons/ass/assdrone.png')

	var/obj/item/photo/copied_ass = new /obj/item/photo(loc)
	var/datum/picture/toEmbed = new(name = "[ass]'s Ass", desc = "You see [ass]'s ass on the photo.", image = temp_img)
	give_pixel_offset(copied_ass)
	toEmbed.psize_x = 128
	toEmbed.psize_y = 128
	copied_ass.set_picture(toEmbed, TRUE, TRUE)
	toner_cartridge.charges -= ASS_TONER_USE

/**
 * Inserts the item into the copier. Called in `attackby()` after a human mob clicked on the copier with a paper, photo, or document.
 *
 * Arugments:
 * * object - the object that got inserted.
 * * user - the mob that inserted the object.
 */
/obj/machinery/photocopier/proc/do_insertion(obj/item/object, mob/user)
	object.forceMove(src)
	to_chat(user, "<span class='notice'>You insert [object] into [src].</span>")
	flick("photocopier1", src)

/**
 * Called when someone hits the "remove item" button on the copier UI.
 *
 * If the user is a silicon, it drops the object at the location of the copier. If the user is not a silicon, it tries to put the object in their hands first.
 * Sets `busy` to `FALSE` because if the inserted item is removed, the copier should halt copying.
 *
 * Arguments:
 * * object - the item we're trying to remove.
 * * user - the user removing the item.
 */
/obj/machinery/photocopier/proc/remove_photocopy(obj/item/object, mob/user)
	if(!issilicon(user)) //surprised this check didn't exist before, putting stuff in AI's hand is bad
		object.forceMove(user.loc)
		user.put_in_hands(object)
	else
		object.forceMove(drop_location())
	to_chat(user, "<span class='notice'>You take [object] out of [src]. [busy ? "The [src] comes to a halt." : ""]</span>")
=======

/obj/machinery/photocopier/ui_interact(mob/user)
	. = ..()
	var/list/dat = list("Photocopier<BR><BR>")
	if(copy || photocopy || doccopy || (ass && (ass.loc == src.loc)))
		dat += "<a href='byond://?src=[REF(src)];remove=1'>Remove Paper</a><BR>"
		if(toner)
			dat += "<a href='byond://?src=[REF(src)];copy=1'>Copy</a><BR>"
			dat += "Printing: [copies] copies."
			dat += "<a href='byond://?src=[REF(src)];min=1'>-</a> "
			dat += "<a href='byond://?src=[REF(src)];add=1'>+</a><BR><BR>"
			if(photocopy)
				dat += "Printing in <a href='byond://?src=[REF(src)];colortoggle=1'>[greytoggle]</a><BR><BR>"
	else if(toner)
		dat += "Please insert paper to copy.<BR><BR>"
	if(isAI(user))
		dat += "<a href='byond://?src=[REF(src)];aipic=1'>Print photo from database</a><BR><BR>"
	dat += "Current toner level: [toner]"
	if(!toner)
		dat +="<BR>Please insert a new toner cartridge!"
	user << browse(dat.Join(""), "window=copier")
	onclose(user, "copier")

/obj/machinery/photocopier/Topic(href, href_list)
	if(..())
		return
	if(href_list["copy"])
		if(copy)
			if(busy)
				return
			for(var/i = 0, i < copies, i++)
				if(toner > 0 && copy)
					if(attempt_charge(src, usr) & COMPONENT_OBJ_CANCEL_CHARGE)
						return
					var/copy_as_paper = 1
					if(istype(copy, /obj/item/paper/contract/employment))
						var/obj/item/paper/contract/employment/E = copy
						var/obj/item/paper/contract/employment/C = new /obj/item/paper/contract/employment (loc, E.target.current)
						if(C)
							copy_as_paper = 0
					if(copy_as_paper)
						var/obj/item/paper/c = new /obj/item/paper (loc)
						if(length(copy.info) > 0)	//Only print and add content if the copied doc has words on it
							if(toner > 10)	//lots of toner, make it dark
								c.info = "<font color = #101010>"
							else			//no toner? shitty copies for you!
								c.info = "<font color = #808080>"
							var/copied = copy.info
							copied = replacetext(copied, "<font face=\"[PEN_FONT]\" color=", "<font face=\"[PEN_FONT]\" nocolor=")	//state of the art techniques in action
							copied = replacetext(copied, "<font face=\"[CRAYON_FONT]\" color=", "<font face=\"[CRAYON_FONT]\" nocolor=")	//This basically just breaks the existing color tag, which we need to do because the innermost tag takes priority.
							c.info += copied
							c.info += "</font>"
							c.name = copy.name
							c.update_icon()
							c.stamps = copy.stamps
							if(copy.stamped)
								c.stamped = copy.stamped.Copy()
							c.copy_overlays(copy, TRUE)
							toner--
					busy = TRUE
					addtimer(CALLBACK(src, .proc/reset_busy), 1.5 SECONDS)
				else
					break
			updateUsrDialog()
		else if(photocopy)
			if(busy)
				return
			for(var/i = 0, i < copies, i++)
				if(attempt_charge(src, usr) & COMPONENT_OBJ_CANCEL_CHARGE)
					return
				if(toner >= 5 && photocopy)  //Was set to = 0, but if there was say 3 toner left and this ran, you would get -2 which would be weird for ink
					new /obj/item/photo (loc, photocopy.picture.Copy(greytoggle == "Greyscale"? TRUE : FALSE))
					busy = TRUE
					addtimer(CALLBACK(src, .proc/reset_busy), 1.5 SECONDS)
				else
					break
		else if(doccopy)
			if(busy)
				return
			for(var/i = 0, i < copies, i++)
				if(attempt_charge(src, usr) & COMPONENT_OBJ_CANCEL_CHARGE)
					return
				if(toner > 5 && doccopy)
					new /obj/item/documents/photocopy(loc, doccopy)
					toner-= 6 // the sprite shows 6 papers, yes I checked
					busy = TRUE
					addtimer(CALLBACK(src, .proc/reset_busy), 1.5 SECONDS)
				else
					break
			updateUsrDialog()
		else if(ass) //ASS COPY. By Miauw
			if(busy)
				return
			for(var/i = 0, i < copies, i++)
				if(attempt_charge(src, usr) & COMPONENT_OBJ_CANCEL_CHARGE)
					return
				var/icon/temp_img
				if(ishuman(ass) && (ass.get_item_by_slot(ITEM_SLOT_ICLOTHING) || ass.get_item_by_slot(ITEM_SLOT_OCLOTHING)))
					to_chat(usr, "<span class='notice'>You feel kind of silly, copying [ass == usr ? "your" : ass][ass == usr ? "" : "\'s"] ass with [ass == usr ? "your" : "[ass.p_their()]"] clothes on.</span>" )
					break
				else if(toner >= 5 && !busy && check_ass()) //You have to be sitting on the copier and either be a xeno or a human without clothes on.
					if(isalienadult(ass) || istype(ass, /mob/living/simple_animal/hostile/alien)) //Xenos have their own asses, thanks to Pybro.
						temp_img = icon('icons/ass/assalien.png')
					else if(ishuman(ass)) //Suit checks are in check_ass
						temp_img = icon(ass.gender == FEMALE ? 'icons/ass/assfemale.png' : 'icons/ass/assmale.png')
					else if(isdrone(ass)) //Drones are hot
						temp_img = icon('icons/ass/assdrone.png')
					else
						break
					busy = TRUE
					sleep(15)
					var/obj/item/photo/p = new /obj/item/photo (loc)
					var/datum/picture/toEmbed = new(name = "[ass]'s Ass", desc = "You see [ass]'s ass on the photo.", image = temp_img)
					p.pixel_x = rand(-10, 10)
					p.pixel_y = rand(-10, 10)
					toEmbed.psize_x = 128
					toEmbed.psize_y = 128
					p.set_picture(toEmbed, TRUE, TRUE)
					toner -= 5
					busy = FALSE
				else
					break
		updateUsrDialog()
	else if(href_list["remove"])
		if(copy)
			remove_photocopy(copy, usr)
			copy = null
		else if(photocopy)
			remove_photocopy(photocopy, usr)
			photocopy = null
		else if(doccopy)
			remove_photocopy(doccopy, usr)
			doccopy = null
		else if(check_ass())
			to_chat(ass, "<span class='notice'>You feel a slight pressure on your ass.</span>")
		updateUsrDialog()
	else if(href_list["min"])
		if(copies > 1)
			copies--
			updateUsrDialog()
	else if(href_list["add"])
		if(copies < maxcopies)
			copies++
			updateUsrDialog()
	else if(href_list["aipic"])
		if(!isAI(usr))
			return
		if(toner >= 5 && !busy)
			var/mob/living/silicon/ai/tempAI = usr
			if(tempAI.aicamera.stored.len == 0)
				to_chat(usr, "<span class='boldannounce'>No images saved</span>")
				return
			var/datum/picture/selection = tempAI.aicamera.selectpicture(usr)
			var/obj/item/photo/photo = new(loc, selection)
			photo.pixel_x = rand(-10, 10)
			photo.pixel_y = rand(-10, 10)
			toner -= 5	 //AI prints color pictures only, thus they can do it more efficiently
			busy = TRUE
			addtimer(CALLBACK(src, .proc/reset_busy), 1.5 SECONDS)
		updateUsrDialog()
	else if(href_list["colortoggle"])
		if(greytoggle == "Greyscale")
			greytoggle = "Color"
		else
			greytoggle = "Greyscale"
		updateUsrDialog()

/obj/machinery/photocopier/proc/reset_busy()
	busy = FALSE
	updateUsrDialog()

/obj/machinery/photocopier/proc/do_insertion(obj/item/O, mob/user)
	O.forceMove(src)
	to_chat(user, "<span class='notice'>You insert [O] into [src].</span>")
	flick("photocopier1", src)
	updateUsrDialog()

/obj/machinery/photocopier/proc/remove_photocopy(obj/item/O, mob/user)
	if(!issilicon(user)) //surprised this check didn't exist before, putting stuff in AI's hand is bad
		O.forceMove(user.loc)
		user.put_in_hands(O)
	else
		O.forceMove(drop_location())
	to_chat(user, "<span class='notice'>You take [O] out of [src].</span>")
>>>>>>> fulpmaster

/obj/machinery/photocopier/attackby(obj/item/O, mob/user, params)
	if(default_unfasten_wrench(user, O))
		return

	else if(istype(O, /obj/item/paper))
		if(copier_empty())
			if(istype(O, /obj/item/paper/contract/infernal))
				to_chat(user, "<span class='warning'>[src] smokes, smelling of brimstone!</span>")
				resistance_flags |= FLAMMABLE
				fire_act()
			else
				if(!user.temporarilyRemoveItemFromInventory(O))
					return
<<<<<<< HEAD
				paper_copy = O
=======
				copy = O
>>>>>>> fulpmaster
				do_insertion(O, user)
		else
			to_chat(user, "<span class='warning'>There is already something in [src]!</span>")

	else if(istype(O, /obj/item/photo))
		if(copier_empty())
			if(!user.temporarilyRemoveItemFromInventory(O))
				return
<<<<<<< HEAD
			photo_copy = O
=======
			photocopy = O
>>>>>>> fulpmaster
			do_insertion(O, user)
		else
			to_chat(user, "<span class='warning'>There is already something in [src]!</span>")

	else if(istype(O, /obj/item/documents))
		if(copier_empty())
			if(!user.temporarilyRemoveItemFromInventory(O))
				return
<<<<<<< HEAD
			document_copy = O
=======
			doccopy = O
>>>>>>> fulpmaster
			do_insertion(O, user)
		else
			to_chat(user, "<span class='warning'>There is already something in [src]!</span>")

	else if(istype(O, /obj/item/toner))
<<<<<<< HEAD
		if(toner_cartridge)
			to_chat(user, "<span class='warning'>[src] already has a toner cartridge inserted. Remove that one first.</span>")
			return
		O.forceMove(src)
		toner_cartridge = O
		to_chat(user, "<span class='notice'>You insert [O] into [src].</span>")

	else if(istype(O, /obj/item/areaeditor/blueprints))
		to_chat(user, "<span class='warning'>The Blueprint is too large to put into the copier. You need to find something else to record the document.</span>")
=======
		if(toner <= 0)
			if(!user.temporarilyRemoveItemFromInventory(O))
				return
			qdel(O)
			toner = 40
			to_chat(user, "<span class='notice'>You insert [O] into [src].</span>")
			updateUsrDialog()
		else
			to_chat(user, "<span class='warning'>This cartridge is not yet ready for replacement! Use up the rest of the toner.</span>")

	else if(istype(O, /obj/item/areaeditor/blueprints))
		to_chat(user, "<span class='warning'>The Blueprint is too large to put into the copier. You need to find something else to record the document</span>")
>>>>>>> fulpmaster
	else
		return ..()

/obj/machinery/photocopier/obj_break(damage_flag)
	. = ..()
<<<<<<< HEAD
	if(. && toner_cartridge.charges)
		new /obj/effect/decal/cleanable/oil(get_turf(src))
		toner_cartridge.charges = 0

/obj/machinery/photocopier/MouseDrop_T(mob/target, mob/user)
	check_ass() //Just to make sure that you can re-drag somebody onto it after they moved off.
	if(!istype(target) || target.anchored || target.buckled || !Adjacent(target) || !user.canUseTopic(src, BE_CLOSE) || target == ass || copier_blocked())
		return
	add_fingerprint(user)
=======
	if(. && toner > 0)
		new /obj/effect/decal/cleanable/oil(get_turf(src))
		toner = 0

/obj/machinery/photocopier/MouseDrop_T(mob/target, mob/user)
	check_ass() //Just to make sure that you can re-drag somebody onto it after they moved off.
	if (!istype(target) || target.anchored || target.buckled || !Adjacent(target) || !user.canUseTopic(src, BE_CLOSE) || target == ass || copier_blocked())
		return
	src.add_fingerprint(user)
>>>>>>> fulpmaster
	if(target == user)
		user.visible_message("<span class='notice'>[user] starts climbing onto the photocopier!</span>", "<span class='notice'>You start climbing onto the photocopier...</span>")
	else
		user.visible_message("<span class='warning'>[user] starts putting [target] onto the photocopier!</span>", "<span class='notice'>You start putting [target] onto the photocopier...</span>")

	if(do_after(user, 20, target = src))
		if(!target || QDELETED(target) || QDELETED(src) || !Adjacent(target)) //check if the photocopier/target still exists.
			return

		if(target == user)
			user.visible_message("<span class='notice'>[user] climbs onto the photocopier!</span>", "<span class='notice'>You climb onto the photocopier.</span>")
		else
			user.visible_message("<span class='warning'>[user] puts [target] onto the photocopier!</span>", "<span class='notice'>You put [target] onto the photocopier.</span>")

		target.forceMove(drop_location())
		ass = target

<<<<<<< HEAD
		if(photo_copy)
			photo_copy.forceMove(drop_location())
			visible_message("<span class='warning'>[photo_copy] is shoved out of the way by [ass]!</span>")
			photo_copy = null

		else if(paper_copy)
			paper_copy.forceMove(drop_location())
			visible_message("<span class='warning'>[paper_copy] is shoved out of the way by [ass]!</span>")
			paper_copy = null

		else if(document_copy)
			document_copy.forceMove(drop_location())
			visible_message("<span class='warning'>[document_copy] is shoved out of the way by [ass]!</span>")
			document_copy = null

/obj/machinery/photocopier/Exited(atom/movable/AM, atom/newloc)
	check_ass() // There was potentially a person sitting on the copier, check if they're still there.
	return ..()

/**
 * Checks the living mob `ass` exists and its location is the same as the photocopier.
 *
 * Returns FALSE if `ass` doesn't exist or is not at the copier's location. Returns TRUE otherwise.
 */
/obj/machinery/photocopier/proc/check_ass() //I'm not sure wether I made this proc because it's good form or because of the name.
	if(!ass)
		return FALSE
	if(ass.loc != loc)
		ass = null
		return FALSE
	return TRUE

/**
 * Checks if the copier is deleted, or has something dense at its location. Called in `MouseDrop_T()`
 */
=======
		if(photocopy)
			photocopy.forceMove(drop_location())
			visible_message("<span class='warning'>[photocopy] is shoved out of the way by [ass]!</span>")
			photocopy = null

		else if(copy)
			copy.forceMove(drop_location())
			visible_message("<span class='warning'>[copy] is shoved out of the way by [ass]!</span>")
			copy = null
	updateUsrDialog()

/obj/machinery/photocopier/proc/check_ass() //I'm not sure wether I made this proc because it's good form or because of the name.
	if(!ass)
		return 0
	if(ass.loc != src.loc)
		ass = null
		updateUsrDialog()
		return 0
	else if(ishuman(ass))
		if(!ass.get_item_by_slot(ITEM_SLOT_ICLOTHING) && !ass.get_item_by_slot(ITEM_SLOT_OCLOTHING))
			return 1
		else
			return 0
	else
		return 1

>>>>>>> fulpmaster
/obj/machinery/photocopier/proc/copier_blocked()
	if(QDELETED(src))
		return
	if(loc.density)
<<<<<<< HEAD
		return TRUE
=======
		return 1
>>>>>>> fulpmaster
	for(var/atom/movable/AM in loc)
		if(AM == src)
			continue
		if(AM.density)
<<<<<<< HEAD
			return TRUE
	return FALSE

/**
 * Checks if there is an item inserted into the copier or a mob sitting on top of it.
 *
 * Return `FALSE` is the copier has something inside of it. Returns `TRUE` if it doesn't.
 */
/obj/machinery/photocopier/proc/copier_empty()
	if(paper_copy || photo_copy || document_copy || check_ass())
		return FALSE
	else
		return TRUE
=======
			return 1
	return 0

/obj/machinery/photocopier/proc/copier_empty()
	if(copy || photocopy || check_ass())
		return 0
	else
		return 1
>>>>>>> fulpmaster

/*
 * Toner cartridge
 */
/obj/item/toner
	name = "toner cartridge"
	icon = 'icons/obj/device.dmi'
	icon_state = "tonercartridge"
	grind_results = list(/datum/reagent/iodine = 40, /datum/reagent/iron = 10)
	var/charges = 5
	var/max_charges = 5

/obj/item/toner/large
	name = "large toner cartridge"
	grind_results = list(/datum/reagent/iodine = 90, /datum/reagent/iron = 10)
	charges = 15
	max_charges = 15

/obj/item/toner/extreme
	name = "extremely large toner cartridge"
	desc = "Why would ANYONE need THIS MUCH TONER?"
	charges = 200
	max_charges = 200
<<<<<<< HEAD

#undef PHOTO_GREYSCALE
#undef PHOTO_COLOR
#undef PAPER_TONER_USE
#undef PHOTO_TONER_USE
#undef DOCUMENT_TONER_USE
#undef ASS_TONER_USE
#undef MAX_COPIES_AT_ONCE
=======
>>>>>>> fulpmaster

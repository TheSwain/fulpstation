
/*
		WELCOME TO THE FULPSTATION CODE Z-LEVEL!


	Any time we want to outright overwrite a variable that is already given a value in a previously defined atom or datum, we
	can overwrite it here!

		WHY DO THIS?

	So we don't have to overwrite the variables defined in TG code.
*/





 	//antag disallowing//

/datum/game_mode/revolution
	restricted_jobs = list("Security Officer", "Warden", "Detective", "AI", "Cyborg","Captain", "Head of Personnel", "Head of Security", "Chief Engineer", "Research Director", "Chief Medical Officer", "Deputy")

/datum/game_mode/clockwork_cult
	restricted_jobs = list("Chaplain", "Captain", "Deputy")

/datum/game_mode/cult
	restricted_jobs = list("Chaplain","AI", "Cyborg", "Security Officer", "Warden", "Detective", "Head of Security", "Captain", "Head of Personnel", "Deputy")

/datum/game_mode/traitor
	restricted_jobs = list("Cyborg", "Deputy")




/obj/item/clothing/accessory
	mob_overlay_icon = 'icons/mob/clothing/accessories.dmi'

/obj/item/clothing/suit/space/hardsuit
	var/toggle_helmet_sound = 'sound/mecha/mechmove03.ogg'


//SEC BODY CAMS by Surrealistik Oct 2019

/obj/item/clothing/under/rank/security
	var/obj/machinery/camera/builtInCamera = null
	var/camera_on = TRUE
	req_one_access = list(ACCESS_SECURITY)

/obj/item/clothing/under/rank/security/Initialize()
	. = ..()
	builtInCamera = new (src)
	builtInCamera.network = list("sec_bodycameras")
	builtInCamera.internal_light = FALSE

	RegisterSignal(src, COMSIG_ITEM_EQUIPPED, .proc/auto_register_bodycam)

/obj/item/clothing/under/rank/security/proc/auto_register_bodycam(datum/source, mob/user, slot)
	if(!builtInCamera)
		return
	if(slot != SLOT_W_UNIFORM)
		return
	if(!user)
		if(ismob(loc))
			user = loc
		else
			return
	var/obj/item/card/id/I = user.get_idcard(TRUE)
	if(!istype(I))
		return
	if(check_access(I))
		var/id_name = I.registered_name
		builtInCamera.c_tag = "*Body Camera: [I.assignment] [id_name]"
		to_chat(user, "<span class='notice'>Security uniform body camera automatically registered to [id_name]</span>")

/obj/item/clothing/under/rank/security/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(!builtInCamera)
		to_chat(user, "<span class='warning'>No body camera detected.</span>")
		return

	var/obj/item/card/id/I
	if (istype(W, /obj/item/card/id))
		I = W
	else if (istype(W, /obj/item/pda))
		var/obj/item/pda/P = W
		I = P.id

	if(!I)
		to_chat(user, "<span class='warning'>No ID detected for body camera registration.</span>")
		return

	if(check_access(I))
		var/id_name = I.registered_name
		builtInCamera.c_tag = "*Body Camera: [I.assignment] [id_name]"
		to_chat(user, "<span class='notice'>Security uniform body camera manually registered with ID to [id_name]</span>")
	else
		to_chat(user, "<span class='warning'>ID is not authorized for registration with this uniform's body camera.</span>")

/obj/item/clothing/under/rank/security/verb/toggle_camera()
	set name = "Toggle Body Camera"
	set category = "Object"
	set src in usr
	var/mob/M = usr
	if (istype(M, /mob/dead/))
		return
	if (!can_use(M))
		return
	camera_toggle(usr)


/obj/item/clothing/under/rank/security/proc/camera_toggle()
	var/message = "<span class='notice'>There's no camera!</span>"

	if(!builtInCamera)

	else if(camera_on)
		camera_on = FALSE
		builtInCamera.status = 0
		message = "<span class='notice'>You toggle the body camera off.</span>"
	else
		camera_on = TRUE
		builtInCamera.status = 1
		message = "<span class='notice'>You toggle the body camera on.</span>"

	if(ismob(loc))
		var/mob/user = loc
		if(user)
			to_chat(user, "[message]")

/obj/item/clothing/under/rank/security/emp_act()
	. = ..()
	camera_toggle()

/obj/machinery/computer/security
	req_one_access = list(ACCESS_SECURITY, ACCESS_FORENSICS_LOCKERS)


/obj/machinery/computer/security/proc/check_bodycamera_unlock(user)
	if(allowed(user))
		network += "sec_bodycameras" //We can tap into the body camera network with appropriate access
	else
		network -= "sec_bodycameras"
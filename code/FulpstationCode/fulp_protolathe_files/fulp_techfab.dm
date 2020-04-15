
/obj/machinery/rnd/production/protolathe/department/ui_interact(mob/user) //This is where we check for access.

	if(!check_id(user))
		return FALSE

	. = ..()

/obj/machinery/rnd/production/techfab/department/ui_interact(mob/user) //This is where we check for access.

	if(!check_id(user))
		return FALSE

	. = ..()


/obj/machinery/rnd/production/proc/check_id(mob/user) //This is where we check for access.
	var/obj/item/card/id/ID = user.get_idcard(TRUE)

	if(!(obj_flags & EMAGGED) && ( !ID || !istype(ID) || !check_access(ID) ) ) //If emagged we ignore the access requirement.
		to_chat(user, "<span class='alert'>Security clearance inadequate. Access denied.</span>")
		playsound(src, 'sound/machines/buzz-two.ogg', 50, FALSE)
		return FALSE

	return TRUE
#define ALERT_COOLDOWN 5 SECONDS

/obj/machinery/computer/upload/proc/upload_authenticate(mob/user)
	if(!user)
		return FALSE

	var/obj/item/card/id/ID = user.get_idcard(TRUE)

	if(!(obj_flags & EMAGGED) && ( !ID || !istype(ID) || !check_access(ID) ) ) //If emagged we ignore the access requirement.
		to_chat(user, "<span class='alert'>Security clearance inadequate. Access denied.</span>")
		playsound(src, 'sound/machines/buzz-two.ogg', 50, FALSE)
		return FALSE

	to_chat(user, "<span class='nicegreen'>Upload access granted.</span>")
	playsound(src, 'sound/machines/ping.ogg', 50, FALSE)
	return TRUE

/obj/machinery/computer/upload/emag_act(mob/user)
	if(!user)
		return FALSE

	if(!is_operational())
		to_chat(user, "<span class='notice'>This console's is too damaged to interface your emag with.</span>")
		return FALSE

	if(obj_flags & EMAGGED)
		to_chat(user, "<span class='notice'>This console's security is already compromised.</span>")
		return FALSE

	var/seconds = sec_breach_time * 0.1 //Adjust for the fact that they're deciseconds when reporting.
	playsound(src, 'sound/machines/engine_alert1.ogg', 100, FALSE) //SOUND ALARM!!
	to_chat(user, "<span class='userdanger'>Breaching the console's security with your emag will take approximately <b>[seconds]</b> seconds. <b>Security will be notified!</b></span>")

	var/location = get_area(src)
	if((world.time - alert_timestamp) > ALERT_COOLDOWN) //So we don't spam this incessantly.
		security_broadcast("<span class='userdanger'><b>WARNING!!</b> Attempted security breach of <b>[src]</b> in progress at <b>[location]</b>. Estimated <b>[seconds] seconds to breach!</b> Dispatch security immediately!</span>")
		alert_timestamp = world.time

	if(!do_after(user, sec_breach_time, target = src))
		return

	if(!src)
		return

	if(!is_operational())
		return

	location = get_area(src)
	playsound(src, 'sound/machines/engine_alert1.ogg', 100, FALSE) //SOUND ALARM!!
	security_broadcast("<span class='userdanger'><b>WARNING!!</b> <b>[src]</b> security at <b>[location]</b> has been successfully breached!</span>")
	to_chat(user, "<span class='nicegreen'>You have successfully breached this console's security protocols.</span>")

	obj_flags |= EMAGGED


/obj/machinery/computer/upload/proc/security_broadcast(message) //To proof alerts against EMP and disassembly
	if(!is_operational())
		return
	if(!message)
		return
	Radio = new/obj/item/radio(src)
	if(radio_key)
		Radio.keyslot = new radio_key
	Radio.subspace_transmission = TRUE
	Radio.canhear_range = 0
	Radio.recalculateChannels()
	Radio.talk_into(src, message, RADIO_CHANNEL_SECURITY)
	qdel(Radio)

/* //Uncomment these procs if we want the console to give us a list of viable targets, and plug these into law.dm
/obj/machinery/computer/upload/ai/proc/select_active_ai_same_z(mob/user)
	var/list/ais
	var/turf/T
	var/turf/upload_turf
	for(var/mob/living/silicon/AI/A in active_ais())
		T = get_turf(A)
		if(T.z != upload_turf.z)
			continue
		ais += A

	if(ais.len)
		if(user)
			. = input(user,"AI signals detected:", "AI Selection", ais[1]) in sortList(ais)
		else
			. = pick(ais)
	return .

/obj/machinery/computer/upload/borg/proc/select_free_borg_same_z(mob/user)
	var/list/borgs
	var/turf/T
	var/turf/upload_turf
	for(var/mob/living/silicon/robot/R in active_free_borgs())
		T = get_turf(R)
		if(T.z != upload_turf.z)
			continue
		borgs += R

	if(borgs.len)
		if(user)
			. = input(user,"Unshackled cyborg signals detected:", "Cyborg Selection", borgs[1]) in sortList(borgs)
		else
			. = pick(borgs)
	return .
*/
/datum/round_event_control/starfurybc
	name = "Starfury Battle Cruiser"
	typepath = /datum/round_event/starfurybc
	weight = 3
	max_occurrences = 1
	min_players = 70
	earliest_start = 60 MINUTES
	gamemode_blacklist = list("nuclear")

/datum/round_event_control/starfurybc/preRunEvent()
	if (!SSmapping.empty_space)
		return EVENT_CANT_RUN
	var/deadMobs = 0
	for(var/mob/M in GLOB.dead_mob_list)
		if(M.client)
			deadMobs++
	if(deadMobs < round(GLOB.player_list/9))
		deadchat_broadcast("Starfury Battle Cruiser event did not start because there were only [deadMobs]/[round(GLOB.player_list/8)] ghosts.", message_type=DEADCHAT_ANNOUNCEMENT)
		message_admins("Syndicate Battle Cruiser attempted to spawn, but there were only [deadMobs]/[round(GLOB.player_list/8)] ghosts.")
		return EVENT_CANT_RUN
	return ..()

/datum/round_event/starfurybc
	startWhen = 130 //30 = 1 minute, apparently
	var/minimum_required = 5
	var/shuttle_spawned = FALSE
	var/started = FALSE
	var/announcetime = 3 MINUTES

/datum/round_event/starfurybc/announce(fake)
	priority_announce("Unidentified ship detected on long range scanners. ETA [round(startWhen/30)] minutes.")
	if(fake)
		return
	started = TRUE

/datum/round_event/starfurybc/start()
	spawn_shuttle()

/*
/datum/round_event/starfurybc/process()
	if(started && SSshuttle.emergency.mode == SHUTTLE_CALL)
		started = FALSE
		var/cursetime = 7200
		var/timer = SSshuttle.emergency.timeLeft(1) + cursetime
		var/security_num = seclevel2num(get_security_level())
		var/set_coefficient = 1
		switch(security_num)
			if(SEC_LEVEL_GREEN)
				set_coefficient = 2
			if(SEC_LEVEL_BLUE)
				set_coefficient = 1
			else
				set_coefficient = 0.5
		var/surplus = timer - (SSshuttle.emergencyCallTime * set_coefficient)
		SSshuttle.emergency.setTimer(timer)
		if(surplus > 0)
			SSshuttle.block_recall(surplus)
		priority_announce("Due to hostile activities on your station shuttle will be delayed for 12 minutes.", "System Failure", 'sound/misc/notice1.ogg')
*/

/datum/round_event/starfurybc/proc/spawn_shuttle()
	shuttle_spawned = TRUE

	var/list/candidates = pollGhostCandidates("Do you wish to be considered for syndicate battlecruiser crew?", ROLE_TRAITOR)
	shuffle_inplace(candidates)
	if(candidates.len < minimum_required)
		deadchat_broadcast("Starfury Battle Cruiser event did not get enough candidates ([minimum_required]) to spawn.", message_type=DEADCHAT_ANNOUNCEMENT)
		return

	var/datum/map_template/shuttle/syndifury/starfury/ship = new
	var/x = rand(TRANSITIONEDGE,world.maxx - TRANSITIONEDGE - ship.width)
	var/y = rand(TRANSITIONEDGE,world.maxy - TRANSITIONEDGE - ship.height)
	var/z = SSmapping.empty_space.z_value
	var/turf/T = locate(x,y,z)
	if(!T)
		CRASH("SBC Starfury event found no turf to load in")

	if(!ship.load(T))
		CRASH("Loading SBC Starfury cruiser failed!")

	//spawn_shuttle_minis()

	for(var/turf/A in ship.get_affected_turfs(T))
		for(var/obj/effect/mob_spawn/human/syndicate/spawner in A)
			if(candidates.len > 0)
				var/mob/M = candidates[1]
				spawner.create(M.ckey)
				candidates -= M
				announce_to_ghosts(M)
			else
				announce_to_ghosts(spawner)

	sleep(announcetime)
	priority_announce("Heavily armed ship, identified as Syndicate Battle Cruiser Starfury, has been detected in nearby sector. Brace for impact.", sound = 'sound/machines/alarm.ogg')

/datum/round_event/starfurybc/proc/spawn_shuttle_minis()
	var/datum/map_template/shuttle/syndifury/sbcfighter/ship1 = new
	var/x1 = rand(TRANSITIONEDGE,world.maxx - TRANSITIONEDGE - ship1.width)
	var/y1 = rand(TRANSITIONEDGE,world.maxy - TRANSITIONEDGE - ship1.height)
	var/z1 = SSmapping.empty_space.z_value
	var/turf/T1 = locate(x1,y1,z1)
	if(!T1)
		CRASH("[ship1] couldn't spawn")

	if(!ship1.load(T1))
		CRASH("Loading [ship1] failed!")

	var/datum/map_template/shuttle/syndifury/sbccorvette/ship2 = new
	var/x2 = rand(TRANSITIONEDGE,world.maxx - TRANSITIONEDGE - ship2.width)
	var/y2 = rand(TRANSITIONEDGE,world.maxy - TRANSITIONEDGE - ship2.height)
	var/turf/T2 = locate(x2,y2,z1)
	if(!T2)
		CRASH("[ship2] couldn't spawn")

	if(!ship2.load(T2))
		CRASH("Loading [ship2] failed!")

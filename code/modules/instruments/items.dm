//copy pasta of the space piano, don't hurt me -Pete
/obj/item/instrument
	name = "generic instrument"
<<<<<<< HEAD:code/modules/instruments/items.dm
	force = 10
	max_integrity = 100
	resistance_flags = FLAMMABLE
	icon = 'icons/obj/musician.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/instruments_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/instruments_righthand.dmi'
	/// Our song datum.
	var/datum/song/handheld/song
	/// Our allowed list of instrument ids. This is nulled on initialize.
	var/list/allowed_instrument_ids
	/// How far away our song datum can be heard.
	var/instrument_range = 15

/obj/item/instrument/Initialize(mapload)
	. = ..()
	song = new(src, allowed_instrument_ids, instrument_range)
	allowed_instrument_ids = null			//We don't need this clogging memory after it's used.

/obj/item/instrument/Destroy()
	QDEL_NULL(song)
	return ..()

/obj/item/instrument/proc/should_stop_playing(mob/user)
	return user.incapacitated() || !((loc == user) || (isturf(loc) && Adjacent(user)))		// sorry, no more TK playing.
=======
	resistance_flags = FLAMMABLE
	force = 10
	max_integrity = 100
	icon = 'icons/obj/musician.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/instruments_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/instruments_righthand.dmi'
	var/datum/song/handheld/song
	var/instrumentId = "generic"
	var/instrumentExt = "mid"
	var/instrumentRange = 15

/obj/item/instrument/Initialize()
	. = ..()
	song = new(instrumentId, src, instrumentExt, instrumentRange)

/obj/item/instrument/Destroy()
	QDEL_NULL(song)
	. = ..()
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm

/obj/item/instrument/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] begins to play 'Gloomy Sunday'! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return (BRUTELOSS)

<<<<<<< HEAD:code/modules/instruments/items.dm
/obj/item/instrument/attack_self(mob/user)
	if(!user.IsAdvancedToolUser())
		to_chat(user, "<span class='warning'>You don't have the dexterity to do this!</span>")
		return TRUE
=======
/obj/item/instrument/Initialize(mapload)
	. = ..()
	if(mapload)
		song.tempo = song.sanitize_tempo(song.tempo) // tick_lag isn't set when the map is loaded

/obj/item/instrument/attack_self(mob/user)
	if(!user.IsAdvancedToolUser())
		to_chat(user, "<span class='warning'>You don't have the dexterity to do this!</span>")
		return 1
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm
	interact(user)

/obj/item/instrument/interact(mob/user)
	ui_interact(user)

/obj/item/instrument/ui_interact(mob/living/user)
<<<<<<< HEAD:code/modules/instruments/items.dm
	if(!isliving(user) || user.stat || user.restrained())
		return

	user.set_machine(src)
	song.ui_interact(user)
=======
	if(!isliving(user) || user.stat || user.restrained() || !(user.mobility_flags & MOBILITY_STAND))
		return

	user.set_machine(src)
	song.interact(user)

/obj/item/instrument/proc/start_playing()
	return

/obj/item/instrument/proc/stop_playing()
	return
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm

/obj/item/instrument/violin
	name = "space violin"
	desc = "A wooden musical instrument with four strings and a bow. \"The devil went down to space, he was looking for an assistant to grief.\""
	icon_state = "violin"
	inhand_icon_state = "violin"
	hitsound = "swing_hit"
<<<<<<< HEAD:code/modules/instruments/items.dm
	allowed_instrument_ids = "violin"
=======
	instrumentId = "violin"
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm

/obj/item/instrument/violin/golden
	name = "golden violin"
	desc = "A golden musical instrument with four strings and a bow. \"The devil went down to space, he was looking for an assistant to grief.\""
	icon_state = "golden_violin"
	inhand_icon_state = "golden_violin"
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/item/instrument/piano_synth
	name = "synthesizer"
	desc = "An advanced electronic synthesizer that can be used as various instruments."
	icon_state = "synth"
	inhand_icon_state = "synth"
<<<<<<< HEAD:code/modules/instruments/items.dm
	allowed_instrument_ids = "piano"

/obj/item/instrument/piano_synth/Initialize(mapload)
	. = ..()
	song.allowed_instrument_ids = SSinstruments.synthesizer_instrument_ids
=======
	instrumentId = "piano"
	instrumentExt = "ogg"
	var/static/list/insTypes = list("accordion" = "mid", "bikehorn" = "ogg", "glockenspiel" = "mid", "banjo" = "ogg", "guitar" = "ogg", "harmonica" = "mid", "piano" = "ogg", "recorder" = "mid", "saxophone" = "mid", "trombone" = "mid", "violin" = "mid", "xylophone" = "mid")	//No eguitar you ear-rapey fuckers.
	actions_types = list(/datum/action/item_action/synthswitch)

/obj/item/instrument/piano_synth/proc/changeInstrument(name = "piano")
	song.instrumentDir = name
	song.instrumentExt = insTypes[name]

/obj/item/instrument/piano_synth/proc/selectInstrument() // Moved here so it can be used by the action and PAI software panel without copypasta
	var/chosen = input("Choose the type of instrument you want to use", "Instrument Selection", song.instrumentDir) as null|anything in sortList(insTypes)
	if(!insTypes[chosen])
		return
	return changeInstrument(chosen)
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm

/obj/item/instrument/piano_synth/headphones
	name = "headphones"
	desc = "Unce unce unce unce. Boop!"
	icon = 'icons/obj/clothing/accessories.dmi'
	lefthand_file = 'icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/clothing_righthand.dmi'
	icon_state = "headphones"
	inhand_icon_state = "headphones"
	slot_flags = ITEM_SLOT_EARS | ITEM_SLOT_HEAD
	force = 0
	w_class = WEIGHT_CLASS_SMALL
	custom_price = 125
<<<<<<< HEAD:code/modules/instruments/items.dm
	instrument_range = 1
=======
	instrumentRange = 1
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm

/obj/item/instrument/piano_synth/headphones/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)
	RegisterSignal(src, COMSIG_SONG_START, .proc/start_playing)
	RegisterSignal(src, COMSIG_SONG_END, .proc/stop_playing)

<<<<<<< HEAD:code/modules/instruments/items.dm
/**
  * Called by a component signal when our song starts playing.
  */
/obj/item/instrument/piano_synth/headphones/proc/start_playing()
	icon_state = "[initial(icon_state)]_on"
	update_icon()

/**
  * Called by a component signal when our song stops playing.
  */
/obj/item/instrument/piano_synth/headphones/proc/stop_playing()
=======
/obj/item/instrument/piano_synth/headphones/start_playing()
	icon_state = "[initial(icon_state)]_on"
	update_icon()

/obj/item/instrument/piano_synth/headphones/stop_playing()
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm
	icon_state = "[initial(icon_state)]"
	update_icon()

/obj/item/instrument/piano_synth/headphones/spacepods
	name = "\improper Nanotrasen space pods"
	desc = "Flex your money, AND ignore what everyone else says, all at once!"
	icon_state = "spacepods"
	inhand_icon_state = "spacepods"
	slot_flags = ITEM_SLOT_EARS
	strip_delay = 100 //air pods don't fall out
<<<<<<< HEAD:code/modules/instruments/items.dm
	instrument_range = 0 //you're paying for quality here
=======
	instrumentRange = 0 //you're paying for quality here
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm
	custom_premium_price = 1800

/obj/item/instrument/banjo
	name = "banjo"
	desc = "A 'Mura' brand banjo. It's pretty much just a drum with a neck and strings."
	icon_state = "banjo"
	inhand_icon_state = "banjo"
<<<<<<< HEAD:code/modules/instruments/items.dm
	attack_verb_continuous = list("scruggs-styles", "hum-diggitys", "shin-digs", "clawhammers")
	attack_verb_simple = list("scruggs-style", "hum-diggity", "shin-dig", "clawhammer")
	hitsound = 'sound/weapons/banjoslap.ogg'
	allowed_instrument_ids = "banjo"

/obj/item/instrument/guitar
	name = "guitar"
	desc = "It's made of wood and has bronze strings."
	icon_state = "guitar"
	inhand_icon_state = "guitar"
	attack_verb_continuous = list("plays metal on", "serenades", "crashes", "smashes")
	attack_verb_simple = list("play metal on", "serenade", "crash", "smash")
	hitsound = 'sound/weapons/stringsmash.ogg'
	allowed_instrument_ids = "guitar"
=======
	instrumentExt = "ogg"
	attack_verb = list("scruggs-styled", "hum-diggitied", "shin-digged", "clawhammered")
	hitsound = 'sound/weapons/banjoslap.ogg'
	instrumentId = "banjo"

/obj/item/instrument/guitar
	name = "guitar"
	desc = "It's made out of wood and has bronze strings."
	icon_state = "guitar"
	inhand_icon_state = "guitar"
	instrumentExt = "ogg"
	attack_verb = list("played metal on", "serenaded", "crashed", "smashed")
	hitsound = 'sound/weapons/stringsmash.ogg'
	instrumentId = "guitar"
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm

/obj/item/instrument/eguitar
	name = "electric guitar"
	desc = "Makes all your shredding needs possible."
	icon_state = "eguitar"
	inhand_icon_state = "eguitar"
	force = 12
<<<<<<< HEAD:code/modules/instruments/items.dm
	attack_verb_continuous = list("plays metal on", "shreds", "crashes", "smashes")
	attack_verb_simple = list("play metal on", "shred", "crash", "smash")
	hitsound = 'sound/weapons/stringsmash.ogg'
	allowed_instrument_ids = "eguitar"
=======
	attack_verb = list("played metal on", "shredded", "crashed", "smashed")
	hitsound = 'sound/weapons/stringsmash.ogg'
	instrumentId = "eguitar"
	instrumentExt = "ogg"
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm

/obj/item/instrument/glockenspiel
	name = "glockenspiel"
	desc = "Smooth metal bars perfect for any marching band."
	icon_state = "glockenspiel"
<<<<<<< HEAD:code/modules/instruments/items.dm
	allowed_instrument_ids = "glockenspiel"
	inhand_icon_state = "glockenspiel"
=======
	inhand_icon_state = "glockenspiel"
	instrumentId = "glockenspiel"
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm

/obj/item/instrument/accordion
	name = "accordion"
	desc = "Pun-Pun not included."
	icon_state = "accordion"
<<<<<<< HEAD:code/modules/instruments/items.dm
	allowed_instrument_ids = "accordion"
	inhand_icon_state = "accordion"
=======
	inhand_icon_state = "accordion"
	instrumentId = "accordion"
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm

/obj/item/instrument/trumpet
	name = "trumpet"
	desc = "To announce the arrival of the king!"
	icon_state = "trumpet"
<<<<<<< HEAD:code/modules/instruments/items.dm
	allowed_instrument_ids = "trombone"
	inhand_icon_state = "trumpet"
=======
	inhand_icon_state = "trumpet"
	instrumentId = "trombone"
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm

/obj/item/instrument/trumpet/spectral
	name = "spectral trumpet"
	desc = "Things are about to get spooky!"
	icon_state = "spectral_trumpet"
	inhand_icon_state = "spectral_trumpet"
	force = 0
<<<<<<< HEAD:code/modules/instruments/items.dm
	attack_verb_continuous = list("plays", "jazzes", "trumpets", "mourns", "doots", "spooks")
	attack_verb_simple = list("play", "jazz", "trumpet", "mourn", "doot", "spook")
=======
	instrumentId = "trombone"
	attack_verb = list("played","jazzed","trumpeted","mourned","dooted","spooked")
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm

/obj/item/instrument/trumpet/spectral/Initialize()
	. = ..()
	AddComponent(/datum/component/spooky)

/obj/item/instrument/trumpet/spectral/attack(mob/living/carbon/C, mob/user)
	playsound (src, 'sound/runtime/instruments/trombone/En4.mid', 100,1,-1)
	..()

/obj/item/instrument/saxophone
	name = "saxophone"
	desc = "This soothing sound will be sure to leave your audience in tears."
	icon_state = "saxophone"
<<<<<<< HEAD:code/modules/instruments/items.dm
	allowed_instrument_ids = "saxophone"
	inhand_icon_state = "saxophone"
=======
	inhand_icon_state = "saxophone"
	instrumentId = "saxophone"
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm

/obj/item/instrument/saxophone/spectral
	name = "spectral saxophone"
	desc = "This spooky sound will be sure to leave mortals in bones."
	icon_state = "saxophone"
	inhand_icon_state = "saxophone"
<<<<<<< HEAD:code/modules/instruments/items.dm
	force = 0
	attack_verb_continuous = list("plays", "jazzes", "saxxes", "mourns", "doots", "spooks")
	attack_verb_simple = list("play", "jazz", "sax", "mourn", "doot", "spook")
=======
	instrumentId = "saxophone"
	force = 0
	attack_verb = list("played","jazzed","saxxed","mourned","dooted","spooked")
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm

/obj/item/instrument/saxophone/spectral/Initialize()
	. = ..()
	AddComponent(/datum/component/spooky)

/obj/item/instrument/saxophone/spectral/attack(mob/living/carbon/C, mob/user)
	playsound (src, 'sound/runtime/instruments/saxophone/En4.mid', 100,1,-1)
	..()

/obj/item/instrument/trombone
	name = "trombone"
	desc = "How can any pool table ever hope to compete?"
	icon_state = "trombone"
<<<<<<< HEAD:code/modules/instruments/items.dm
	allowed_instrument_ids = "trombone"
	inhand_icon_state = "trombone"
=======
	inhand_icon_state = "trombone"
	instrumentId = "trombone"
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm

/obj/item/instrument/trombone/spectral
	name = "spectral trombone"
	desc = "A skeleton's favorite instrument. Apply directly on the mortals."
<<<<<<< HEAD:code/modules/instruments/items.dm
	icon_state = "trombone"
	inhand_icon_state = "trombone"
	force = 0
	attack_verb_continuous = list("plays", "jazzes", "trombones", "mourns", "doots", "spooks")
	attack_verb_simple = list("play", "jazz", "trombone", "mourn", "doot", "spook")
=======
	instrumentId = "trombone"
	icon_state = "trombone"
	inhand_icon_state = "trombone"
	force = 0
	attack_verb = list("played","jazzed","tromboned","mourned","dooted","spooked")
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm

/obj/item/instrument/trombone/spectral/Initialize()
	. = ..()
	AddComponent(/datum/component/spooky)

/obj/item/instrument/trombone/spectral/attack(mob/living/carbon/C, mob/user)
	playsound (src, 'sound/runtime/instruments/trombone/Cn4.mid', 100,1,-1)
	..()

/obj/item/instrument/recorder
	name = "recorder"
	desc = "Just like in school, playing ability and all."
	force = 5
	icon_state = "recorder"
<<<<<<< HEAD:code/modules/instruments/items.dm
	allowed_instrument_ids = "recorder"
	inhand_icon_state = "recorder"
=======
	inhand_icon_state = "recorder"
	instrumentId = "recorder"
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm

/obj/item/instrument/harmonica
	name = "harmonica"
	desc = "For when you get a bad case of the space blues."
	icon_state = "harmonica"
<<<<<<< HEAD:code/modules/instruments/items.dm
	allowed_instrument_ids = "harmonica"
	inhand_icon_state = "harmonica"
=======
	inhand_icon_state = "harmonica"
	instrumentId = "harmonica"
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm
	slot_flags = ITEM_SLOT_MASK
	force = 5
	w_class = WEIGHT_CLASS_SMALL
	actions_types = list(/datum/action/item_action/instrument)

/obj/item/instrument/harmonica/proc/handle_speech(datum/source, list/speech_args)
	if(song.playing && ismob(loc))
		to_chat(loc, "<span class='warning'>You stop playing the harmonica to talk...</span>")
		song.playing = FALSE

/obj/item/instrument/harmonica/equipped(mob/M, slot)
	. = ..()
<<<<<<< HEAD:code/modules/instruments/items.dm
	RegisterSignal(M, COMSIG_MOB_SAY, .proc/handle_speech)
=======
	RegisterSignal(M, COMSIG_MOB_SAY, .proc/handle_speech, override = TRUE)
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm

/obj/item/instrument/harmonica/dropped(mob/M)
	. = ..()
	UnregisterSignal(M, COMSIG_MOB_SAY)

/obj/item/instrument/bikehorn
	name = "gilded bike horn"
	desc = "An exquisitely decorated bike horn, capable of honking in a variety of notes."
	icon_state = "bike_horn"
	inhand_icon_state = "bike_horn"
	lefthand_file = 'icons/mob/inhands/equipment/horns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/horns_righthand.dmi'
<<<<<<< HEAD:code/modules/instruments/items.dm
	allowed_instrument_ids = "bikehorn"
	attack_verb_continuous = list("beautifully honks")
	attack_verb_simple = list("beautifully honk")
=======
	attack_verb = list("beautifully honks")
	instrumentId = "bikehorn"
	instrumentExt = "ogg"
>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm
	w_class = WEIGHT_CLASS_TINY
	force = 0
	throw_speed = 3
	throw_range = 15
	hitsound = 'sound/items/bikehorn.ogg'

<<<<<<< HEAD:code/modules/instruments/items.dm
=======
///

>>>>>>> fulpmaster:code/game/objects/items/devices/instruments.dm
/obj/item/choice_beacon/music
	name = "instrument delivery beacon"
	desc = "Summon your tool of art."
	icon_state = "gangtool-red"

/obj/item/choice_beacon/music/generate_display_names()
	var/static/list/instruments
	if(!instruments)
		instruments = list()
		var/list/templist = list(/obj/item/instrument/violin,
							/obj/item/instrument/piano_synth,
							/obj/item/instrument/banjo,
							/obj/item/instrument/guitar,
							/obj/item/instrument/eguitar,
							/obj/item/instrument/glockenspiel,
							/obj/item/instrument/accordion,
							/obj/item/instrument/trumpet,
							/obj/item/instrument/saxophone,
							/obj/item/instrument/trombone,
							/obj/item/instrument/recorder,
							/obj/item/instrument/harmonica,
							/obj/item/instrument/piano_synth/headphones
							)
		for(var/V in templist)
			var/atom/A = V
			instruments[initial(A.name)] = A
	return instruments

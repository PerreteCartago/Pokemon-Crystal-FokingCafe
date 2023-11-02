	object_const_def
	const SLOWPOKEWELLB2F_GYM_GUIDE
	const SLOWPOKEWELLB2F_POKE_BALL
	const SLOWPOKEWELLB2F_THIEF

SlowpokeWellB2F_MapScripts:
	def_scene_scripts

	def_callbacks

ThiefScript:
	faceplayer
	opentext
	writetext SlowpokeThiefText
	waitbutton
	writetext SlowpokeThiefText2
	yesorno
	iffalse .TutorRefused
	setval THIEF
	writetext SlowpokeThiefClear
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetext SlowpokeThiefTextRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext SlowpokeThiefTextTaught
	waitbutton
	closetext
	end

SlowpokeWellB2FGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
	iftrue .GotKingsRock
	writetext SlowpokeWellB2FGymGuideText
	promptbutton
	verbosegiveitem KINGS_ROCK
	iffalse .NoRoom
	setevent EVENT_GOT_KINGS_ROCK_IN_SLOWPOKE_WELL
.NoRoom:
	closetext
	end

.GotKingsRock:
	writetext SlowpokeWellB2FGymGuideText_GotKingsRock
	waitbutton
	closetext
	end

SlowpokeWellB2FTMRainDance:
	itemball TM_RAIN_DANCE

SlowpokeWellB2FGymGuideText:
	text "I'm waiting to see"
	line "SLOWPOKE's moment"
	cont "of evolution."

	para "Through observa-"
	line "tion, I made a new"
	cont "discovery."

	para "A SLOWPOKE with a"
	line "KING'S ROCK often"

	para "gets bitten by a"
	line "SHELLDER."

	para "Here, I'll share a"
	line "KING'S ROCK with"
	cont "you."
	done

SlowpokeWellB2FGymGuideText_GotKingsRock:
	text "I'm going to be"
	line "like SLOWPOKE."

	para "I'll wait patient-"
	line "ly, so I can see"
	cont "one evolve."
	done

SlowpokeThiefText:
	text "Hello there!"
	line "I've seen you"
	cont "running around."

	para "It must be good"
	line "luck that brought"
	cont "us together."
	done

SlowpokeThiefText2:
	text "Would you like me"
	line "to teach your"

	para "#MON to use"
	line "THIEF?"

SlowpokeThiefTextRefused:
	text "OK then."
	done

SlowpokeThiefClear:
	text_start
	done

SlowpokeThiefTextTaught:
	text "Now if your"
	line "#MON is in a"

	para "pinch, they can"
	line "steal stuff now"

	para "Maybe someday you"
	line "will become a Team"
	cont "Rocket member"
	done

SlowpokeWellB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 11, SLOWPOKE_WELL_B1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  4, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 1, SlowpokeWellB2FGymGuideScript, -1
	object_event 15,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SlowpokeWellB2FTMRainDance, EVENT_SLOWPOKE_WELL_B2F_TM_RAIN_DANCE
	object_event 9, 4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ThiefScript, -1

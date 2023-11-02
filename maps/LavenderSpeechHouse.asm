	object_const_def
	const LAVENDERSPEECHHOUSE_POKEFAN_F
	const LAVENDERSPEECHHOUSE_GRAMPS1

LavenderSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

LavenderSpeechHouseGramps1Script:
	faceplayer
	opentext
	writetext LavenderSpeechHouseTutorPsyckUpText
	waitbutton
	writetext LavenderSpeechHouseTutorPsyckUpText2
	yesorno
	iffalse .TutorRefused
	setval PSYCH_UP
	writetext LavenderSpeechHouseTutorPsyckUpClear
	special MoveTutor
	ifequal FALSE, .TeachMove
.TutorRefused
	writetext LavenderSpeechHouseTutorPsyckUpRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext LavenderSpeechHouseTutorPsyckUpTaught
	waitbutton
	closetext
	end

LavenderSpeechHousePokefanFScript:
	jumptextfaceplayer LavenderSpeechHousePokefanFText

LavenderSpeechHouseBookshelf:
	jumpstd PictureBookshelfScript

LavenderSpeechHousePokefanFText:
	text "LAVENDER is a"
	line "tiny, quiet town"

	para "at the foot of the"
	line "mountains."

	para "It's gotten a bit"
	line "busier since the"

	para "RADIO TOWER was"
	line "built."
	done

LavenderSpeechHouseTutorPsyckUpText:
	text "Hello there!"
	line "I've seen you"
	cont "running around."

	para "It must be good"
	line "luck that brought"
	cont "us together."
	done

LavenderSpeechHouseTutorPsyckUpText2:
	text "Would you like me"
	line "to teach your"

	para "#MON to use"
	line "Psych Up?"

LavenderSpeechHouseTutorPsyckUpRefused:
	text "OK then."
	done

LavenderSpeechHouseTutorPsyckUpClear:
	text_start
	done

LavenderSpeechHouseTutorPsyckUpTaught:
	text "Now if your"
	line "#MON is in a"

	para "Raises special"
	line "atack but deals"
	cont "no damage."
	done

LavenderSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 3
	warp_event  3,  7, LAVENDER_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, LavenderSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, LavenderSpeechHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderSpeechHousePokefanFScript, -1
	object_event 2, 4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LavenderSpeechHouseGramps1Script, -1

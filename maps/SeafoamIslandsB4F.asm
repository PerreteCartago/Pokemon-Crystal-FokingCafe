	object_const_def
	const SEAFOAM_ISLANDS_B4F_ARTICUNO

SeafoamIslandsB4F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene2
	
	db 0 ; callbacks

.DummyScene2:
	checkevent EVENT_FOUGHT_ARTICUNO
	iftrue .DoNothing
	checkcode VAR_BADGES
	ifequal NUM_BADGES, .ArticunoAppear
.DoNothing
	end

.ArticunoAppear
	setevent EVENT_ARTICUNO_APPEAR
	end

SeafoamIslandsB4FArticuno:
	opentext
	writetext ArticunoText
	cry ARTICUNO
	pause 15
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon ARTICUNO, 60
	startbattle
	disappear SEAFOAM_ISLANDS_B4F_ARTICUNO
	setevent EVENT_FOUGHT_ARTICUNO
	reloadmapafterbattle
	end

SeafoamIslandsB4FUltraBall:
	hiddenitem ULTRA_BALL, EVENT_FOUND_ULTRA_BALL_IN_SEAFOAM_ISLANDS_B4F

ArticunoText:
	text "Artic!"
	done

SeafoamIslandsB4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25,  4, SEAFOAM_ISLANDS_B3F, 4
	warp_event 11,  7, SEAFOAM_ISLANDS_B3F, 5

	def_coord_events

	def_bg_events
	bg_event 25, 17, BGEVENT_ITEM, SeafoamIslandsB4FUltraBall

	def_object_events
	object_event  7,  1, SPRITE_ARTICUNO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0,  SeafoamIslandsB4FArticuno, EVENT_ARTICUNO_APPEAR

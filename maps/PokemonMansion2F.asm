	object_const_def
	const POKEMON_MANSION_2F_POKE_BALL1


PokemonMansion2F_MapScripts:
	db 0 ; scene_scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Dummyscene3

.Dummyscene3
	checkevent EVENT_MANSION_SWITCH_ON
	iftrue .Donothing
	changeblock  8,  4, $07 ; clear
	changeblock 18,  8, $1F ; gate2
	changeblock  6, 22, $79 ; gate3
.Done:
	return

.Donothing
	changeblock  8,  4, $79 ; gate3
	changeblock 18,  8, $07 ; clear
	changeblock  6, 22, $07 ; clear
	return

SwitchesScript2F:
	opentext
	writetext PressButton2FText
	cry MEW
	pause 15
	closetext
	checkevent EVENT_MANSION_SWITCH_ON
	iftrue .Cosacierta
	iffalse .Cosafalsa
	end

.Cosacierta:
	clearevent EVENT_MANSION_SWITCH_ON
	changeblock  8,  4, $07 ; clear
	changeblock 18,  8, $1F ; gate2
	changeblock  6, 22, $79 ; gate3
	end

.Cosafalsa:
	setevent EVENT_MANSION_SWITCH_ON
	changeblock  8,  4, $79 ; gate3
	changeblock 18,  8, $07 ; clear
	changeblock  6, 22, $07 ; clear
	end

PressButton2FText:
	text "What?"
	line "A secret switch!"
	cont "Lets Press it!"
	done

PokemonMansion2FCalcium:
	itemball CALCIUM

PokemonMansion2FHiddenPpUp:
	hiddenitem PP_UP, EVENT_POKEMON_MANSION_2F_PP_UP

PokemonMansion2FHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_POKEMON_MANSION_2F_MAX_REVIVE

PokemonMansion2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 10, POKEMON_MANSION_1F, 5
	warp_event  6,  1, POKEMON_MANSION_3F, 1
	warp_event  7, 10, POKEMON_MANSION_3F, 2
	warp_event 25, 14, POKEMON_MANSION_3F, 3


	def_coord_events

	def_bg_events
	bg_event  2, 11, BGEVENT_READ, SwitchesScript2F
	bg_event 18, 14, BGEVENT_ITEM, PokemonMansion2FHiddenMaxRevive
	bg_event  8, 17, BGEVENT_ITEM, PokemonMansion1FHiddenHpUp

	def_object_events
	object_event 28,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansion2FCalcium, EVENT_POKEMON_MANSION_2F_CALCIUM


	object_const_def
	const POKEMON_MANSION_B1F_POKE_BALL1
	const POKEMON_MANSION_B1F_POKE_BALL2
	const POKEMON_MANSION_B1F_POKE_BALL3
	const POKEMON_MANSION_B1F_POKE_BALL4
	const POKEMON_MANSION_B1F_POKEDEX

PokemonMansionB1F_MapScripts:
	db 0 ; scene_scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Dummyscene5

.Dummyscene5
	checkevent EVENT_MANSION_SWITCH_ON
	iftrue .Donothing
	changeblock  8,  6, $07 ; clear
	changeblock 26, 16, $20 ; gate
	changeblock 12, 22, $79 ; gate3
	changeblock 16, 16, $07 ; clear
.Done:
	return

.Donothing
	changeblock  8,  6, $79 ; gate3
	changeblock 26, 16, $07 ; clear
	changeblock 12, 22, $07 ; clear
	changeblock 16, 16, $20 ; gate
	return

SwitchesScriptB1:
	opentext
	writetext PressButtonB1Text
	cry MEW
	pause 15
	closetext
	checkevent EVENT_MANSION_SWITCH_ON
	iftrue .Cosacierta
	iffalse .Cosafalsa
	end

.Cosacierta:
	clearevent EVENT_MANSION_SWITCH_ON
	changeblock  8,  6, $07 ; clear
	changeblock 26, 16, $20 ; gate
	changeblock 12, 22, $79 ; gate3
	changeblock 16, 16, $07 ; clear
	end

.Cosafalsa:
	setevent EVENT_MANSION_SWITCH_ON
	changeblock  8,  6, $79 ; gate3
	changeblock 26, 16, $07 ; clear
	changeblock 12, 22, $07 ; clear
	changeblock 16, 16, $20 ; gate
	end

SwitchesScriptB2:
	opentext
	writetext PressButtonB1Text
	cry MEW
	pause 15
	closetext
	checkevent EVENT_MANSION_SWITCH_ON
	iftrue .Cosacierta2
	iffalse .Cosafalsa2
	end

.Cosacierta2:
	clearevent EVENT_MANSION_SWITCH_ON
	changeblock  8,  6, $07 ; clear
	changeblock 26, 16, $20 ; gate
	changeblock 12, 22, $79 ; gate3
	changeblock 16, 16, $07 ; clear
	end

.Cosafalsa2:
	setevent EVENT_MANSION_SWITCH_ON
	changeblock  8,  6, $79 ; gate3
	changeblock 26, 16, $07 ; clear
	changeblock 12, 22, $07 ; clear
	changeblock 16, 16, $20 ; gate
	end

MewB1FBookScript:
	opentext
	writetext MewB1FText
	waitbutton
	closetext
	end

PressButtonB1Text:
	text "What?"
	line "A secret switch!"
	cont "Lets Press it!"
	done

MewB1FText:
	text "Diary; Sept. 1"
	line "MEWTWO is far too"
	cont "powerful."

	para "We have failed to"
	line "curb its vicious"
	cont "tendencies..."
	done

	
PokemonMansionB1FBlizzard:
	itemball TM_BLIZZARD

PokemonMansionB1FFullRestore:
	itemball FULL_RESTORE

PokemonMansionB1FSolarBeam:
	itemball TM_SOLARBEAM

PokemonMansionB1FRarecandy:
	itemball RARE_CANDY

PokemonMansionB1FHiddenRarecandy:
	hiddenitem RARE_CANDY, EVENT_POKEMON_MANSION_B1F_HIDDEN_RARE_CANDY

PokemonMansionB1FHiddenElixir:
	hiddenitem RARE_CANDY, EVENT_POKEMON_MANSION_B1F_HIDDEN_ELIXIR

PokemonMansionB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23, 22, POKEMON_MANSION_1F, 6

	def_coord_events

	def_bg_events
	bg_event 20,  3, BGEVENT_READ, SwitchesScriptB1
	bg_event 18, 25, BGEVENT_READ, SwitchesScriptB2
	bg_event  1,  9, BGEVENT_ITEM, PokemonMansionB1FHiddenRarecandy
	bg_event 23, 10, BGEVENT_ITEM, PokemonMansionB1FHiddenElixir


	def_object_events
	object_event  4,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansionB1FBlizzard, EVENT_POKEMON_MANSION_B1F_BLIZZARD
	object_event  1, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansionB1FFullRestore, EVENT_POKEMON_MANSION_B1F_FULL_RESTORE
	object_event 19, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansionB1FSolarBeam, EVENT_POKEMON_MANSION_B1F_SOLAR_BEAM
	object_event 10,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansionB1FRarecandy, EVENT_POKEMON_MANSION_B1F_RARE_CANDY
	object_event 17, 22, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MewB1FBookScript, -1

	

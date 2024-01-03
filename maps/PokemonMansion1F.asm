	object_const_def
	const POKEMONMANSION1F_POKEDEX
	const POKEMON_MANSION_1F_POKE_BALL1
	const POKEMON_MANSION_1F_POKE_BALL2

PokemonMansion1F_MapScripts:
	db 0 ; scene_scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Dummyscene

.Dummyscene
	checkevent EVENT_MANSION_SWITCH_ON
	iftrue .Donothing
	changeblock 24, 12, $07 ; clear
	changeblock 16,  6, $20 ; gate
	changeblock 20, 16, $07 ; clear
	changeblock 24, 16, $20 ; gate
.Done:
	return

.Donothing
	changeblock 24, 12, $20 ; gate
	changeblock 16,  6, $07 ; clear
	changeblock 20, 16, $20 ; gate
	changeblock 24, 16, $07 ; clear
	return

SwitchesScript:
	opentext
	writetext PressButtonText
	cry MEW
	pause 15
	closetext
	checkevent EVENT_MANSION_SWITCH_ON
	iftrue .Cosacierta
	iffalse .Cosafalsa
	end

.Cosacierta:
	clearevent EVENT_MANSION_SWITCH_ON
	changeblock 24, 12, $07 ; clear
	changeblock 16,  6, $20 ; gate
	changeblock 20, 16, $07 ; clear
	changeblock 24, 16, $20 ; gate
	end

.Cosafalsa:
	setevent EVENT_MANSION_SWITCH_ON
	changeblock 24, 12, $20 ; gate
	changeblock 16,  6, $07 ; clear
	changeblock 20, 16, $20 ; gate
	changeblock 24, 16, $07 ; clear
	end

MewFirstBookScript:
	opentext
	writetext MewText1
	waitbutton
	closetext
	end

PressButtonText:
	text "What?"
	line "A secret switch!"
	cont "Lets Press it!"
	done

MewText1:
	text "Diary: July 5"
	line "Guyana,"
	cont "South America"

	para "A new #MON was"
	line "discovered deep"
	cont "in the jungle."
	done

PokemonMansion1FEscapeRope:
	itemball ESCAPE_ROPE

PokemonMansion1FCarbos:
	itemball CARBOS

PokemonMansion1FHiddenMoonStone:
	hiddenitem MOON_STONE, EVENT_POKEMON_MANSION_1F_MOON_STONE

PokemonMansion1FHiddenHpUp:
	hiddenitem HP_UP, EVENT_POKEMON_MANSION_1F_HP_UP

PokemonMansion1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 27, CINNABAR_ISLAND, 4
	warp_event  4, 27, CINNABAR_ISLAND, 4
	warp_event  6, 27, CINNABAR_ISLAND, 4
	warp_event  7, 27, CINNABAR_ISLAND, 4
	warp_event  5, 10, POKEMON_MANSION_2F, 1
	warp_event 21, 22, POKEMON_MANSION_B1F, 1

	def_coord_events

	def_bg_events
	bg_event  2,  5, BGEVENT_READ, SwitchesScript
	bg_event  8, 16, BGEVENT_ITEM, PokemonMansion1FHiddenMoonStone
	bg_event  1,  1, BGEVENT_ITEM, PokemonMansion1FHiddenHpUp

	def_object_events
	object_event 25,  8, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MewFirstBookScript, -1
	object_event 14,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansion1FEscapeRope, EVENT_POKEMON_MANSION_1F_ESCAPE_ROPE
	object_event 18, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansion1FCarbos, EVENT_POKEMON_MANSION_1F_CARBOS

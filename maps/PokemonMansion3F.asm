	object_const_def
	const POKEMON_MANSION_3F_POKE_BALL1
	const POKEMON_MANSION_3F_POKE_BALL2
	const POKEMON_MANSION_3F_POKE_BALL3

PokemonMansion3F_MapScripts:
	db 0 ; scene_scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Dummyscene4

.Dummyscene4
	checkevent EVENT_MANSION_SWITCH_ON
	iftrue .Donothing
	changeblock 14,  4, $07 ; clear
	changeblock 14, 10, $79 ; gate3
.Done:
	return

.Donothing
	changeblock 14,  4, $79 ; gate3
	changeblock 14, 10, $07 ; clear
	return

SwitchesScript3F:
	opentext
	writetext PressButton3FText
	cry MEW
	pause 15
	closetext
	checkevent EVENT_MANSION_SWITCH_ON
	iftrue .Cosacierta
	iffalse .Cosafalsa
	end

.Cosacierta:
	clearevent EVENT_MANSION_SWITCH_ON
	changeblock 14,  4, $07 ; clear
	changeblock 14, 10, $79 ; gate3
	end

.Cosafalsa:
	setevent EVENT_MANSION_SWITCH_ON
	changeblock 14,  4, $79 ; gate3
	changeblock 14, 10, $07 ; clear
	end

PressButton3FText:
	text "What?"
	line "A secret switch!"
	cont "Lets Press it!"
	done

PokemonMansion3FIron:
	itemball IRON

PokemonMansion3FUltraball:
	itemball ULTRA_BALL

PokemonMansion3FSmokeBall:
	itemball SMOKE_BALL

PokemonMansion3FHiddenGorgeousBox:
	hiddenitem GORGEOUS_BOX, EVENT_POKEMON_MANSION_3F_GORGEOUS_BOX

PokemonMansion3FHiddenBersekGene:
	hiddenitem BERSERK_GENE, EVENT_POKEMON_MANSION_3F_BERSERK_GENE

PokemonMansion3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  1, POKEMON_MANSION_2F, 2
	warp_event  7, 10, POKEMON_MANSION_2F, 3
	warp_event 25, 14, POKEMON_MANSION_2F, 4


	def_coord_events

	def_bg_events
	bg_event  4,  3, BGEVENT_READ, SwitchesScript3F
	bg_event 16, 10, BGEVENT_ITEM, PokemonMansion3FHiddenGorgeousBox
	bg_event  1,  9, BGEVENT_ITEM, PokemonMansion3FHiddenBersekGene

	def_object_events
	object_event 28, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansion3FIron, EVENT_POKEMON_MANSION_3F_IRON
	object_event 25,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansion3FUltraball, EVENT_POKEMON_MANSION_ULTRABALL
	object_event 14,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansion3FSmokeBall, EVENT_POKEMON_MANSION_3F_SMOKEBALL

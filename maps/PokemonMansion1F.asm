	object_const_def
	const POKEMONMANSION1F_POKEDEX

PokemonMansion1F_MapScripts:
	def_scene_scripts

	def_callbacks

MewFirstBookScript:
	opentext
	writetext MewText1
	waitbutton
	closetext
	end

MewText1:
	text "Diary: July 5"
	line "Guyana,"
	cont "South America"

	para "A new #MON was"
	line "discovered deep"
	cont "in the jungle."
	done

PokemonMansion1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 27, CINNABAR_ISLAND, 4
	warp_event  4, 27, CINNABAR_ISLAND, 4
	warp_event  6, 27, CINNABAR_ISLAND, 4
	warp_event  7, 27, CINNABAR_ISLAND, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  4, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MewFirstBookScript, -1
	
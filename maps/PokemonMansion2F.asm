	object_const_def

PokemonMansion2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokemonMansion2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 10, POKEMON_MANSION_1F, 5

	def_coord_events

	def_bg_events

	def_object_events

	object_const_def
	const SEAFOAM_ISLANDS_BOULDER1
	const SEAFOAM_ISLANDS_BOULDER2

SeafoamIslands_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SeafoamIslandsBoulder1:
	jumpstd StrengthBoulderScript

SeafoamIslandsBoulder2:
	jumpstd StrengthBoulderScript

SeafoamIslands_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, ROUTE_20, 2
	warp_event 26, 15, ROUTE_20, 1
	warp_event  7,  5, SEAFOAM_ISLANDS_B1F, 1
	warp_event 25,  3, SEAFOAM_ISLANDS_B1F, 2
	warp_event 23, 15, SEAFOAM_ISLANDS_B1F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event 25,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsBoulder1, -1
	object_event 15,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsBoulder2, -1

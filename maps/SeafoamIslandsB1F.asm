	object_const_def

SeafoamIslandsB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SeafoamIslandsB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8,  5, SEAFOAM_ISLANDS, 3
	warp_event 25,  3, SEAFOAM_ISLANDS, 4
	warp_event 23, 15, SEAFOAM_ISLANDS, 5
	warp_event  5,  3, SEAFOAM_ISLANDS_B2F, 1
	warp_event 13,  7, SEAFOAM_ISLANDS_B2F, 2
	warp_event 25, 11, SEAFOAM_ISLANDS_B2F, 3
	warp_event 19, 15, SEAFOAM_ISLANDS_B2F, 4

	def_coord_events

	def_bg_events

	def_object_events

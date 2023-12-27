	object_const_def

SeafoamIslandsB2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SeafoamIslandsB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  3, SEAFOAM_ISLANDS_B1F, 4
	warp_event 13,  7, SEAFOAM_ISLANDS_B1F, 5
	warp_event 26, 11, SEAFOAM_ISLANDS_B1F, 6
	warp_event 25,  3, SEAFOAM_ISLANDS_B3F, 1
	warp_event  5, 13, SEAFOAM_ISLANDS_B3F, 2
	warp_event 19, 15, SEAFOAM_ISLANDS_B1F, 7
	warp_event 25, 14, SEAFOAM_ISLANDS_B3F, 3

	def_coord_events

	def_bg_events

	def_object_events

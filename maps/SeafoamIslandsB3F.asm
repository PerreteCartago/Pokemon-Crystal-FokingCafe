	object_const_def

SeafoamIslandsB3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SeafoamIslandsB3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27,  3, SEAFOAM_ISLANDS_B2F, 4
	warp_event  7, 14, SEAFOAM_ISLANDS_B2F, 5
	warp_event 27, 16, SEAFOAM_ISLANDS_B2F, 7
	warp_event 27,  6, SEAFOAM_ISLANDS_B4F, 1
	warp_event 11,  9, SEAFOAM_ISLANDS_B4F, 2

	def_coord_events

	def_bg_events

	def_object_events

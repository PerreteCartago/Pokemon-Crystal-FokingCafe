	object_const_def
	const CINNABARMART_CLERK
	const CINNABARMART_GRANNY
	const CINNABARMART_COOLTRAINER_M

CinnabarMart_MapScripts:
	def_scene_scripts

	def_callbacks

CinnabarMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_CINNABAR
	closetext
	end

CinnabarMartGrannyScript:
	jumptextfaceplayer CinnabarMartGrannyText

CinnabarMartCooltrainerMScript:
	jumptextfaceplayer CinnabarMartCooltrainerMText

CinnabarMartGrannyText:
	text "Team Rocket built"
	line "the Pokémon house"
	cont "but they left."

	para "But nobody cared"
	line "About the #MON"
	cont "left behind."
	done

CinnabarMartCooltrainerMText:
	text "This place was"
	line "under the rocks"
	cont "not long ago."

	para "But FrenchOrange"
	line "and other nice"

	para "people helped us"
	line "to rebuild it"
	done

CinnabarMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CINNABAR_ISLAND, 2
	warp_event  3,  7, CINNABAR_ISLAND, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarMartClerkScript, -1
	object_event  7,  6, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarMartGrannyScript, -1
	object_event  5,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CinnabarMartCooltrainerMScript, -1

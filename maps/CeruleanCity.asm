	object_const_def
	const CERULEANCITY_COOLTRAINER_M
	const CERULEANCITY_SUPER_NERD
	const CERULEANCITY_SLOWPOKE
	const CERULEANCITY_COOLTRAINER_F
	const CERULEANCITY_FISHER
	const CERULEANCITY_YOUNGSTER
	const BULBASAURIO

CeruleanCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, CeruleanCityFlypointCallback

BulbasaurioScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BULBA
	iftrue .GotBulbasaur
	writetext YouTakeThisBulbaText
	yesorno
	iffalse .Refused
	writetext PoliceCountingOnYouText
	promptbutton
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedBulbaText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke BULBASAUR, 5
	setevent EVENT_GOT_BULBA
	writetext AlternatetiveText
	waitbutton
	closetext
	end

.NoRoom:
	writetext PoliPartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext PoliNoEeveeText
	waitbutton
	closetext
	end

.GotBulbasaur:
	writetext PoliPopWontWorkText
	waitbutton
	closetext
	end

CeruleanCityFlypointCallback:
	setflag ENGINE_FLYPOINT_CERULEAN
	endcallback

CeruleanCityCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext CeruleanCityCooltrainerMText1
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext CeruleanCityCooltrainerMText2
	waitbutton
	closetext
	end

CeruleanCitySuperNerdScript:
	jumptextfaceplayer CeruleanCitySuperNerdText

CeruleanCitySlowbro:
	opentext
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	closetext
	end

CeruleanCityCooltrainerFScript:
	faceplayer
	opentext
	writetext CeruleanCityCooltrainerFText1
	waitbutton
	closetext
	turnobject CERULEANCITY_COOLTRAINER_F, LEFT
	opentext
	writetext CeruleanCityCooltrainerFText2
	waitbutton
	closetext
	opentext
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	closetext
	opentext
	writetext CeruleanCityCooltrainerFText3
	waitbutton
	closetext
	end

CeruleanCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	iftrue .MetCeruleanRocket
.ReturnedMachinePart:
	writetext CeruleanCityFisherText
	waitbutton
	closetext
	end

.MetCeruleanRocket:
	writetext CeruleanCityFisherRocketTipText
	waitbutton
	closetext
	end

CeruleanCityYoungsterScript:
	faceplayer
	opentext
	writetext CeruleanCityYoungsterText1
	waitbutton
	closetext
	checkevent EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY
	iffalse .BerserkGenePingsItemfinder
	end

.BerserkGenePingsItemfinder:
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	waitsfx
	playsound SFX_TRANSACTION
	waitsfx
	showemote EMOTE_SHOCK, CERULEANCITY_YOUNGSTER, 15
	turnobject CERULEANCITY_YOUNGSTER, LEFT
	opentext
	writetext CeruleanCityYoungsterText2
	waitbutton
	closetext
	end

CeruleanCitySign:
	jumptext CeruleanCitySignText

CeruleanGymSign:
	jumptext CeruleanGymSignText

CeruleanBikeShopSign:
	jumptext CeruleanBikeShopSignText

CeruleanPoliceSign:
	jumptext CeruleanPoliceSignText

CeruleanCapeSign:
	jumptext CeruleanCapeSignText

CeruleanCaveSign:
	jumptext CeruleanCaveSignText

CeruleanLockedDoor:
	jumptext CeruleanLockedDoorText

CeruleanCityPokecenterSign:
	jumpstd PokecenterSignScript

CeruleanCityMartSign:
	jumpstd MartSignScript

CeruleanCityHiddenBerserkGene:
	hiddenitem BERSERK_GENE, EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY

YouTakeThisBulbaText:
	text "Sorry Kid, you"
	line "cant go in there"

	para "Kanto goverment"
	line "spend our taxes"
	
	para "in free to use"
	line "Pokemon Centers,"

	para "We dont even own"
	line "a police station"

	para "We failed to the."
	line "Kanto people and"

	para "the Team Rocket"
	line "is more dangerous"
	cont "every day."

	para "We found a Pokemon"
	line "in the crime scene"

	para "Can I count on you"
	line "to save him,"
	cont "<PLAYER>?"
	done

PoliceCountingOnYouText:
	text "Good, I knew you'd"
	line "come through!"

	para "You are a good"
	line "citizen. Bye"

	para "Keep yourself"
	line "out of troubles."
	done

ReceivedBulbaText:
	text "<PLAYER> received"
	line "BULBASAUR!"
	done

AlternatetiveText:
	text "Dont you dare to"
	line "mistreat him"

	para "The power of law"
	line "will fall upon you."
	done

PoliPartyFullText:
	text "Whoa, wait. You"
	line "can't carry any"
	cont "more #MON."
	done

PoliNoEeveeText:
	text "What?"
	line "Why?"
	done

PoliPopWontWorkText:
	text "Something terrible"
	line "happened here and"

	para "this is a game"
	line "for kids."

	para "Please, you have"
	line "to leave."
	cont "Now."

CeruleanCityCooltrainerMText1:
	text "KANTO's POWER"
	line "PLANT?"

	para "It's near the end"
	line "of ROUTE 9, the"

	para "road that heads"
	line "east from here."

	para "I think there was"
	line "an accident of"
	cont "some sort there."
	done

CeruleanCityCooltrainerMText2:
	text "You're collecting"
	line "every single kind"
	cont "of #MON?"

	para "That must be quite"
	line "a challenge, but"
	cont "it sounds fun too."
	done

CeruleanCitySuperNerdText:
	text "The CAPE in the"
	line "north is a good"

	para "place for dates."
	line "Girls like it!"
	done

CeruleanCitySlowbroText:
	text "SLOWBRO: Yarah?"
	done

CeruleanCityCooltrainerFText1:
	text "My SLOWBRO and I"
	line "make an awesome"
	cont "combination!"
	done

CeruleanCityCooltrainerFText2:
	text "SLOWBRO, show me"
	line "your CONFUSION!"
	done

CeruleanCityCooltrainerFText3:
	text "…"
	done

CeruleanCityFisherText:
	text "I'm a huge fan of"
	line "CERULEAN GYM's"
	cont "MISTY."
	done

CeruleanCityFisherRocketTipText:
	text "I saw this shady"
	line "guy go off toward"
	cont "CERULEAN's CAPE."
	done

CeruleanCityYoungsterText1:
	text "There used to be a"
	line "cave here that had"

	para "horribly powerful"
	line "#MON in it."
	done

CeruleanCityYoungsterText2:
	text "Ayuh?"

	para "My ITEMFINDER is"
	line "responding…"
	done

CeruleanCitySignText:
	text "CERULEAN CITY"

	para "A Mysterious Blue"
	line "Aura Surrounds It"
	done

CeruleanGymSignText:
	text "CERULEAN CITY"
	line "#MON GYM"
	cont "LEADER: MISTY"

	para "The Tomboyish"
	line "Mermaid"
	done

CeruleanCaveSignText:
	text "Cerulean Cave"
	done

CeruleanBikeShopSignText:
	text "There's a notice"
	line "here…"

	para "The BIKE SHOP has"
	line "moved to GOLDENROD"
	cont "CITY in JOHTO…"
	done

CeruleanPoliceSignText:
	text "There's a notice"
	line "here…"

	para "Stamp out thievery"
	line "and make the city"

	para "a friendlier, more"
	line "cheerful place!"

	para "CERULEAN POLICE"
	done

CeruleanCapeSignText:
	text "CERULEAN CAPE"
	line "AHEAD"
	done

CeruleanLockedDoorText:
	text "It's locked…"
	done

CeruleanCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 15, CERULEAN_GYM_BADGE_SPEECH_HOUSE, 1
	warp_event 28, 17, CERULEAN_POLICE_STATION, 1
	warp_event 13, 19, CERULEAN_TRADE_SPEECH_HOUSE, 1
	warp_event 19, 21, CERULEAN_POKECENTER_1F, 1
	warp_event 30, 23, CERULEAN_GYM, 1
	warp_event 25, 29, CERULEAN_MART, 2
	warp_event  4, 11, CERULEAN_CAVE_1F, 1

	def_coord_events

	def_bg_events
	bg_event 23, 23, BGEVENT_READ, CeruleanCitySign
	bg_event 27, 25, BGEVENT_READ, CeruleanGymSign
	bg_event 11, 29, BGEVENT_READ, CeruleanBikeShopSign
	bg_event 25, 17, BGEVENT_READ, CeruleanPoliceSign
	bg_event 23,  7, BGEVENT_READ, CeruleanCapeSign
	bg_event 14, 29, BGEVENT_READ, CeruleanLockedDoor
	bg_event 20, 21, BGEVENT_READ, CeruleanCityPokecenterSign
	bg_event  5, 13, BGEVENT_READ, CeruleanCaveSign
	bg_event 26, 29, BGEVENT_READ, CeruleanCityMartSign
	bg_event  6, 12, BGEVENT_ITEM, CeruleanCityHiddenBerserkGene

	def_object_events
	object_event 15, 23, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerMScript, -1
	object_event 23, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCitySuperNerdScript, -1
	object_event 20, 24, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCitySlowbro, -1
	object_event 21, 24, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerFScript, -1
	object_event 30, 26, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityFisherScript, -1
	object_event  8, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityYoungsterScript, -1
	object_event 15, 16, SPRITE_OFFICERJENNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BulbasaurioScript, -1

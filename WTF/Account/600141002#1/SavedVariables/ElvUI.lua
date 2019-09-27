
ElvDB = {
	["profileKeys"] = {
		["白银兽骑团委 - 碧玉矿洞"] = "碧玉矿洞",
		["白银兽骑团员 - 碧玉矿洞"] = "碧玉矿洞",
		["白銀諾艾爾 - 碧玉矿洞"] = "碧玉矿洞",
	},
	["gold"] = {
		["碧玉矿洞"] = {
			["白银兽骑团委"] = 64,
			["白銀諾艾爾"] = 365550,
			["白银兽骑团友"] = 0,
			["白银兽骑团员"] = 35091,
		},
	},
	["class"] = {
		["碧玉矿洞"] = {
			["白银兽骑团委"] = "MAGE",
			["白銀諾艾爾"] = "PALADIN",
			["白银兽骑团友"] = "DRUID",
			["白银兽骑团员"] = "HUNTER",
		},
	},
	["global"] = {
		["general"] = {
			["smallerWorldMap"] = false,
			["WorldMapCoordinates"] = {
				["enable"] = false,
				["yOffset"] = -8,
				["position"] = "BOTTOM",
			},
			["UIScale"] = 0.8,
			["fadeMapWhenMoving"] = false,
			["smallerWorldMapScale"] = 0.5,
		},
		["unitframe"] = {
			["aurafilters"] = {
				["paladin"] = {
					["spells"] = {
						[1032] = {
							["enable"] = true,
							["priority"] = 0,
							["stackThreshold"] = 0,
						},
						[19746] = {
							["enable"] = true,
							["priority"] = 0,
							["stackThreshold"] = 0,
						},
						[10300] = {
							["enable"] = true,
							["priority"] = 0,
							["stackThreshold"] = 0,
						},
						[13819] = {
							["enable"] = true,
							["priority"] = 0,
							["stackThreshold"] = 0,
						},
					},
					["type"] = "Blacklist",
				},
			},
		},
	},
	["profiles"] = {
		["碧玉矿洞"] = {
			["databars"] = {
				["experience"] = {
					["textFormat"] = "REM",
					["width"] = 348,
					["orientation"] = "HORIZONTAL",
					["textSize"] = 12,
					["height"] = 10,
				},
				["honor"] = {
					["height"] = 10,
					["orientation"] = "HORIZONTAL",
					["width"] = 222,
				},
				["reputation"] = {
					["enable"] = true,
					["width"] = 222,
					["height"] = 10,
					["orientation"] = "HORIZONTAL",
				},
				["azerite"] = {
					["orientation"] = "HORIZONTAL",
					["height"] = 10,
					["width"] = 222,
				},
			},
			["currentTutorial"] = 3,
			["general"] = {
				["totems"] = {
					["spacing"] = 8,
					["growthDirection"] = "HORIZONTAL",
					["size"] = 50,
				},
				["valuecolor"] = {
					["r"] = 0.67,
					["g"] = 0.83,
					["b"] = 0.45,
				},
				["topPanel"] = false,
				["bordercolor"] = {
					["r"] = 0,
					["g"] = 0,
					["b"] = 0,
				},
				["font"] = "聊天",
				["autoRepair"] = "PLAYER",
				["minimap"] = {
					["locationFont"] = "聊天",
					["icons"] = {
						["tracking"] = {
							["scale"] = 0.75,
							["xOffset"] = 0,
							["yOffset"] = -29,
						},
					},
					["size"] = 220,
				},
				["objectiveFrameHeight"] = 400,
				["talkingHeadFrameScale"] = 1,
				["bonusObjectivePosition"] = "AUTO",
				["itemLevel"] = {
					["itemLevelFont"] = "默认",
				},
			},
			["v11NamePlateReset"] = true,
			["hideTutorial"] = true,
			["auras"] = {
				["debuffs"] = {
					["countFontSize"] = 12,
					["durationFontSize"] = 12,
					["size"] = 40,
				},
				["font"] = "聊天",
				["fontOutline"] = "NONE",
				["buffs"] = {
					["countFontSize"] = 12,
					["durationFontSize"] = 12,
					["size"] = 40,
				},
			},
			["locplus"] = {
				["timer"] = 0.1,
			},
			["layoutSet"] = "tank",
			["movers"] = {
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,284",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,412",
				["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-244,-4",
				["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["LootFrameMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-388,437",
				["QuestWatchFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
				["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,737",
				["MicrobarMover"] = "BOTTOM,ElvUIParent,BOTTOM,275,4",
				["PetAB"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,267",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
				["ZoneAbility"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,142",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,222",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,209,153",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,415",
				["LossControlMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,507",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,482",
				["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,-1,-96",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,-1,-36",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,109",
				["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,40",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-209,153",
				["QuestTimerFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,142,-4",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-264",
				["AzeriteBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-245",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,0,75",
				["ElvAB_5"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-497,45",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,500,36",
				["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210",
				["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,0,4",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-163,-325",
				["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["ElvNP_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-207,274",
				["ElvUF_PetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-114,243",
				["HonorBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-255",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,209,229",
				["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,-1,-120",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,373",
				["ElvUF_TargetTargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,173",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,490,4",
				["ElvAB_4"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,499,44",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,4",
				["AlertFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,372",
				["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-244,-189",
				["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-4",
			},
			["tooltip"] = {
				["fontSize"] = 12,
				["cursorAnchor"] = true,
				["cursorAnchorType"] = "ANCHOR_CURSOR_RIGHT",
				["healthBar"] = {
					["font"] = "聊天",
					["fontOutline"] = "MONOCHROMEOUTLINE",
					["height"] = 12,
				},
				["npcID"] = false,
				["cursorAnchorY"] = -100,
				["font"] = "聊天",
			},
			["unitframe"] = {
				["fontSize"] = 14,
				["font"] = "聊天",
				["units"] = {
					["targettargettarget"] = {
						["debuffs"] = {
							["enable"] = false,
						},
						["enable"] = true,
						["name"] = {
							["attachTextTo"] = "Health",
							["text_format"] = "[name:medium]",
						},
						["height"] = 22,
						["buffs"] = {
							["sizeOverride"] = 15,
						},
					},
					["targettarget"] = {
						["debuffs"] = {
							["enable"] = false,
						},
						["disableTargetGlow"] = false,
						["name"] = {
							["text_format"] = "[name:medium]",
						},
						["infoPanel"] = {
							["height"] = 12,
						},
						["portrait"] = {
							["camDistanceScale"] = 1,
						},
						["height"] = 22,
						["buffs"] = {
							["sizeOverride"] = 15,
						},
					},
					["player"] = {
						["debuffs"] = {
							["sizeOverride"] = 0,
							["yOffset"] = 25,
						},
						["portrait"] = {
							["enable"] = true,
						},
						["classbar"] = {
							["height"] = 14,
						},
						["CombatIcon"] = {
							["anchorPoint"] = "TOPLEFT",
						},
						["castbar"] = {
							["enable"] = false,
							["insideInfoPanel"] = false,
							["width"] = 200,
							["height"] = 25,
						},
						["healPrediction"] = {
							["showOverAbsorbs"] = false,
						},
						["disableMouseoverGlow"] = true,
						["width"] = 200,
						["infoPanel"] = {
							["enable"] = true,
						},
						["name"] = {
							["text_format"] = "[level]  [name]",
						},
						["power"] = {
							["height"] = 12,
							["attachTextTo"] = "InfoPanel",
						},
						["height"] = 50,
						["buffs"] = {
							["attachTo"] = "FRAME",
							["enable"] = true,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
						},
					},
					["raid40"] = {
						["enable"] = false,
						["rdebuffs"] = {
							["font"] = "聊天",
						},
					},
					["target"] = {
						["debuffs"] = {
							["anchorPoint"] = "TOPLEFT",
							["attachTo"] = "FRAME",
							["enable"] = false,
						},
						["portrait"] = {
							["enable"] = true,
						},
						["orientation"] = "LEFT",
						["aurabar"] = {
							["friendlyAuraType"] = "HARMFUL",
							["attachTo"] = "BUFFS",
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["height"] = 12,
						},
						["healPrediction"] = {
							["showOverAbsorbs"] = false,
						},
						["disableMouseoverGlow"] = true,
						["width"] = 200,
						["infoPanel"] = {
							["enable"] = true,
						},
						["castbar"] = {
							["insideInfoPanel"] = false,
							["width"] = 200,
							["height"] = 20,
						},
						["fader"] = {
							["hover"] = true,
							["combat"] = true,
							["power"] = true,
							["enable"] = false,
							["health"] = true,
							["playertarget"] = true,
							["casting"] = true,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
						},
						["height"] = 50,
						["buffs"] = {
							["anchorPoint"] = "TOPLEFT",
						},
						["name"] = {
							["text_format"] = "[level]  [name:medium]",
						},
					},
					["raid"] = {
						["infoPanel"] = {
							["enable"] = true,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["position"] = "BOTTOMLEFT",
							["xOffset"] = 2,
						},
						["visibility"] = "[@raid6,noexists] hide;show",
						["rdebuffs"] = {
							["xOffset"] = 30,
							["yOffset"] = 25,
							["font"] = "聊天",
							["size"] = 30,
						},
						["growthDirection"] = "RIGHT_UP",
						["resurrectIcon"] = {
							["attachTo"] = "BOTTOMRIGHT",
						},
						["numGroups"] = 8,
						["width"] = 92,
						["health"] = {
							["frequentUpdates"] = true,
						},
						["roleIcon"] = {
							["attachTo"] = "InfoPanel",
							["position"] = "BOTTOMRIGHT",
							["xOffset"] = 0,
							["size"] = 12,
						},
					},
					["pet"] = {
						["debuffs"] = {
							["anchorPoint"] = "TOPRIGHT",
							["enable"] = true,
						},
						["portrait"] = {
							["camDistanceScale"] = 2,
						},
						["width"] = 270,
						["infoPanel"] = {
							["height"] = 14,
						},
						["disableTargetGlow"] = false,
						["castbar"] = {
							["width"] = 270,
							["iconSize"] = 32,
						},
					},
					["party"] = {
						["showPlayer"] = false,
						["height"] = 74,
						["buffs"] = {
							["anchorPoint"] = "BOTTOMLEFT",
							["perrow"] = 10,
							["attachTo"] = "POWER",
							["enable"] = true,
						},
						["rdebuffs"] = {
							["font"] = "聊天",
						},
						["buffIndicator"] = {
							["enable"] = false,
						},
						["power"] = {
							["height"] = 13,
						},
						["width"] = 231,
						["health"] = {
							["text_format"] = "[health:current] ([health:deficit])",
							["yOffset"] = -20,
						},
						["verticalSpacing"] = 30,
					},
				},
				["smoothbars"] = true,
				["colors"] = {
					["healthclass"] = true,
					["castClassColor"] = true,
					["castColor"] = {
						["r"] = 0.1,
						["g"] = 0.1,
						["b"] = 0.1,
					},
					["health"] = {
						["r"] = 0.1,
						["g"] = 0.1,
						["b"] = 0.1,
					},
					["auraBarBuff"] = {
						["r"] = 0.96,
						["g"] = 0.55,
						["b"] = 0.73,
					},
				},
				["fontOutline"] = "NONE",
				["thinBorders"] = true,
			},
			["datatexts"] = {
				["font"] = "聊天",
				["localtime"] = false,
			},
			["actionbar"] = {
				["bar3"] = {
					["buttonspacing"] = 1,
					["buttons"] = 10,
					["buttonsPerRow"] = 12,
					["visibility"] = "[petbattle] hide; show",
				},
				["font"] = "聊天",
				["backdropSpacingConverted"] = true,
				["bar1"] = {
					["buttonspacing"] = 1,
					["buttons"] = 10,
				},
				["microbar"] = {
					["enabled"] = true,
					["buttonSize"] = 17,
				},
				["bar2"] = {
					["buttonspacing"] = 1,
					["enabled"] = true,
					["buttons"] = 10,
					["visibility"] = "[petbattle] hide; show",
				},
				["bar5"] = {
					["buttons"] = 12,
					["backdrop"] = true,
					["point"] = "TOPLEFT",
					["buttonsPerRow"] = 4,
					["visibility"] = "[petbattle] hide; show",
				},
				["bar6"] = {
					["buttonspacing"] = 1,
					["enabled"] = true,
					["buttons"] = 10,
					["visibility"] = "[petbattle] hide; show",
				},
				["macrotext"] = true,
				["bar4"] = {
					["point"] = "TOPLEFT",
					["buttonsPerRow"] = 4,
					["visibility"] = "[petbattle] hide; show",
				},
			},
			["nameplates"] = {
				["units"] = {
					["ENEMY_NPC"] = {
						["debuffs"] = {
							["yOffset"] = 1,
							["size"] = 22,
						},
						["health"] = {
							["height"] = 18,
							["text"] = {
								["format"] = "[health:current]",
							},
						},
						["buffs"] = {
							["enable"] = false,
						},
					},
					["FRIENDLY_NPC"] = {
						["enable"] = false,
					},
					["FRIENDLY_PLAYER"] = {
						["debuffs"] = {
							["enable"] = false,
						},
						["portrait"] = {
							["enable"] = true,
						},
						["buffs"] = {
							["enable"] = false,
						},
					},
					["PLAYER"] = {
						["castbar"] = {
							["font"] = "默认",
						},
						["buffs"] = {
							["countFontOutline"] = "NONE",
						},
					},
				},
				["font"] = "聊天",
			},
			["chat"] = {
				["tabFont"] = "聊天",
				["font"] = "聊天",
				["tapFontSize"] = 12,
				["panelWidth"] = 472,
				["fontSize"] = 12,
				["panelColorConverted"] = true,
				["panelHeight"] = 182,
				["timeStampFormat"] = "%H:%M ",
			},
			["bags"] = {
				["itemLevelFont"] = "聊天",
				["bagSize"] = 42,
				["itemLevelCustomColorEnable"] = true,
				["bankSize"] = 42,
				["countFontSize"] = 12,
				["itemLevelFontSize"] = 12,
				["scrapIcon"] = true,
				["bagWidth"] = 474,
				["countFont"] = "聊天",
				["vendorGrays"] = {
					["enable"] = true,
				},
				["bankWidth"] = 474,
			},
		},
		["Minimalistic"] = {
			["currentTutorial"] = 2,
			["general"] = {
				["font"] = "Expressway",
				["bottomPanel"] = false,
				["backdropfadecolor"] = {
					["a"] = 0.80000001192093,
					["b"] = 0.058823529411765,
					["g"] = 0.058823529411765,
					["r"] = 0.058823529411765,
				},
				["reputation"] = {
					["orientation"] = "HORIZONTAL",
					["textFormat"] = "PERCENT",
					["height"] = 16,
					["width"] = 200,
				},
				["bordercolor"] = {
					["b"] = 0.30588235294118,
					["g"] = 0.30588235294118,
					["r"] = 0.30588235294118,
				},
				["fontSize"] = 11,
				["valuecolor"] = {
					["a"] = 1,
					["b"] = 1,
					["g"] = 1,
					["r"] = 1,
				},
			},
			["movers"] = {
				["PetAB"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-428",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,51,120",
				["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,50,50",
				["GMMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,250,-50",
				["BossButton"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-117,-298",
				["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,249,-216",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,50,827",
				["MicrobarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-52",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,51,-87",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,143",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,392,1073",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,50",
				["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,90",
				["ElvAB_4"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-394",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,0,-186",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,305,50",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-305,50",
				["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,51,937",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-228",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-122,-393",
				["BNETMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,50,232",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,50,1150",
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,133",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-50,50",
				["ElvAB_6"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-488,330",
				["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-50,50",
				["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,50,995",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,463,50",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,200",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-230,140",
				["ElvUF_PartyMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,184,773",
				["AlertFrameMover"] = "TOP,ElvUIParent,TOP,0,-50",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,230,140",
				["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-50",
			},
			["bags"] = {
				["itemLevelFontSize"] = 9,
				["countFontSize"] = 9,
			},
			["hideTutorial"] = true,
			["auras"] = {
				["font"] = "Expressway",
				["debuffs"] = {
					["countFontSize"] = 11,
					["durationFontSize"] = 11,
				},
				["buffs"] = {
					["countFontSize"] = 11,
					["maxWraps"] = 2,
					["durationFontSize"] = 11,
				},
			},
			["unitframe"] = {
				["statusbar"] = "ElvUI Blank",
				["fontOutline"] = "THICKOUTLINE",
				["smoothbars"] = true,
				["fontSize"] = 9,
				["font"] = "Expressway",
				["units"] = {
					["tank"] = {
						["enable"] = false,
					},
					["targettarget"] = {
						["infoPanel"] = {
							["enable"] = true,
						},
						["debuffs"] = {
							["enable"] = false,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["position"] = "TOP",
							["yOffset"] = -2,
						},
						["height"] = 50,
						["width"] = 122,
					},
					["target"] = {
						["debuffs"] = {
							["perrow"] = 7,
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["hideonnpc"] = false,
							["text_format"] = "[powercolor][power:current-max]",
							["height"] = 15,
						},
						["infoPanel"] = {
							["enable"] = true,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[healthcolor][health:current-max]",
						},
						["height"] = 80,
						["buffs"] = {
							["perrow"] = 7,
						},
						["smartAuraPosition"] = "DEBUFFS_ON_BUFFS",
						["castbar"] = {
							["iconSize"] = 54,
							["iconAttached"] = false,
						},
					},
					["raid"] = {
						["roleIcon"] = {
							["position"] = "RIGHT",
						},
						["debuffs"] = {
							["enable"] = true,
							["sizeOverride"] = 27,
							["perrow"] = 4,
						},
						["rdebuffs"] = {
							["enable"] = false,
							["font"] = "Expressway",
						},
						["growthDirection"] = "UP_RIGHT",
						["health"] = {
							["yOffset"] = -6,
						},
						["groupsPerRowCol"] = 5,
						["height"] = 28,
						["name"] = {
							["position"] = "LEFT",
						},
						["visibility"] = "[nogroup] hide;show",
						["width"] = 140,
					},
					["player"] = {
						["infoPanel"] = {
							["enable"] = true,
						},
						["debuffs"] = {
							["perrow"] = 7,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[healthcolor][health:current-max]",
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[powercolor][power:current-max]",
							["height"] = 15,
						},
						["height"] = 80,
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
						},
						["classbar"] = {
							["height"] = 15,
							["autoHide"] = true,
						},
						["castbar"] = {
							["iconAttached"] = false,
							["iconSize"] = 54,
							["height"] = 35,
							["width"] = 478,
						},
					},
					["raid40"] = {
						["enable"] = false,
						["rdebuffs"] = {
							["font"] = "Expressway",
						},
					},
					["focus"] = {
						["infoPanel"] = {
							["height"] = 17,
							["enable"] = true,
						},
						["threatStyle"] = "NONE",
						["castbar"] = {
							["iconSize"] = 26,
							["width"] = 122,
						},
						["height"] = 56,
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["position"] = "LEFT",
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[healthcolor][health:current]",
						},
						["width"] = 189,
					},
					["assist"] = {
						["enable"] = false,
					},
					["arena"] = {
						["spacing"] = 26,
						["castbar"] = {
							["width"] = 246,
						},
					},
					["party"] = {
						["horizontalSpacing"] = 3,
						["debuffs"] = {
							["numrows"] = 4,
							["anchorPoint"] = "BOTTOM",
							["perrow"] = 1,
						},
						["power"] = {
							["text_format"] = "",
							["height"] = 5,
						},
						["enable"] = false,
						["rdebuffs"] = {
							["font"] = "Expressway",
						},
						["growthDirection"] = "RIGHT_DOWN",
						["infoPanel"] = {
							["enable"] = true,
						},
						["width"] = 110,
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["orientation"] = "VERTICAL",
							["text_format"] = "[healthcolor][health:current]",
							["position"] = "RIGHT",
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name:short]",
							["position"] = "LEFT",
						},
						["height"] = 59,
						["verticalSpacing"] = 0,
						["healPrediction"] = true,
						["roleIcon"] = {
							["position"] = "TOPRIGHT",
						},
					},
					["pet"] = {
						["infoPanel"] = {
							["enable"] = true,
							["height"] = 14,
						},
						["debuffs"] = {
							["enable"] = true,
						},
						["threatStyle"] = "NONE",
						["castbar"] = {
							["width"] = 122,
						},
						["height"] = 50,
						["portrait"] = {
							["camDistanceScale"] = 2,
						},
						["width"] = 122,
					},
				},
			},
			["datatexts"] = {
				["minimapPanels"] = false,
				["fontSize"] = 11,
				["panelTransparency"] = true,
				["goldFormat"] = "SHORT",
				["leftChatPanel"] = false,
				["font"] = "Expressway",
				["panels"] = {
					["BottomMiniPanel"] = "Time",
					["RightMiniPanel"] = "",
					["RightChatDataPanel"] = {
						["right"] = "",
						["left"] = "",
						["middle"] = "",
					},
					["LeftMiniPanel"] = "",
					["LeftChatDataPanel"] = {
						["right"] = "",
						["left"] = "",
						["middle"] = "",
					},
				},
				["rightChatPanel"] = false,
			},
			["actionbar"] = {
				["bar3"] = {
					["inheritGlobalFade"] = true,
					["buttonsize"] = 38,
					["buttonsPerRow"] = 3,
				},
				["fontSize"] = 9,
				["bar2"] = {
					["enabled"] = true,
					["inheritGlobalFade"] = true,
					["buttonsize"] = 38,
				},
				["bar1"] = {
					["heightMult"] = 2,
					["inheritGlobalFade"] = true,
					["buttonsize"] = 38,
				},
				["bar5"] = {
					["inheritGlobalFade"] = true,
					["buttonsize"] = 38,
					["buttonsPerRow"] = 3,
				},
				["globalFadeAlpha"] = 0.87,
				["stanceBar"] = {
					["inheritGlobalFade"] = true,
				},
				["bar6"] = {
					["buttonsize"] = 38,
				},
				["bar4"] = {
					["enabled"] = false,
					["backdrop"] = false,
					["buttonsize"] = 38,
				},
			},
			["layoutSet"] = "dpsMelee",
			["nameplates"] = {
				["filters"] = {
				},
			},
			["tooltip"] = {
				["textFontSize"] = 11,
				["font"] = "Expressway",
				["healthBar"] = {
					["font"] = "Expressway",
				},
				["headerFontSize"] = 11,
				["fontSize"] = 11,
				["smallTextFontSize"] = 11,
			},
			["chat"] = {
				["chatHistory"] = false,
				["fontSize"] = 11,
				["tabFont"] = "Expressway",
				["tabFontSize"] = 11,
				["fadeUndockedTabs"] = false,
				["editBoxPosition"] = "ABOVE_CHAT",
				["fadeTabsNoBackdrop"] = false,
				["font"] = "Expressway",
				["panelBackdrop"] = "HIDEBOTH",
			},
		},
	},
}
ElvPrivateDB = {
	["profileKeys"] = {
		["白银兽骑团委 - 碧玉矿洞"] = "白银兽骑团委 - 碧玉矿洞",
		["白银兽骑团友 - 碧玉矿洞"] = "白银兽骑团友 - 碧玉矿洞",
		["白银兽骑团员 - 碧玉矿洞"] = "白银兽骑团员 - 碧玉矿洞",
		["白銀諾艾爾 - 碧玉矿洞"] = "白銀諾艾爾 - 碧玉矿洞",
	},
	["profiles"] = {
		["白银兽骑团委 - 碧玉矿洞"] = {
			["install_complete"] = "1.08",
		},
		["白银兽骑团友 - 碧玉矿洞"] = {
		},
		["白银兽骑团员 - 碧玉矿洞"] = {
			["bags"] = {
				["enable"] = false,
			},
			["install_complete"] = "1.05",
		},
		["白銀諾艾爾 - 碧玉矿洞"] = {
			["theme"] = "class",
			["bags"] = {
				["enable"] = false,
			},
			["general"] = {
				["chatBubbleFontSize"] = 12,
				["chatBubbles"] = "backdrop_noborder",
				["chatBubbleFont"] = "聊天",
				["namefont"] = "默认",
				["dmgfont"] = "伤害数字",
			},
			["install_complete"] = "1.03",
		},
	},
}

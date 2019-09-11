
ElvDB = {
	["profileKeys"] = {
		["白银兽骑团员 - 碧玉矿洞"] = "碧玉矿洞",
		["白銀諾艾爾 - 碧玉矿洞"] = "碧玉矿洞",
	},
	["gold"] = {
		["碧玉矿洞"] = {
			["白银兽骑团员"] = 9670,
			["白銀諾艾爾"] = 318627,
		},
	},
	["class"] = {
		["碧玉矿洞"] = {
			["白银兽骑团员"] = "HUNTER",
			["白銀諾艾爾"] = "PALADIN",
		},
	},
	["global"] = {
		["general"] = {
			["smallerWorldMap"] = false,
			["WorldMapCoordinates"] = {
				["enable"] = false,
				["position"] = "BOTTOM",
				["yOffset"] = -8,
			},
			["UIScale"] = 0.8,
			["fadeMapWhenMoving"] = false,
			["smallerWorldMapScale"] = 0.5,
		},
	},
	["profiles"] = {
		["Minimalistic"] = {
			["currentTutorial"] = 2,
			["general"] = {
				["font"] = "Expressway",
				["bottomPanel"] = false,
				["backdropfadecolor"] = {
					["a"] = 0.80000001192093,
					["r"] = 0.058823529411765,
					["g"] = 0.058823529411765,
					["b"] = 0.058823529411765,
				},
				["reputation"] = {
					["orientation"] = "HORIZONTAL",
					["textFormat"] = "PERCENT",
					["height"] = 16,
					["width"] = 200,
				},
				["bordercolor"] = {
					["r"] = 0.30588235294118,
					["g"] = 0.30588235294118,
					["b"] = 0.30588235294118,
				},
				["valuecolor"] = {
					["a"] = 1,
					["r"] = 1,
					["g"] = 1,
					["b"] = 1,
				},
				["fontSize"] = 11,
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
				["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-50",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,230,140",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-122,-393",
				["BNETMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,50,232",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,50,1150",
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,133",
				["ElvUF_PartyMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,184,773",
				["ElvAB_6"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-488,330",
				["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-50,50",
				["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,50,995",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,200",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-230,140",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,463,50",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-50,50",
				["AlertFrameMover"] = "TOP,ElvUIParent,TOP,0,-50",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-228",
				["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,51,937",
			},
			["bags"] = {
				["itemLevelFontSize"] = 9,
				["countFontSize"] = 9,
			},
			["hideTutorial"] = true,
			["auras"] = {
				["font"] = "Expressway",
				["buffs"] = {
					["countFontSize"] = 11,
					["maxWraps"] = 2,
					["durationFontSize"] = 11,
				},
				["debuffs"] = {
					["countFontSize"] = 11,
					["durationFontSize"] = 11,
				},
			},
			["unitframe"] = {
				["statusbar"] = "ElvUI Blank",
				["fontOutline"] = "THICKOUTLINE",
				["smoothbars"] = true,
				["font"] = "Expressway",
				["fontSize"] = 9,
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
							["yOffset"] = -2,
							["position"] = "TOP",
						},
						["height"] = 50,
						["width"] = 122,
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
						["castbar"] = {
							["iconAttached"] = false,
							["iconSize"] = 54,
							["height"] = 35,
							["width"] = 478,
						},
						["classbar"] = {
							["height"] = 15,
							["autoHide"] = true,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
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
						["roleIcon"] = {
							["position"] = "TOPRIGHT",
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["orientation"] = "VERTICAL",
							["text_format"] = "[healthcolor][health:current]",
							["position"] = "RIGHT",
						},
						["healPrediction"] = true,
						["height"] = 59,
						["verticalSpacing"] = 0,
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name:short]",
							["position"] = "LEFT",
						},
						["width"] = 110,
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
						["castbar"] = {
							["width"] = 246,
						},
						["spacing"] = 26,
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
						["width"] = 140,
						["height"] = 28,
						["name"] = {
							["position"] = "LEFT",
						},
						["visibility"] = "[nogroup] hide;show",
						["groupsPerRowCol"] = 5,
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
						["castbar"] = {
							["iconSize"] = 54,
							["iconAttached"] = false,
						},
						["height"] = 80,
						["buffs"] = {
							["perrow"] = 7,
						},
						["smartAuraPosition"] = "DEBUFFS_ON_BUFFS",
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[healthcolor][health:current-max]",
						},
					},
				},
			},
			["datatexts"] = {
				["minimapPanels"] = false,
				["fontSize"] = 11,
				["leftChatPanel"] = false,
				["goldFormat"] = "SHORT",
				["panelTransparency"] = true,
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
			["tooltip"] = {
				["textFontSize"] = 11,
				["font"] = "Expressway",
				["healthBar"] = {
					["font"] = "Expressway",
				},
				["smallTextFontSize"] = 11,
				["fontSize"] = 11,
				["headerFontSize"] = 11,
			},
			["nameplates"] = {
				["filters"] = {
				},
			},
		},
		["碧玉矿洞"] = {
			["databars"] = {
				["reputation"] = {
					["enable"] = true,
					["width"] = 222,
					["height"] = 10,
					["orientation"] = "HORIZONTAL",
				},
				["azerite"] = {
					["width"] = 222,
					["height"] = 10,
					["orientation"] = "HORIZONTAL",
				},
				["experience"] = {
					["textFormat"] = "REM",
					["width"] = 348,
					["height"] = 10,
					["textSize"] = 12,
					["orientation"] = "HORIZONTAL",
				},
				["honor"] = {
					["width"] = 222,
					["height"] = 10,
					["orientation"] = "HORIZONTAL",
				},
			},
			["currentTutorial"] = 3,
			["general"] = {
				["totems"] = {
					["spacing"] = 8,
					["size"] = 50,
					["growthDirection"] = "HORIZONTAL",
				},
				["valuecolor"] = {
					["b"] = 0.73,
					["g"] = 0.55,
					["r"] = 0.96,
				},
				["font"] = "聊天",
				["minimap"] = {
					["locationFont"] = "聊天",
					["size"] = 220,
				},
				["objectiveFrameHeight"] = 400,
				["talkingHeadFrameScale"] = 1,
				["bonusObjectivePosition"] = "AUTO",
				["itemLevel"] = {
					["itemLevelFont"] = "默认",
				},
				["bordercolor"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
				},
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
				["bankWidth"] = 474,
			},
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
			["layoutSet"] = "tank",
			["movers"] = {
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,284",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,368",
				["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-244,-4",
				["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["LootFrameMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-388,437",
				["QuestWatchFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
				["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,737",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
				["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,142",
				["ZoneAbility"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,209,153",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,222",
				["LossControlMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,507",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,482",
				["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,-1,-96",
				["ElvAB_4"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,499,44",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,109",
				["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,40",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,4",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,373",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-264",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,-1,-36",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,0,75",
				["ElvUF_TargetTargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,173",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,490,4",
				["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,-1,-120",
				["ElvAB_5"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-497,45",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-163,-325",
				["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,500,36",
				["ElvUF_PetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-114,243",
				["HonorBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-255",
				["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,0,4",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,209,229",
				["ElvNP_PlayerMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-481,4",
				["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-209,153",
				["AzeriteBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-245",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,415",
				["AlertFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,372",
				["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-244,-189",
				["PetAB"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,267",
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
				["spellID"] = false,
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
							["enable"] = false,
						},
						["portrait"] = {
							["enable"] = true,
						},
						["CombatIcon"] = {
							["anchorPoint"] = "TOPLEFT",
						},
						["classbar"] = {
							["height"] = 14,
						},
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
						["name"] = {
							["text_format"] = "[level]  [name]",
						},
						["castbar"] = {
							["enable"] = false,
							["insideInfoPanel"] = false,
							["width"] = 200,
							["height"] = 25,
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
						["height"] = 50,
						["aurabar"] = {
							["friendlyAuraType"] = "HARMFUL",
							["attachTo"] = "BUFFS",
						},
						["castbar"] = {
							["insideInfoPanel"] = false,
							["width"] = 200,
							["height"] = 20,
						},
						["healPrediction"] = {
							["showOverAbsorbs"] = false,
						},
						["disableMouseoverGlow"] = true,
						["width"] = 200,
						["infoPanel"] = {
							["enable"] = true,
						},
						["power"] = {
							["xOffset"] = -2,
							["attachTextTo"] = "InfoPanel",
							["height"] = 12,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["xOffset"] = 2,
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
						["orientation"] = "LEFT",
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
					["party"] = {
						["showPlayer"] = false,
						["height"] = 74,
						["verticalSpacing"] = 30,
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
						["buffs"] = {
							["anchorPoint"] = "BOTTOMLEFT",
							["perrow"] = 10,
							["attachTo"] = "POWER",
							["enable"] = true,
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
				},
				["smoothbars"] = true,
				["colors"] = {
					["healthclass"] = true,
					["castClassColor"] = true,
					["castColor"] = {
						["b"] = 0.1,
						["g"] = 0.1,
						["r"] = 0.1,
					},
					["health"] = {
						["b"] = 0.1,
						["g"] = 0.1,
						["r"] = 0.1,
					},
					["auraBarBuff"] = {
						["b"] = 0.73,
						["g"] = 0.55,
						["r"] = 0.96,
					},
				},
				["fontOutline"] = "NONE",
				["thinBorders"] = true,
			},
			["datatexts"] = {
				["font"] = "聊天",
			},
			["actionbar"] = {
				["bar3"] = {
					["buttonspacing"] = 1,
					["buttons"] = 10,
					["buttonsPerRow"] = 12,
					["visibility"] = "[petbattle] hide; show",
				},
				["bar1"] = {
					["buttonspacing"] = 1,
					["buttons"] = 10,
				},
				["font"] = "聊天",
				["backdropSpacingConverted"] = true,
				["bar2"] = {
					["buttonspacing"] = 1,
					["enabled"] = true,
					["buttons"] = 10,
					["visibility"] = "[petbattle] hide; show",
				},
				["bar6"] = {
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
						["health"] = {
							["height"] = 18,
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
			["v11NamePlateReset"] = true,
			["chat"] = {
				["tabFont"] = "聊天",
				["font"] = "聊天",
				["tapFontSize"] = 12,
				["panelWidth"] = 472,
				["fontSize"] = 12,
				["panelColorConverted"] = true,
				["panelHeight"] = 182,
			},
		},
		["白银兽骑团员 - 碧玉矿洞"] = {
			["movers"] = {
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,432",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,956",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,195",
				["ElvUF_RaidMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,427",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,736",
			},
			["currentTutorial"] = 1,
			["v11NamePlateReset"] = true,
			["chat"] = {
				["panelColorConverted"] = true,
			},
		},
		["白銀諾艾爾 - 碧玉矿洞"] = {
			["databars"] = {
				["reputation"] = {
					["enable"] = true,
					["orientation"] = "HORIZONTAL",
					["height"] = 10,
					["width"] = 222,
				},
				["honor"] = {
					["height"] = 10,
					["orientation"] = "HORIZONTAL",
					["width"] = 222,
				},
				["experience"] = {
					["height"] = 10,
					["orientation"] = "HORIZONTAL",
					["textSize"] = 12,
					["width"] = 348,
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
					["growthDirection"] = "HORIZONTAL",
					["size"] = 50,
					["spacing"] = 8,
				},
				["itemLevel"] = {
					["itemLevelFont"] = "默认",
				},
				["talkingHeadFrameScale"] = 1,
				["bordercolor"] = {
					["r"] = 0,
					["g"] = 0,
					["b"] = 0,
				},
				["minimap"] = {
					["size"] = 220,
					["locationFont"] = "聊天",
				},
				["font"] = "聊天",
				["bonusObjectivePosition"] = "AUTO",
				["valuecolor"] = {
					["r"] = 0.96,
					["g"] = 0.55,
					["b"] = 0.73,
				},
				["objectiveFrameHeight"] = 400,
			},
			["movers"] = {
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,284",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,368",
				["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-244,-4",
				["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["LootFrameMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-388,437",
				["ZoneAbility"] = "BOTTOM,ElvUIParent,BOTTOM,-1,293",
				["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,737",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
				["ExperienceBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,43",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,209,153",
				["LossControlMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,507",
				["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,-1,-120",
				["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,-1,-96",
				["PetAB"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,267",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,105",
				["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,57",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["ElvAB_4"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,498,44",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,373",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-264",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,-1,-36",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,0,4",
				["ElvUF_TargetTargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,173",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,482",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,500,36",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-209,153",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-163,-325",
				["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["ElvNP_PlayerMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-481,4",
				["AzeriteBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-245",
				["HonorBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-255",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,209,229",
				["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210",
				["ElvUF_PetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-114,243",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,222",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,490,4",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-92,57",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,415",
				["AlertFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,372",
				["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-244,-189",
				["QuestWatchFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4",
			},
			["v11NamePlateReset"] = true,
			["hideTutorial"] = true,
			["auras"] = {
				["buffs"] = {
					["countFontSize"] = 12,
					["size"] = 40,
					["durationFontSize"] = 12,
				},
				["debuffs"] = {
					["countFontSize"] = 12,
					["size"] = 40,
					["durationFontSize"] = 12,
				},
				["font"] = "聊天",
				["fontOutline"] = "NONE",
			},
			["chat"] = {
				["font"] = "聊天",
				["panelColorConverted"] = true,
				["panelHeight"] = 182,
				["tabFont"] = "聊天",
				["fontSize"] = 12,
				["tapFontSize"] = 12,
				["panelWidth"] = 472,
			},
			["unitframe"] = {
				["fontSize"] = 14,
				["colors"] = {
					["auraBarBuff"] = {
						["r"] = 0.96,
						["g"] = 0.55,
						["b"] = 0.73,
					},
					["castClassColor"] = true,
					["castColor"] = {
						["b"] = 0.1,
						["g"] = 0.1,
						["r"] = 0.1,
					},
					["health"] = {
						["b"] = 0.1,
						["g"] = 0.1,
						["r"] = 0.1,
					},
					["healthclass"] = true,
				},
				["fontOutline"] = "NONE",
				["font"] = "聊天",
				["smoothbars"] = true,
				["thinBorders"] = true,
				["units"] = {
					["player"] = {
						["debuffs"] = {
							["sizeOverride"] = 0,
						},
						["portrait"] = {
							["enable"] = true,
						},
						["castbar"] = {
							["enable"] = false,
							["width"] = 200,
							["height"] = 25,
							["insideInfoPanel"] = false,
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
						["health"] = {
							["attachTextTo"] = "InfoPanel",
						},
						["height"] = 50,
						["CombatIcon"] = {
							["anchorPoint"] = "TOPLEFT",
						},
						["classbar"] = {
							["height"] = 14,
						},
						["power"] = {
							["height"] = 12,
							["attachTextTo"] = "InfoPanel",
						},
					},
					["party"] = {
						["power"] = {
							["height"] = 13,
						},
						["height"] = 74,
						["showPlayer"] = false,
						["rdebuffs"] = {
							["font"] = "聊天",
						},
						["width"] = 231,
					},
					["raid40"] = {
						["enable"] = false,
						["rdebuffs"] = {
							["font"] = "聊天",
						},
					},
					["targettarget"] = {
						["infoPanel"] = {
							["height"] = 12,
						},
						["disableTargetGlow"] = false,
						["height"] = 22,
						["buffs"] = {
							["enable"] = true,
							["sizeOverride"] = 15,
						},
						["portrait"] = {
							["camDistanceScale"] = 1,
						},
						["name"] = {
							["text_format"] = "[name:medium]",
						},
					},
					["target"] = {
						["debuffs"] = {
							["anchorPoint"] = "TOPLEFT",
							["enable"] = false,
							["attachTo"] = "FRAME",
						},
						["portrait"] = {
							["enable"] = true,
						},
						["castbar"] = {
							["height"] = 20,
							["width"] = 200,
							["insideInfoPanel"] = false,
						},
						["power"] = {
							["xOffset"] = -2,
							["height"] = 12,
							["attachTextTo"] = "InfoPanel",
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
							["text_format"] = "[level]  [name:medium]",
						},
						["fader"] = {
							["hover"] = true,
							["combat"] = true,
							["power"] = true,
							["enable"] = false,
							["casting"] = true,
							["health"] = true,
							["playertarget"] = true,
						},
						["height"] = 50,
						["orientation"] = "LEFT",
						["buffs"] = {
							["anchorPoint"] = "TOPLEFT",
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["xOffset"] = 2,
						},
						["aurabar"] = {
							["friendlyAuraType"] = "HARMFUL",
							["attachTo"] = "BUFFS",
						},
					},
					["raid"] = {
						["roleIcon"] = {
							["attachTo"] = "InfoPanel",
							["size"] = 12,
							["xOffset"] = 0,
							["position"] = "BOTTOMRIGHT",
						},
						["rdebuffs"] = {
							["xOffset"] = 30,
							["font"] = "聊天",
							["size"] = 30,
							["yOffset"] = 25,
						},
						["numGroups"] = 8,
						["growthDirection"] = "RIGHT_UP",
						["infoPanel"] = {
							["enable"] = true,
						},
						["resurrectIcon"] = {
							["attachTo"] = "BOTTOMRIGHT",
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["xOffset"] = 2,
							["position"] = "BOTTOMLEFT",
						},
						["health"] = {
							["frequentUpdates"] = true,
						},
						["visibility"] = "[@raid6,noexists] hide;show",
						["width"] = 92,
					},
					["pet"] = {
						["infoPanel"] = {
							["height"] = 14,
						},
						["debuffs"] = {
							["anchorPoint"] = "TOPRIGHT",
							["enable"] = true,
						},
						["portrait"] = {
							["camDistanceScale"] = 2,
						},
						["castbar"] = {
							["iconSize"] = 32,
							["width"] = 270,
						},
						["disableTargetGlow"] = false,
						["width"] = 270,
					},
					["targettargettarget"] = {
						["enable"] = true,
						["buffs"] = {
							["enable"] = true,
							["sizeOverride"] = 15,
						},
						["name"] = {
							["attachTextTo"] = "Health",
							["text_format"] = "[name:medium]",
						},
						["height"] = 22,
					},
				},
			},
			["datatexts"] = {
				["font"] = "聊天",
			},
			["actionbar"] = {
				["bar3"] = {
					["buttons"] = 9,
					["buttonspacing"] = 1,
					["buttonsPerRow"] = 10,
					["buttonsize"] = 38,
					["visibility"] = "[petbattle] hide; show",
				},
				["font"] = "聊天",
				["bar4"] = {
					["visibility"] = "[petbattle] hide; show",
					["buttonsPerRow"] = 4,
				},
				["bar2"] = {
					["enabled"] = true,
					["buttons"] = 9,
					["buttonspacing"] = 1,
					["buttonsize"] = 44,
					["visibility"] = "[petbattle] hide; show",
				},
				["bar1"] = {
					["buttonspacing"] = 1,
					["buttonsize"] = 44,
					["buttons"] = 9,
				},
				["bar6"] = {
					["visibility"] = "[petbattle] hide; show",
				},
				["bar5"] = {
					["enabled"] = false,
					["visibility"] = "[petbattle] hide; show",
				},
				["backdropSpacingConverted"] = true,
			},
			["layoutSet"] = "tank",
			["bags"] = {
				["countFontSize"] = 12,
				["countFont"] = "聊天",
				["itemLevelFont"] = "聊天",
				["vendorGrays"] = {
					["enable"] = true,
				},
				["bagSize"] = 42,
				["itemLevelFontSize"] = 12,
				["bankWidth"] = 474,
				["scrapIcon"] = true,
				["itemLevelCustomColorEnable"] = true,
				["bagWidth"] = 474,
				["bankSize"] = 42,
			},
			["nameplates"] = {
				["font"] = "聊天",
				["units"] = {
					["ENEMY_NPC"] = {
						["health"] = {
							["height"] = 18,
						},
						["buffs"] = {
							["enable"] = false,
						},
					},
					["PLAYER"] = {
						["buffs"] = {
							["countFontOutline"] = "NONE",
						},
						["castbar"] = {
							["font"] = "默认",
						},
					},
				},
			},
			["tooltip"] = {
				["cursorAnchorY"] = -100,
				["fontSize"] = 12,
				["cursorAnchor"] = true,
				["spellID"] = false,
				["cursorAnchorType"] = "ANCHOR_CURSOR_RIGHT",
				["font"] = "聊天",
				["healthBar"] = {
					["height"] = 12,
					["font"] = "聊天",
					["fontOutline"] = "MONOCHROMEOUTLINE",
				},
				["npcID"] = false,
			},
		},
	},
}
ElvPrivateDB = {
	["profileKeys"] = {
		["白银兽骑团员 - 碧玉矿洞"] = "白银兽骑团员 - 碧玉矿洞",
		["白銀諾艾爾 - 碧玉矿洞"] = "白銀諾艾爾 - 碧玉矿洞",
	},
	["profiles"] = {
		["白银兽骑团员 - 碧玉矿洞"] = {
			["install_complete"] = "1.05",
			["bags"] = {
				["enable"] = false,
			},
		},
		["白銀諾艾爾 - 碧玉矿洞"] = {
			["general"] = {
				["dmgfont"] = "伤害数字",
				["namefont"] = "默认",
			},
			["bags"] = {
				["enable"] = false,
			},
			["theme"] = "class",
			["install_complete"] = "1.03",
		},
	},
}

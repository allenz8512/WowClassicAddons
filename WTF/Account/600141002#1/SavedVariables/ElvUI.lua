
ElvDB = {
	["profileKeys"] = {
		["白銀諾艾爾 - 碧玉矿洞"] = "碧玉矿洞",
		["白银兽骑团员 - 碧玉矿洞"] = "碧玉矿洞",
		["白银兽骑团委 - 碧玉矿洞"] = "碧玉矿洞",
	},
	["gold"] = {
		["碧玉矿洞"] = {
			["白银兽骑团委"] = 64,
			["白银兽骑团员"] = 16451,
			["白银兽骑团友"] = 0,
			["白銀諾艾爾"] = 271384,
		},
	},
	["class"] = {
		["碧玉矿洞"] = {
			["白银兽骑团委"] = "MAGE",
			["白银兽骑团员"] = "HUNTER",
			["白银兽骑团友"] = "DRUID",
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
				["topPanel"] = false,
				["bordercolor"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
				},
				["font"] = "聊天",
				["autoRepair"] = "PLAYER",
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
					["progressBar"] = false,
				},
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
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,209,153",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,222",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,4",
				["LossControlMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,507",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,482",
				["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,-1,-96",
				["ElvAB_4"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,499,44",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,109",
				["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,40",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,490,4",
				["QuestTimerFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,142,-4",
				["ElvAB_5"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-497,45",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,-1,-36",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,0,75",
				["ElvUF_TargetTargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,173",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,373",
				["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,-1,-120",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,209,229",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-163,-325",
				["BNETMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-4,-274",
				["ElvNP_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-207,274",
				["ElvUF_PetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-114,243",
				["HonorBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-255",
				["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,0,4",
				["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,368,-210",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,500,36",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-264",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-209,153",
				["AzeriteBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-245",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,415",
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
						["fader"] = {
							["hover"] = true,
							["combat"] = true,
							["power"] = true,
							["enable"] = false,
							["health"] = true,
							["playertarget"] = true,
							["casting"] = true,
						},
						["name"] = {
							["text_format"] = "[level]  [name:medium]",
						},
						["orientation"] = "LEFT",
						["buffs"] = {
							["anchorPoint"] = "TOPLEFT",
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["xOffset"] = 2,
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
							["text_format"] = "[healthcolor][health:current-max-percent]",
							["yOffset"] = -20,
						},
						["verticalSpacing"] = 30,
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
				["timeStampFormat"] = "%H:%M ",
			},
		},
	},
}
ElvPrivateDB = {
	["profileKeys"] = {
		["白銀諾艾爾 - 碧玉矿洞"] = "白銀諾艾爾 - 碧玉矿洞",
		["白银兽骑团友 - 碧玉矿洞"] = "白银兽骑团友 - 碧玉矿洞",
		["白银兽骑团员 - 碧玉矿洞"] = "白银兽骑团员 - 碧玉矿洞",
		["白银兽骑团委 - 碧玉矿洞"] = "白银兽骑团委 - 碧玉矿洞",
	},
	["profiles"] = {
		["白銀諾艾爾 - 碧玉矿洞"] = {
			["general"] = {
				["chatBubbleFont"] = "聊天",
				["dmgfont"] = "伤害数字",
				["chatBubbleFontSize"] = 12,
				["chatBubbles"] = "backdrop_noborder",
				["namefont"] = "默认",
			},
			["bags"] = {
				["enable"] = false,
			},
			["theme"] = "class",
			["install_complete"] = "1.03",
		},
		["白银兽骑团友 - 碧玉矿洞"] = {
		},
		["白银兽骑团员 - 碧玉矿洞"] = {
			["bags"] = {
				["enable"] = false,
			},
			["install_complete"] = "1.05",
		},
		["白银兽骑团委 - 碧玉矿洞"] = {
			["install_complete"] = "1.08",
		},
	},
}

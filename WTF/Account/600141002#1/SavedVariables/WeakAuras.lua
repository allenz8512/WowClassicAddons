
WeakAurasSaved = {
	["dynamicIconCache"] = {
	},
	["displays"] = {
		["正义之怒"] = {
			["glow"] = false,
			["parent"] = "Protection Paladin",
			["yOffset"] = 24,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["matchesShowOn"] = "showAlways",
						["event"] = "Chat Message",
						["use_unit"] = true,
						["unit"] = "player",
						["names"] = {
						},
						["spellIds"] = {
						},
						["useExactSpellId"] = true,
						["auraspellids"] = {
							"25780", -- [1]
						},
						["unevent"] = "timed",
						["duration"] = "1",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "status",
						["genericShowOn"] = "showAlways",
						["unevent"] = "auto",
						["use_exact_spellName"] = true,
						["duration"] = "1",
						["event"] = "Cooldown Progress (Spell)",
						["subeventPrefix"] = "SPELL",
						["realSpellName"] = 25780,
						["use_spellName"] = true,
						["use_genericShowOn"] = true,
						["unit"] = "player",
						["subeventSuffix"] = "_CAST_START",
						["use_unit"] = true,
						["use_track"] = true,
						["spellName"] = 25780,
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
					},
				}, -- [2]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 24,
			["glowXOffset"] = 0,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%p",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["text_fontSize"] = 10,
					["text_visible"] = false,
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
				}, -- [1]
			},
			["height"] = 24,
			["anchorFrameType"] = "SCREEN",
			["load"] = {
				["use_class"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "PALADIN",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["alpha"] = 0.7,
			["glowFrequency"] = 0.25,
			["progressPrecision"] = 0,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["glowType"] = "Pixel",
			["glowThickness"] = 1,
			["keepAspectRatio"] = false,
			["authorOptions"] = {
			},
			["glowLines"] = 8,
			["regionType"] = "icon",
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["uid"] = "1qpyQAHUbcD",
			["xOffset"] = 188,
			["glowYOffset"] = 0,
			["zoom"] = 0,
			["auto"] = true,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = true,
			["glowScale"] = 1,
			["id"] = "正义之怒",
			["useglowColor"] = false,
			["frameStrata"] = 1,
			["width"] = 24,
			["icon"] = true,
			["config"] = {
			},
			["inverse"] = false,
			["glowLength"] = 4,
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "glow",
						}, -- [1]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = "<=",
						["variable"] = "expirationTime",
						["value"] = "30",
					},
					["changes"] = {
						{
							["value"] = {
								1, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["property"] = "glowColor",
						}, -- [1]
						{
							["value"] = true,
							["property"] = "sub.2.text_visible",
						}, -- [2]
					},
				}, -- [3]
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 2,
								["variable"] = "insufficientResources",
								["value"] = 1,
							}, -- [1]
							{
								["trigger"] = 1,
								["variable"] = "buffed",
								["value"] = 0,
							}, -- [2]
						},
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								0, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [4]
			},
			["cooldown"] = false,
			["glowBorder"] = false,
		},
		["圣疗术 2"] = {
			["glow"] = false,
			["parent"] = "Protection Paladin",
			["yOffset"] = 84,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["matchesShowOn"] = "showAlways",
						["genericShowOn"] = "showAlways",
						["unit"] = "player",
						["names"] = {
						},
						["spellName"] = 10310,
						["use_genericShowOn"] = true,
						["type"] = "status",
						["use_unit"] = true,
						["auraspellids"] = {
							"20293", -- [1]
							"20357", -- [2]
							"20348", -- [3]
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 10310,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["duration"] = "1",
						["useExactSpellId"] = true,
						["unevent"] = "auto",
						["use_track"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "status",
						["use_health"] = false,
						["unevent"] = "auto",
						["duration"] = "1",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["health"] = "20",
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["use_unit"] = true,
						["health_operator"] = "<=",
					},
					["untrigger"] = {
					},
				}, -- [2]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 24,
			["glowXOffset"] = 0,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%p",
					["text_color"] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["text_visible"] = false,
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorXOffset"] = 0,
					["text_fontSize"] = 10,
				}, -- [1]
			},
			["height"] = 24,
			["glowLines"] = 8,
			["load"] = {
				["use_class"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "PALADIN",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["alpha"] = 0.7,
			["glowFrequency"] = 0.25,
			["glowLength"] = 10,
			["keepAspectRatio"] = false,
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 3,
			["authorOptions"] = {
			},
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["xOffset"] = 0,
			["regionType"] = "icon",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["uid"] = "0)RvRmFy0Ut",
			["useglowColor"] = false,
			["glowYOffset"] = 0,
			["zoom"] = 0,
			["auto"] = true,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = false,
			["glowScale"] = 1,
			["id"] = "圣疗术 2",
			["width"] = 24,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["inverse"] = false,
			["selfPoint"] = "CENTER",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "spellUsable",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
						{
							["property"] = "glow",
						}, -- [2]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "insufficientResources",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								0, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [2]
				{
					["check"] = {
						["op"] = "<=",
						["checks"] = {
							{
								["value"] = 1,
								["variable"] = "onCooldown",
							}, -- [1]
							{
								["value"] = "30",
								["variable"] = "expirationTime",
								["op"] = "<=",
							}, -- [2]
						},
						["trigger"] = 1,
						["variable"] = "onCooldown",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.1.text_visible",
						}, -- [1]
						{
							["property"] = "glow",
						}, -- [2]
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [3]
					},
				}, -- [3]
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 1,
								["variable"] = "onCooldown",
								["value"] = 0,
							}, -- [1]
							{
								["trigger"] = 1,
								["variable"] = "insufficientResources",
								["value"] = 0,
							}, -- [2]
							{
								["trigger"] = 2,
								["op"] = "<=",
								["variable"] = "percenthealth",
								["value"] = "20",
							}, -- [3]
						},
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "glow",
						}, -- [1]
					},
				}, -- [4]
			},
			["cooldown"] = false,
			["glowBorder"] = false,
		},
		["生命值"] = {
			["sparkWidth"] = 180,
			["sparkOffsetX"] = 0,
			["parent"] = "Protection Paladin",
			["yOffset"] = 60,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "status",
						["unevent"] = "auto",
						["duration"] = "1",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["powertype"] = 0,
						["spellIds"] = {
						},
						["use_unit"] = true,
						["unit"] = "player",
						["names"] = {
						},
						["use_powertype"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["internalVersion"] = 24,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["barColor"] = {
				1, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["sparkOffsetY"] = 0,
			["subRegions"] = {
				{
					["type"] = "aurabar_bar",
				}, -- [1]
				{
					["text_shadowXOffset"] = 1,
					["type"] = "subtext",
					["text_text"] = "%p",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = -1,
					["text_selfPoint"] = "AUTO",
					["text_visible"] = true,
					["text_fontType"] = "None",
					["text_anchorPoint"] = "INNER_LEFT",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorXOffset"] = 0,
					["text_fontSize"] = 12,
				}, -- [2]
			},
			["height"] = 20,
			["load"] = {
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["spark"] = false,
			["selfPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["xOffset"] = -24,
			["authorOptions"] = {
			},
			["icon_side"] = "RIGHT",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkHeight"] = 30,
			["texture"] = "ElvUI Norm",
			["uid"] = "mSbZZQRv1ef",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["auto"] = true,
			["alpha"] = 0.7,
			["sparkHidden"] = "NEVER",
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["width"] = 180,
			["id"] = "生命值",
			["config"] = {
			},
			["inverse"] = false,
			["zoom"] = 0,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "percenthealth",
						["value"] = "20",
						["op"] = "<=",
					},
					["changes"] = {
						{
							["value"] = {
								["sound_type"] = "Play",
								["sound"] = "Interface\\AddOns\\ElvUI\\Media\\Sounds\\Warning.ogg",
								["sound_channel"] = "SFX",
							},
							["property"] = "sound",
						}, -- [1]
					},
				}, -- [1]
			},
			["icon"] = false,
			["color"] = {
			},
		},
		["圣印"] = {
			["glow"] = false,
			["parent"] = "Protection Paladin",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["auraspellids"] = {
							"20293", -- [1]
							"20357", -- [2]
							"20348", -- [3]
						},
						["subeventPrefix"] = "SPELL",
						["matchesShowOn"] = "showAlways",
						["event"] = "Chat Message",
						["use_unit"] = true,
						["useExactSpellId"] = true,
						["names"] = {
						},
						["spellIds"] = {
						},
						["unit"] = "player",
						["subeventSuffix"] = "_CAST_START",
						["unevent"] = "timed",
						["duration"] = "1",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "status",
						["genericShowOn"] = "showAlways",
						["unevent"] = "auto",
						["use_exact_spellName"] = true,
						["duration"] = "1",
						["event"] = "Cooldown Progress (Spell)",
						["subeventPrefix"] = "SPELL",
						["realSpellName"] = 20293,
						["use_spellName"] = true,
						["use_genericShowOn"] = true,
						["unit"] = "player",
						["subeventSuffix"] = "_CAST_START",
						["use_unit"] = true,
						["use_track"] = true,
						["spellName"] = 20293,
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
					},
				}, -- [2]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 24,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%s",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["rotateText"] = "NONE",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_visible"] = true,
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%p",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["text_visible"] = true,
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorXOffset"] = 0,
					["text_fontSize"] = 14,
				}, -- [2]
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%2.p",
					["text_color"] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["rotateText"] = "NONE",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_fontSize"] = 14,
					["anchorXOffset"] = 0,
					["text_visible"] = false,
				}, -- [3]
			},
			["height"] = 48,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["load"] = {
				["use_class"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "PALADIN",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["frameStrata"] = 1,
			["glowFrequency"] = 0.25,
			["glowXOffset"] = 0,
			["authorOptions"] = {
			},
			["glowType"] = "Pixel",
			["glowThickness"] = 3,
			["glowLines"] = 8,
			["glowLength"] = 10,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["config"] = {
			},
			["useglowColor"] = false,
			["width"] = 48,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = true,
			["zoom"] = 0,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "圣印",
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 0.7,
			["glowYOffset"] = 0,
			["xOffset"] = -48,
			["uid"] = "FUYcElT6pGE",
			["inverse"] = false,
			["selfPoint"] = "CENTER",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
						{
							["property"] = "glow",
						}, -- [2]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 1,
								["variable"] = "buffed",
								["value"] = 0,
							}, -- [1]
							{
								["trigger"] = 2,
								["variable"] = "onCooldown",
								["value"] = 1,
							}, -- [2]
						},
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.3.text_visible",
						}, -- [1]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "glow",
						}, -- [1]
					},
				}, -- [3]
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = "<=",
						["value"] = "5",
						["variable"] = "expirationTime",
					},
					["changes"] = {
						{
							["value"] = {
								1, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["property"] = "glowColor",
						}, -- [1]
					},
				}, -- [4]
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 2,
								["variable"] = "insufficientResources",
								["value"] = 1,
							}, -- [1]
							{
								["trigger"] = 1,
								["variable"] = "buffed",
								["value"] = 0,
							}, -- [2]
						},
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								0, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [5]
			},
			["cooldown"] = false,
			["glowBorder"] = false,
		},
		["Debuff"] = {
			["glow"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["yOffset"] = 24,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["subeventSuffix"] = "_CAST_START",
						["matchesShowOn"] = "showOnActive",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["names"] = {
						},
						["unit"] = "player",
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 24,
			["glowXOffset"] = 0,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["desaturate"] = false,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%s",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["text_visible"] = true,
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorXOffset"] = 0,
					["text_fontSize"] = 20,
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%p",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["rotateText"] = "NONE",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_fontSize"] = 20,
					["anchorXOffset"] = 0,
					["text_visible"] = true,
				}, -- [2]
			},
			["height"] = 64,
			["load"] = {
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["glowFrequency"] = 0.25,
			["progressPrecision"] = 0,
			["zoom"] = 0,
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 1,
			["uid"] = "F2IpVGf25gM",
			["xOffset"] = 240,
			["keepAspectRatio"] = false,
			["regionType"] = "icon",
			["width"] = 64,
			["glowLines"] = 8,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["glowLength"] = 10,
			["glowYOffset"] = 0,
			["alpha"] = 0.7,
			["cooldownTextDisabled"] = false,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "Debuff",
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["authorOptions"] = {
			},
			["config"] = {
			},
			["inverse"] = false,
			["useglowColor"] = false,
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 1,
								["variable"] = "debuffClass",
								["value"] = "disease",
								["op"] = "~=",
							}, -- [1]
							{
								["trigger"] = 1,
								["variable"] = "debuffClass",
								["value"] = "magic",
								["op"] = "~=",
							}, -- [2]
							{
								["trigger"] = 1,
								["variable"] = "debuffClass",
								["value"] = "poison",
								["op"] = "~=",
							}, -- [3]
						},
					},
					["changes"] = {
						{
							["property"] = "alpha",
						}, -- [1]
					},
				}, -- [1]
			},
			["parent"] = "Protection Paladin",
			["glowBorder"] = false,
		},
		["保护祝福"] = {
			["glow"] = true,
			["glowLength"] = 10,
			["yOffset"] = 56,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showAlways",
						["use_unit"] = true,
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
						["matchesShowOn"] = "showAlways",
						["type"] = "status",
						["auraspellids"] = {
							"20293", -- [1]
							"20357", -- [2]
							"20348", -- [3]
						},
						["useExactSpellId"] = true,
						["unevent"] = "auto",
						["duration"] = "1",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 10278,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["spellName"] = 10278,
						["subeventPrefix"] = "SPELL",
						["use_track"] = true,
						["names"] = {
						},
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 24,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["desaturate"] = false,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%p",
					["text_color"] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["text_fontSize"] = 10,
					["text_visible"] = false,
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
				}, -- [1]
			},
			["height"] = 24,
			["width"] = 24,
			["load"] = {
				["use_class"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "PALADIN",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["frameStrata"] = 1,
			["glowFrequency"] = 0.25,
			["parent"] = "Protection Paladin",
			["icon"] = true,
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 3,
			["glowXOffset"] = 0,
			["glowLines"] = 8,
			["xOffset"] = -236,
			["regionType"] = "icon",
			["progressPrecision"] = 0,
			["config"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchorFrameType"] = "SCREEN",
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = false,
			["zoom"] = 0,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "保护祝福",
			["useglowColor"] = false,
			["alpha"] = 0.7,
			["glowYOffset"] = 0,
			["selfPoint"] = "CENTER",
			["uid"] = "A6ZaLyqLVi8",
			["inverse"] = false,
			["authorOptions"] = {
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "spellUsable",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
						{
							["property"] = "glow",
						}, -- [2]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "insufficientResources",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								0, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [2]
				{
					["check"] = {
						["op"] = "<=",
						["checks"] = {
							{
								["value"] = 1,
								["variable"] = "onCooldown",
							}, -- [1]
							{
								["value"] = "30",
								["variable"] = "expirationTime",
								["op"] = "<=",
							}, -- [2]
						},
						["trigger"] = 1,
						["variable"] = "onCooldown",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.1.text_visible",
						}, -- [1]
						{
							["property"] = "glow",
						}, -- [2]
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [3]
					},
				}, -- [3]
			},
			["cooldown"] = false,
			["glowBorder"] = false,
		},
		["Protection Paladin"] = {
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["controlledChildren"] = {
				"武器", -- [1]
				"Debuff", -- [2]
				"神圣之盾", -- [3]
				"圣印", -- [4]
				"审判", -- [5]
				"奉献", -- [6]
				"奉献 2", -- [7]
				"审判效果", -- [8]
				"祝福", -- [9]
				"正义之怒", -- [10]
				"光环", -- [11]
				"保护祝福", -- [12]
				"牺牲祝福", -- [13]
				"圣疗术", -- [14]
				"生命值", -- [15]
				"魔法值", -- [16]
				"圣盾术", -- [17]
				"圣疗术 2", -- [18]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["authorOptions"] = {
			},
			["border"] = false,
			["yOffset"] = -190,
			["anchorPoint"] = "CENTER",
			["borderSize"] = 2,
			["uid"] = "BqpJOUGfRf)",
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["scale"] = 1,
			["borderOffset"] = 4,
			["borderEdge"] = "Square Full White",
			["selfPoint"] = "BOTTOMLEFT",
			["id"] = "Protection Paladin",
			["regionType"] = "group",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["internalVersion"] = 24,
			["config"] = {
			},
			["borderInset"] = 1,
			["subRegions"] = {
			},
			["conditions"] = {
			},
			["load"] = {
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["xOffset"] = 24,
		},
		["审判"] = {
			["glow"] = true,
			["parent"] = "Protection Paladin",
			["yOffset"] = 24,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["matchesShowOn"] = "showAlways",
						["genericShowOn"] = "showAlways",
						["unit"] = "player",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
						["subeventPrefix"] = "SPELL",
						["type"] = "status",
						["unevent"] = "auto",
						["useExactSpellId"] = true,
						["spellName"] = 20271,
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 20271,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["duration"] = "1",
						["use_unit"] = true,
						["auraspellids"] = {
							"20293", -- [1]
							"20357", -- [2]
							"20348", -- [3]
						},
						["use_track"] = true,
						["use_genericShowOn"] = true,
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 24,
			["glowXOffset"] = 0,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%p",
					["text_color"] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["text_visible"] = false,
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorXOffset"] = 0,
					["text_fontSize"] = 28,
				}, -- [1]
			},
			["height"] = 96,
			["anchorFrameType"] = "SCREEN",
			["load"] = {
				["use_class"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "PALADIN",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["alpha"] = 0.7,
			["glowFrequency"] = 0.25,
			["progressPrecision"] = 0,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 3,
			["keepAspectRatio"] = false,
			["authorOptions"] = {
			},
			["glowLines"] = 8,
			["regionType"] = "icon",
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["uid"] = "L1EidKV08j)",
			["xOffset"] = -168,
			["glowYOffset"] = 0,
			["zoom"] = 0,
			["auto"] = true,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = false,
			["glowScale"] = 1,
			["id"] = "审判",
			["useglowColor"] = false,
			["frameStrata"] = 1,
			["width"] = 96,
			["icon"] = true,
			["config"] = {
			},
			["inverse"] = false,
			["glowLength"] = 10,
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "spellUsable",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
						{
							["property"] = "glow",
						}, -- [2]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "insufficientResources",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								0, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "onCooldown",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.1.text_visible",
						}, -- [1]
						{
							["property"] = "glow",
						}, -- [2]
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [3]
					},
				}, -- [3]
			},
			["cooldown"] = false,
			["glowBorder"] = false,
		},
		["奉献"] = {
			["glow"] = true,
			["glowLength"] = 10,
			["yOffset"] = 24,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showAlways",
						["use_unit"] = true,
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
						["matchesShowOn"] = "showAlways",
						["type"] = "status",
						["auraspellids"] = {
							"20293", -- [1]
							"20357", -- [2]
							"20348", -- [3]
						},
						["useExactSpellId"] = true,
						["unevent"] = "auto",
						["duration"] = "1",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 20923,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["spellName"] = 20923,
						["subeventPrefix"] = "SPELL",
						["use_track"] = true,
						["names"] = {
						},
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 24,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["desaturate"] = false,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%p",
					["text_color"] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["text_fontSize"] = 28,
					["text_visible"] = false,
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
				}, -- [1]
			},
			["height"] = 96,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["load"] = {
				["use_class"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "PALADIN",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["frameStrata"] = 1,
			["glowFrequency"] = 0.25,
			["authorOptions"] = {
			},
			["glowXOffset"] = 0,
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 3,
			["parent"] = "Protection Paladin",
			["progressPrecision"] = 0,
			["glowLines"] = 8,
			["regionType"] = "icon",
			["xOffset"] = 120,
			["config"] = {
			},
			["icon"] = true,
			["width"] = 96,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = false,
			["zoom"] = 0,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "奉献",
			["glowYOffset"] = 0,
			["alpha"] = 0.7,
			["anchorFrameType"] = "SCREEN",
			["useglowColor"] = false,
			["uid"] = "mAxuKEYLdNz",
			["inverse"] = false,
			["selfPoint"] = "CENTER",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "spellUsable",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
						{
							["property"] = "glow",
						}, -- [2]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "insufficientResources",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								0, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "onCooldown",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.1.text_visible",
						}, -- [1]
						{
							["property"] = "glow",
						}, -- [2]
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [3]
					},
				}, -- [3]
			},
			["cooldown"] = false,
			["glowBorder"] = false,
		},
		["牺牲祝福"] = {
			["glow"] = true,
			["glowLength"] = 10,
			["yOffset"] = 24,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showAlways",
						["names"] = {
						},
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
						["matchesShowOn"] = "showAlways",
						["type"] = "status",
						["spellName"] = 20729,
						["auraspellids"] = {
							"20293", -- [1]
							"20357", -- [2]
							"20348", -- [3]
						},
						["use_unit"] = true,
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 20729,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["duration"] = "1",
						["unevent"] = "auto",
						["useExactSpellId"] = true,
						["use_track"] = true,
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 24,
			["glowXOffset"] = 0,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["desaturate"] = false,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%p",
					["text_color"] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["text_fontType"] = "OUTLINE",
					["text_visible"] = false,
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_fontSize"] = 10,
					["anchorXOffset"] = 0,
					["rotateText"] = "NONE",
				}, -- [1]
			},
			["height"] = 24,
			["glowLines"] = 8,
			["load"] = {
				["use_class"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "PALADIN",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["alpha"] = 0.7,
			["glowFrequency"] = 0.25,
			["selfPoint"] = "CENTER",
			["authorOptions"] = {
			},
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 3,
			["parent"] = "Protection Paladin",
			["keepAspectRatio"] = false,
			["progressPrecision"] = 0,
			["regionType"] = "icon",
			["icon"] = true,
			["uid"] = "TDwmHVSWO9e",
			["useglowColor"] = false,
			["glowYOffset"] = 0,
			["zoom"] = 0,
			["auto"] = true,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = false,
			["glowScale"] = 1,
			["id"] = "牺牲祝福",
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["width"] = 24,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["inverse"] = false,
			["xOffset"] = -236,
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "spellUsable",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
						{
							["property"] = "glow",
						}, -- [2]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "insufficientResources",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								0, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [2]
				{
					["check"] = {
						["op"] = "<=",
						["checks"] = {
							{
								["value"] = 1,
								["variable"] = "onCooldown",
							}, -- [1]
							{
								["value"] = "30",
								["variable"] = "expirationTime",
								["op"] = "<=",
							}, -- [2]
						},
						["trigger"] = 1,
						["variable"] = "onCooldown",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.1.text_visible",
						}, -- [1]
						{
							["property"] = "glow",
						}, -- [2]
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [3]
					},
				}, -- [3]
			},
			["cooldown"] = false,
			["glowBorder"] = false,
		},
		["祝福"] = {
			["glow"] = false,
			["parent"] = "Protection Paladin",
			["yOffset"] = 56,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["subeventSuffix"] = "_CAST_START",
						["use_unit"] = true,
						["matchesShowOn"] = "showAlways",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["duration"] = "1",
						["unevent"] = "timed",
						["spellIds"] = {
						},
						["auraspellids"] = {
							"20913", -- [1]
							"19854", -- [2]
							"19838", -- [3]
						},
						["useExactSpellId"] = true,
						["names"] = {
						},
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "status",
						["event"] = "Cooldown Progress (Spell)",
						["unevent"] = "auto",
						["subeventPrefix"] = "SPELL",
						["duration"] = "1",
						["genericShowOn"] = "showAlways",
						["use_exact_spellName"] = true,
						["realSpellName"] = 20913,
						["use_spellName"] = true,
						["use_unit"] = true,
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["use_genericShowOn"] = true,
						["use_track"] = true,
						["spellName"] = 20913,
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
					},
				}, -- [2]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 24,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%p",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["text_visible"] = false,
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorXOffset"] = 0,
					["text_fontSize"] = 10,
				}, -- [1]
			},
			["height"] = 24,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["load"] = {
				["use_class"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "PALADIN",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["frameStrata"] = 1,
			["glowFrequency"] = 0.25,
			["glowXOffset"] = 0,
			["authorOptions"] = {
			},
			["glowType"] = "Pixel",
			["glowThickness"] = 1,
			["glowLines"] = 8,
			["glowLength"] = 4,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["regionType"] = "icon",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["config"] = {
			},
			["useglowColor"] = false,
			["width"] = 24,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = true,
			["zoom"] = 0,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "祝福",
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 0.7,
			["glowYOffset"] = 0,
			["xOffset"] = 188,
			["uid"] = "dw21I(GjC2Y",
			["inverse"] = false,
			["selfPoint"] = "CENTER",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "glow",
						}, -- [1]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = "<=",
						["value"] = "30",
						["variable"] = "expirationTime",
					},
					["changes"] = {
						{
							["value"] = {
								1, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["property"] = "glowColor",
						}, -- [1]
						{
							["value"] = true,
							["property"] = "sub.2.text_visible",
						}, -- [2]
					},
				}, -- [3]
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 2,
								["variable"] = "insufficientResources",
								["value"] = 1,
							}, -- [1]
							{
								["trigger"] = 1,
								["variable"] = "buffed",
								["value"] = 0,
							}, -- [2]
						},
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								0, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [4]
			},
			["cooldown"] = false,
			["glowBorder"] = false,
		},
		["武器"] = {
			["glow"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["yOffset"] = 24,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["itemName"] = 0,
						["duration"] = "1",
						["genericShowOn"] = "showAlways",
						["unit"] = "player",
						["itemSlot"] = 16,
						["debuffType"] = "HELPFUL",
						["type"] = "status",
						["unevent"] = "auto",
						["use_equipped"] = true,
						["event"] = "Cooldown Progress (Equipment Slot)",
						["names"] = {
						},
						["use_itemSlot"] = true,
						["use_itemSetId"] = true,
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["use_itemName"] = true,
						["use_genericShowOn"] = true,
						["use_unit"] = true,
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
						["itemSlot"] = 16,
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 24,
			["glowXOffset"] = 0,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["desaturate"] = false,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["subRegions"] = {
			},
			["height"] = 64,
			["load"] = {
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["glowFrequency"] = 0.25,
			["zoom"] = 0,
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 1,
			["uid"] = "xDisX03LUJU",
			["xOffset"] = -288,
			["keepAspectRatio"] = false,
			["regionType"] = "icon",
			["width"] = 64,
			["glowLines"] = 8,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["glowLength"] = 10,
			["glowYOffset"] = 0,
			["alpha"] = 0.7,
			["cooldownTextDisabled"] = false,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "武器",
			["selfPoint"] = "CENTER",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["authorOptions"] = {
			},
			["config"] = {
			},
			["inverse"] = false,
			["useglowColor"] = false,
			["conditions"] = {
			},
			["parent"] = "Protection Paladin",
			["glowBorder"] = false,
		},
		["神圣之盾"] = {
			["glow"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["matchesShowOn"] = "showAlways",
						["event"] = "Chat Message",
						["use_unit"] = true,
						["unit"] = "player",
						["names"] = {
						},
						["spellIds"] = {
						},
						["useExactSpellId"] = true,
						["auraspellids"] = {
							"20927", -- [1]
						},
						["unevent"] = "timed",
						["duration"] = "1",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "status",
						["event"] = "Cooldown Progress (Spell)",
						["unevent"] = "auto",
						["subeventPrefix"] = "SPELL",
						["duration"] = "1",
						["genericShowOn"] = "showAlways",
						["use_exact_spellName"] = true,
						["realSpellName"] = 20927,
						["use_spellName"] = true,
						["use_unit"] = true,
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["use_genericShowOn"] = true,
						["use_track"] = true,
						["spellName"] = 20927,
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
					},
				}, -- [2]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 24,
			["glowXOffset"] = 0,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["desaturate"] = false,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%s",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["text_fontType"] = "OUTLINE",
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["rotateText"] = "NONE",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%p",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["rotateText"] = "NONE",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_fontSize"] = 14,
					["anchorXOffset"] = 0,
					["text_visible"] = true,
				}, -- [2]
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%2.p",
					["text_color"] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["text_fontType"] = "OUTLINE",
					["text_visible"] = false,
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_fontSize"] = 14,
					["anchorXOffset"] = 0,
					["rotateText"] = "NONE",
				}, -- [3]
			},
			["height"] = 48,
			["authorOptions"] = {
			},
			["load"] = {
				["use_class"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "PALADIN",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["alpha"] = 0.7,
			["glowFrequency"] = 0.25,
			["parent"] = "Protection Paladin",
			["glowLength"] = 10,
			["glowType"] = "Pixel",
			["glowThickness"] = 3,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["regionType"] = "icon",
			["glowLines"] = 8,
			["uid"] = "TXUjWXV89zq",
			["glowYOffset"] = 0,
			["anchorFrameType"] = "SCREEN",
			["zoom"] = 0,
			["auto"] = true,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = true,
			["glowScale"] = 1,
			["id"] = "神圣之盾",
			["useglowColor"] = false,
			["frameStrata"] = 1,
			["width"] = 48,
			["xOffset"] = 0,
			["config"] = {
			},
			["inverse"] = false,
			["progressPrecision"] = 0,
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 1,
								["variable"] = "buffed",
								["value"] = 0,
							}, -- [1]
							{
								["trigger"] = 2,
								["variable"] = "onCooldown",
								["value"] = 1,
							}, -- [2]
						},
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.3.text_visible",
						}, -- [1]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "glow",
						}, -- [1]
					},
				}, -- [3]
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = "<=",
						["variable"] = "expirationTime",
						["value"] = "3",
					},
					["changes"] = {
						{
							["value"] = {
								1, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["property"] = "glowColor",
						}, -- [1]
					},
				}, -- [4]
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 2,
								["variable"] = "insufficientResources",
								["value"] = 1,
							}, -- [1]
							{
								["trigger"] = 1,
								["variable"] = "buffed",
								["value"] = 0,
							}, -- [2]
						},
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								0, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [5]
			},
			["cooldown"] = false,
			["glowBorder"] = false,
		},
		["魔法值"] = {
			["sparkWidth"] = 180,
			["sparkOffsetX"] = 0,
			["parent"] = "Protection Paladin",
			["yOffset"] = 36,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["sparkRotationMode"] = "AUTO",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.5, -- [4]
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "status",
						["subeventSuffix"] = "_CAST_START",
						["duration"] = "1",
						["event"] = "Power",
						["subeventPrefix"] = "SPELL",
						["unevent"] = "auto",
						["powertype"] = 0,
						["spellIds"] = {
						},
						["use_unit"] = true,
						["names"] = {
						},
						["unit"] = "player",
						["use_powertype"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["internalVersion"] = 24,
			["selfPoint"] = "CENTER",
			["barColor"] = {
				0, -- [1]
				0, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["sparkOffsetY"] = 0,
			["subRegions"] = {
				{
					["type"] = "aurabar_bar",
				}, -- [1]
				{
					["text_shadowXOffset"] = 1,
					["type"] = "subtext",
					["text_text"] = "%p",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = -1,
					["text_selfPoint"] = "AUTO",
					["rotateText"] = "NONE",
					["text_fontType"] = "None",
					["text_anchorPoint"] = "INNER_LEFT",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_visible"] = true,
				}, -- [2]
			},
			["height"] = 20,
			["load"] = {
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["uid"] = "(wPsZ27zPPP",
			["icon"] = false,
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["xOffset"] = -24,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["icon_side"] = "RIGHT",
			["zoom"] = 0,
			["sparkHeight"] = 30,
			["texture"] = "ElvUI Norm",
			["id"] = "魔法值",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["spark"] = false,
			["config"] = {
			},
			["sparkHidden"] = "NEVER",
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["width"] = 180,
			["alpha"] = 0.7,
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["auto"] = true,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["authorOptions"] = {
			},
		},
		["审判效果"] = {
			["glow"] = false,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["subeventSuffix"] = "_CAST_START",
						["auraspellids"] = {
							"20355", -- [1]
							"20345", -- [2]
						},
						["subeventPrefix"] = "SPELL",
						["duration"] = "1",
						["event"] = "Chat Message",
						["unit"] = "target",
						["unitExists"] = true,
						["names"] = {
						},
						["spellIds"] = {
						},
						["unevent"] = "timed",
						["use_unit"] = true,
						["useExactSpellId"] = true,
						["matchesShowOn"] = "showAlways",
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 24,
			["glowXOffset"] = 0,
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["desaturate"] = false,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%p",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["text_fontType"] = "OUTLINE",
					["text_visible"] = true,
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["rotateText"] = "NONE",
				}, -- [1]
			},
			["height"] = 28,
			["load"] = {
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["alpha"] = 0.7,
			["glowFrequency"] = 0.25,
			["glowYOffset"] = 0,
			["width"] = 28,
			["glowType"] = "Pixel",
			["glowThickness"] = 2,
			["parent"] = "Protection Paladin",
			["progressPrecision"] = 0,
			["keepAspectRatio"] = false,
			["regionType"] = "icon",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["useglowColor"] = false,
			["uid"] = "cNRjdXU5aOF",
			["selfPoint"] = "CENTER",
			["cooldownTextDisabled"] = false,
			["auto"] = true,
			["zoom"] = 0,
			["useGlowColor"] = true,
			["glowScale"] = 1,
			["id"] = "审判效果",
			["authorOptions"] = {
			},
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["glowLength"] = 10,
			["config"] = {
			},
			["inverse"] = false,
			["xOffset"] = -96,
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
						{
							["property"] = "glow",
						}, -- [2]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "glow",
						}, -- [1]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "expirationTime",
						["value"] = "3",
						["op"] = "<=",
					},
					["changes"] = {
						{
							["value"] = {
								1, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["property"] = "glowColor",
						}, -- [1]
					},
				}, -- [3]
			},
			["glowLines"] = 8,
			["glowBorder"] = false,
		},
		["圣疗术"] = {
			["glow"] = true,
			["authorOptions"] = {
			},
			["yOffset"] = -8,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["matchesShowOn"] = "showAlways",
						["genericShowOn"] = "showAlways",
						["subeventPrefix"] = "SPELL",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
						["use_genericShowOn"] = true,
						["type"] = "status",
						["auraspellids"] = {
							"20293", -- [1]
							"20357", -- [2]
							"20348", -- [3]
						},
						["unevent"] = "auto",
						["useExactSpellId"] = true,
						["duration"] = "1",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 10310,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["use_unit"] = true,
						["spellName"] = 10310,
						["use_track"] = true,
						["unit"] = "player",
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 24,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%p",
					["text_color"] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["rotateText"] = "NONE",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_fontSize"] = 10,
					["anchorXOffset"] = 0,
					["text_visible"] = false,
				}, -- [1]
			},
			["height"] = 24,
			["anchorFrameType"] = "SCREEN",
			["glowLines"] = 8,
			["frameStrata"] = 1,
			["glowFrequency"] = 0.25,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["load"] = {
				["use_class"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "PALADIN",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 3,
			["xOffset"] = -236,
			["glowLength"] = 10,
			["progressPrecision"] = 0,
			["regionType"] = "icon",
			["glowXOffset"] = 0,
			["config"] = {
			},
			["icon"] = true,
			["width"] = 24,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = false,
			["zoom"] = 0,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "圣疗术",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["alpha"] = 0.7,
			["glowYOffset"] = 0,
			["useglowColor"] = false,
			["uid"] = "CshjXQjY)YR",
			["inverse"] = false,
			["parent"] = "Protection Paladin",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "spellUsable",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
						{
							["property"] = "glow",
						}, -- [2]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "insufficientResources",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								0, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [2]
				{
					["check"] = {
						["op"] = "<=",
						["checks"] = {
							{
								["value"] = 1,
								["variable"] = "onCooldown",
							}, -- [1]
							{
								["value"] = "30",
								["variable"] = "expirationTime",
								["op"] = "<=",
							}, -- [2]
						},
						["trigger"] = 1,
						["variable"] = "onCooldown",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.1.text_visible",
						}, -- [1]
						{
							["property"] = "glow",
						}, -- [2]
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [3]
					},
				}, -- [3]
			},
			["cooldown"] = false,
			["glowBorder"] = false,
		},
		["光环"] = {
			["glow"] = false,
			["glowLength"] = 4,
			["yOffset"] = -8,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["subeventSuffix"] = "_CAST_START",
						["use_unit"] = true,
						["matchesShowOn"] = "showAlways",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["duration"] = "1",
						["unevent"] = "timed",
						["spellIds"] = {
						},
						["auraspellids"] = {
							"10301", -- [1]
							"10292", -- [2]
							"19746", -- [3]
							"19896", -- [4]
							"19898", -- [5]
							"19899", -- [6]
						},
						["useExactSpellId"] = true,
						["names"] = {
						},
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 24,
			["keepAspectRatio"] = false,
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["desaturate"] = false,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["subRegions"] = {
			},
			["height"] = 24,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["load"] = {
				["use_class"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "PALADIN",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["frameStrata"] = 1,
			["glowFrequency"] = 0.25,
			["authorOptions"] = {
			},
			["glowXOffset"] = 0,
			["glowType"] = "Pixel",
			["glowThickness"] = 1,
			["parent"] = "Protection Paladin",
			["progressPrecision"] = 0,
			["glowLines"] = 8,
			["regionType"] = "icon",
			["xOffset"] = 188,
			["config"] = {
			},
			["icon"] = true,
			["width"] = 24,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = true,
			["zoom"] = 0,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "光环",
			["glowYOffset"] = 0,
			["alpha"] = 0.7,
			["anchorFrameType"] = "SCREEN",
			["useglowColor"] = false,
			["uid"] = "tafdZj)gT7t",
			["inverse"] = false,
			["selfPoint"] = "CENTER",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "glow",
						}, -- [1]
					},
				}, -- [2]
			},
			["cooldown"] = false,
			["glowBorder"] = false,
		},
		["奉献 2"] = {
			["glow"] = true,
			["authorOptions"] = {
			},
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["icon"] = true,
			["triggers"] = {
				{
					["trigger"] = {
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showAlways",
						["names"] = {
						},
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
						["matchesShowOn"] = "showAlways",
						["type"] = "status",
						["spellName"] = 26573,
						["auraspellids"] = {
							"20293", -- [1]
							"20357", -- [2]
							"20348", -- [3]
						},
						["use_unit"] = true,
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 26573,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["duration"] = "1",
						["unevent"] = "auto",
						["useExactSpellId"] = true,
						["use_track"] = true,
						["subeventPrefix"] = "SPELL",
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 24,
			["glowXOffset"] = 0,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%p",
					["text_color"] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["text_fontType"] = "OUTLINE",
					["text_visible"] = false,
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["rotateText"] = "NONE",
				}, -- [1]
			},
			["height"] = 30,
			["glowYOffset"] = 0,
			["load"] = {
				["use_class"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "PALADIN",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["alpha"] = 0.7,
			["glowFrequency"] = 0.25,
			["progressPrecision"] = 0,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 3,
			["keepAspectRatio"] = false,
			["glowLength"] = 10,
			["glowLines"] = 8,
			["regionType"] = "icon",
			["animation"] = {
				["start"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["main"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
				["finish"] = {
					["duration_type"] = "seconds",
					["type"] = "none",
				},
			},
			["uid"] = "JO73YMPNNhn",
			["xOffset"] = 48,
			["anchorFrameType"] = "SCREEN",
			["zoom"] = 0,
			["auto"] = true,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = false,
			["glowScale"] = 1,
			["id"] = "奉献 2",
			["useglowColor"] = false,
			["frameStrata"] = 1,
			["width"] = 30,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["config"] = {
			},
			["inverse"] = false,
			["parent"] = "Protection Paladin",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "spellUsable",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
						{
							["property"] = "glow",
						}, -- [2]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "insufficientResources",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								0, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "onCooldown",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.1.text_visible",
						}, -- [1]
						{
							["property"] = "glow",
						}, -- [2]
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [3]
					},
				}, -- [3]
			},
			["cooldown"] = false,
			["glowBorder"] = false,
		},
		["圣盾术"] = {
			["glow"] = false,
			["glowLength"] = 10,
			["yOffset"] = 84,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["icon"] = true,
			["useglowColor"] = false,
			["internalVersion"] = 24,
			["keepAspectRatio"] = false,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["progressPrecision"] = 0,
			["subRegions"] = {
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%p",
					["text_color"] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["text_fontSize"] = 10,
					["text_visible"] = false,
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
				}, -- [1]
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%3.p",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_font"] = "Friz Quadrata TT",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_shadowYOffset"] = 0,
					["text_selfPoint"] = "AUTO",
					["text_fontType"] = "OUTLINE",
					["text_visible"] = false,
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["rotateText"] = "NONE",
				}, -- [2]
			},
			["height"] = 24,
			["width"] = 24,
			["glowLines"] = 8,
			["frameStrata"] = 1,
			["glowFrequency"] = 0.25,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["load"] = {
				["use_class"] = true,
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "PALADIN",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 3,
			["glowXOffset"] = 0,
			["parent"] = "Protection Paladin",
			["xOffset"] = -48,
			["regionType"] = "icon",
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["main"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
				["finish"] = {
					["type"] = "none",
					["duration_type"] = "seconds",
				},
			},
			["config"] = {
			},
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["anchorFrameType"] = "SCREEN",
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = false,
			["zoom"] = 0,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "圣盾术",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["alpha"] = 0.7,
			["glowYOffset"] = 0,
			["triggers"] = {
				{
					["trigger"] = {
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showAlways",
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
						["spellName"] = 1020,
						["use_unit"] = true,
						["type"] = "status",
						["matchesShowOn"] = "showAlways",
						["auraspellids"] = {
							"20293", -- [1]
							"20357", -- [2]
							"20348", -- [3]
						},
						["unevent"] = "auto",
						["duration"] = "1",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 1020,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["useExactSpellId"] = true,
						["use_track"] = true,
						["names"] = {
						},
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "status",
						["use_health"] = false,
						["unevent"] = "auto",
						["duration"] = "1",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["health"] = "20",
						["health_operator"] = "<=",
						["use_unit"] = true,
						["unit"] = "player",
						["subeventSuffix"] = "_CAST_START",
					},
					["untrigger"] = {
					},
				}, -- [2]
				{
					["trigger"] = {
						["type"] = "aura2",
						["subeventSuffix"] = "_CAST_START",
						["matchesShowOn"] = "showAlways",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["auraspellids"] = {
							"1020", -- [1]
						},
						["unit"] = "player",
						["useExactSpellId"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [3]
				{
					["trigger"] = {
						["type"] = "aura2",
						["subeventSuffix"] = "_CAST_START",
						["matchesShowOn"] = "showAlways",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["auraspellids"] = {
							"25771", -- [1]
						},
						["unit"] = "player",
						["useExactSpellId"] = true,
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [4]
				["activeTriggerMode"] = -10,
			},
			["uid"] = "wPy034RpNRg",
			["inverse"] = false,
			["authorOptions"] = {
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "spellUsable",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
						{
							["property"] = "glow",
						}, -- [2]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "insufficientResources",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = {
								0, -- [1]
								0, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = -2,
						["op"] = "<=",
						["variable"] = "AND",
						["checks"] = {
							{
								["value"] = 1,
								["variable"] = "onCooldown",
								["trigger"] = 1,
							}, -- [1]
							{
								["value"] = 0,
								["variable"] = "buffed",
								["op"] = "<=",
								["trigger"] = 4,
							}, -- [2]
						},
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.1.text_visible",
						}, -- [1]
						{
							["property"] = "glow",
						}, -- [2]
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [3]
					},
				}, -- [3]
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 1,
								["variable"] = "onCooldown",
								["value"] = 0,
							}, -- [1]
							{
								["trigger"] = 1,
								["variable"] = "insufficientResources",
								["value"] = 0,
							}, -- [2]
							{
								["trigger"] = 2,
								["op"] = "<=",
								["value"] = "20",
								["variable"] = "percenthealth",
							}, -- [3]
							{
								["trigger"] = 4,
								["variable"] = "buffed",
								["value"] = 0,
							}, -- [4]
						},
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "glow",
						}, -- [1]
					},
				}, -- [4]
				{
					["check"] = {
						["trigger"] = 3,
						["variable"] = "buffed",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.2.text_visible",
						}, -- [1]
						{
							["value"] = 92,
							["property"] = "yOffset",
						}, -- [2]
						{
							["value"] = 32,
							["property"] = "width",
						}, -- [3]
						{
							["value"] = 32,
							["property"] = "height",
						}, -- [4]
					},
				}, -- [5]
			},
			["cooldown"] = false,
			["glowBorder"] = false,
		},
	},
	["login_squelch_time"] = 10,
	["minimap"] = {
		["minimapPos"] = 199.002195712601,
		["hide"] = false,
	},
	["lastUpgrade"] = 1570214941,
	["dbVersion"] = 24,
	["clearOldHistory"] = 30,
	["registered"] = {
	},
	["history"] = {
		["26MfEG1fAlG"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["xOffset"] = 0,
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["cooldownEdge"] = true,
				["icon"] = true,
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["animation"] = {
					["start"] = {
						["colorR"] = 0,
						["duration"] = "1",
						["alphaType"] = "alphaPulse",
						["colorA"] = 1,
						["colorG"] = 0,
						["alphaFunc"] = "    function(progress, start, delta)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return start + (((math.sin(angle) + 1)/2) * delta)\n    end\n  ",
						["colorB"] = 0,
						["duration_type"] = "seconds",
						["use_translate"] = true,
						["use_alpha"] = true,
						["translateType"] = "bounce",
						["scaleType"] = "pulse",
						["type"] = "preset",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["x"] = 0,
						["y"] = 0,
						["colorType"] = "straightHSV",
						["preset"] = "slidetop",
						["use_color"] = true,
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["use_scale"] = true,
						["scalex"] = 1,
					},
					["main"] = {
						["type"] = "none",
						["preset"] = "pulse",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
				},
				["height"] = 38,
				["glowLines"] = 8,
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["glowFrequency"] = 0.25,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = true,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["spellknown"] = 20271,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["glowLength"] = 10,
				["url"] = "https://wago.io/pQukwVj27/1",
				["progressPrecision"] = 0,
				["regionType"] = "icon",
				["config"] = {
				},
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["width"] = 38,
				["frameStrata"] = 1,
				["keepAspectRatio"] = false,
				["actions"] = {
					["start"] = {
					},
					["init"] = {
						["custom"] = "\n\n",
						["do_custom"] = false,
					},
					["finish"] = {
					},
				},
				["glowScale"] = 1,
				["cooldownTextDisabled"] = true,
				["zoom"] = 0,
				["auto"] = true,
				["tocversion"] = 11302,
				["id"] = "审判",
				["selfPoint"] = "CENTER",
				["alpha"] = 1,
				["anchorFrameType"] = "SCREEN",
				["glowYOffset"] = 0,
				["uid"] = "26MfEG1fAlG",
				["inverse"] = true,
				["triggers"] = {
					{
						["trigger"] = {
							["track"] = "auto",
							["duration"] = "1",
							["genericShowOn"] = "showOnReady",
							["use_unit"] = true,
							["use_showgcd"] = true,
							["use_hand"] = true,
							["use_attackable"] = true,
							["debuffType"] = "HELPFUL",
							["type"] = "status",
							["unevent"] = "auto",
							["unit"] = "player",
							["subeventPrefix"] = "SPELL",
							["event"] = "Cooldown Progress (Spell)",
							["use_genericShowOn"] = true,
							["realSpellName"] = "审判",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["spellName"] = 20271,
							["hand"] = "main",
							["subeventSuffix"] = "_CAST_START",
							["use_track"] = true,
							["names"] = {
							},
						},
						["untrigger"] = {
							["hand"] = "main",
							["genericShowOn"] = "showOnReady",
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["use_targetRequired"] = true,
							["duration"] = "1",
							["event"] = "Action Usable",
							["unit"] = "player",
							["realSpellName"] = "审判",
							["use_spellName"] = true,
							["subeventPrefix"] = "SPELL",
							["unevent"] = "auto",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["spellName"] = 20271,
						},
						["untrigger"] = {
						},
					}, -- [2]
					{
						["trigger"] = {
							["type"] = "status",
							["use_targetRequired"] = true,
							["duration"] = "1",
							["event"] = "Unit Characteristics",
							["unit"] = "target",
							["realSpellName"] = "奥术射击",
							["use_spellName"] = true,
							["use_unit"] = true,
							["unevent"] = "auto",
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["use_attackable"] = true,
							["spellName"] = 3044,
						},
						["untrigger"] = {
							["unit"] = "target",
						},
					}, -- [3]
					{
						["trigger"] = {
							["type"] = "status",
							["use_health"] = true,
							["health_operator"] = ">",
							["duration"] = "1",
							["event"] = "Health",
							["unit"] = "target",
							["health"] = "0",
							["use_unit"] = true,
							["unevent"] = "auto",
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
						},
						["untrigger"] = {
							["unit"] = "target",
						},
					}, -- [4]
					{
						["trigger"] = {
							["type"] = "status",
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Conditions",
							["unit"] = "player",
							["subeventPrefix"] = "SPELL",
							["use_alive"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
						},
						["untrigger"] = {
						},
					}, -- [5]
					["activeTriggerMode"] = 1,
				},
				["useTooltip"] = true,
				["conditions"] = {
					{
						["check"] = {
							["trigger"] = 1,
							["variable"] = "insufficientResources",
							["value"] = 1,
						},
						["changes"] = {
							{
								["value"] = {
									0.21176470588235, -- [1]
									0.24313725490196, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["property"] = "color",
							}, -- [1]
						},
					}, -- [1]
					{
						["check"] = {
							["trigger"] = 1,
							["variable"] = "spellInRange",
							["value"] = 0,
						},
						["changes"] = {
							{
								["value"] = {
									1, -- [1]
									0.094117647058824, -- [2]
									0.13333333333333, -- [3]
									1, -- [4]
								},
								["property"] = "color",
							}, -- [1]
						},
					}, -- [2]
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["eOX9jYSjl9f"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245660,
			["allowUpdates"] = true,
			["data"] = {
				["backdropColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					0.5, -- [4]
				},
				["controlledChildren"] = {
				},
				["borderBackdrop"] = "Blizzard Tooltip",
				["xOffset"] = 0.00030517578125,
				["authorOptions"] = {
				},
				["border"] = false,
				["yOffset"] = -171,
				["anchorPoint"] = "CENTER",
				["borderSize"] = 2,
				["scale"] = 1,
				["borderColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["regionType"] = "group",
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "aura",
							["subeventSuffix"] = "_CAST_START",
							["event"] = "Health",
							["unit"] = "player",
							["spellIds"] = {
							},
							["debuffType"] = "HELPFUL",
							["subeventPrefix"] = "SPELL",
							["names"] = {
							},
							["buffShowOn"] = "showOnActive",
						},
						["untrigger"] = {
						},
					}, -- [1]
					["disjunctive"] = "all",
					["activeTriggerMode"] = -10,
				},
				["selfPoint"] = "BOTTOMLEFT",
				["internalVersion"] = 24,
				["semver"] = "1.0.7",
				["tocversion"] = 11302,
				["id"] = "Paladin 2.0",
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["config"] = {
				},
				["borderInset"] = 1,
				["version"] = 8,
				["uid"] = "eOX9jYSjl9f",
				["borderOffset"] = 4,
				["conditions"] = {
				},
				["load"] = {
					["talent2"] = {
						["multi"] = {
						},
					},
					["talent"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["use_class"] = "true",
					["race"] = {
						["multi"] = {
						},
					},
					["pvptalent"] = {
						["multi"] = {
						},
					},
					["faction"] = {
						["multi"] = {
						},
					},
					["difficulty"] = {
						["multi"] = {
						},
					},
					["role"] = {
						["multi"] = {
						},
					},
					["ingroup"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["borderEdge"] = "1 Pixel",
			},
		},
		["HvyJzKiq3wv"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245660,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["yOffset"] = -155.78,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["icon"] = true,
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 8,
				["subRegions"] = {
				},
				["height"] = 35,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["glowLines"] = 8,
				["authorOptions"] = {
				},
				["glowFrequency"] = 0.25,
				["displayIcon"] = 135968,
				["keepAspectRatio"] = false,
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["load"] = {
					["use_class"] = true,
					["race"] = {
						["single"] = "Human",
						["multi"] = {
							["Dwarf"] = true,
							["Human"] = true,
						},
					},
					["use_never"] = false,
					["use_race"] = false,
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["ROGUE"] = true,
							["PALADIN"] = true,
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["parent"] = "Paladin 2.0",
				["config"] = {
				},
				["regionType"] = "icon",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["glowYOffset"] = 0,
				["alpha"] = 1,
				["cooldownEdge"] = false,
				["progressPrecision"] = 0,
				["glowScale"] = 1,
				["semver"] = "1.0.7",
				["cooldownTextDisabled"] = true,
				["zoom"] = 0.3,
				["auto"] = false,
				["tocversion"] = 11302,
				["id"] = "Paladin - Blessing of Freedom",
				["glowLength"] = 10,
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["width"] = 35,
				["uid"] = "HvyJzKiq3wv",
				["inverse"] = false,
				["xOffset"] = -34.777954101563,
				["triggers"] = {
					{
						["trigger"] = {
							["auranames"] = {
								"Rend", -- [1]
							},
							["matchesShowOn"] = "showAlways",
							["genericShowOn"] = "showAlways",
							["unit"] = "target",
							["unitExists"] = true,
							["debuffType"] = "HARMFUL",
							["spellName"] = 1044,
							["type"] = "status",
							["unevent"] = "auto",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["use_genericShowOn"] = true,
							["event"] = "Cooldown Progress (Spell)",
							["duration"] = "1",
							["realSpellName"] = "Blessing of Freedom",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["useName"] = true,
							["names"] = {
							},
							["ownOnly"] = true,
							["use_track"] = true,
							["subeventPrefix"] = "SPELL",
						},
						["untrigger"] = {
							["genericShowOn"] = "showAlways",
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["use_alwaystrue"] = true,
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Conditions",
							["use_unit"] = true,
							["unit"] = "player",
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["conditions"] = {
					{
						["check"] = {
							["trigger"] = 1,
							["variable"] = "onCooldown",
							["value"] = 1,
						},
						["changes"] = {
							{
								["value"] = true,
								["property"] = "desaturate",
							}, -- [1]
						},
					}, -- [1]
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["CRWdLShKE1B"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = true,
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["yOffset"] = 30,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["cooldownEdge"] = true,
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["useglowColor"] = false,
				["useTooltip"] = true,
				["keepAspectRatio"] = false,
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					0.62745098039216, -- [2]
					0.11764705882353, -- [3]
					1, -- [4]
				},
				["animation"] = {
					["start"] = {
						["colorR"] = 0,
						["duration"] = "1",
						["alphaType"] = "alphaPulse",
						["colorB"] = 0,
						["colorG"] = 0,
						["alphaFunc"] = "    function(progress, start, delta)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return start + (((math.sin(angle) + 1)/2) * delta)\n    end\n  ",
						["colorA"] = 1,
						["duration_type"] = "seconds",
						["use_translate"] = true,
						["use_alpha"] = true,
						["scaleType"] = "pulse",
						["type"] = "preset",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["preset"] = "slidetop",
						["alpha"] = 0,
						["colorType"] = "straightHSV",
						["y"] = 0,
						["x"] = 0,
						["translateType"] = "bounce",
						["scaley"] = 1,
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["use_scale"] = true,
						["scalex"] = 1,
					},
					["main"] = {
						["type"] = "none",
						["preset"] = "pulse",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["version"] = 1,
				["subRegions"] = {
					{
						["text_shadowXOffset"] = 0,
						["type"] = "subtext",
						["text_text"] = "%s",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = 0,
						["text_selfPoint"] = "AUTO",
						["text_fontSize"] = 12,
						["text_visible"] = true,
						["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontType"] = "OUTLINE",
					}, -- [1]
				},
				["height"] = 30,
				["internalVersion"] = 24,
				["glowLines"] = 8,
				["triggers"] = {
					{
						["trigger"] = {
							["showClones"] = true,
							["type"] = "aura2",
							["unevent"] = "auto",
							["subeventPrefix"] = "SPELL",
							["duration"] = "1",
							["event"] = "Health",
							["unit"] = "target",
							["ownOnly"] = true,
							["auranames"] = {
								"毒蛇钉刺", -- [1]
							},
							["spellIds"] = {
							},
							["use_unit"] = true,
							["matchesShowOn"] = "showOnActive",
							["names"] = {
							},
							["subeventSuffix"] = "_CAST_START",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Unit Characteristics",
							["unit"] = "player",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_attackable"] = false,
							["subeventPrefix"] = "SPELL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["activeTriggerMode"] = 1,
				},
				["glowFrequency"] = 0.25,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["authorMode"] = true,
				["config"] = {
				},
				["glowXOffset"] = 0,
				["regionType"] = "icon",
				["glowYOffset"] = 0,
				["alpha"] = 1,
				["glowLength"] = 10,
				["progressPrecision"] = 0,
				["glowScale"] = 1,
				["useGlowColor"] = true,
				["cooldownTextDisabled"] = false,
				["xOffset"] = 0,
				["zoom"] = 0,
				["auto"] = true,
				["tocversion"] = 11302,
				["id"] = "目标- BUFF11",
				["icon"] = true,
				["frameStrata"] = 1,
				["width"] = 30,
				["anchorFrameType"] = "SCREEN",
				["uid"] = "CRWdLShKE1B",
				["inverse"] = false,
				["url"] = "https://wago.io/pQukwVj27/1",
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = false,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["spellknown"] = 1978,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["QjH3Q4JrpE("] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = true,
				["xOffset"] = 0,
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["cooldownEdge"] = true,
				["actions"] = {
					["start"] = {
						["message"] = "吃",
						["do_message"] = false,
						["message_type"] = "SAY",
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["animation"] = {
					["start"] = {
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_scale"] = true,
						["colorA"] = 1,
						["colorG"] = 0,
						["duration"] = "1",
						["use_translate"] = true,
						["scalex"] = 1,
						["colorR"] = 0,
						["type"] = "preset",
						["scaleType"] = "pulse",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["x"] = 0,
						["y"] = 0,
						["colorType"] = "straightHSV",
						["translateType"] = "bounce",
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["colorB"] = 0,
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
					{
						["text_shadowXOffset"] = 0,
						["type"] = "subtext",
						["text_text"] = "%tooltip1",
						["text_color"] = {
							1, -- [1]
							0.058823529411765, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = 0,
						["text_selfPoint"] = "AUTO",
						["text_fontSize"] = 18,
						["text_visible"] = true,
						["text_anchorPoint"] = "OUTER_TOP",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontType"] = "OUTLINE",
					}, -- [1]
				},
				["height"] = 38,
				["glowLines"] = 8,
				["selfPoint"] = "CENTER",
				["glowFrequency"] = 0.25,
				["url"] = "https://wago.io/pQukwVj27/1",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["keepAspectRatio"] = false,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["authorMode"] = true,
				["regionType"] = "icon",
				["uid"] = "QjH3Q4JrpE(",
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = false,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["MAGE"] = true,
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["spellknown"] = 1459,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["width"] = 38,
				["frameStrata"] = 1,
				["icon"] = true,
				["glowLength"] = 10,
				["glowScale"] = 1,
				["cooldownTextDisabled"] = false,
				["zoom"] = 0,
				["auto"] = true,
				["tocversion"] = 11302,
				["id"] = "进食 buff 9",
				["useTooltip"] = true,
				["alpha"] = 1,
				["glowYOffset"] = 0,
				["anchorFrameType"] = "SCREEN",
				["config"] = {
				},
				["inverse"] = false,
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["triggers"] = {
					{
						["trigger"] = {
							["auranames"] = {
								"433", -- [1]
							},
							["matchesShowOn"] = "showOnActive",
							["use_unit"] = true,
							["use_attackable"] = true,
							["debuffType"] = "HELPFUL",
							["type"] = "aura2",
							["subeventPrefix"] = "SPELL",
							["unevent"] = "auto",
							["unit"] = "player",
							["fetchTooltip"] = true,
							["event"] = "Unit Characteristics",
							["use_charges"] = true,
							["realSpellName"] = 0,
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["names"] = {
							},
							["duration"] = "1",
							["useName"] = true,
							["spellName"] = 0,
							["subeventSuffix"] = "_CAST_START",
						},
						["untrigger"] = {
							["unit"] = "target",
						},
					}, -- [1]
					["activeTriggerMode"] = 1,
				},
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["5sIquIf1M3z"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245660,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["xOffset"] = 0,
				["yOffset"] = 590,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["icon"] = true,
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 8,
				["subRegions"] = {
					{
						["text_shadowXOffset"] = 0,
						["type"] = "subtext",
						["text_text"] = "%s",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = 0,
						["text_selfPoint"] = "AUTO",
						["text_fontSize"] = 12,
						["text_visible"] = false,
						["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontType"] = "OUTLINE",
					}, -- [1]
				},
				["height"] = 64,
				["glowLines"] = 8,
				["glowFrequency"] = 0.25,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["keepAspectRatio"] = false,
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["displayIcon"] = 135970,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["authorOptions"] = {
				},
				["regionType"] = "icon",
				["parent"] = "Paladin 2.0",
				["config"] = {
				},
				["glowLength"] = 10,
				["width"] = 64,
				["alpha"] = 1,
				["zoom"] = 0.3,
				["semver"] = "1.0.7",
				["tocversion"] = 11302,
				["cooldownTextDisabled"] = false,
				["auto"] = false,
				["glowScale"] = 1,
				["id"] = "Paladin - Blessing of Wisdom",
				["cooldownEdge"] = false,
				["frameStrata"] = 1,
				["glowYOffset"] = 0,
				["anchorFrameType"] = "SCREEN",
				["uid"] = "5sIquIf1M3z",
				["inverse"] = false,
				["load"] = {
					["use_class"] = true,
					["use_race"] = false,
					["ingroup"] = {
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["use_combat"] = true,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["PALADIN"] = true,
						},
					},
					["race"] = {
						["single"] = "Human",
						["multi"] = {
							["Dwarf"] = true,
							["Human"] = true,
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["useName"] = true,
							["auranames"] = {
								"Blessing of Wisdom", -- [1]
								"Blessing of Might", -- [2]
							},
							["matchesShowOn"] = "showOnMissing",
							["event"] = "Health",
							["names"] = {
							},
							["spellIds"] = {
							},
							["subeventPrefix"] = "SPELL",
							["unit"] = "player",
							["type"] = "aura2",
							["subeventSuffix"] = "_CAST_START",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					["activeTriggerMode"] = -10,
				},
				["conditions"] = {
				},
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["glowBorder"] = false,
			},
		},
		["G53cq9A9zti"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = true,
				["text1FontSize"] = 12,
				["xOffset"] = 0,
				["displayText"] = "",
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["url"] = "https://wago.io/pQukwVj27/1",
				["icon"] = true,
				["text1Enabled"] = true,
				["keepAspectRatio"] = false,
				["wordWrap"] = "WordWrap",
				["text1Containment"] = "INSIDE",
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["font"] = "Friz Quadrata TT",
				["text2FontFlags"] = "OUTLINE",
				["load"] = {
					["use_class"] = true,
					["ingroup"] = {
						["multi"] = {
							["group"] = true,
							["raid"] = true,
						},
					},
					["use_ingroup"] = false,
					["role"] = {
					},
					["use_combat"] = false,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["text1FontFlags"] = "OUTLINE",
				["regionType"] = "text",
				["text2FontSize"] = 24,
				["cooldownTextDisabled"] = false,
				["auto"] = true,
				["glowScale"] = 1,
				["text2Enabled"] = false,
				["glowYOffset"] = 0,
				["config"] = {
				},
				["fixedWidth"] = 200,
				["outline"] = "OUTLINE",
				["glowLength"] = 10,
				["cooldownSwipe"] = true,
				["customTextUpdate"] = "update",
				["cooldownEdge"] = false,
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "aura2",
							["auraspellids"] = {
								"1243", -- [1]
								"1244", -- [2]
								"1245", -- [3]
								"2791", -- [4]
								"10937", -- [5]
								"10938", -- [6]
							},
							["matchesShowOn"] = "showOnMissing",
							["event"] = "Health",
							["names"] = {
							},
							["useExactSpellId"] = true,
							["spellIds"] = {
							},
							["auranames"] = {
							},
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["unit"] = "player",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					{
						["trigger"] = {
							["use_unitisunit"] = false,
							["use_hostility"] = true,
							["duration"] = "1",
							["use_character"] = true,
							["unit"] = "party1",
							["use_class"] = true,
							["character"] = "player",
							["custom_hide"] = "timed",
							["type"] = "status",
							["subeventSuffix"] = "_CAST_START",
							["hostility"] = "friendly",
							["event"] = "Unit Characteristics",
							["class"] = "PRIEST",
							["use_name"] = false,
							["custom_type"] = "event",
							["name"] = "",
							["subeventPrefix"] = "SPELL",
							["check"] = "event",
							["unevent"] = "auto",
							["use_unit"] = true,
							["use_specific_unit"] = true,
						},
						["untrigger"] = {
							["use_specific_unit"] = true,
							["unit"] = "party1",
						},
					}, -- [2]
					{
						["trigger"] = {
							["duration"] = "1",
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["hostility"] = "friendly",
							["class"] = "PRIEST",
							["use_character"] = true,
							["subeventPrefix"] = "SPELL",
							["use_class"] = true,
							["character"] = "player",
							["unit"] = "party2",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_specific_unit"] = true,
							["use_absorbMode"] = true,
						},
						["untrigger"] = {
							["use_specific_unit"] = true,
							["unit"] = "party2",
						},
					}, -- [3]
					{
						["trigger"] = {
							["subeventPrefix"] = "SPELL",
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["use_specific_unit"] = true,
							["use_absorbMode"] = true,
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["class"] = "PRIEST",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["unit"] = "party3",
							["duration"] = "1",
						},
						["untrigger"] = {
							["use_specific_unit"] = true,
							["unit"] = "party3",
						},
					}, -- [4]
					{
						["trigger"] = {
							["duration"] = "1",
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["class"] = "PRIEST",
							["use_absorbMode"] = true,
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["use_unit"] = true,
							["event"] = "Unit Characteristics",
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["use_specific_unit"] = true,
							["unit"] = "party4",
						},
						["untrigger"] = {
							["use_specific_unit"] = true,
							["unit"] = "party4",
						},
					}, -- [5]
					{
						["trigger"] = {
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["hostility"] = "friendly",
							["duration"] = "1",
							["use_character"] = true,
							["unit"] = "player",
							["use_class"] = true,
							["character"] = "player",
							["use_unit"] = true,
							["event"] = "Unit Characteristics",
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["class"] = "PRIEST",
							["use_absorbMode"] = true,
						},
						["untrigger"] = {
						},
					}, -- [6]
					["disjunctive"] = "custom",
					["customTriggerLogic"] = "function(trigger)\n    return trigger[1] and (trigger[2] or trigger[3] or trigger[4] or trigger[5] or trigger[6]);\nend",
					["activeTriggerMode"] = -10,
				},
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["animation"] = {
					["start"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidetop",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["stickyDuration"] = false,
				["version"] = 1,
				["subRegions"] = {
				},
				["height"] = 35,
				["glowLines"] = 8,
				["glowFrequency"] = 0.25,
				["fontSize"] = 12,
				["text2Containment"] = "INSIDE",
				["alpha"] = 1,
				["text1Font"] = "Friz Quadrata TT",
				["tocversion"] = 11302,
				["authorOptions"] = {
				},
				["text2Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["text2Font"] = "Friz Quadrata TT",
				["text2"] = "%p",
				["text1Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["text1Point"] = "BOTTOMRIGHT",
				["automaticWidth"] = "Auto",
				["width"] = 35,
				["text1"] = "%s",
				["actions"] = {
					["start"] = {
						["message"] = "-> %n <-",
						["do_message"] = true,
						["message_type"] = "YELL",
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["text2Point"] = "CENTER",
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["justify"] = "LEFT",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["id"] = "ms-noBuff 10",
				["useglowColor"] = false,
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["zoom"] = 0.3,
				["selfPoint"] = "CENTER",
				["inverse"] = false,
				["desaturate"] = false,
				["uid"] = "G53cq9A9zti",
				["conditions"] = {
				},
				["authorMode"] = true,
				["glowBorder"] = false,
			},
		},
		["XPrM2Lov4va"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = true,
				["text1FontSize"] = 12,
				["xOffset"] = 0,
				["displayText"] = "",
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["url"] = "https://wago.io/pQukwVj27/1",
				["actions"] = {
					["start"] = {
						["message"] = "-> %n <-",
						["do_message"] = true,
						["message_type"] = "YELL",
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["text2Font"] = "Friz Quadrata TT",
				["keepAspectRatio"] = false,
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["font"] = "Friz Quadrata TT",
				["text2FontFlags"] = "OUTLINE",
				["load"] = {
					["ingroup"] = {
						["multi"] = {
							["group"] = true,
							["raid"] = true,
						},
					},
					["use_never"] = true,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["use_class"] = true,
					["use_ingroup"] = false,
					["role"] = {
					},
					["use_combat"] = false,
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["text1FontFlags"] = "OUTLINE",
				["regionType"] = "text",
				["text2FontSize"] = 24,
				["cooldownTextDisabled"] = false,
				["auto"] = true,
				["glowScale"] = 1,
				["text2Enabled"] = false,
				["glowYOffset"] = 0,
				["uid"] = "XPrM2Lov4va",
				["fixedWidth"] = 200,
				["outline"] = "OUTLINE",
				["glowLength"] = 10,
				["cooldownSwipe"] = true,
				["customTextUpdate"] = "update",
				["cooldownEdge"] = false,
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["animation"] = {
					["start"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidetop",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["stickyDuration"] = false,
				["version"] = 1,
				["subRegions"] = {
				},
				["height"] = 35,
				["glowLines"] = 8,
				["glowFrequency"] = 0.25,
				["fontSize"] = 12,
				["text2Containment"] = "INSIDE",
				["alpha"] = 1,
				["text1Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["tocversion"] = 11302,
				["authorMode"] = true,
				["text2Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["wordWrap"] = "WordWrap",
				["authorOptions"] = {
				},
				["text1Point"] = "BOTTOMRIGHT",
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "aura2",
							["auraspellids"] = {
								"6673", -- [1]
								"5242", -- [2]
								"6192", -- [3]
								"11549", -- [4]
								"11550", -- [5]
								"11551", -- [6]
								"25289", -- [7]
							},
							["matchesShowOn"] = "showOnMissing",
							["event"] = "Health",
							["names"] = {
							},
							["subeventSuffix"] = "_CAST_START",
							["spellIds"] = {
							},
							["auranames"] = {
							},
							["subeventPrefix"] = "SPELL",
							["useExactSpellId"] = true,
							["unit"] = "player",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					{
						["trigger"] = {
							["use_unitisunit"] = false,
							["use_hostility"] = true,
							["duration"] = "1",
							["use_character"] = true,
							["use_specific_unit"] = true,
							["use_class"] = true,
							["character"] = "player",
							["custom_hide"] = "timed",
							["type"] = "status",
							["subeventSuffix"] = "_CAST_START",
							["hostility"] = "friendly",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["use_name"] = false,
							["custom_type"] = "event",
							["name"] = "",
							["subeventPrefix"] = "SPELL",
							["check"] = "event",
							["unevent"] = "auto",
							["class"] = "WARRIOR",
							["unit"] = "party1",
						},
						["untrigger"] = {
							["unit"] = "party1",
							["use_specific_unit"] = true,
						},
					}, -- [2]
					{
						["trigger"] = {
							["duration"] = "1",
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["hostility"] = "friendly",
							["class"] = "WARRIOR",
							["use_character"] = true,
							["unit"] = "party2",
							["use_class"] = true,
							["character"] = "player",
							["subeventPrefix"] = "SPELL",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_specific_unit"] = true,
							["use_absorbMode"] = true,
						},
						["untrigger"] = {
							["unit"] = "party2",
							["use_specific_unit"] = true,
						},
					}, -- [3]
					{
						["trigger"] = {
							["duration"] = "1",
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["hostility"] = "friendly",
							["class"] = "WARRIOR",
							["use_character"] = true,
							["unit"] = "party3",
							["use_class"] = true,
							["character"] = "player",
							["subeventPrefix"] = "SPELL",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_specific_unit"] = true,
							["use_absorbMode"] = true,
						},
						["untrigger"] = {
							["unit"] = "party3",
							["use_specific_unit"] = true,
						},
					}, -- [4]
					{
						["trigger"] = {
							["use_absorbMode"] = true,
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["duration"] = "1",
							["class"] = "WARRIOR",
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["subeventPrefix"] = "SPELL",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_specific_unit"] = true,
							["unit"] = "party4",
						},
						["untrigger"] = {
							["unit"] = "party4",
							["use_specific_unit"] = true,
						},
					}, -- [5]
					{
						["trigger"] = {
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["hostility"] = "friendly",
							["class"] = "WARRIOR",
							["use_character"] = true,
							["unit"] = "player",
							["use_class"] = true,
							["character"] = "player",
							["subeventPrefix"] = "SPELL",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["duration"] = "1",
							["use_absorbMode"] = true,
						},
						["untrigger"] = {
						},
					}, -- [6]
					["disjunctive"] = "custom",
					["customTriggerLogic"] = "function(trigger)\n    return trigger[1] and (trigger[2] or trigger[3] or trigger[4] or trigger[5] or trigger[6]);\nend",
					["activeTriggerMode"] = -10,
				},
				["icon"] = true,
				["anchorFrameType"] = "SCREEN",
				["text1"] = "%s",
				["zoom"] = 0.3,
				["text2Point"] = "CENTER",
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["justify"] = "LEFT",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["id"] = "Zs-noBuff 10",
				["text1Font"] = "Friz Quadrata TT",
				["frameStrata"] = 1,
				["width"] = 35,
				["automaticWidth"] = "Auto",
				["text1Enabled"] = true,
				["inverse"] = false,
				["text1Containment"] = "INSIDE",
				["config"] = {
				},
				["conditions"] = {
				},
				["text2"] = "%p",
				["glowBorder"] = false,
			},
		},
		["PKH)ncuThwv"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = true,
				["glowLength"] = 10,
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["url"] = "https://wago.io/pQukwVj27/1",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
						["custom"] = "\n\n",
						["do_custom"] = false,
					},
					["finish"] = {
					},
				},
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
				},
				["height"] = 38,
				["glowLines"] = 8,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = true,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["spellknown"] = 21084,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["glowFrequency"] = 0.25,
				["animation"] = {
					["start"] = {
						["translateType"] = "bounce",
						["use_scale"] = true,
						["alphaType"] = "alphaPulse",
						["colorB"] = 0,
						["colorG"] = 0,
						["alphaFunc"] = "    function(progress, start, delta)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return start + (((math.sin(angle) + 1)/2) * delta)\n    end\n  ",
						["colorA"] = 1,
						["scalex"] = 1,
						["use_translate"] = true,
						["use_alpha"] = true,
						["duration_type"] = "seconds",
						["type"] = "preset",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["preset"] = "slidetop",
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["use_color"] = true,
						["alpha"] = 0,
						["colorType"] = "straightHSV",
						["y"] = 0,
						["x"] = 0,
						["scaleType"] = "pulse",
						["scaley"] = 1,
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["colorR"] = 0,
						["duration"] = "1",
					},
					["main"] = {
						["type"] = "none",
						["preset"] = "pulse",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["useName"] = true,
							["auranames"] = {
								"正义圣印", -- [1]
							},
							["ownOnly"] = true,
							["event"] = "Health",
							["unit"] = "player",
							["names"] = {
							},
							["spellIds"] = {
							},
							["type"] = "aura2",
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["matchesShowOn"] = "showOnActive",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Conditions",
							["names"] = {
							},
							["unit"] = "player",
							["spellIds"] = {
							},
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["use_alive"] = true,
							["use_unit"] = true,
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["activeTriggerMode"] = 1,
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["cooldownEdge"] = true,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["regionType"] = "icon",
				["config"] = {
				},
				["useTooltip"] = true,
				["anchorFrameType"] = "SCREEN",
				["frameStrata"] = 1,
				["progressPrecision"] = 0,
				["xOffset"] = 0,
				["tocversion"] = 11302,
				["cooldownTextDisabled"] = false,
				["zoom"] = 0,
				["auto"] = true,
				["glowScale"] = 1,
				["id"] = "正义圣印-Buff",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["alpha"] = 1,
				["glowYOffset"] = 0,
				["width"] = 38,
				["uid"] = "PKH)ncuThwv",
				["inverse"] = false,
				["icon"] = true,
				["keepAspectRatio"] = false,
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["rMkrlBHkIzL"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["sparkWidth"] = 16,
				["sparkOffsetX"] = 0,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["customText"] = "function() \n    if aura_env.state and aura_env.state.percenthealth then \n        return string.format(\"%.0f\",aura_env.state.percenthealth) \n    end \nend",
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["sparkRotation"] = 0,
				["sparkRotationMode"] = "AUTO",
				["url"] = "https://wago.io/pQukwVj27/1",
				["backgroundColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					0.5, -- [4]
				},
				["triggers"] = {
					{
						["trigger"] = {
							["duration"] = "1",
							["subeventPrefix"] = "SPELL",
							["debuffType"] = "HELPFUL",
							["type"] = "status",
							["use_health"] = false,
							["health_operator"] = ">",
							["percenthealth"] = "100",
							["event"] = "Health",
							["unevent"] = "auto",
							["subeventSuffix"] = "_CAST_START",
							["health"] = "1",
							["spellIds"] = {
							},
							["unit"] = "player",
							["use_unit"] = true,
							["use_percenthealth"] = false,
							["percenthealth_operator"] = "<",
							["names"] = {
							},
						},
						["untrigger"] = {
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["use_incombat"] = true,
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Conditions",
							["unit"] = "player",
							["use_unit"] = true,
							["subeventPrefix"] = "SPELL",
							["use_alive"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_mounted"] = false,
						},
						["untrigger"] = {
						},
					}, -- [2]
					["activeTriggerMode"] = 1,
				},
				["icon_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["internalVersion"] = 24,
				["selfPoint"] = "CENTER",
				["barColor"] = {
					1, -- [1]
					0.07843137254902, -- [2]
					0.019607843137255, -- [3]
					1, -- [4]
				},
				["desaturate"] = false,
				["version"] = 1,
				["subRegions"] = {
					{
						["type"] = "aurabar_bar",
					}, -- [1]
					{
						["text_shadowXOffset"] = 1,
						["text_text"] = "%c",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_selfPoint"] = "BOTTOM",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["type"] = "subtext",
						["text_anchorXOffset"] = 0,
						["text_color"] = {
							1, -- [1]
							0.97254901960784, -- [2]
							0.96862745098039, -- [3]
							1, -- [4]
						},
						["text_font"] = "默认",
						["text_shadowYOffset"] = -1,
						["text_fontType"] = "None",
						["text_anchorPoint"] = "TOP",
						["text_visible"] = true,
						["text_fontSize"] = 12,
						["anchorXOffset"] = 0,
						["text_anchorYOffset"] = 2,
					}, -- [2]
				},
				["height"] = 38,
				["load"] = {
					["use_class"] = true,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["MAGE"] = true,
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["sparkBlendMode"] = "ADD",
				["useAdjustededMax"] = false,
				["authorOptions"] = {
				},
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["preset"] = "slidetop",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["xOffset"] = -2,
				["icon"] = false,
				["smoothProgress"] = true,
				["useAdjustededMin"] = false,
				["regionType"] = "aurabar",
				["sparkColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["sparkTexture"] = "XPBarAnim-OrangeSpark",
				["icon_side"] = "RIGHT",
				["uid"] = "rMkrlBHkIzL",
				["id"] = "HP-(进入战斗中显示) 8",
				["sparkHeight"] = 10,
				["texture"] = "Blizzard",
				["width"] = 14,
				["zoom"] = 0,
				["spark"] = true,
				["tocversion"] = 11302,
				["sparkHidden"] = "NEVER",
				["frameStrata"] = 1,
				["alpha"] = 1,
				["anchorFrameType"] = "SCREEN",
				["auto"] = true,
				["config"] = {
				},
				["inverse"] = false,
				["sparkOffsetY"] = 0,
				["orientation"] = "VERTICAL_INVERSE",
				["conditions"] = {
					{
						["check"] = {
							["trigger"] = 2,
							["variable"] = "show",
						},
						["changes"] = {
							{
							}, -- [1]
						},
					}, -- [1]
				},
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["color"] = {
				},
			},
		},
		["bVPFjtfMg9e"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["outline"] = "OUTLINE",
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["displayText"] = "",
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["customTextUpdate"] = "update",
				["automaticWidth"] = "Auto",
				["actions"] = {
					["start"] = {
						["message"] = "HP:%1.health，怎这么少！  9 9 9 9",
						["do_message"] = true,
						["message_type"] = "YELL",
					},
					["init"] = {
					},
					["finish"] = {
						["do_message"] = false,
						["message_type"] = "SAY",
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["duration"] = "1",
							["names"] = {
							},
							["debuffType"] = "HELPFUL",
							["type"] = "status",
							["unit"] = "player",
							["custom_type"] = "status",
							["subeventSuffix"] = "_CAST_START",
							["percenthealth"] = "20",
							["event"] = "Health",
							["unevent"] = "auto",
							["use_absorbMode"] = true,
							["events"] = "",
							["spellIds"] = {
							},
							["use_unit"] = true,
							["check"] = "event",
							["use_percenthealth"] = true,
							["percenthealth_operator"] = "<=",
							["subeventPrefix"] = "SPELL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["internalVersion"] = 24,
				["selfPoint"] = "BOTTOM",
				["font"] = "Friz Quadrata TT",
				["version"] = 1,
				["load"] = {
					["use_class"] = true,
					["use_petbattle"] = false,
					["use_vehicleUi"] = false,
					["use_vehicle"] = false,
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["MAGE"] = true,
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["authorMode"] = true,
				["fontSize"] = 16,
				["regionType"] = "text",
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["xOffset"] = 0,
				["justify"] = "LEFT",
				["tocversion"] = 11302,
				["id"] = "99喊话  到20%血时 9",
				["conditions"] = {
				},
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["config"] = {
				},
				["semver"] = "1.0.20",
				["uid"] = "bVPFjtfMg9e",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["fixedWidth"] = 200,
				["url"] = "https://wago.io/pQukwVj27/1",
				["wordWrap"] = "WordWrap",
			},
		},
		["ElK0(gA)67y"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["url"] = "https://wago.io/pQukwVj27/1",
				["icon"] = true,
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
					{
						["text_shadowXOffset"] = 0,
						["type"] = "subtext",
						["text_text"] = "%p",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = 0,
						["text_selfPoint"] = "AUTO",
						["text_fontSize"] = 24,
						["text_visible"] = true,
						["text_anchorPoint"] = "CENTER",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontType"] = "OUTLINE",
					}, -- [1]
				},
				["height"] = 52,
				["glowLines"] = 8,
				["glowFrequency"] = 0.25,
				["glowLength"] = 10,
				["animation"] = {
					["start"] = {
						["colorR"] = 0,
						["scalex"] = 1,
						["colorB"] = 0,
						["colorG"] = 0,
						["colorA"] = 1,
						["use_translate"] = true,
						["duration"] = "1",
						["type"] = "preset",
						["scaleType"] = "pulse",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["colorType"] = "straightHSV",
						["y"] = 0,
						["x"] = 0,
						["translateType"] = "bounce",
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["use_scale"] = true,
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
					},
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["cooldownEdge"] = true,
				["load"] = {
					["use_class"] = true,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["regionType"] = "icon",
				["progressPrecision"] = 0,
				["config"] = {
				},
				["xOffset"] = 0,
				["anchorFrameType"] = "SCREEN",
				["alpha"] = 1,
				["keepAspectRatio"] = false,
				["cooldownTextDisabled"] = true,
				["glowScale"] = 1,
				["zoom"] = 0,
				["auto"] = true,
				["tocversion"] = 11302,
				["id"] = "施放中 7",
				["width"] = 52,
				["frameStrata"] = 1,
				["glowYOffset"] = 0,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["uid"] = "ElK0(gA)67y",
				["inverse"] = true,
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "status",
							["subeventSuffix"] = "_CAST_START",
							["duration"] = "1",
							["event"] = "Cast",
							["unit"] = "player",
							["unevent"] = "auto",
							["subeventPrefix"] = "SPELL",
							["spellIds"] = {
							},
							["use_hand"] = true,
							["use_unit"] = true,
							["names"] = {
							},
							["hand"] = "ranged",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
							["hand"] = "ranged",
						},
					}, -- [1]
					["activeTriggerMode"] = 1,
				},
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["Hp56JmSW6RR"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = true,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["yOffset"] = 30,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["url"] = "https://wago.io/pQukwVj27/1",
				["icon"] = true,
				["useglowColor"] = false,
				["useTooltip"] = true,
				["glowXOffset"] = 0,
				["animation"] = {
					["start"] = {
						["translateType"] = "bounce",
						["scalex"] = 1,
						["alphaType"] = "alphaPulse",
						["colorB"] = 0,
						["colorG"] = 0,
						["alphaFunc"] = "    function(progress, start, delta)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return start + (((math.sin(angle) + 1)/2) * delta)\n    end\n  ",
						["duration"] = "1",
						["use_scale"] = true,
						["use_translate"] = true,
						["use_alpha"] = true,
						["duration_type"] = "seconds",
						["type"] = "preset",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["preset"] = "slidetop",
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["use_color"] = true,
						["alpha"] = 0,
						["x"] = 0,
						["y"] = 0,
						["colorType"] = "straightHSV",
						["scaleType"] = "pulse",
						["scaley"] = 1,
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["colorR"] = 0,
						["colorA"] = 1,
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
						["preset"] = "pulse",
					},
					["finish"] = {
						["type"] = "preset",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
					},
				},
				["desaturate"] = false,
				["glowColor"] = {
					0, -- [1]
					1, -- [2]
					0.07843137254902, -- [3]
					1, -- [4]
				},
				["glowLength"] = 10,
				["version"] = 1,
				["subRegions"] = {
					{
						["text_shadowXOffset"] = 0,
						["type"] = "subtext",
						["text_text"] = "%s",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = 0,
						["text_selfPoint"] = "AUTO",
						["text_visible"] = true,
						["text_fontType"] = "OUTLINE",
						["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontSize"] = 12,
					}, -- [1]
				},
				["height"] = 30,
				["keepAspectRatio"] = false,
				["glowLines"] = 8,
				["internalVersion"] = 24,
				["glowFrequency"] = 0.25,
				["cooldownEdge"] = true,
				["triggers"] = {
					{
						["trigger"] = {
							["showClones"] = true,
							["type"] = "aura2",
							["auranames"] = {
								"毒蛇钉刺", -- [1]
							},
							["matchesShowOn"] = "showOnActive",
							["ownOnly"] = true,
							["event"] = "Health",
							["subeventPrefix"] = "SPELL",
							["unit"] = "target",
							["unevent"] = "auto",
							["spellIds"] = {
							},
							["names"] = {
							},
							["duration"] = "1",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["debuffType"] = "HARMFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Unit Characteristics",
							["unit"] = "target",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_attackable"] = true,
							["subeventPrefix"] = "SPELL",
						},
						["untrigger"] = {
							["unit"] = "target",
						},
					}, -- [2]
					["activeTriggerMode"] = 1,
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["config"] = {
				},
				["xOffset"] = 0,
				["regionType"] = "icon",
				["width"] = 30,
				["alpha"] = 1,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = false,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["spellknown"] = 1978,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["selfPoint"] = "CENTER",
				["tocversion"] = 11302,
				["auto"] = true,
				["cooldownTextDisabled"] = false,
				["authorMode"] = true,
				["zoom"] = 0,
				["useGlowColor"] = true,
				["glowScale"] = 1,
				["id"] = "目标- DEBUFF11",
				["progressPrecision"] = 0,
				["frameStrata"] = 1,
				["glowYOffset"] = 0,
				["anchorFrameType"] = "SCREEN",
				["uid"] = "Hp56JmSW6RR",
				["inverse"] = false,
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["SrzEFc67St1"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["sparkWidth"] = 16,
				["sparkOffsetX"] = 0,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["customText"] = "function() \n    if aura_env.state and aura_env.state.percentpower then \n        return string.format(\"%.0f\",aura_env.state.percentpower) \n    end \nend",
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["sparkRotation"] = 0,
				["sparkRotationMode"] = "AUTO",
				["url"] = "https://wago.io/pQukwVj27/1",
				["icon"] = false,
				["triggers"] = {
					{
						["trigger"] = {
							["duration"] = "1",
							["use_unit"] = true,
							["powertype"] = 0,
							["unit"] = "player",
							["subeventPrefix"] = "SPELL",
							["use_powertype"] = true,
							["debuffType"] = "HELPFUL",
							["names"] = {
							},
							["type"] = "status",
							["use_health"] = true,
							["power"] = "1",
							["power_operator"] = ">",
							["subeventSuffix"] = "_CAST_START",
							["use_requirePowerType"] = false,
							["use_percentpower"] = false,
							["unevent"] = "auto",
							["spellIds"] = {
							},
							["health"] = "1",
							["health_operator"] = ">",
							["event"] = "Power",
							["use_power"] = true,
							["percentpower"] = "100",
							["percentpower_operator"] = "<",
						},
						["untrigger"] = {
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["use_incombat"] = true,
							["subeventSuffix"] = "_CAST_START",
							["duration"] = "1",
							["event"] = "Conditions",
							["unit"] = "player",
							["subeventPrefix"] = "SPELL",
							["use_alive"] = true,
							["use_unit"] = true,
							["unevent"] = "auto",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["activeTriggerMode"] = 1,
				},
				["icon_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["internalVersion"] = 24,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
						["preset"] = "slidetop",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
					},
				},
				["barColor"] = {
					0.35294117647059, -- [1]
					0.5921568627451, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["desaturate"] = false,
				["version"] = 1,
				["subRegions"] = {
					{
						["type"] = "aurabar_bar",
					}, -- [1]
					{
						["text_shadowXOffset"] = 1,
						["text_text"] = "%c",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_selfPoint"] = "BOTTOM",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["type"] = "subtext",
						["text_anchorXOffset"] = 0,
						["text_color"] = {
							1, -- [1]
							0.97254901960784, -- [2]
							0.96862745098039, -- [3]
							1, -- [4]
						},
						["text_font"] = "默认",
						["text_anchorYOffset"] = 4,
						["text_visible"] = true,
						["text_anchorPoint"] = "SPARK",
						["text_fontType"] = "None",
						["text_fontSize"] = 12,
						["anchorXOffset"] = 0,
						["text_shadowYOffset"] = -1,
					}, -- [2]
				},
				["height"] = 38,
				["load"] = {
					["use_class"] = true,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["MAGE"] = true,
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["sparkBlendMode"] = "ADD",
				["useAdjustededMax"] = false,
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-",
						["fontSize"] = "medium",
						["width"] = 1,
					}, -- [1]
				},
				["xOffset"] = -2,
				["color"] = {
				},
				["backgroundColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					0.5, -- [4]
				},
				["selfPoint"] = "CENTER",
				["smoothProgress"] = true,
				["useAdjustededMin"] = false,
				["regionType"] = "aurabar",
				["config"] = {
				},
				["uid"] = "SrzEFc67St1",
				["icon_side"] = "RIGHT",
				["id"] = "MP 6",
				["width"] = 14,
				["sparkHeight"] = 10,
				["texture"] = "Blizzard",
				["alpha"] = 1,
				["zoom"] = 0,
				["spark"] = true,
				["tocversion"] = 11302,
				["sparkHidden"] = "NEVER",
				["auto"] = true,
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["sparkTexture"] = "XPBarAnim-OrangeSpark",
				["sparkColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["inverse"] = false,
				["authorMode"] = true,
				["orientation"] = "VERTICAL_INVERSE",
				["conditions"] = {
				},
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["sparkOffsetY"] = 0,
			},
		},
		["OYANmZnGZj)"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["cooldownEdge"] = true,
				["icon"] = true,
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["animation"] = {
					["start"] = {
						["colorR"] = 0,
						["duration_type"] = "seconds",
						["alphaType"] = "alphaPulse",
						["colorB"] = 0,
						["colorG"] = 0,
						["alphaFunc"] = "    function(progress, start, delta)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return start + (((math.sin(angle) + 1)/2) * delta)\n    end\n  ",
						["duration"] = "1",
						["use_scale"] = true,
						["use_translate"] = true,
						["use_alpha"] = true,
						["translateType"] = "bounce",
						["type"] = "preset",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["preset"] = "slidetop",
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["x"] = 0,
						["y"] = 0,
						["colorType"] = "straightHSV",
						["scaleType"] = "pulse",
						["use_color"] = true,
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["scalex"] = 1,
						["colorA"] = 1,
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
						["preset"] = "pulse",
					},
					["finish"] = {
						["type"] = "preset",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
					},
				},
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
				},
				["height"] = 38,
				["glowLines"] = 8,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["glowFrequency"] = 0.25,
				["actions"] = {
					["start"] = {
					},
					["init"] = {
						["custom"] = "\n\n",
						["do_custom"] = false,
					},
					["finish"] = {
					},
				},
				["url"] = "https://wago.io/pQukwVj27/1",
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["keepAspectRatio"] = false,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = true,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["spellknown"] = 21084,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["xOffset"] = 0,
				["regionType"] = "icon",
				["config"] = {
				},
				["width"] = 38,
				["anchorFrameType"] = "SCREEN",
				["alpha"] = 1,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["progressPrecision"] = 0,
				["glowScale"] = 1,
				["cooldownTextDisabled"] = true,
				["zoom"] = 0,
				["auto"] = true,
				["tocversion"] = 11302,
				["id"] = "正义圣印",
				["selfPoint"] = "CENTER",
				["frameStrata"] = 1,
				["glowYOffset"] = 0,
				["glowLength"] = 10,
				["uid"] = "OYANmZnGZj)",
				["inverse"] = true,
				["triggers"] = {
					{
						["trigger"] = {
							["track"] = "auto",
							["use_genericShowOn"] = true,
							["genericShowOn"] = "showAlways",
							["use_unit"] = true,
							["use_showgcd"] = true,
							["use_hand"] = true,
							["use_attackable"] = true,
							["debuffType"] = "HELPFUL",
							["type"] = "status",
							["unevent"] = "auto",
							["names"] = {
							},
							["subeventSuffix"] = "_CAST_START",
							["event"] = "Cooldown Progress (Spell)",
							["spellName"] = 21084,
							["realSpellName"] = "正义圣印",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["hand"] = "main",
							["unit"] = "player",
							["subeventPrefix"] = "SPELL",
							["use_track"] = true,
							["duration"] = "1",
						},
						["untrigger"] = {
							["hand"] = "main",
							["genericShowOn"] = "showAlways",
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["use_targetRequired"] = false,
							["duration"] = "1",
							["event"] = "Action Usable",
							["unit"] = "player",
							["realSpellName"] = "正义圣印",
							["use_spellName"] = true,
							["subeventPrefix"] = "SPELL",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["unevent"] = "auto",
							["spellName"] = 20154,
						},
						["untrigger"] = {
						},
					}, -- [2]
					{
						["trigger"] = {
							["type"] = "status",
							["use_targetRequired"] = true,
							["duration"] = "1",
							["event"] = "Unit Characteristics",
							["unit"] = "target",
							["realSpellName"] = "奥术射击",
							["use_spellName"] = true,
							["unevent"] = "auto",
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
							["use_unit"] = true,
							["use_attackable"] = true,
							["spellName"] = 3044,
						},
						["untrigger"] = {
							["unit"] = "target",
						},
					}, -- [3]
					{
						["trigger"] = {
							["type"] = "status",
							["use_health"] = true,
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Health",
							["unit"] = "target",
							["health"] = "0",
							["use_unit"] = true,
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["health_operator"] = ">",
						},
						["untrigger"] = {
							["unit"] = "target",
						},
					}, -- [4]
					{
						["trigger"] = {
							["type"] = "status",
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Conditions",
							["unit"] = "player",
							["use_unit"] = true,
							["use_alive"] = true,
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
						},
						["untrigger"] = {
						},
					}, -- [5]
					{
						["trigger"] = {
							["type"] = "aura2",
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Health",
							["subeventPrefix"] = "SPELL",
							["ownOnly"] = true,
							["matchesShowOn"] = "showOnMissing",
							["auranames"] = {
								"正义圣印", -- [1]
							},
							["unit"] = "player",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["useName"] = true,
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [6]
					["activeTriggerMode"] = 1,
				},
				["useTooltip"] = true,
				["conditions"] = {
					{
						["check"] = {
							["trigger"] = 1,
							["variable"] = "insufficientResources",
							["value"] = 1,
						},
						["changes"] = {
							{
								["value"] = {
									0.21176470588235, -- [1]
									0.24313725490196, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["property"] = "color",
							}, -- [1]
						},
					}, -- [1]
					{
						["check"] = {
							["trigger"] = 1,
							["variable"] = "spellInRange",
							["value"] = 0,
						},
						["changes"] = {
							{
								["value"] = {
									1, -- [1]
									0.094117647058824, -- [2]
									0.13333333333333, -- [3]
									1, -- [4]
								},
								["property"] = "color",
							}, -- [1]
						},
					}, -- [2]
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["iLFYe(OE6jf"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["xOffset"] = 0,
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["cooldownEdge"] = false,
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
					{
						["text_shadowXOffset"] = 0,
						["type"] = "subtext",
						["text_text"] = " ",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = 0,
						["text_selfPoint"] = "AUTO",
						["text_fontSize"] = 12,
						["text_visible"] = true,
						["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontType"] = "OUTLINE",
					}, -- [1]
				},
				["height"] = 38,
				["glowLines"] = 8,
				["glowFrequency"] = 0.25,
				["selfPoint"] = "CENTER",
				["load"] = {
					["use_encounter"] = false,
					["talent"] = {
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["use_class"] = true,
					["use_spellknown"] = true,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["use_combat"] = false,
					["spellknown"] = 2383,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["displayIcon"] = "133939",
				["authorMode"] = true,
				["keepAspectRatio"] = false,
				["regionType"] = "icon",
				["url"] = "https://wago.io/pQukwVj27/1",
				["config"] = {
				},
				["authorOptions"] = {
				},
				["glowYOffset"] = 0,
				["frameStrata"] = 1,
				["icon"] = true,
				["cooldownTextDisabled"] = false,
				["glowScale"] = 1,
				["zoom"] = 0,
				["auto"] = false,
				["tocversion"] = 11302,
				["id"] = "Find Herbs 11",
				["glowLength"] = 10,
				["alpha"] = 1,
				["anchorFrameType"] = "SCREEN",
				["width"] = 38,
				["uid"] = "iLFYe(OE6jf",
				["inverse"] = false,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "status",
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Conditions",
							["unit"] = "player",
							["names"] = {
							},
							["spellIds"] = {
							},
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_alive"] = true,
							["subeventPrefix"] = "SPELL",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "custom",
							["custom"] = "function()\n    local isTracking = MiniMapTrackingFrame:IsShown()\n    local icon = MiniMapTrackingIcon:GetTexture()\n    return not isTracking and (icon == nil or icon == 133939)\nend",
							["subeventSuffix"] = "_CAST_START",
							["check"] = "update",
							["custom_type"] = "status",
							["event"] = "Health",
							["subeventPrefix"] = "SPELL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["activeTriggerMode"] = -10,
				},
				["conditions"] = {
				},
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["glowBorder"] = false,
			},
		},
		[")a(k2ZGYOat"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = true,
				["text1FontSize"] = 12,
				["xOffset"] = 0,
				["displayText"] = "",
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["url"] = "https://wago.io/pQukwVj27/1",
				["icon"] = true,
				["text1Enabled"] = true,
				["keepAspectRatio"] = false,
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["font"] = "Friz Quadrata TT",
				["text2FontFlags"] = "OUTLINE",
				["load"] = {
					["use_class"] = true,
					["ingroup"] = {
						["multi"] = {
							["group"] = true,
							["raid"] = true,
						},
					},
					["use_ingroup"] = false,
					["role"] = {
					},
					["use_combat"] = false,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["text1FontFlags"] = "OUTLINE",
				["regionType"] = "text",
				["text2FontSize"] = 24,
				["cooldownTextDisabled"] = false,
				["auto"] = true,
				["glowScale"] = 1,
				["text2Enabled"] = false,
				["glowYOffset"] = 0,
				["config"] = {
				},
				["fixedWidth"] = 200,
				["outline"] = "OUTLINE",
				["glowLength"] = 10,
				["cooldownSwipe"] = true,
				["customTextUpdate"] = "update",
				["cooldownEdge"] = false,
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "aura2",
							["auraspellids"] = {
								"1459", -- [1]
								"1460", -- [2]
								"1461", -- [3]
								"10156", -- [4]
								"10157", -- [5]
							},
							["matchesShowOn"] = "showOnMissing",
							["event"] = "Health",
							["names"] = {
							},
							["useExactSpellId"] = true,
							["spellIds"] = {
							},
							["auranames"] = {
							},
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["unit"] = "player",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					{
						["trigger"] = {
							["use_unitisunit"] = false,
							["use_hostility"] = true,
							["duration"] = "1",
							["use_character"] = true,
							["use_specific_unit"] = true,
							["use_class"] = true,
							["character"] = "player",
							["custom_hide"] = "timed",
							["type"] = "status",
							["subeventSuffix"] = "_CAST_START",
							["unit"] = "party1",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["use_name"] = false,
							["custom_type"] = "event",
							["name"] = "",
							["subeventPrefix"] = "SPELL",
							["check"] = "event",
							["unevent"] = "auto",
							["class"] = "MAGE",
							["hostility"] = "friendly",
						},
						["untrigger"] = {
							["use_specific_unit"] = true,
							["unit"] = "party1",
						},
					}, -- [2]
					{
						["trigger"] = {
							["use_absorbMode"] = true,
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["hostility"] = "friendly",
							["class"] = "MAGE",
							["use_character"] = true,
							["subeventPrefix"] = "SPELL",
							["use_class"] = true,
							["character"] = "player",
							["unit"] = "party2",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_specific_unit"] = true,
							["duration"] = "1",
						},
						["untrigger"] = {
							["use_specific_unit"] = true,
							["unit"] = "party2",
						},
					}, -- [3]
					{
						["trigger"] = {
							["subeventPrefix"] = "SPELL",
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["use_specific_unit"] = true,
							["duration"] = "1",
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["class"] = "MAGE",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["unit"] = "party3",
							["use_absorbMode"] = true,
						},
						["untrigger"] = {
							["use_specific_unit"] = true,
							["unit"] = "party3",
						},
					}, -- [4]
					{
						["trigger"] = {
							["use_absorbMode"] = true,
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["class"] = "MAGE",
							["duration"] = "1",
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["use_unit"] = true,
							["event"] = "Unit Characteristics",
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["use_specific_unit"] = true,
							["unit"] = "party4",
						},
						["untrigger"] = {
							["use_specific_unit"] = true,
							["unit"] = "party4",
						},
					}, -- [5]
					{
						["trigger"] = {
							["subeventPrefix"] = "SPELL",
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["unit"] = "player",
							["duration"] = "1",
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["class"] = "MAGE",
							["event"] = "Unit Characteristics",
							["use_name"] = false,
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["use_absorbMode"] = true,
						},
						["untrigger"] = {
						},
					}, -- [6]
					["disjunctive"] = "custom",
					["customTriggerLogic"] = "function(trigger)\n    return trigger[1] and (trigger[2] or trigger[3] or trigger[4] or trigger[5] or trigger[6]);\nend",
					["activeTriggerMode"] = -10,
				},
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["animation"] = {
					["start"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidetop",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["stickyDuration"] = false,
				["version"] = 1,
				["subRegions"] = {
				},
				["height"] = 35,
				["glowLines"] = 8,
				["glowFrequency"] = 0.25,
				["fontSize"] = 12,
				["text2Containment"] = "INSIDE",
				["automaticWidth"] = "Auto",
				["text1Font"] = "Friz Quadrata TT",
				["tocversion"] = 11302,
				["authorOptions"] = {
				},
				["text2Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["text1Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["text2Font"] = "Friz Quadrata TT",
				["alpha"] = 1,
				["text1Point"] = "BOTTOMRIGHT",
				["useglowColor"] = false,
				["width"] = 35,
				["text1"] = "%s",
				["text1Containment"] = "INSIDE",
				["text2Point"] = "CENTER",
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["justify"] = "LEFT",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["id"] = "FS-noBuff 10",
				["zoom"] = 0.3,
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["actions"] = {
					["start"] = {
						["message"] = "-> %n <-",
						["do_message"] = true,
						["message_type"] = "YELL",
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["text2"] = "%p",
				["inverse"] = false,
				["wordWrap"] = "WordWrap",
				["uid"] = ")a(k2ZGYOat",
				["conditions"] = {
				},
				["authorMode"] = true,
				["glowBorder"] = false,
			},
		},
		["YrFx8T5DIzA"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571246060,
			["allowUpdates"] = true,
			["data"] = {
				["user_y"] = 0,
				["slanted"] = true,
				["user_x"] = 0.18,
				["parent"] = "Paladin Protection",
				["adjustedMax"] = 5,
				["adjustedMin"] = 1,
				["yOffset"] = -33.444580078125,
				["foregroundColor"] = {
					1, -- [1]
					0.90588235294118, -- [2]
					0.24705882352941, -- [3]
					1, -- [4]
				},
				["desaturateBackground"] = false,
				["color"] = {
				},
				["crop_x"] = 1.22,
				["sameTexture"] = true,
				["url"] = "https://wago.io/eEPLkEuIv/1",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["showClones"] = true,
							["rem"] = "20",
							["auranames"] = {
								"25780", -- [1]
							},
							["ownOnly"] = true,
							["event"] = "Health",
							["unit"] = "player",
							["subeventPrefix"] = "SPELL",
							["names"] = {
							},
							["spellIds"] = {
							},
							["type"] = "aura2",
							["remOperator"] = "<=",
							["useName"] = true,
							["subeventSuffix"] = "_CAST_START",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					{
						["trigger"] = {
							["useName"] = true,
							["auranames"] = {
								"25780", -- [1]
							},
							["matchesShowOn"] = "showOnMissing",
							["event"] = "Health",
							["subeventPrefix"] = "SPELL",
							["unit"] = "player",
							["ownOnly"] = true,
							["type"] = "aura2",
							["subeventSuffix"] = "_CAST_START",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["endAngle"] = 360,
				["internalVersion"] = 24,
				["authorOptions"] = {
				},
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["backgroundColor"] = {
					0.44313725490196, -- [1]
					0, -- [2]
					0.011764705882353, -- [3]
					0.5, -- [4]
				},
				["discrete_rotation"] = 0,
				["uid"] = "YrFx8T5DIzA",
				["desaturate"] = false,
				["rotation"] = 0,
				["font"] = "Friz Quadrata TT",
				["version"] = 1,
				["subRegions"] = {
				},
				["height"] = 82.997993469238,
				["rotate"] = true,
				["load"] = {
					["class"] = {
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["fontSize"] = 12,
				["useAdjustededMax"] = true,
				["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
				["width"] = 54.422419642543,
				["foregroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura33",
				["alpha"] = 1,
				["textureWrapMode"] = "CLAMP",
				["mirror"] = true,
				["useAdjustededMin"] = true,
				["regionType"] = "progresstexture",
				["xOffset"] = 305.71264648438,
				["blendMode"] = "ADD",
				["compress"] = false,
				["slantFirst"] = false,
				["slantMode"] = "INSIDE",
				["anchorFrameParent"] = false,
				["texture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura2",
				["startAngle"] = 0,
				["desaturateForeground"] = false,
				["smoothProgress"] = true,
				["tocversion"] = 11302,
				["id"] = "Righteous fury",
				["crop_y"] = 0.41,
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["selfPoint"] = "RIGHT",
				["config"] = {
				},
				["inverse"] = false,
				["anchorPoint"] = "CENTER",
				["orientation"] = "VERTICAL",
				["conditions"] = {
				},
				["slant"] = 0,
				["backgroundOffset"] = 2,
			},
		},
		["R8aK6ttRBtP"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = true,
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["url"] = "https://wago.io/pQukwVj27/1",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["useglowColor"] = false,
				["useTooltip"] = true,
				["keepAspectRatio"] = false,
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
				},
				["height"] = 38,
				["animation"] = {
					["start"] = {
						["translateType"] = "bounce",
						["duration_type"] = "seconds",
						["colorB"] = 0,
						["colorG"] = 0,
						["colorA"] = 1,
						["use_translate"] = true,
						["duration"] = "1",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["type"] = "preset",
						["scaleType"] = "pulse",
						["preset"] = "slidetop",
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["colorType"] = "straightHSV",
						["y"] = 0,
						["x"] = 0,
						["scalex"] = 1,
						["use_color"] = true,
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["colorR"] = 0,
						["use_scale"] = true,
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["glowLines"] = 8,
				["glowXOffset"] = 0,
				["glowFrequency"] = 0.25,
				["displayIcon"] = 136187,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = false,
					["use_race"] = true,
					["race"] = {
						["single"] = "Scourge",
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["MAGE"] = true,
						},
					},
					["spellknown"] = 20589,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["glowLength"] = 10,
				["uid"] = "R8aK6ttRBtP",
				["regionType"] = "icon",
				["xOffset"] = 0,
				["glowYOffset"] = 0,
				["alpha"] = 1,
				["cooldownEdge"] = true,
				["internalVersion"] = 24,
				["tocversion"] = 11302,
				["icon"] = true,
				["cooldownTextDisabled"] = true,
				["zoom"] = 0,
				["auto"] = false,
				["glowScale"] = 1,
				["id"] = "被遗忘者的意志  8",
				["authorMode"] = true,
				["frameStrata"] = 1,
				["width"] = 38,
				["anchorFrameType"] = "SCREEN",
				["config"] = {
				},
				["inverse"] = true,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["triggers"] = {
					{
						["trigger"] = {
							["auranames"] = {
								"免疫魅惑/恐惧/变形", -- [1]
								"恐惧", -- [2]
								"催眠术", -- [3]
							},
							["duration"] = "1",
							["unit"] = "player",
							["use_attackable"] = true,
							["debuffType"] = "HARMFUL",
							["type"] = "aura2",
							["use_debuffClass"] = true,
							["subeventSuffix"] = "_CAST_START",
							["matchesShowOn"] = "showOnActive",
							["names"] = {
							},
							["event"] = "Unit Characteristics",
							["use_charges"] = true,
							["realSpellName"] = 0,
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["use_unit"] = true,
							["spellName"] = 0,
							["useName"] = true,
							["subeventPrefix"] = "SPELL",
							["unevent"] = "auto",
						},
						["untrigger"] = {
							["unit"] = "target",
						},
					}, -- [1]
					{
						["trigger"] = {
							["itemName"] = 0,
							["type"] = "status",
							["unevent"] = "auto",
							["subeventSuffix"] = "_CAST_START",
							["unit"] = "player",
							["use_genericShowOn"] = true,
							["genericShowOn"] = "showOnReady",
							["subeventPrefix"] = "SPELL",
							["realSpellName"] = "被遗忘者的意志",
							["use_spellName"] = true,
							["duration"] = "1",
							["event"] = "Cooldown Progress (Spell)",
							["use_unit"] = true,
							["use_itemName"] = true,
							["use_track"] = true,
							["spellName"] = 7744,
						},
						["untrigger"] = {
							["genericShowOn"] = "showOnReady",
						},
					}, -- [2]
					["activeTriggerMode"] = 1,
				},
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["Z7AwBEvsHD7"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["grow"] = "RIGHT",
				["controlledChildren"] = {
				},
				["borderBackdrop"] = "Blizzard Tooltip",
				["authorOptions"] = {
				},
				["groupIcon"] = 132325,
				["anchorPoint"] = "CENTER",
				["borderColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["space"] = 2,
				["url"] = "https://wago.io/pQukwVj27/1",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["unit"] = "player",
							["type"] = "aura2",
							["spellIds"] = {
							},
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
							["names"] = {
							},
							["event"] = "Health",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
				},
				["columnSpace"] = 1,
				["radius"] = 200,
				["useLimit"] = false,
				["align"] = "RIGHT",
				["desc"] = "\nhttps://wago.io/p/husandro2    其他WA字符\n---\n如果wa插件占内存大，请/ RELOAD，完后不要再打开wa插件选项界面",
				["stagger"] = 0,
				["version"] = 1,
				["subRegions"] = {
				},
				["load"] = {
					["use_class"] = "true",
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["backdropColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					0.5, -- [4]
				},
				["animate"] = true,
				["scale"] = 1,
				["border"] = false,
				["borderEdge"] = "1 Pixel",
				["regionType"] = "dynamicgroup",
				["borderSize"] = 2,
				["limit"] = 5,
				["selfPoint"] = "BOTTOMLEFT",
				["gridType"] = "RD",
				["yOffset"] = -240.21807861328,
				["arcLength"] = 360,
				["constantFactor"] = "RADIUS",
				["sort"] = "none",
				["borderOffset"] = 4,
				["config"] = {
				},
				["tocversion"] = 11302,
				["id"] = "圣骑士 QS(动态 怀旧 Classic)",
				["borderInset"] = 1,
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["gridWidth"] = 5,
				["uid"] = "Z7AwBEvsHD7",
				["xOffset"] = -184.35302734375,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["rowSpace"] = 1,
				["conditions"] = {
				},
				["internalVersion"] = 24,
				["rotation"] = 0,
			},
		},
		["We3V)BlFpGH"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245660,
			["allowUpdates"] = true,
			["data"] = {
				["sparkWidth"] = 10,
				["borderBackdrop"] = "None",
				["parent"] = "Paladin 2.0",
				["yOffset"] = -107.99981689453,
				["anchorPoint"] = "CENTER",
				["sparkRotation"] = 0,
				["sparkRotationMode"] = "AUTO",
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "status",
							["genericShowOn"] = "showOnActive",
							["unevent"] = "auto",
							["names"] = {
							},
							["duration"] = "1",
							["event"] = "Swing Timer",
							["unit"] = "player",
							["use_unit"] = true,
							["use_absorbMode"] = true,
							["spellIds"] = {
							},
							["use_hand"] = true,
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["hand"] = "main",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["use_alwaystrue"] = true,
							["unevent"] = "auto",
							["use_absorbMode"] = true,
							["genericShowOn"] = "showOnActive",
							["unit"] = "player",
							["subeventPrefix"] = "SPELL",
							["duration"] = "1",
							["event"] = "Conditions",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
						},
						["untrigger"] = {
						},
					}, -- [2]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["icon_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["internalVersion"] = 24,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["backdropInFront"] = false,
				["desaturate"] = false,
				["barColor"] = {
					1, -- [1]
					0.50196078431373, -- [2]
					0.95294117647059, -- [3]
					1, -- [4]
				},
				["stickyDuration"] = false,
				["icon"] = false,
				["sparkOffsetY"] = 0,
				["version"] = 8,
				["subRegions"] = {
					{
						["type"] = "aurabar_bar",
					}, -- [1]
					{
						["text_shadowXOffset"] = 1,
						["type"] = "subtext",
						["text_text"] = " ",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = -1,
						["text_selfPoint"] = "AUTO",
						["text_fontSize"] = 12,
						["text_visible"] = false,
						["text_anchorPoint"] = "INNER_RIGHT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontType"] = "None",
					}, -- [2]
					{
						["text_shadowXOffset"] = 1,
						["type"] = "subtext",
						["text_text"] = " ",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = -1,
						["text_selfPoint"] = "AUTO",
						["text_fontSize"] = 12,
						["text_visible"] = false,
						["text_anchorPoint"] = "INNER_LEFT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontType"] = "None",
					}, -- [3]
					{
						["text_shadowXOffset"] = 1,
						["type"] = "subtext",
						["text_text"] = "%s",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = -1,
						["text_selfPoint"] = "AUTO",
						["text_fontSize"] = 12,
						["text_visible"] = false,
						["text_anchorPoint"] = "ICON_CENTER",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontType"] = "None",
					}, -- [4]
					{
						["border_offset"] = 1,
						["border_anchor"] = "bar",
						["border_size"] = 1,
						["border_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["border_visible"] = true,
						["border_edge"] = "1 Pixel",
						["type"] = "subborder",
					}, -- [5]
				},
				["height"] = 15.000045776367,
				["authorOptions"] = {
				},
				["load"] = {
					["use_race"] = false,
					["talent"] = {
						["multi"] = {
						},
					},
					["ingroup"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["PALADIN"] = true,
						},
					},
					["spec"] = {
						["single"] = 1,
						["multi"] = {
						},
					},
					["use_class"] = true,
					["difficulty"] = {
						["multi"] = {
						},
					},
					["role"] = {
						["multi"] = {
						},
					},
					["use_spec"] = true,
					["faction"] = {
						["multi"] = {
						},
					},
					["pvptalent"] = {
						["multi"] = {
						},
					},
					["race"] = {
						["single"] = "Human",
						["multi"] = {
							["Dwarf"] = true,
							["Human"] = true,
						},
					},
					["talent2"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["sparkBlendMode"] = "ADD",
				["useAdjustededMax"] = false,
				["selfPoint"] = "CENTER",
				["sparkColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["config"] = {
				},
				["backgroundColor"] = {
					1, -- [1]
					0.50196078431373, -- [2]
					0.95294117647059, -- [3]
					0.60000002384186, -- [4]
				},
				["anchorFrameType"] = "SCREEN",
				["alpha"] = 1,
				["useAdjustededMin"] = false,
				["regionType"] = "aurabar",
				["borderInFront"] = true,
				["backdropColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["icon_side"] = "RIGHT",
				["sparkHidden"] = "NEVER",
				["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
				["sparkHeight"] = 30,
				["texture"] = "ElvUI Blank",
				["semver"] = "1.0.7",
				["zoom"] = 0,
				["auto"] = true,
				["tocversion"] = 11302,
				["id"] = "Paladin - Swing Timer",
				["spark"] = false,
				["frameStrata"] = 1,
				["width"] = 244.99998474121,
				["sparkOffsetX"] = 0,
				["uid"] = "We3V)BlFpGH",
				["inverse"] = false,
				["sparkDesature"] = false,
				["orientation"] = "HORIZONTAL",
				["conditions"] = {
				},
				["xOffset"] = 0,
				["fontFlags"] = "OUTLINE",
			},
		},
		["7RE5889xJbY"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571246060,
			["allowUpdates"] = true,
			["data"] = {
				["user_y"] = 0,
				["user_x"] = 0,
				["color"] = {
				},
				["adjustedMax"] = 10,
				["adjustedMin"] = 2,
				["yOffset"] = -25.498352050781,
				["foregroundColor"] = {
					1, -- [1]
					0.90588235294118, -- [2]
					0.24705882352941, -- [3]
					1, -- [4]
				},
				["desaturateBackground"] = false,
				["sameTexture"] = true,
				["url"] = "https://wago.io/eEPLkEuIv/1",
				["desaturateForeground"] = false,
				["triggers"] = {
					{
						["trigger"] = {
							["track"] = "auto",
							["auranames"] = {
								"20154", -- [1]
								"20305", -- [2]
								"20164", -- [3]
							},
							["matchesShowOn"] = "showOnActive",
							["genericShowOn"] = "showAlways",
							["unit"] = "player",
							["unitExists"] = true,
							["debuffType"] = "HELPFUL",
							["use_remaining"] = false,
							["type"] = "aura2",
							["unevent"] = "timed",
							["subeventSuffix"] = "_CAST_START",
							["use_genericShowOn"] = true,
							["spellName"] = 20293,
							["event"] = "Chat Message",
							["useName"] = true,
							["realSpellName"] = "Seal of Righteousness",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["use_unit"] = true,
							["duration"] = "1",
							["names"] = {
							},
							["use_track"] = true,
							["subeventPrefix"] = "SPELL",
						},
						["untrigger"] = {
							["genericShowOn"] = "showAlways",
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "aura2",
							["auranames"] = {
								"20305", -- [1]
								"20289", -- [2]
								"20164", -- [3]
							},
							["matchesShowOn"] = "showOnMissing",
							["event"] = "Health",
							["unit"] = "player",
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["useName"] = true,
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["endAngle"] = 360,
				["internalVersion"] = 24,
				["animation"] = {
					["start"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "fade",
					},
					["main"] = {
						["colorR"] = 1,
						["scalex"] = 1,
						["alphaType"] = "straight",
						["colorB"] = 1,
						["colorG"] = 1,
						["alphaFunc"] = "    function(progress, start, delta)\n      return start + (progress * delta)\n    end\n  ",
						["use_alpha"] = true,
						["type"] = "none",
						["preset"] = "alphaPulse",
						["alpha"] = 0.6,
						["y"] = 0,
						["x"] = 0,
						["colorA"] = 1,
						["duration"] = "5",
						["rotate"] = 0,
						["scaley"] = 1,
						["duration_type"] = "relative",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
						["preset"] = "grow",
					},
				},
				["slanted"] = true,
				["parent"] = "Paladin Protection",
				["crop_x"] = 0.41,
				["authorOptions"] = {
				},
				["rotation"] = 180,
				["font"] = "Friz Quadrata TT",
				["version"] = 1,
				["subRegions"] = {
				},
				["height"] = 52.552562713623,
				["textureWrapMode"] = "CLAMP",
				["crop_y"] = 0.41,
				["startAngle"] = 0,
				["useAdjustededMax"] = true,
				["fontSize"] = 12,
				["config"] = {
				},
				["foregroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura8",
				["mirror"] = false,
				["width"] = 55.128562927246,
				["smoothProgress"] = true,
				["useAdjustededMin"] = true,
				["regionType"] = "progresstexture",
				["alpha"] = 1,
				["blendMode"] = "ADD",
				["anchorPoint"] = "CENTER",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["slantMode"] = "INSIDE",
				["anchorFrameParent"] = false,
				["tocversion"] = 11302,
				["xOffset"] = 289.85559082031,
				["slantFirst"] = false,
				["backgroundColor"] = {
					0.44313725490196, -- [1]
					0, -- [2]
					0.011764705882353, -- [3]
					0.5, -- [4]
				},
				["compress"] = false,
				["id"] = "Seal of righteousness",
				["selfPoint"] = "RIGHT",
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
				["uid"] = "7RE5889xJbY",
				["inverse"] = false,
				["load"] = {
					["class"] = {
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["orientation"] = "VERTICAL",
				["conditions"] = {
				},
				["slant"] = 0,
				["backgroundOffset"] = 2,
			},
		},
		["8gJCWK0ijiq"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = true,
				["text1FontSize"] = 12,
				["authorOptions"] = {
				},
				["displayText"] = "",
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["url"] = "https://wago.io/pQukwVj27/1",
				["actions"] = {
					["start"] = {
						["message"] = "-> %n <-",
						["do_message"] = true,
						["message_type"] = "YELL",
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["text1Enabled"] = true,
				["keepAspectRatio"] = false,
				["selfPoint"] = "CENTER",
				["text1Containment"] = "INSIDE",
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["text1Point"] = "BOTTOMRIGHT",
				["text2FontFlags"] = "OUTLINE",
				["load"] = {
					["use_class"] = true,
					["ingroup"] = {
						["multi"] = {
							["group"] = true,
							["raid"] = true,
						},
					},
					["use_ingroup"] = false,
					["role"] = {
					},
					["use_combat"] = false,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["text1FontFlags"] = "OUTLINE",
				["regionType"] = "text",
				["text2FontSize"] = 24,
				["cooldownTextDisabled"] = false,
				["auto"] = true,
				["glowScale"] = 1,
				["text2Enabled"] = false,
				["glowYOffset"] = 0,
				["uid"] = "8gJCWK0ijiq",
				["fixedWidth"] = 200,
				["outline"] = "OUTLINE",
				["glowLength"] = 10,
				["cooldownSwipe"] = true,
				["customTextUpdate"] = "update",
				["cooldownEdge"] = false,
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["animation"] = {
					["start"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidetop",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["stickyDuration"] = false,
				["version"] = 1,
				["subRegions"] = {
				},
				["height"] = 35,
				["glowLines"] = 8,
				["glowFrequency"] = 0.25,
				["fontSize"] = 12,
				["text2Containment"] = "INSIDE",
				["config"] = {
				},
				["text1Font"] = "Friz Quadrata TT",
				["tocversion"] = 11302,
				["font"] = "Friz Quadrata TT",
				["text2Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["xOffset"] = 0,
				["wordWrap"] = "WordWrap",
				["text1Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "aura2",
							["auranames"] = {
							},
							["matchesShowOn"] = "showOnMissing",
							["event"] = "Health",
							["unit"] = "player",
							["names"] = {
							},
							["spellIds"] = {
							},
							["auraspellids"] = {
								"1126", -- [1]
								"5232", -- [2]
								"6756", -- [3]
								"5234", -- [4]
								"8907", -- [5]
								"9884", -- [6]
								"9885", -- [7]
							},
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
							["useExactSpellId"] = true,
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					{
						["trigger"] = {
							["use_unitisunit"] = false,
							["use_hostility"] = true,
							["class"] = "DRUID",
							["use_character"] = true,
							["unit"] = "party1",
							["use_class"] = true,
							["character"] = "player",
							["custom_hide"] = "timed",
							["type"] = "status",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["event"] = "Unit Characteristics",
							["duration"] = "1",
							["use_name"] = false,
							["custom_type"] = "event",
							["name"] = "",
							["subeventPrefix"] = "SPELL",
							["check"] = "event",
							["unevent"] = "auto",
							["hostility"] = "friendly",
							["use_specific_unit"] = true,
						},
						["untrigger"] = {
							["unit"] = "party1",
							["use_specific_unit"] = true,
						},
					}, -- [2]
					{
						["trigger"] = {
							["use_unit"] = true,
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["use_specific_unit"] = true,
							["duration"] = "1",
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["class"] = "DRUID",
							["event"] = "Unit Characteristics",
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["unit"] = "party2",
							["use_absorbMode"] = true,
						},
						["untrigger"] = {
							["use_specific_unit"] = true,
							["unit"] = "party2",
						},
					}, -- [3]
					{
						["trigger"] = {
							["use_unit"] = true,
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["use_specific_unit"] = true,
							["duration"] = "1",
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["class"] = "DRUID",
							["event"] = "Unit Characteristics",
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["unit"] = "party3",
							["use_absorbMode"] = true,
						},
						["untrigger"] = {
							["use_specific_unit"] = true,
							["unit"] = "party3",
						},
					}, -- [4]
					{
						["trigger"] = {
							["use_unit"] = true,
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["use_specific_unit"] = true,
							["use_absorbMode"] = true,
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["class"] = "DRUID",
							["event"] = "Unit Characteristics",
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["unit"] = "party4",
							["duration"] = "1",
						},
						["untrigger"] = {
							["use_specific_unit"] = true,
							["unit"] = "party4",
						},
					}, -- [5]
					{
						["trigger"] = {
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["hostility"] = "friendly",
							["use_absorbMode"] = true,
							["use_character"] = true,
							["unit"] = "player",
							["use_class"] = true,
							["character"] = "player",
							["subeventPrefix"] = "SPELL",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["duration"] = "1",
							["class"] = "DRUID",
						},
						["untrigger"] = {
						},
					}, -- [6]
					["disjunctive"] = "custom",
					["customTriggerLogic"] = "function(trigger)\n    return trigger[1] and (trigger[2] or trigger[3] or trigger[4] or trigger[5] or trigger[6]);\nend",
					["activeTriggerMode"] = -10,
				},
				["icon"] = true,
				["anchorFrameType"] = "SCREEN",
				["text1"] = "%s",
				["zoom"] = 0.3,
				["text2Point"] = "CENTER",
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["justify"] = "LEFT",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["id"] = "xd1-nobuff 10",
				["text2"] = "%p",
				["frameStrata"] = 1,
				["width"] = 35,
				["automaticWidth"] = "Auto",
				["text2Font"] = "Friz Quadrata TT",
				["inverse"] = false,
				["alpha"] = 1,
				["desaturate"] = false,
				["conditions"] = {
				},
				["authorMode"] = true,
				["glowBorder"] = false,
			},
		},
		["Kj2Cgc0DOKL"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245660,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["yOffset"] = -155.78,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["cooldownEdge"] = false,
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 8,
				["subRegions"] = {
				},
				["height"] = 35,
				["glowLength"] = 10,
				["glowLines"] = 8,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["glowFrequency"] = 0.25,
				["displayIcon"] = 136225,
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["parent"] = "Paladin 2.0",
				["keepAspectRatio"] = false,
				["config"] = {
				},
				["regionType"] = "icon",
				["xOffset"] = 71,
				["anchorFrameType"] = "SCREEN",
				["alpha"] = 1,
				["width"] = 35,
				["progressPrecision"] = 0,
				["tocversion"] = 11302,
				["semver"] = "1.0.7",
				["cooldownTextDisabled"] = true,
				["zoom"] = 0.3,
				["auto"] = false,
				["glowScale"] = 1,
				["id"] = "Paladin - Stoneskin",
				["authorOptions"] = {
				},
				["frameStrata"] = 1,
				["glowYOffset"] = 0,
				["icon"] = true,
				["uid"] = "Kj2Cgc0DOKL",
				["inverse"] = false,
				["load"] = {
					["use_class"] = true,
					["use_race"] = true,
					["use_never"] = false,
					["race"] = {
						["single"] = "Dwarf",
						["multi"] = {
							["Human"] = true,
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["MAGE"] = true,
							["PALADIN"] = true,
							["SHAMAN"] = true,
							["PRIEST"] = true,
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["auranames"] = {
								"Rend", -- [1]
							},
							["matchesShowOn"] = "showAlways",
							["genericShowOn"] = "showAlways",
							["unit"] = "target",
							["unitExists"] = true,
							["debuffType"] = "HARMFUL",
							["duration"] = "1",
							["type"] = "status",
							["subeventSuffix"] = "_CAST_START",
							["unevent"] = "auto",
							["use_genericShowOn"] = true,
							["ownOnly"] = true,
							["event"] = "Cooldown Progress (Spell)",
							["spellName"] = 20594,
							["realSpellName"] = "Stoneform",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["useName"] = true,
							["use_unit"] = true,
							["names"] = {
							},
							["use_track"] = true,
							["subeventPrefix"] = "SPELL",
						},
						["untrigger"] = {
							["genericShowOn"] = "showAlways",
						},
					}, -- [1]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["conditions"] = {
					{
						["check"] = {
							["trigger"] = 1,
							["variable"] = "onCooldown",
							["value"] = 1,
						},
						["changes"] = {
							{
								["value"] = true,
								["property"] = "desaturate",
							}, -- [1]
						},
					}, -- [1]
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["1YbIxpD4wQ6"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["xOffset"] = 0,
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["url"] = "https://wago.io/pQukwVj27/1",
				["icon"] = true,
				["useglowColor"] = false,
				["useTooltip"] = true,
				["glowXOffset"] = 0,
				["animation"] = {
					["start"] = {
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_scale"] = true,
						["colorA"] = 1,
						["colorG"] = 0,
						["duration"] = "1",
						["use_translate"] = true,
						["scalex"] = 1,
						["colorR"] = 0,
						["type"] = "preset",
						["scaleType"] = "pulse",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["x"] = 0,
						["y"] = 0,
						["colorType"] = "straightHSV",
						["translateType"] = "bounce",
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["colorB"] = 0,
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "preset",
						["preset"] = "shake",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
					},
				},
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
				},
				["height"] = 38,
				["selfPoint"] = "CENTER",
				["glowLines"] = 8,
				["internalVersion"] = 24,
				["authorMode"] = true,
				["displayIcon"] = 132932,
				["glowLength"] = 10,
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["keepAspectRatio"] = false,
				["config"] = {
				},
				["regionType"] = "icon",
				["cooldownEdge"] = true,
				["glowYOffset"] = 0,
				["alpha"] = 1,
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["width"] = 38,
				["glowScale"] = 1,
				["actions"] = {
					["start"] = {
						["do_glow"] = false,
						["do_sound"] = true,
						["message_type"] = "SAY",
						["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\sonar.ogg",
						["do_message"] = false,
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["cooldownTextDisabled"] = true,
				["zoom"] = 0,
				["auto"] = false,
				["tocversion"] = 11302,
				["id"] = "脱战 9",
				["glowFrequency"] = 0.25,
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["uid"] = "1YbIxpD4wQ6",
				["inverse"] = true,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = false,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["MAGE"] = true,
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["spellknown"] = 1459,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["auranames"] = {
								"433", -- [1]
							},
							["matchesShowOn"] = "showOnActive",
							["use_unit"] = true,
							["use_attackable"] = true,
							["debuffType"] = "HELPFUL",
							["unit"] = "player",
							["useName"] = true,
							["use_charges"] = true,
							["unevent"] = "timed",
							["names"] = {
							},
							["type"] = "event",
							["event"] = "Combat Events",
							["eventtype"] = "PLAYER_REGEN_ENABLED",
							["realSpellName"] = 0,
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["use_eventtype"] = true,
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
							["duration"] = "3",
							["spellName"] = 0,
						},
						["untrigger"] = {
							["eventtype"] = "PLAYER_REGEN_ENABLED",
							["unit"] = "target",
						},
					}, -- [1]
					["activeTriggerMode"] = 1,
				},
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["hf46CiBubFC"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["sparkWidth"] = 16,
				["sparkOffsetX"] = 0,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["adjustedMax"] = 5,
				["customText"] = "",
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["sparkRotation"] = 0,
				["sparkRotationMode"] = "AUTO",
				["url"] = "https://wago.io/pQukwVj27/1",
				["backgroundColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					0.5, -- [4]
				},
				["triggers"] = {
					{
						["trigger"] = {
							["duration"] = "1",
							["subeventPrefix"] = "SPELL",
							["powertype"] = 4,
							["names"] = {
							},
							["use_unit"] = true,
							["use_powertype"] = true,
							["debuffType"] = "HELPFUL",
							["use_power"] = true,
							["type"] = "status",
							["use_health"] = true,
							["subeventSuffix"] = "_CAST_START",
							["power_operator"] = ">",
							["event"] = "Power",
							["use_requirePowerType"] = false,
							["use_percentpower"] = false,
							["power"] = "1",
							["health"] = "1",
							["spellIds"] = {
							},
							["health_operator"] = ">",
							["unit"] = "player",
							["unevent"] = "auto",
							["percentpower"] = "100",
							["percentpower_operator"] = "<",
						},
						["untrigger"] = {
						},
					}, -- [1]
					["activeTriggerMode"] = 1,
				},
				["icon_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["internalVersion"] = 24,
				["animation"] = {
					["start"] = {
						["colorR"] = 0,
						["scalex"] = 1,
						["colorB"] = 0,
						["colorG"] = 0,
						["colorA"] = 1,
						["use_translate"] = true,
						["use_scale"] = true,
						["type"] = "preset",
						["scaleType"] = "pulse",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["colorType"] = "straightHSV",
						["y"] = 0,
						["x"] = 0,
						["translateType"] = "bounce",
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["duration"] = "1",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["barColor"] = {
					0.011764705882353, -- [1]
					1, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["desaturate"] = false,
				["version"] = 1,
				["subRegions"] = {
					{
						["type"] = "aurabar_bar",
					}, -- [1]
					{
						["text_shadowXOffset"] = 1,
						["type"] = "subtext",
						["text_text"] = "%1.powertype",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = -1,
						["text_selfPoint"] = "BOTTOM",
						["text_visible"] = true,
						["text_fontType"] = "None",
						["text_anchorPoint"] = "SPARK",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontSize"] = 18,
					}, -- [2]
				},
				["height"] = 38,
				["load"] = {
					["use_class"] = true,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["MAGE"] = true,
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["sparkBlendMode"] = "ADD",
				["useAdjustededMax"] = true,
				["sparkOffsetY"] = 0,
				["color"] = {
				},
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["smoothProgress"] = true,
				["useAdjustededMin"] = false,
				["regionType"] = "aurabar",
				["icon"] = false,
				["sparkTexture"] = "XPBarAnim-OrangeSpark",
				["icon_side"] = "RIGHT",
				["uid"] = "hf46CiBubFC",
				["sparkHidden"] = "NEVER",
				["sparkHeight"] = 10,
				["texture"] = "Blizzard",
				["width"] = 14,
				["zoom"] = 0,
				["spark"] = true,
				["tocversion"] = 11302,
				["id"] = "点数 4",
				["alpha"] = 1,
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["auto"] = true,
				["sparkColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["inverse"] = false,
				["config"] = {
				},
				["orientation"] = "VERTICAL_INVERSE",
				["conditions"] = {
				},
				["selfPoint"] = "CENTER",
				["xOffset"] = -2,
			},
		},
		["BDQvI8HtAOa"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245660,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["glowLength"] = 10,
				["yOffset"] = -75,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["icon"] = true,
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 8,
				["subRegions"] = {
				},
				["height"] = 49,
				["glowLines"] = 8,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["glowFrequency"] = 0.25,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["displayIcon"] = 135954,
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["authorOptions"] = {
				},
				["keepAspectRatio"] = false,
				["xOffset"] = 99,
				["regionType"] = "icon",
				["config"] = {
				},
				["cooldownEdge"] = false,
				["glowYOffset"] = 0,
				["alpha"] = 1,
				["width"] = 49,
				["cooldownTextDisabled"] = true,
				["glowScale"] = 1,
				["semver"] = "1.0.7",
				["zoom"] = 0.3,
				["auto"] = false,
				["tocversion"] = 11302,
				["id"] = "Paladin - Divine Protection",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["parent"] = "Paladin 2.0",
				["uid"] = "BDQvI8HtAOa",
				["inverse"] = false,
				["load"] = {
					["use_class"] = true,
					["race"] = {
						["single"] = "Human",
						["multi"] = {
							["Dwarf"] = true,
							["Human"] = true,
						},
					},
					["use_race"] = false,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["PALADIN"] = true,
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["track"] = "auto",
							["auranames"] = {
								"Blood Fury", -- [1]
							},
							["duration"] = "1",
							["genericShowOn"] = "showAlways",
							["unit"] = "player",
							["unitExists"] = true,
							["debuffType"] = "HELPFUL",
							["type"] = "status",
							["subeventPrefix"] = "SPELL",
							["unevent"] = "auto",
							["matchesShowOn"] = "showAlways",
							["names"] = {
							},
							["event"] = "Cooldown Progress (Spell)",
							["use_genericShowOn"] = true,
							["realSpellName"] = "Divine Protection",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["use_unit"] = true,
							["useName"] = true,
							["spellName"] = 498,
							["use_track"] = true,
							["subeventSuffix"] = "_CAST_START",
						},
						["untrigger"] = {
							["genericShowOn"] = "showAlways",
							["track"] = "auto",
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["use_alwaystrue"] = true,
							["subeventSuffix"] = "_CAST_START",
							["duration"] = "1",
							["event"] = "Conditions",
							["unit"] = "player",
							["unevent"] = "auto",
							["subeventPrefix"] = "SPELL",
							["use_unit"] = true,
						},
						["untrigger"] = {
						},
					}, -- [2]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["conditions"] = {
					{
						["check"] = {
							["trigger"] = 1,
							["variable"] = "onCooldown",
							["value"] = 1,
						},
						["changes"] = {
							{
								["value"] = true,
								["property"] = "desaturate",
							}, -- [1]
							{
							}, -- [2]
						},
					}, -- [1]
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["c)s9kocTJmy"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = true,
				["text1FontSize"] = 12,
				["xOffset"] = 0,
				["displayText"] = "",
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["url"] = "https://wago.io/pQukwVj27/1",
				["actions"] = {
					["start"] = {
						["message"] = "-> %n <-",
						["do_message"] = true,
						["message_type"] = "YELL",
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["text1Enabled"] = true,
				["keepAspectRatio"] = false,
				["wordWrap"] = "WordWrap",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["font"] = "Friz Quadrata TT",
				["text2FontFlags"] = "OUTLINE",
				["load"] = {
					["ingroup"] = {
						["multi"] = {
							["group"] = true,
							["raid"] = true,
						},
					},
					["use_never"] = true,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["use_class"] = true,
					["use_ingroup"] = false,
					["role"] = {
					},
					["use_combat"] = false,
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["text1FontFlags"] = "OUTLINE",
				["regionType"] = "text",
				["text2FontSize"] = 24,
				["cooldownTextDisabled"] = false,
				["auto"] = true,
				["glowScale"] = 1,
				["text2Enabled"] = false,
				["glowYOffset"] = 0,
				["uid"] = "c)s9kocTJmy",
				["fixedWidth"] = 200,
				["outline"] = "OUTLINE",
				["glowLength"] = 10,
				["cooldownSwipe"] = true,
				["customTextUpdate"] = "update",
				["cooldownEdge"] = false,
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "aura2",
							["auraspellids"] = {
								"19740", -- [1]
								"19834", -- [2]
								"19835", -- [3]
								"19836", -- [4]
								"19837", -- [5]
								"19838", -- [6]
								"25291", -- [7]
							},
							["matchesShowOn"] = "showOnMissing",
							["event"] = "Health",
							["names"] = {
							},
							["subeventSuffix"] = "_CAST_START",
							["spellIds"] = {
							},
							["auranames"] = {
							},
							["subeventPrefix"] = "SPELL",
							["useExactSpellId"] = true,
							["unit"] = "player",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					{
						["trigger"] = {
							["use_unitisunit"] = false,
							["use_hostility"] = true,
							["duration"] = "1",
							["use_character"] = true,
							["unit"] = "party1",
							["use_class"] = true,
							["character"] = "player",
							["custom_hide"] = "timed",
							["type"] = "status",
							["subeventSuffix"] = "_CAST_START",
							["hostility"] = "friendly",
							["event"] = "Unit Characteristics",
							["class"] = "PALADIN",
							["use_name"] = false,
							["custom_type"] = "event",
							["name"] = "",
							["subeventPrefix"] = "SPELL",
							["check"] = "event",
							["unevent"] = "auto",
							["use_unit"] = true,
							["use_specific_unit"] = true,
						},
						["untrigger"] = {
							["unit"] = "party1",
							["use_specific_unit"] = true,
						},
					}, -- [2]
					{
						["trigger"] = {
							["use_absorbMode"] = true,
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["hostility"] = "friendly",
							["class"] = "PALADIN",
							["use_character"] = true,
							["unit"] = "party2",
							["use_class"] = true,
							["character"] = "player",
							["subeventPrefix"] = "SPELL",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_specific_unit"] = true,
							["duration"] = "1",
						},
						["untrigger"] = {
							["unit"] = "party2",
							["use_specific_unit"] = true,
						},
					}, -- [3]
					{
						["trigger"] = {
							["use_absorbMode"] = true,
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["hostility"] = "friendly",
							["class"] = "PALADIN",
							["use_character"] = true,
							["unit"] = "party3",
							["use_class"] = true,
							["character"] = "player",
							["subeventPrefix"] = "SPELL",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_specific_unit"] = true,
							["duration"] = "1",
						},
						["untrigger"] = {
							["unit"] = "party3",
							["use_specific_unit"] = true,
						},
					}, -- [4]
					{
						["trigger"] = {
							["use_absorbMode"] = true,
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["class"] = "PALADIN",
							["duration"] = "1",
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["subeventPrefix"] = "SPELL",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_specific_unit"] = true,
							["unit"] = "party4",
						},
						["untrigger"] = {
							["unit"] = "party4",
							["use_specific_unit"] = true,
						},
					}, -- [5]
					{
						["trigger"] = {
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["hostility"] = "friendly",
							["duration"] = "1",
							["use_character"] = true,
							["unit"] = "player",
							["use_class"] = true,
							["character"] = "player",
							["use_unit"] = true,
							["event"] = "Unit Characteristics",
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["use_absorbMode"] = true,
							["class"] = "PALADIN",
						},
						["untrigger"] = {
						},
					}, -- [6]
					["disjunctive"] = "custom",
					["customTriggerLogic"] = "function(trigger)\n    return trigger[1] and (trigger[2] or trigger[3] or trigger[4] or trigger[5] or trigger[6]);\nend",
					["activeTriggerMode"] = -10,
				},
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["animation"] = {
					["start"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidetop",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["stickyDuration"] = false,
				["version"] = 1,
				["subRegions"] = {
				},
				["height"] = 35,
				["glowLines"] = 8,
				["glowFrequency"] = 0.25,
				["fontSize"] = 12,
				["text2Containment"] = "INSIDE",
				["config"] = {
				},
				["text1Font"] = "Friz Quadrata TT",
				["tocversion"] = 11302,
				["automaticWidth"] = "Auto",
				["text2Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["text1Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["text2Font"] = "Friz Quadrata TT",
				["alpha"] = 1,
				["text1Point"] = "BOTTOMRIGHT",
				["zoom"] = 0.3,
				["width"] = 35,
				["text1"] = "%s",
				["text1Containment"] = "INSIDE",
				["text2Point"] = "CENTER",
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["justify"] = "LEFT",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["id"] = "zs-noBuff 10",
				["useglowColor"] = false,
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["icon"] = true,
				["selfPoint"] = "CENTER",
				["inverse"] = false,
				["authorOptions"] = {
				},
				["authorMode"] = true,
				["conditions"] = {
				},
				["text2"] = "%p",
				["glowBorder"] = false,
			},
		},
		["zA)oQAUgAcu"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245425,
			["allowUpdates"] = true,
			["data"] = {
				["grow"] = "RIGHT",
				["controlledChildren"] = {
				},
				["borderBackdrop"] = "Blizzard Tooltip",
				["xOffset"] = -17.5,
				["yOffset"] = -213.75616455078,
				["anchorPoint"] = "CENTER",
				["borderColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["space"] = 2,
				["url"] = "https://wago.io/8gwJWjdPx/1",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["unit"] = "player",
							["type"] = "aura2",
							["spellIds"] = {
							},
							["subeventSuffix"] = "_CAST_START",
							["names"] = {
							},
							["subeventPrefix"] = "SPELL",
							["event"] = "Health",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
				},
				["columnSpace"] = 1,
				["internalVersion"] = 24,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["align"] = "CENTER",
				["stagger"] = 0,
				["version"] = 1,
				["subRegions"] = {
				},
				["load"] = {
					["use_class"] = "true",
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["backdropColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					0.5, -- [4]
				},
				["animate"] = true,
				["scale"] = 1,
				["border"] = false,
				["borderEdge"] = "Square Full White",
				["regionType"] = "dynamicgroup",
				["borderSize"] = 2,
				["limit"] = 5,
				["useLimit"] = false,
				["gridType"] = "RD",
				["rowSpace"] = 1,
				["constantFactor"] = "RADIUS",
				["authorOptions"] = {
				},
				["borderOffset"] = 4,
				["sort"] = "none",
				["tocversion"] = 11302,
				["id"] = "Classic Paladin - CD's",
				["uid"] = "zA)oQAUgAcu",
				["gridWidth"] = 5,
				["anchorFrameType"] = "SCREEN",
				["borderInset"] = 1,
				["config"] = {
				},
				["frameStrata"] = 1,
				["arcLength"] = 360,
				["selfPoint"] = "LEFT",
				["conditions"] = {
				},
				["radius"] = 200,
				["rotation"] = 0,
			},
		},
		["2mpablvJ7mN"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = true,
				["text1FontSize"] = 12,
				["authorOptions"] = {
				},
				["displayText"] = "",
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["url"] = "https://wago.io/pQukwVj27/1",
				["icon"] = true,
				["text1Enabled"] = true,
				["keepAspectRatio"] = false,
				["wordWrap"] = "WordWrap",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["font"] = "Friz Quadrata TT",
				["text2FontFlags"] = "OUTLINE",
				["load"] = {
					["use_class"] = true,
					["ingroup"] = {
						["multi"] = {
							["group"] = true,
							["raid"] = true,
						},
					},
					["use_ingroup"] = false,
					["role"] = {
					},
					["use_combat"] = false,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["text1FontFlags"] = "OUTLINE",
				["regionType"] = "text",
				["text2FontSize"] = 24,
				["cooldownTextDisabled"] = false,
				["auto"] = true,
				["glowScale"] = 1,
				["text2Enabled"] = false,
				["glowYOffset"] = 0,
				["uid"] = "2mpablvJ7mN",
				["fixedWidth"] = 200,
				["outline"] = "OUTLINE",
				["glowLength"] = 10,
				["cooldownSwipe"] = true,
				["customTextUpdate"] = "update",
				["automaticWidth"] = "Auto",
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["animation"] = {
					["start"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidetop",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["stickyDuration"] = false,
				["version"] = 1,
				["subRegions"] = {
				},
				["height"] = 35,
				["glowLines"] = 8,
				["glowFrequency"] = 0.25,
				["fontSize"] = 12,
				["text2Containment"] = "INSIDE",
				["cooldownEdge"] = false,
				["text1Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["tocversion"] = 11302,
				["text2"] = "%p",
				["text2Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["text2Font"] = "Friz Quadrata TT",
				["text1Font"] = "Friz Quadrata TT",
				["xOffset"] = 0,
				["text1Point"] = "BOTTOMRIGHT",
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "aura2",
							["auraspellids"] = {
								"467", -- [1]
								"782", -- [2]
								"1075", -- [3]
								"8914", -- [4]
								"9756", -- [5]
								"9910", -- [6]
							},
							["matchesShowOn"] = "showOnMissing",
							["event"] = "Health",
							["subeventPrefix"] = "SPELL",
							["useExactSpellId"] = true,
							["spellIds"] = {
							},
							["auranames"] = {
							},
							["names"] = {
							},
							["subeventSuffix"] = "_CAST_START",
							["unit"] = "player",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					{
						["trigger"] = {
							["use_unitisunit"] = false,
							["use_hostility"] = true,
							["duration"] = "1",
							["use_character"] = true,
							["use_specific_unit"] = true,
							["use_class"] = true,
							["character"] = "player",
							["custom_hide"] = "timed",
							["type"] = "status",
							["subeventSuffix"] = "_CAST_START",
							["hostility"] = "friendly",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["use_name"] = false,
							["custom_type"] = "event",
							["name"] = "",
							["subeventPrefix"] = "SPELL",
							["check"] = "event",
							["unevent"] = "auto",
							["class"] = "DRUID",
							["unit"] = "party1",
						},
						["untrigger"] = {
							["unit"] = "party1",
							["use_specific_unit"] = true,
						},
					}, -- [2]
					{
						["trigger"] = {
							["duration"] = "1",
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["class"] = "DRUID",
							["use_absorbMode"] = true,
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["subeventPrefix"] = "SPELL",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_specific_unit"] = true,
							["unit"] = "party2",
						},
						["untrigger"] = {
							["use_specific_unit"] = true,
							["unit"] = "party2",
						},
					}, -- [3]
					{
						["trigger"] = {
							["use_absorbMode"] = true,
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["class"] = "DRUID",
							["duration"] = "1",
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["subeventPrefix"] = "SPELL",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_specific_unit"] = true,
							["unit"] = "party3",
						},
						["untrigger"] = {
							["use_specific_unit"] = true,
							["unit"] = "party3",
						},
					}, -- [4]
					{
						["trigger"] = {
							["use_absorbMode"] = true,
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["class"] = "DRUID",
							["duration"] = "1",
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["subeventPrefix"] = "SPELL",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_specific_unit"] = true,
							["unit"] = "party4",
						},
						["untrigger"] = {
							["use_specific_unit"] = true,
							["unit"] = "party4",
						},
					}, -- [5]
					{
						["trigger"] = {
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["hostility"] = "friendly",
							["use_absorbMode"] = true,
							["use_character"] = true,
							["unit"] = "player",
							["use_class"] = true,
							["character"] = "player",
							["subeventPrefix"] = "SPELL",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["duration"] = "1",
							["class"] = "DRUID",
						},
						["untrigger"] = {
						},
					}, -- [6]
					["disjunctive"] = "custom",
					["customTriggerLogic"] = "function(trigger)\n    return trigger[1] and (trigger[2] or trigger[3] or trigger[4] or trigger[5] or trigger[6]);\nend",
					["activeTriggerMode"] = -10,
				},
				["width"] = 35,
				["text1"] = "%s",
				["zoom"] = 0.3,
				["text2Point"] = "CENTER",
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["justify"] = "LEFT",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["id"] = "xd2-noBuff 10",
				["text1Containment"] = "INSIDE",
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["actions"] = {
					["start"] = {
						["message"] = "-> %n <-",
						["do_message"] = true,
						["message_type"] = "YELL",
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["selfPoint"] = "CENTER",
				["inverse"] = false,
				["config"] = {
				},
				["authorMode"] = true,
				["conditions"] = {
				},
				["alpha"] = 1,
				["glowBorder"] = false,
			},
		},
		["Cf)OpccDm3E"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571246060,
			["allowUpdates"] = true,
			["data"] = {
				["user_y"] = 0,
				["backgroundOffset"] = 2,
				["user_x"] = 0,
				["parent"] = "Paladin Protection",
				["adjustedMax"] = 10,
				["adjustedMin"] = 2,
				["yOffset"] = -24.333435058594,
				["anchorPoint"] = "CENTER",
				["desaturateBackground"] = false,
				["slant"] = 0,
				["conditions"] = {
				},
				["sameTexture"] = true,
				["url"] = "https://wago.io/eEPLkEuIv/1",
				["backgroundColor"] = {
					0.44313725490196, -- [1]
					0, -- [2]
					0.011764705882353, -- [3]
					0.5, -- [4]
				},
				["triggers"] = {
					{
						["trigger"] = {
							["showClones"] = true,
							["type"] = "aura2",
							["auranames"] = {
								"19850", -- [1]
								"19835", -- [2]
								"1044", -- [3]
							},
							["ownOnly"] = true,
							["event"] = "Health",
							["unit"] = "player",
							["names"] = {
							},
							["subeventPrefix"] = "SPELL",
							["spellIds"] = {
							},
							["rem"] = "20",
							["remOperator"] = "<=",
							["useName"] = true,
							["subeventSuffix"] = "_CAST_START",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "aura2",
							["auranames"] = {
								"19835", -- [1]
								"1044", -- [2]
								"19850", -- [3]
							},
							["matchesShowOn"] = "showOnMissing",
							["event"] = "Health",
							["subeventPrefix"] = "SPELL",
							["unit"] = "player",
							["ownOnly"] = true,
							["useName"] = true,
							["subeventSuffix"] = "_CAST_START",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["endAngle"] = 360,
				["internalVersion"] = 24,
				["foregroundColor"] = {
					1, -- [1]
					0.90588235294118, -- [2]
					0.24705882352941, -- [3]
					1, -- [4]
				},
				["animation"] = {
					["start"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "fade",
					},
					["main"] = {
						["colorR"] = 1,
						["duration_type"] = "relative",
						["alphaType"] = "alphaPulse",
						["colorA"] = 1,
						["colorG"] = 0.31764705882353,
						["alphaFunc"] = "    function(progress, start, delta)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return start + (((math.sin(angle) + 1)/2) * delta)\n    end\n  ",
						["use_alpha"] = true,
						["type"] = "none",
						["scalex"] = 1,
						["scaley"] = 1,
						["alpha"] = 0.6,
						["x"] = 0,
						["y"] = 0,
						["colorType"] = "straightColor",
						["preset"] = "alphaPulse",
						["use_color"] = false,
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\n    end\n  ",
						["rotate"] = 0,
						["duration"] = "1",
						["colorB"] = 0.29019607843137,
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
						["preset"] = "shrink",
					},
				},
				["color"] = {
				},
				["load"] = {
					["class"] = {
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["uid"] = "Cf)OpccDm3E",
				["desaturate"] = false,
				["discrete_rotation"] = 0,
				["font"] = "Friz Quadrata TT",
				["version"] = 1,
				["subRegions"] = {
				},
				["height"] = 87.886688232422,
				["rotate"] = true,
				["crop_y"] = 0.41,
				["fontSize"] = 12,
				["useAdjustededMax"] = true,
				["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
				["anchorFrameType"] = "SCREEN",
				["startAngle"] = 0,
				["alpha"] = 1,
				["smoothProgress"] = true,
				["mirror"] = true,
				["useAdjustededMin"] = true,
				["regionType"] = "progresstexture",
				["actions"] = {
					["start"] = {
						["do_glow"] = false,
						["sound_kit_id"] = "911",
						["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\chimes.ogg",
						["do_sound"] = false,
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["blendMode"] = "ADD",
				["tocversion"] = 11302,
				["slantFirst"] = false,
				["slantMode"] = "INSIDE",
				["anchorFrameParent"] = false,
				["texture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura2",
				["selfPoint"] = "RIGHT",
				["xOffset"] = 313.71264648438,
				["textureWrapMode"] = "CLAMP",
				["compress"] = false,
				["id"] = "Blessing of wisdom",
				["rotation"] = 0,
				["frameStrata"] = 1,
				["width"] = 88.77564239502,
				["foregroundTexture"] = "165639",
				["config"] = {
				},
				["inverse"] = false,
				["authorOptions"] = {
				},
				["orientation"] = "VERTICAL",
				["crop_x"] = 0.41,
				["desaturateForeground"] = false,
				["slanted"] = true,
			},
		},
		["dTdOnqsm(Jz"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245425,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["url"] = "https://wago.io/8gwJWjdPx/1",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
					{
						["text_shadowXOffset"] = 0,
						["type"] = "subtext",
						["text_text"] = "%p",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = 0,
						["text_selfPoint"] = "AUTO",
						["text_fontSize"] = 26,
						["text_visible"] = true,
						["text_anchorPoint"] = "CENTER",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontType"] = "OUTLINE",
					}, -- [1]
				},
				["height"] = 35,
				["glowLines"] = 8,
				["glowFrequency"] = 0.25,
				["progressPrecision"] = 0,
				["keepAspectRatio"] = false,
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["cooldownEdge"] = false,
				["load"] = {
					["use_class"] = true,
					["use_never"] = false,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["selfPoint"] = "CENTER",
				["regionType"] = "icon",
				["parent"] = "Classic Paladin - CD's",
				["config"] = {
				},
				["xOffset"] = 1,
				["anchorFrameType"] = "SCREEN",
				["alpha"] = 1,
				["authorOptions"] = {
				},
				["cooldownTextDisabled"] = true,
				["glowScale"] = 1,
				["zoom"] = 0.3,
				["auto"] = true,
				["tocversion"] = 11302,
				["id"] = "Paladin - Hammer of Justice",
				["glowLength"] = 10,
				["frameStrata"] = 1,
				["glowYOffset"] = 0,
				["width"] = 35,
				["uid"] = "dTdOnqsm(Jz",
				["inverse"] = false,
				["icon"] = true,
				["triggers"] = {
					{
						["trigger"] = {
							["duration"] = "1",
							["genericShowOn"] = "showOnCooldown",
							["unit"] = "target",
							["debuffType"] = "HARMFUL",
							["type"] = "status",
							["subeventSuffix"] = "_CAST_START",
							["names"] = {
							},
							["subeventPrefix"] = "SPELL",
							["event"] = "Cooldown Progress (Spell)",
							["use_unit"] = true,
							["realSpellName"] = "Hammer of Justice",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["useName"] = true,
							["use_genericShowOn"] = true,
							["unevent"] = "auto",
							["use_track"] = true,
							["spellName"] = 853,
						},
						["untrigger"] = {
						},
					}, -- [1]
					["activeTriggerMode"] = -10,
				},
				["conditions"] = {
					{
						["check"] = {
							["trigger"] = 1,
							["variable"] = "onCooldown",
							["value"] = 1,
						},
						["changes"] = {
							{
								["property"] = "desaturate",
							}, -- [1]
						},
					}, -- [1]
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["agZ8Y9tweva"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["authorOptions"] = {
				},
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["url"] = "https://wago.io/pQukwVj27/1",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
					{
						["text_shadowXOffset"] = 0,
						["type"] = "subtext",
						["text_text"] = " ",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = 0,
						["text_selfPoint"] = "AUTO",
						["text_fontSize"] = 12,
						["text_visible"] = true,
						["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontType"] = "OUTLINE",
					}, -- [1]
				},
				["height"] = 38,
				["glowLines"] = 8,
				["authorMode"] = true,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["glowLength"] = 10,
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["displayIcon"] = "135725",
				["selfPoint"] = "CENTER",
				["keepAspectRatio"] = false,
				["regionType"] = "icon",
				["icon"] = true,
				["config"] = {
				},
				["xOffset"] = 0,
				["glowYOffset"] = 0,
				["alpha"] = 1,
				["anchorFrameType"] = "SCREEN",
				["cooldownTextDisabled"] = false,
				["glowScale"] = 1,
				["zoom"] = 0,
				["auto"] = false,
				["tocversion"] = 11302,
				["id"] = "Find Treasure 11",
				["glowFrequency"] = 0.25,
				["frameStrata"] = 1,
				["width"] = 38,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["uid"] = "agZ8Y9tweva",
				["inverse"] = false,
				["load"] = {
					["use_encounter"] = false,
					["talent"] = {
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["use_class"] = true,
					["use_spellknown"] = true,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["use_combat"] = false,
					["spellknown"] = 2481,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "status",
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Conditions",
							["unit"] = "player",
							["subeventPrefix"] = "SPELL",
							["spellIds"] = {
							},
							["names"] = {
							},
							["subeventSuffix"] = "_CAST_START",
							["use_alive"] = true,
							["use_unit"] = true,
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "custom",
							["custom"] = "function()\n    local isTracking = MiniMapTrackingFrame:IsShown()\n    local icon = MiniMapTrackingIcon:GetTexture()\n    return not isTracking and (icon == nil or icon == 135725)\nend",
							["subeventSuffix"] = "_CAST_START",
							["check"] = "update",
							["custom_type"] = "status",
							["event"] = "Health",
							["subeventPrefix"] = "SPELL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["activeTriggerMode"] = -10,
				},
				["conditions"] = {
				},
				["cooldownEdge"] = false,
				["glowBorder"] = false,
			},
		},
		["vZgSWvDP4VW"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = true,
				["xOffset"] = 0,
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["cooldownEdge"] = true,
				["actions"] = {
					["start"] = {
						["message_type"] = "SAY",
						["message"] = "",
						["do_message"] = false,
						["do_custom"] = false,
					},
					["init"] = {
						["do_custom"] = false,
					},
					["finish"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["auranames"] = {
								"430", -- [1]
							},
							["duration"] = "1",
							["unit"] = "player",
							["use_attackable"] = true,
							["debuffType"] = "HELPFUL",
							["type"] = "aura2",
							["use_charges"] = true,
							["unevent"] = "auto",
							["use_unit"] = true,
							["fetchTooltip"] = true,
							["event"] = "Unit Characteristics",
							["matchesShowOn"] = "showOnActive",
							["realSpellName"] = 0,
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["useName"] = true,
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["names"] = {
							},
							["spellName"] = 0,
						},
						["untrigger"] = {
							["unit"] = "target",
						},
					}, -- [1]
					["activeTriggerMode"] = 1,
				},
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
					{
						["text_shadowXOffset"] = 0,
						["type"] = "subtext",
						["text_text"] = "%tooltip1",
						["text_color"] = {
							0.29019607843137, -- [1]
							0.43137254901961, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = 0,
						["text_selfPoint"] = "AUTO",
						["text_fontSize"] = 18,
						["text_visible"] = true,
						["text_anchorPoint"] = "OUTER_TOP",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontType"] = "OUTLINE",
					}, -- [1]
				},
				["height"] = 38,
				["useglowColor"] = false,
				["glowLines"] = 8,
				["icon"] = true,
				["glowFrequency"] = 0.25,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = false,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["MAGE"] = true,
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["spellknown"] = 1459,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["url"] = "https://wago.io/pQukwVj27/1",
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["progressPrecision"] = 0,
				["authorMode"] = true,
				["config"] = {
				},
				["regionType"] = "icon",
				["useTooltip"] = true,
				["width"] = 38,
				["alpha"] = 1,
				["keepAspectRatio"] = false,
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["tocversion"] = 11302,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["cooldownTextDisabled"] = false,
				["zoom"] = 0,
				["auto"] = true,
				["glowScale"] = 1,
				["id"] = "喝水 buff  9",
				["glowLength"] = 10,
				["frameStrata"] = 1,
				["glowYOffset"] = 0,
				["anchorFrameType"] = "SCREEN",
				["uid"] = "vZgSWvDP4VW",
				["inverse"] = false,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["animation"] = {
					["start"] = {
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_scale"] = true,
						["colorA"] = 1,
						["colorG"] = 0,
						["duration"] = "1",
						["use_translate"] = true,
						["scalex"] = 1,
						["colorR"] = 0,
						["type"] = "preset",
						["scaleType"] = "pulse",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["x"] = 0,
						["y"] = 0,
						["colorType"] = "straightHSV",
						["translateType"] = "bounce",
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["colorB"] = 0,
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["WxGR7Jn4myz"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245660,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["authorOptions"] = {
				},
				["yOffset"] = -155.78,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["cooldownEdge"] = false,
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["auranames"] = {
								"Rend", -- [1]
							},
							["matchesShowOn"] = "showAlways",
							["genericShowOn"] = "showAlways",
							["subeventPrefix"] = "SPELL",
							["unitExists"] = true,
							["debuffType"] = "HARMFUL",
							["ownOnly"] = true,
							["useName"] = true,
							["unevent"] = "auto",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["use_genericShowOn"] = true,
							["event"] = "Cooldown Progress (Spell)",
							["spellName"] = 20598,
							["realSpellName"] = "The Human Spirit",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["type"] = "status",
							["names"] = {
							},
							["duration"] = "1",
							["use_track"] = true,
							["unit"] = "target",
						},
						["untrigger"] = {
							["genericShowOn"] = "showAlways",
						},
					}, -- [1]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 8,
				["subRegions"] = {
				},
				["height"] = 35,
				["xOffset"] = 71,
				["glowLines"] = 8,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["glowFrequency"] = 0.25,
				["displayIcon"] = 132874,
				["keepAspectRatio"] = false,
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["selfPoint"] = "CENTER",
				["glowLength"] = 10,
				["config"] = {
				},
				["regionType"] = "icon",
				["width"] = 35,
				["glowYOffset"] = 0,
				["alpha"] = 1,
				["icon"] = true,
				["progressPrecision"] = 0,
				["glowScale"] = 1,
				["semver"] = "1.0.7",
				["cooldownTextDisabled"] = true,
				["zoom"] = 0.3,
				["auto"] = false,
				["tocversion"] = 11302,
				["id"] = "Paladin - Human Spirit",
				["useglowColor"] = false,
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["parent"] = "Paladin 2.0",
				["uid"] = "WxGR7Jn4myz",
				["inverse"] = false,
				["load"] = {
					["use_class"] = true,
					["race"] = {
						["single"] = "Human",
						["multi"] = {
							["Human"] = true,
						},
					},
					["use_never"] = false,
					["use_race"] = true,
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["MAGE"] = true,
							["PALADIN"] = true,
							["SHAMAN"] = true,
							["PRIEST"] = true,
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["conditions"] = {
					{
						["check"] = {
							["trigger"] = 1,
							["variable"] = "onCooldown",
							["value"] = 1,
						},
						["changes"] = {
							{
								["value"] = true,
								["property"] = "desaturate",
							}, -- [1]
						},
					}, -- [1]
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["xYtg5ixWtX0"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["outline"] = "OUTLINE",
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["displayText"] = "",
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["customTextUpdate"] = "update",
				["automaticWidth"] = "Auto",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["custom_type"] = "status",
							["type"] = "custom",
							["use_absorbMode"] = true,
							["unevent"] = "auto",
							["use_unit"] = true,
							["duration"] = "1",
							["event"] = "Health",
							["names"] = {
							},
							["subeventPrefix"] = "SPELL",
							["custom"] = "function ()\n    local channel = \"say\"    --喊话频道\n    local timestamp, eventType, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = CombatLogGetCurrentEventInfo()\n    if eventType==\"SPELL_INTERRUPT\" then\n        local spellId, spellName, spellSchool, extraSpellId, extraSpellName, extraSchool = select(12, CombatLogGetCurrentEventInfo())\n        if sourceName==UnitName(\"player\")  or sourceName==UnitName(\"pet\")then\n            SendChatMessage(\"打断\"..GetSpellLink(extraSpellId), channel)\n        end\n    elseif eventType==\"SPELL_DISPEL\" then\n        local spellId, spellName, spellSchool, extraSpellId, extraSpellName, extraSchool, auraType = select(12, CombatLogGetCurrentEventInfo())\n        if sourceName==UnitName(\"player\")  or sourceName==UnitName(\"pet\")then\n            SendChatMessage(\"驱散\"..GetSpellLink(extraSpellId), channel)\n        end\n    elseif eventType==\"SPELL_STOLEN\" then\n        local spellId, spellName, spellSchool, extraSpellId, extraSpellName, extraSchool, auraType = select(12, CombatLogGetCurrentEventInfo())\n        if sourceName==UnitName(\"player\") then\n            SendChatMessage(\"偷取\"..GetSpellLink(extraSpellId), channel)\n        end\n    elseif eventType==\"SPELL_MISSED\" then\n        local spellId, spellName, spellSchool, missType, isOffHand, amountMissed = select(12, CombatLogGetCurrentEventInfo())\n        if missType==\"REFLECT\" and destName==UnitName(\"player\") then \n            SendChatMessage(\"反射\"..GetSpellLink(spellId), channel)\n        elseif missType==\"ABSORB\" and destName == \"根基图腾\" and destFlags == 8465 then\n            SendChatMessage(\"吸收\"..GetSpellLink(spellId), channel)\n        end\n    end\nend",
							["events"] = "COMBAT_LOG_EVENT_UNFILTERED",
							["spellIds"] = {
							},
							["check"] = "event",
							["unit"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["internalVersion"] = 24,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["font"] = "Friz Quadrata TT",
				["version"] = 1,
				["load"] = {
					["use_class"] = true,
					["use_petbattle"] = false,
					["use_vehicleUi"] = false,
					["use_vehicle"] = false,
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["MAGE"] = true,
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["authorMode"] = true,
				["fontSize"] = 16,
				["regionType"] = "text",
				["selfPoint"] = "BOTTOM",
				["xOffset"] = 0,
				["justify"] = "LEFT",
				["tocversion"] = 11302,
				["id"] = "打断喊话 9",
				["conditions"] = {
				},
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["url"] = "https://wago.io/pQukwVj27/1",
				["config"] = {
				},
				["semver"] = "1.0.20",
				["uid"] = "xYtg5ixWtX0",
				["wordWrap"] = "WordWrap",
				["fixedWidth"] = 200,
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
			},
		},
		["L23)f9lqUjs"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["url"] = "https://wago.io/pQukwVj27/1",
				["icon"] = true,
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["selfPoint"] = "CENTER",
				["desaturate"] = true,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
				},
				["height"] = 38,
				["glowLines"] = 8,
				["glowLength"] = 10,
				["glowFrequency"] = 0.25,
				["animation"] = {
					["start"] = {
						["translateType"] = "bounce",
						["duration_type"] = "seconds",
						["alphaType"] = "alphaPulse",
						["colorB"] = 0,
						["colorG"] = 0,
						["alphaFunc"] = "    function(progress, start, delta)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return start + (((math.sin(angle) + 1)/2) * delta)\n    end\n  ",
						["duration"] = "1",
						["use_scale"] = true,
						["use_translate"] = true,
						["use_alpha"] = true,
						["type"] = "preset",
						["scaleType"] = "pulse",
						["colorR"] = 0,
						["preset"] = "slidetop",
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["y"] = 0,
						["colorType"] = "straightHSV",
						["x"] = 0,
						["use_color"] = true,
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["colorA"] = 1,
						["scalex"] = 1,
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
						["preset"] = "pulse",
					},
					["finish"] = {
						["type"] = "preset",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
					},
				},
				["actions"] = {
					["start"] = {
					},
					["init"] = {
						["custom"] = "\n\n",
						["do_custom"] = false,
					},
					["finish"] = {
					},
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["cooldownEdge"] = true,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = true,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["spellknown"] = 465,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["regionType"] = "icon",
				["config"] = {
				},
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["anchorFrameType"] = "SCREEN",
				["alpha"] = 1,
				["progressPrecision"] = 0,
				["glowYOffset"] = 0,
				["glowScale"] = 1,
				["cooldownTextDisabled"] = true,
				["zoom"] = 0,
				["auto"] = true,
				["tocversion"] = 11302,
				["id"] = "虔诚光环-无buff",
				["xOffset"] = 0,
				["frameStrata"] = 1,
				["width"] = 38,
				["keepAspectRatio"] = false,
				["uid"] = "L23)f9lqUjs",
				["inverse"] = true,
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "aura2",
							["auranames"] = {
								"虔诚光环", -- [1]
							},
							["matchesShowOn"] = "showOnMissing",
							["event"] = "Health",
							["names"] = {
							},
							["spellIds"] = {
							},
							["subeventPrefix"] = "SPELL",
							["useName"] = true,
							["subeventSuffix"] = "_CAST_START",
							["unit"] = "player",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Conditions",
							["unit"] = "player",
							["subeventPrefix"] = "SPELL",
							["spellIds"] = {
							},
							["names"] = {
							},
							["use_unit"] = true,
							["use_alive"] = true,
							["subeventSuffix"] = "_CAST_START",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["activeTriggerMode"] = 1,
				},
				["useTooltip"] = true,
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["HOFa0L4cHSP"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["url"] = "https://wago.io/pQukwVj27/1",
				["icon"] = true,
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["selfPoint"] = "CENTER",
				["desaturate"] = true,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
				},
				["height"] = 38,
				["glowLines"] = 8,
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["glowFrequency"] = 0.25,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = true,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["spellknown"] = 19740,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["animation"] = {
					["start"] = {
						["colorR"] = 0,
						["duration_type"] = "seconds",
						["alphaType"] = "alphaPulse",
						["colorA"] = 1,
						["colorG"] = 0,
						["alphaFunc"] = "    function(progress, start, delta)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return start + (((math.sin(angle) + 1)/2) * delta)\n    end\n  ",
						["duration"] = "1",
						["use_scale"] = true,
						["use_translate"] = true,
						["use_alpha"] = true,
						["scaleType"] = "pulse",
						["type"] = "preset",
						["translateType"] = "bounce",
						["scaley"] = 1,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["use_color"] = true,
						["alpha"] = 0,
						["x"] = 0,
						["y"] = 0,
						["colorType"] = "straightHSV",
						["preset"] = "slidetop",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["colorB"] = 0,
						["scalex"] = 1,
					},
					["main"] = {
						["type"] = "none",
						["preset"] = "pulse",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["cooldownEdge"] = true,
				["actions"] = {
					["start"] = {
					},
					["init"] = {
						["custom"] = "\n\n",
						["do_custom"] = false,
					},
					["finish"] = {
					},
				},
				["progressPrecision"] = 0,
				["regionType"] = "icon",
				["config"] = {
				},
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["width"] = 38,
				["frameStrata"] = 1,
				["keepAspectRatio"] = false,
				["xOffset"] = 0,
				["glowScale"] = 1,
				["cooldownTextDisabled"] = true,
				["zoom"] = 0,
				["auto"] = true,
				["tocversion"] = 11302,
				["id"] = "力量祝福-无buff",
				["glowLength"] = 10,
				["alpha"] = 1,
				["anchorFrameType"] = "SCREEN",
				["glowYOffset"] = 0,
				["uid"] = "HOFa0L4cHSP",
				["inverse"] = true,
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "aura2",
							["match_countOperator"] = "~=",
							["matchesShowOn"] = "showOnMissing",
							["event"] = "Health",
							["unit"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["names"] = {
							},
							["spellIds"] = {
							},
							["useName"] = true,
							["match_count"] = "1",
							["subeventPrefix"] = "SPELL",
							["auranames"] = {
								"力量祝福", -- [1]
							},
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Conditions",
							["names"] = {
							},
							["unit"] = "player",
							["spellIds"] = {
							},
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["use_alive"] = true,
							["use_unit"] = true,
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["activeTriggerMode"] = 1,
				},
				["useTooltip"] = true,
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["x2D48dATgs9"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["outline"] = "OUTLINE",
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["displayText"] = "\n",
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["customTextUpdate"] = "update",
				["automaticWidth"] = "Auto",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "custom",
							["subeventSuffix"] = "_CAST_START",
							["custom_hide"] = "timed",
							["duration"] = "1",
							["event"] = "Health",
							["subeventPrefix"] = "SPELL",
							["unit"] = "player",
							["custom"] = "function() \n    SetCVar(\"alwaysCompareItems\", \"1\")--装备对比，0 关\n\nend",
							["events"] = "PLAYER_ENTERING_WORLD",
							["names"] = {
							},
							["check"] = "event",
							["spellIds"] = {
							},
							["custom_type"] = "event",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["internalVersion"] = 24,
				["selfPoint"] = "BOTTOM",
				["font"] = "Friz Quadrata TT",
				["version"] = 1,
				["subRegions"] = {
				},
				["load"] = {
					["use_class"] = true,
					["use_never"] = false,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["MAGE"] = true,
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["authorMode"] = true,
				["fontSize"] = 12,
				["regionType"] = "text",
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["justify"] = "LEFT",
				["tocversion"] = 11302,
				["id"] = "SetCVar 15",
				["wordWrap"] = "WordWrap",
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["conditions"] = {
				},
				["config"] = {
				},
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-",
						["fontSize"] = "medium",
						["width"] = 1,
					}, -- [1]
				},
				["xOffset"] = 0,
				["uid"] = "x2D48dATgs9",
				["fixedWidth"] = 200,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["url"] = "https://wago.io/pQukwVj27/1",
			},
		},
		["c7nB(n8TlUf"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245660,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["glowLength"] = 10,
				["yOffset"] = -75,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["cooldownEdge"] = false,
				["icon"] = true,
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["keepAspectRatio"] = false,
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 8,
				["subRegions"] = {
					{
						["text_shadowXOffset"] = 0,
						["type"] = "subtext",
						["text_text"] = "%p",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Vixar",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = 0,
						["text_selfPoint"] = "AUTO",
						["text_fontSize"] = 26,
						["text_visible"] = true,
						["text_anchorPoint"] = "CENTER",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontType"] = "OUTLINE",
					}, -- [1]
				},
				["height"] = 49,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["glowLines"] = 8,
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["glowFrequency"] = 0.25,
				["displayIcon"] = 132325,
				["glowXOffset"] = 0,
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["parent"] = "Paladin 2.0",
				["authorOptions"] = {
				},
				["config"] = {
				},
				["regionType"] = "icon",
				["anchorFrameType"] = "SCREEN",
				["glowYOffset"] = 0,
				["alpha"] = 1,
				["xOffset"] = -98,
				["progressPrecision"] = 0,
				["glowScale"] = 1,
				["semver"] = "1.0.7",
				["cooldownTextDisabled"] = true,
				["zoom"] = 0.3,
				["auto"] = false,
				["tocversion"] = 11302,
				["id"] = "Paladin - Seal of Righteousness",
				["triggers"] = {
					{
						["trigger"] = {
							["track"] = "auto",
							["auranames"] = {
								"20154", -- [1]
							},
							["duration"] = "1",
							["genericShowOn"] = "showAlways",
							["subeventPrefix"] = "SPELL",
							["unitExists"] = true,
							["debuffType"] = "HELPFUL",
							["use_unit"] = true,
							["use_remaining"] = false,
							["subeventSuffix"] = "_CAST_START",
							["unevent"] = "timed",
							["useName"] = true,
							["names"] = {
							},
							["event"] = "Chat Message",
							["use_genericShowOn"] = true,
							["realSpellName"] = "Seal of Righteousness",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["type"] = "aura2",
							["matchesShowOn"] = "showAlways",
							["unit"] = "player",
							["use_track"] = true,
							["spellName"] = 20293,
						},
						["untrigger"] = {
							["genericShowOn"] = "showAlways",
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["use_alwaystrue"] = true,
							["subeventSuffix"] = "_CAST_START",
							["duration"] = "1",
							["event"] = "Conditions",
							["unit"] = "player",
							["unevent"] = "auto",
							["subeventPrefix"] = "SPELL",
							["use_unit"] = true,
						},
						["untrigger"] = {
						},
					}, -- [2]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["frameStrata"] = 1,
				["width"] = 49,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["uid"] = "c7nB(n8TlUf",
				["inverse"] = false,
				["load"] = {
					["use_class"] = true,
					["race"] = {
						["single"] = "Human",
						["multi"] = {
							["Dwarf"] = true,
							["Human"] = true,
						},
					},
					["use_race"] = false,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["PALADIN"] = true,
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["CB4amWD3(UX"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["url"] = "https://wago.io/pQukwVj27/1",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["custom_hide"] = "timed",
							["type"] = "custom",
							["custom_type"] = "status",
							["subeventSuffix"] = "_CAST_START",
							["unevent"] = "timed",
							["duration"] = "1",
							["event"] = "Chat Message",
							["subeventPrefix"] = "SPELL",
							["customDuration"] = "function()\n    return false\nend",
							["spellIds"] = {
							},
							["custom"] = "function()\n    local region = aura_env.region\n    local plate = C_NamePlate.GetNamePlateForUnit(\"target\")\n    if plate then\n        region:ClearAllPoints()\n        --位置 Left right center\n        region:SetPoint(\"LEFT\", plate, \"LEFT\",-80, -25)\n        return true\n    else\n        return false\n    end\nend",
							["events"] = "aura_env.region",
							["check"] = "update",
							["names"] = {
							},
							["unit"] = "player",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
							["custom"] = "",
						},
					}, -- [1]
					["disjunctive"] = "all",
					["activeTriggerMode"] = 1,
				},
				["internalVersion"] = 24,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["scalex"] = 1.3,
						["colorA"] = 1,
						["colorG"] = 1,
						["type"] = "custom",
						["use_scale"] = true,
						["colorR"] = 1,
						["preset"] = "pulse",
						["scaley"] = 1.3,
						["alpha"] = 0,
						["colorType"] = "custom",
						["y"] = 0,
						["x"] = 0,
						["scaleType"] = "pulse",
						["duration_type"] = "seconds",
						["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    name, rank, icon, castTime, minRange, maxRange, spellId = GetSpellInfo(\"Aimed Shot\")\n    --tmin, tmax = WeakAuras.getRange(\"target\")\n    --print(maxRange)\n    --print(WeakAuras.GetRange(\"target\"))\n    if WeakAuras.CheckRange(\"target\", 8, \"<=\") then\n        return 1,0,0,1\n    end\n    if WeakAuras.CheckRange(\"target\", 25, \"<=\") then\n        return 1,0.6,0,1\n    end\n    if WeakAuras.CheckRange(\"target\", 40, \"<=\") then\n        return 1,1,0,1\n    end\n    if IsSpellInRange(\"Aimed Shot\") == 1 then \n        return 0,1,0,1\n    end\n    return 1,1,1,1\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["rotate"] = 0,
						["use_color"] = false,
						["colorB"] = 1,
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["desc"] = "选中：选项-游戏-名字-(敌对单位)，否则没效果. https://wago.io/p/husandro2 其他WA字符",
				["rotation"] = 282,
				["version"] = 1,
				["height"] = 80,
				["rotate"] = true,
				["load"] = {
					["use_class"] = true,
					["use_petbattle"] = false,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["MAGE"] = true,
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["authorMode"] = true,
				["mirror"] = false,
				["regionType"] = "texture",
				["blendMode"] = "ADD",
				["texture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura35",
				["desaturate"] = false,
				["selfPoint"] = "CENTER",
				["semver"] = "1.0.0",
				["tocversion"] = 11302,
				["id"] = "目标指示(Classic) 9",
				["anchorFrameType"] = "SCREEN",
				["frameStrata"] = 9,
				["width"] = 80,
				["alpha"] = 1,
				["config"] = {
				},
				["xOffset"] = 0,
				["uid"] = "CB4amWD3(UX",
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["conditions"] = {
					{
						["check"] = {
							["trigger"] = -2,
							["variable"] = "AND",
							["checks"] = {
								{
									["trigger"] = -1,
									["variable"] = "attackabletarget",
									["value"] = 1,
								}, -- [1]
								{
									["trigger"] = -1,
									["variable"] = "incombat",
									["value"] = 1,
								}, -- [2]
							},
						},
						["changes"] = {
							{
								["value"] = {
									1, -- [1]
									0, -- [2]
									0.058823529411765, -- [3]
									1, -- [4]
								},
								["property"] = "color",
							}, -- [1]
						},
					}, -- [1]
					{
						["check"] = {
							["trigger"] = -2,
							["variable"] = "AND",
							["checks"] = {
								{
									["trigger"] = -1,
									["variable"] = "attackabletarget",
									["value"] = 0,
								}, -- [1]
								{
									["trigger"] = -1,
									["variable"] = "incombat",
									["value"] = 1,
								}, -- [2]
							},
						},
						["changes"] = {
							{
								["value"] = {
									0.019607843137255, -- [1]
									1, -- [2]
									0.011764705882353, -- [3]
									1, -- [4]
								},
								["property"] = "color",
							}, -- [1]
						},
					}, -- [2]
				},
				["color"] = {
					1, -- [1]
					0.95294117647059, -- [2]
					0.96470588235294, -- [3]
					1, -- [4]
				},
				["discrete_rotation"] = 0,
			},
		},
		["xN(7f2Vk6HQ"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = true,
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-",
						["fontSize"] = "medium",
						["width"] = 1,
					}, -- [1]
				},
				["yOffset"] = 38,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["url"] = "https://wago.io/pQukwVj27/1",
				["icon"] = true,
				["useglowColor"] = false,
				["useTooltip"] = true,
				["glowXOffset"] = 0,
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
					{
						["text_shadowXOffset"] = 0,
						["type"] = "subtext",
						["text_text"] = "%n",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "聊天",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = 0,
						["text_selfPoint"] = "AUTO",
						["text_fontSize"] = 18,
						["text_visible"] = true,
						["text_anchorPoint"] = "OUTER_TOP",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontType"] = "OUTLINE",
					}, -- [1]
				},
				["height"] = 38,
				["glowLines"] = 8,
				["glowLength"] = 10,
				["glowFrequency"] = 0.25,
				["internalVersion"] = 24,
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["cooldownEdge"] = true,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["authorMode"] = true,
				["regionType"] = "icon",
				["config"] = {
				},
				["xOffset"] = 0,
				["width"] = 38,
				["frameStrata"] = 1,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["keepAspectRatio"] = false,
				["glowScale"] = 1,
				["cooldownTextDisabled"] = false,
				["zoom"] = 0,
				["auto"] = true,
				["tocversion"] = 11302,
				["id"] = "目标 施法 10",
				["animation"] = {
					["start"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidetop",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["alpha"] = 1,
				["glowYOffset"] = 0,
				["anchorFrameType"] = "SCREEN",
				["uid"] = "xN(7f2Vk6HQ",
				["inverse"] = true,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = false,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["MAGE"] = true,
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["spellknown"] = 604,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["use_castType"] = true,
							["type"] = "status",
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Cast",
							["unit"] = "target",
							["castType"] = "cast",
							["spellIds"] = {
							},
							["subeventPrefix"] = "SPELL",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["names"] = {
							},
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
							["unit"] = "target",
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Unit Characteristics",
							["unit"] = "target",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_attackable"] = true,
							["subeventPrefix"] = "SPELL",
						},
						["untrigger"] = {
							["unit"] = "target",
						},
					}, -- [2]
					["activeTriggerMode"] = 1,
				},
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["zxFkI03OXw4"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245660,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["yOffset"] = -155.78,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["cooldownEdge"] = false,
				["icon"] = true,
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 8,
				["subRegions"] = {
				},
				["height"] = 35,
				["authorOptions"] = {
				},
				["glowLines"] = 8,
				["glowLength"] = 10,
				["glowFrequency"] = 0.25,
				["displayIcon"] = 135942,
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["load"] = {
					["use_class"] = true,
					["race"] = {
						["single"] = "Human",
						["multi"] = {
							["Dwarf"] = true,
							["Human"] = true,
						},
					},
					["use_never"] = false,
					["use_race"] = false,
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["ROGUE"] = true,
							["PALADIN"] = true,
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["keepAspectRatio"] = false,
				["config"] = {
				},
				["regionType"] = "icon",
				["width"] = 35,
				["anchorFrameType"] = "SCREEN",
				["alpha"] = 1,
				["xOffset"] = 36,
				["progressPrecision"] = 0,
				["glowScale"] = 1,
				["semver"] = "1.0.7",
				["cooldownTextDisabled"] = true,
				["zoom"] = 0.3,
				["auto"] = false,
				["tocversion"] = 11302,
				["id"] = "Paladin - Repentance",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["frameStrata"] = 1,
				["glowYOffset"] = 0,
				["parent"] = "Paladin 2.0",
				["uid"] = "zxFkI03OXw4",
				["inverse"] = false,
				["selfPoint"] = "CENTER",
				["triggers"] = {
					{
						["trigger"] = {
							["auranames"] = {
								"Rend", -- [1]
							},
							["matchesShowOn"] = "showAlways",
							["genericShowOn"] = "showAlways",
							["unit"] = "target",
							["unitExists"] = true,
							["debuffType"] = "HARMFUL",
							["spellName"] = 20066,
							["type"] = "status",
							["unevent"] = "auto",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["use_genericShowOn"] = true,
							["event"] = "Cooldown Progress (Spell)",
							["duration"] = "1",
							["realSpellName"] = "Repentance",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["useName"] = true,
							["names"] = {
							},
							["ownOnly"] = true,
							["use_track"] = true,
							["subeventPrefix"] = "SPELL",
						},
						["untrigger"] = {
							["genericShowOn"] = "showAlways",
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["use_alwaystrue"] = true,
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Conditions",
							["use_unit"] = true,
							["unit"] = "player",
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["conditions"] = {
					{
						["check"] = {
							["trigger"] = 1,
							["variable"] = "onCooldown",
							["value"] = 1,
						},
						["changes"] = {
							{
								["value"] = true,
								["property"] = "desaturate",
							}, -- [1]
						},
					}, -- [1]
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["9BF1nEvaZu5"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = true,
				["xOffset"] = 0,
				["yOffset"] = 38,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["cooldownEdge"] = true,
				["icon"] = true,
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["keepAspectRatio"] = false,
				["animation"] = {
					["start"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidetop",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
					{
						["text_shadowXOffset"] = 0,
						["type"] = "subtext",
						["text_text"] = "%n",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "聊天",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = 0,
						["text_selfPoint"] = "AUTO",
						["text_fontSize"] = 18,
						["text_visible"] = true,
						["text_anchorPoint"] = "OUTER_TOP",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontType"] = "OUTLINE",
					}, -- [1]
				},
				["height"] = 38,
				["glowLines"] = 8,
				["glowXOffset"] = 0,
				["glowFrequency"] = 0.25,
				["useTooltip"] = true,
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["glowLength"] = 10,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = false,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["MAGE"] = true,
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["spellknown"] = 604,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-",
						["fontSize"] = "medium",
						["width"] = 1,
					}, -- [1]
				},
				["regionType"] = "icon",
				["config"] = {
				},
				["width"] = 38,
				["anchorFrameType"] = "SCREEN",
				["alpha"] = 1,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["selfPoint"] = "CENTER",
				["glowScale"] = 1,
				["cooldownTextDisabled"] = false,
				["zoom"] = 0,
				["auto"] = true,
				["tocversion"] = 11302,
				["id"] = "目标 引导法术 10",
				["authorMode"] = true,
				["frameStrata"] = 1,
				["glowYOffset"] = 0,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["uid"] = "9BF1nEvaZu5",
				["inverse"] = true,
				["triggers"] = {
					{
						["trigger"] = {
							["use_castType"] = true,
							["type"] = "status",
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Cast",
							["names"] = {
							},
							["castType"] = "channel",
							["spellIds"] = {
							},
							["subeventPrefix"] = "SPELL",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["unit"] = "target",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
							["unit"] = "target",
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Unit Characteristics",
							["unit"] = "target",
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["use_attackable"] = true,
							["use_unit"] = true,
						},
						["untrigger"] = {
							["unit"] = "target",
						},
					}, -- [2]
					["activeTriggerMode"] = 1,
				},
				["url"] = "https://wago.io/pQukwVj27/1",
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["vRsVPXrPDqb"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["xOffset"] = 0,
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["url"] = "https://wago.io/pQukwVj27/1",
				["icon"] = true,
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
					{
						["text_shadowXOffset"] = 0,
						["type"] = "subtext",
						["text_text"] = "%p",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = 0,
						["text_selfPoint"] = "AUTO",
						["text_visible"] = true,
						["text_fontType"] = "OUTLINE",
						["text_anchorPoint"] = "CENTER",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontSize"] = 24,
					}, -- [1]
				},
				["height"] = 52,
				["glowLines"] = 8,
				["glowFrequency"] = 0.25,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["keepAspectRatio"] = false,
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "status",
							["subeventSuffix"] = "_CAST_START",
							["duration"] = "1",
							["event"] = "Swing Timer",
							["unit"] = "player",
							["unevent"] = "auto",
							["subeventPrefix"] = "SPELL",
							["spellIds"] = {
							},
							["use_hand"] = true,
							["use_unit"] = true,
							["names"] = {
							},
							["hand"] = "ranged",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
							["hand"] = "ranged",
						},
					}, -- [1]
					["activeTriggerMode"] = -10,
				},
				["cooldownEdge"] = true,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["regionType"] = "icon",
				["animation"] = {
					["start"] = {
						["colorR"] = 0,
						["scalex"] = 1,
						["colorB"] = 0,
						["colorG"] = 0,
						["colorA"] = 1,
						["use_translate"] = true,
						["duration"] = "1",
						["type"] = "preset",
						["scaleType"] = "pulse",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["colorType"] = "straightHSV",
						["y"] = 0,
						["x"] = 0,
						["translateType"] = "bounce",
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["use_scale"] = true,
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
					},
				},
				["config"] = {
				},
				["width"] = 52,
				["glowYOffset"] = 0,
				["frameStrata"] = 1,
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["cooldownTextDisabled"] = true,
				["glowScale"] = 1,
				["zoom"] = 0,
				["auto"] = true,
				["tocversion"] = 11302,
				["id"] = "射击中 7",
				["glowLength"] = 10,
				["alpha"] = 1,
				["anchorFrameType"] = "SCREEN",
				["progressPrecision"] = 0,
				["uid"] = "vRsVPXrPDqb",
				["inverse"] = true,
				["load"] = {
					["use_class"] = true,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["Zn1irtWqaTG"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245660,
			["allowUpdates"] = true,
			["data"] = {
				["sparkWidth"] = 25,
				["sparkOffsetX"] = 0,
				["xOffset"] = 0,
				["yOffset"] = -127,
				["anchorPoint"] = "CENTER",
				["sparkRotation"] = 0,
				["sparkRotationMode"] = "AUTO",
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
						["custom"] = "aura_env.lastMana = UnitPower(\"player\" , 0)",
						["do_custom"] = true,
					},
					["finish"] = {
						["custom"] = "WeakAuras.ScanEvents(\"TICKUPDATE\", true)",
						["do_custom"] = false,
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["duration"] = "2",
							["subeventPrefix"] = "SPELL",
							["debuffType"] = "HELPFUL",
							["type"] = "custom",
							["names"] = {
							},
							["subeventSuffix"] = "_ENERGIZE",
							["use_unit"] = true,
							["unit"] = "player",
							["event"] = "Health",
							["custom_type"] = "stateupdate",
							["spellIds"] = {
							},
							["events"] = "UNIT_SPELLCAST_SUCCEEDED:player UNIT_POWER_FREQUENT:player",
							["custom"] = "function(a, e, t)\n    local currentMana = UnitPower(\"player\" , 0)\n    \n    if currentMana >= UnitPowerMax(\"player\", 0) then\n        return false\n    end\n    \n    if e == \"UNIT_POWER_FREQUENT\" and currentMana > aura_env.lastMana then\n        local duration = 2\n        a[\"\"] = {\n            show = true,\n            changed = true,\n            duration = duration,\n            expirationTime = GetTime() + duration,\n            progressType = \"timed\",\n            autoHide = true\n        }\n        aura_env.lastMana = currentMana\n        \n    elseif e == \"UNIT_SPELLCAST_SUCCEEDED\" and currentMana < aura_env.lastMana then\n        local duration = 6.45 -- why?\n        --local duration = 5\n        a[\"\"] = {\n            show = true,\n            changed = true,\n            duration = duration,\n            expirationTime = GetTime() + duration,\n            progressType = \"timed\",\n            autoHide = true\n        }\n        aura_env.lastMana = currentMana\n    end\n    \n    --aura_env.lastMana = currentMana\n    return true\nend",
							["use_sourceUnit"] = true,
							["check"] = "event",
							["unevent"] = "auto",
							["sourceUnit"] = "player",
							["customVariables"] = "{\n    duration = true\n}",
						},
						["untrigger"] = {
						},
					}, -- [1]
					["activeTriggerMode"] = -10,
				},
				["icon_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["internalVersion"] = 24,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["selfPoint"] = "CENTER",
				["backdropInFront"] = false,
				["desaturate"] = false,
				["barColor"] = {
					0, -- [1]
					0.23529411764706, -- [2]
					1, -- [3]
					0, -- [4]
				},
				["stickyDuration"] = false,
				["progressPrecision"] = 0,
				["sparkOffsetY"] = 0,
				["version"] = 8,
				["subRegions"] = {
					{
						["type"] = "aurabar_bar",
					}, -- [1]
					{
						["text_shadowXOffset"] = 1,
						["text_text"] = "%p",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_selfPoint"] = "AUTO",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["type"] = "subtext",
						["text_anchorXOffset"] = 15,
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Accidental Presidency",
						["text_shadowYOffset"] = -1,
						["text_fontType"] = "None",
						["text_anchorPoint"] = "SPARK",
						["text_visible"] = false,
						["text_fontSize"] = 20,
						["anchorXOffset"] = 0,
						["text_anchorYOffset"] = -10,
					}, -- [2]
					{
						["border_offset"] = 5,
						["border_anchor"] = "bar",
						["border_size"] = 16,
						["border_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							0.5, -- [4]
						},
						["border_visible"] = false,
						["border_edge"] = "None",
						["type"] = "subborder",
					}, -- [3]
				},
				["height"] = 20,
				["useAdjustededMax"] = false,
				["load"] = {
					["use_class"] = true,
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["HUNTER"] = true,
							["WARLOCK"] = true,
							["SHAMAN"] = true,
							["MAGE"] = true,
							["DRUID"] = true,
							["PALADIN"] = true,
							["PRIEST"] = true,
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["sparkBlendMode"] = "ADD",
				["backdropColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					0.5, -- [4]
				},
				["color"] = {
				},
				["uid"] = "Zn1irtWqaTG",
				["config"] = {
				},
				["borderBackdrop"] = "Blizzard Tooltip",
				["anchorFrameType"] = "SCREEN",
				["smoothProgress"] = false,
				["useAdjustededMin"] = false,
				["regionType"] = "aurabar",
				["borderInFront"] = true,
				["alpha"] = 1,
				["icon_side"] = "RIGHT",
				["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
				["sparkHidden"] = "FULL",
				["sparkHeight"] = 35,
				["texture"] = "ElvUI Blank",
				["semver"] = "1.0.7",
				["zoom"] = 0,
				["auto"] = true,
				["tocversion"] = 11302,
				["id"] = "Paladin - 5Second+ManaRegen",
				["spark"] = true,
				["frameStrata"] = 4,
				["width"] = 245,
				["backgroundColor"] = {
					0, -- [1]
					0.22352941176471, -- [2]
					1, -- [3]
					0, -- [4]
				},
				["sparkColor"] = {
					0.97254901960784, -- [1]
					0.96078431372549, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["inverse"] = false,
				["icon"] = false,
				["orientation"] = "HORIZONTAL",
				["conditions"] = {
					{
						["check"] = {
							["trigger"] = 1,
							["op"] = "<",
							["variable"] = "duration",
							["value"] = "5",
						},
						["changes"] = {
							{
								["value"] = true,
								["property"] = "inverse",
							}, -- [1]
						},
					}, -- [1]
				},
				["authorOptions"] = {
				},
				["parent"] = "Paladin 2.0",
			},
		},
		["0WRhSUjVEKC"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["xOffset"] = 0,
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["url"] = "https://wago.io/pQukwVj27/1",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["animation"] = {
					["start"] = {
						["colorR"] = 0,
						["scalex"] = 1,
						["colorB"] = 0,
						["colorG"] = 0,
						["colorA"] = 1,
						["use_translate"] = true,
						["duration"] = "1",
						["type"] = "preset",
						["scaleType"] = "pulse",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["colorType"] = "straightHSV",
						["y"] = 0,
						["x"] = 0,
						["translateType"] = "bounce",
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["use_scale"] = true,
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
					{
						["text_shadowXOffset"] = 0,
						["type"] = "subtext",
						["text_text"] = "%p",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = 0,
						["text_selfPoint"] = "AUTO",
						["text_fontSize"] = 24,
						["text_visible"] = true,
						["text_anchorPoint"] = "CENTER",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontType"] = "OUTLINE",
					}, -- [1]
				},
				["height"] = 52,
				["glowLines"] = 8,
				["glowFrequency"] = 0.25,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["selfPoint"] = "CENTER",
				["cooldownEdge"] = true,
				["load"] = {
					["use_class"] = true,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["regionType"] = "icon",
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["config"] = {
				},
				["progressPrecision"] = 0,
				["glowYOffset"] = 0,
				["frameStrata"] = 1,
				["glowLength"] = 10,
				["cooldownTextDisabled"] = true,
				["glowScale"] = 1,
				["zoom"] = 0,
				["auto"] = true,
				["tocversion"] = 11302,
				["id"] = "功击中 副手 8",
				["keepAspectRatio"] = false,
				["alpha"] = 1,
				["anchorFrameType"] = "SCREEN",
				["width"] = 52,
				["uid"] = "0WRhSUjVEKC",
				["inverse"] = true,
				["icon"] = true,
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "status",
							["subeventSuffix"] = "_CAST_START",
							["duration"] = "1",
							["event"] = "Swing Timer",
							["unit"] = "player",
							["unevent"] = "auto",
							["subeventPrefix"] = "SPELL",
							["spellIds"] = {
							},
							["use_hand"] = true,
							["use_unit"] = true,
							["names"] = {
							},
							["hand"] = "off",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
							["hand"] = "off",
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Cast",
							["unit"] = "player",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_inverse"] = true,
							["subeventPrefix"] = "SPELL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["activeTriggerMode"] = 1,
				},
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["XJR7hKBCnbG"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245660,
			["allowUpdates"] = true,
			["data"] = {
				["overlays"] = {
					{
						0.43529411764706, -- [1]
						0, -- [2]
						1, -- [3]
						0.25, -- [4]
					}, -- [1]
				},
				["sparkOffsetX"] = 0,
				["xOffset"] = 0,
				["customText"] = "function()\n    if aura_env.region then\n        local mana = UnitPower(\"player\", Enum.PowerType.Mana)\n        aura_env.region.text3:SetText(mana)\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n",
				["yOffset"] = -126.99987792969,
				["anchorPoint"] = "CENTER",
				["sparkRotation"] = 0,
				["sparkRotationMode"] = "AUTO",
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["backgroundColor"] = {
					0, -- [1]
					0.33725490196078, -- [2]
					1, -- [3]
					0.30986058712006, -- [4]
				},
				["triggers"] = {
					{
						["trigger"] = {
							["use_power"] = false,
							["genericShowOn"] = "showOnActive",
							["subeventPrefix"] = "SPELL",
							["powertype"] = 0,
							["use_powertype"] = true,
							["debuffType"] = "HELPFUL",
							["type"] = "status",
							["use_health"] = true,
							["subeventSuffix"] = "_CAST_START",
							["names"] = {
							},
							["event"] = "Power",
							["custom_hide"] = "timed",
							["use_unit"] = true,
							["duration"] = "1",
							["health"] = "0",
							["health_operator"] = ">=",
							["spellIds"] = {
							},
							["unevent"] = "auto",
							["use_showCost"] = true,
							["unit"] = "player",
						},
						["untrigger"] = {
						},
					}, -- [1]
					["disjunctive"] = "all",
					["activeTriggerMode"] = -10,
				},
				["icon_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["internalVersion"] = 24,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["selfPoint"] = "CENTER",
				["backdropInFront"] = false,
				["desaturate"] = false,
				["barColor"] = {
					0, -- [1]
					0.33725490196078, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["stickyDuration"] = false,
				["authorOptions"] = {
				},
				["sparkWidth"] = 10,
				["version"] = 8,
				["subRegions"] = {
					{
						["type"] = "aurabar_bar",
					}, -- [1]
					{
						["text_shadowXOffset"] = 1,
						["type"] = "subtext",
						["text_text"] = "%c ",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Expressway",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = -1,
						["text_selfPoint"] = "AUTO",
						["text_fontSize"] = 15,
						["text_visible"] = false,
						["text_anchorPoint"] = "INNER_RIGHT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontType"] = "None",
					}, -- [2]
					{
						["text_shadowXOffset"] = 1,
						["type"] = "subtext",
						["text_text"] = " ",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Expressway",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = -1,
						["text_selfPoint"] = "AUTO",
						["text_fontSize"] = 18,
						["text_visible"] = true,
						["text_anchorPoint"] = "INNER_LEFT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontType"] = "None",
					}, -- [3]
					{
						["text_shadowXOffset"] = 1,
						["type"] = "subtext",
						["text_text"] = "%s",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = -1,
						["text_selfPoint"] = "AUTO",
						["text_fontSize"] = 12,
						["text_visible"] = false,
						["text_anchorPoint"] = "ICON_CENTER",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontType"] = "None",
					}, -- [4]
					{
						["border_offset"] = 1,
						["border_anchor"] = "bar",
						["border_size"] = 1,
						["border_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["border_visible"] = true,
						["border_edge"] = "1 Pixel",
						["type"] = "subborder",
					}, -- [5]
				},
				["height"] = 20,
				["borderBackdrop"] = "None",
				["load"] = {
					["use_petbattle"] = false,
					["use_never"] = false,
					["talent"] = {
						["multi"] = {
						},
					},
					["use_vehicle"] = false,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["PALADIN"] = true,
						},
					},
					["talent2"] = {
						["multi"] = {
						},
					},
					["spec"] = {
						["single"] = 1,
						["multi"] = {
							true, -- [1]
							[3] = true,
						},
					},
					["difficulty"] = {
						["multi"] = {
						},
					},
					["race"] = {
						["single"] = "Human",
						["multi"] = {
							["Dwarf"] = true,
							["Human"] = true,
						},
					},
					["use_class"] = true,
					["faction"] = {
						["multi"] = {
						},
					},
					["role"] = {
						["multi"] = {
						},
					},
					["pvptalent"] = {
						["multi"] = {
						},
					},
					["ingroup"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["sparkBlendMode"] = "ADD",
				["useAdjustededMax"] = false,
				["uid"] = "XJR7hKBCnbG",
				["sparkColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["actions"] = {
					["start"] = {
					},
					["init"] = {
						["custom"] = "if aura_env.region then\n    local r = aura_env.region\n    if not r.text3 then\n        local text3 = r.bar:CreateFontString(nil, \"OVERLAY\")\n        r.text3 = text3\n        r.text3:SetJustifyH(\"CENTER\")\n        r.text3:SetJustifyV(\"MIDDLE\")\n        r.text3:SetPoint(\"CENTER\", r.bar, \"CENTER\")\n        r.text3:Show()\n    end\n    r.text3:SetShadowOffset(1, -1)\n    r.text3:SetFont(r.text:GetFont())\n    r.text3:SetTextColor(r.text:GetTextColor())\nend\n\n\n\n\n\n\n",
						["do_custom"] = true,
					},
					["finish"] = {
					},
				},
				["width"] = 245,
				["alpha"] = 1,
				["sparkOffsetY"] = 0,
				["useAdjustededMin"] = false,
				["regionType"] = "aurabar",
				["borderInFront"] = true,
				["sparkHidden"] = "NEVER",
				["icon_side"] = "RIGHT",
				["semver"] = "1.0.7",
				["spark"] = false,
				["sparkHeight"] = 30,
				["texture"] = "ElvUI Blank",
				["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
				["zoom"] = 0,
				["auto"] = true,
				["tocversion"] = 11302,
				["id"] = "Paladin - Mana Bar",
				["icon"] = false,
				["frameStrata"] = 3,
				["anchorFrameType"] = "SCREEN",
				["backdropColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["config"] = {
				},
				["inverse"] = false,
				["sparkDesature"] = false,
				["orientation"] = "HORIZONTAL",
				["conditions"] = {
				},
				["parent"] = "Paladin 2.0",
				["fontFlags"] = "OUTLINE",
			},
		},
		["4fDAaZR217H"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245660,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["glowLength"] = 10,
				["yOffset"] = -75,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["icon"] = true,
				["triggers"] = {
					{
						["trigger"] = {
							["track"] = "auto",
							["auranames"] = {
								"Bloodrage", -- [1]
							},
							["duration"] = "1",
							["genericShowOn"] = "showAlways",
							["unit"] = "player",
							["unitExists"] = true,
							["debuffType"] = "HELPFUL",
							["useName"] = true,
							["matchesShowOn"] = "showAlways",
							["unevent"] = "auto",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["event"] = "Cooldown Progress (Spell)",
							["use_genericShowOn"] = true,
							["realSpellName"] = "Hammer of Justice",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["type"] = "status",
							["subeventPrefix"] = "SPELL",
							["names"] = {
							},
							["use_track"] = true,
							["spellName"] = 853,
						},
						["untrigger"] = {
							["genericShowOn"] = "showAlways",
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["use_alwaystrue"] = true,
							["subeventSuffix"] = "_CAST_START",
							["duration"] = "1",
							["event"] = "Conditions",
							["unit"] = "player",
							["unevent"] = "auto",
							["subeventPrefix"] = "SPELL",
							["use_unit"] = true,
						},
						["untrigger"] = {
						},
					}, -- [2]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 8,
				["subRegions"] = {
				},
				["height"] = 49,
				["selfPoint"] = "CENTER",
				["glowLines"] = 8,
				["displayIcon"] = 135963,
				["glowFrequency"] = 0.25,
				["progressPrecision"] = 0,
				["keepAspectRatio"] = false,
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["parent"] = "Paladin 2.0",
				["uid"] = "4fDAaZR217H",
				["useglowColor"] = false,
				["regionType"] = "icon",
				["width"] = 49,
				["alpha"] = 1,
				["authorOptions"] = {
				},
				["auto"] = false,
				["glowScale"] = 1,
				["semver"] = "1.0.7",
				["zoom"] = 0.3,
				["cooldownEdge"] = false,
				["cooldownTextDisabled"] = true,
				["useGlowColor"] = true,
				["tocversion"] = 11302,
				["id"] = "Paladin - Hammer of Justice",
				["xOffset"] = 50,
				["frameStrata"] = 1,
				["glowYOffset"] = 0,
				["anchorFrameType"] = "SCREEN",
				["config"] = {
				},
				["inverse"] = false,
				["load"] = {
					["use_class"] = true,
					["race"] = {
						["single"] = "Human",
						["multi"] = {
							["Dwarf"] = true,
							["Human"] = true,
						},
					},
					["use_race"] = false,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["PALADIN"] = true,
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["conditions"] = {
					{
						["check"] = {
							["trigger"] = 1,
							["variable"] = "onCooldown",
							["value"] = 1,
						},
						["changes"] = {
							{
								["value"] = true,
								["property"] = "desaturate",
							}, -- [1]
						},
					}, -- [1]
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["wTaloHlmaY0"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571246060,
			["allowUpdates"] = true,
			["data"] = {
				["backdropColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					0.5, -- [4]
				},
				["controlledChildren"] = {
				},
				["borderBackdrop"] = "Blizzard Tooltip",
				["xOffset"] = 0,
				["authorOptions"] = {
				},
				["border"] = false,
				["yOffset"] = 0,
				["regionType"] = "group",
				["borderSize"] = 2,
				["scale"] = 1,
				["borderColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["anchorPoint"] = "CENTER",
				["url"] = "https://wago.io/eEPLkEuIv/1",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["unit"] = "player",
							["type"] = "aura2",
							["spellIds"] = {
							},
							["subeventSuffix"] = "_CAST_START",
							["names"] = {
							},
							["subeventPrefix"] = "SPELL",
							["event"] = "Health",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
				},
				["selfPoint"] = "BOTTOMLEFT",
				["borderOffset"] = 4,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["tocversion"] = 11302,
				["id"] = "Paladin Protection",
				["borderInset"] = 1,
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["config"] = {
				},
				["uid"] = "wTaloHlmaY0",
				["version"] = 1,
				["subRegions"] = {
				},
				["internalVersion"] = 24,
				["conditions"] = {
				},
				["load"] = {
					["use_class"] = false,
					["class"] = {
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["borderEdge"] = "1 Pixel",
			},
		},
		["8H9rtxOHA0g"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = true,
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["yOffset"] = -30,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["url"] = "https://wago.io/pQukwVj27/1",
				["icon"] = true,
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					0, -- [2]
					0.003921568627451, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
					{
						["text_shadowXOffset"] = 0,
						["type"] = "subtext",
						["text_text"] = "%s",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = 0,
						["text_selfPoint"] = "AUTO",
						["text_visible"] = true,
						["text_fontType"] = "OUTLINE",
						["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontSize"] = 12,
					}, -- [1]
				},
				["height"] = 30,
				["glowLength"] = 10,
				["glowLines"] = 8,
				["actions"] = {
					["start"] = {
						["message"] = "我中了-> %n <-",
						["do_message"] = true,
						["message_type"] = "SAY",
					},
					["init"] = {
						["do_custom"] = false,
					},
					["finish"] = {
					},
				},
				["glowFrequency"] = 0.25,
				["triggers"] = {
					{
						["trigger"] = {
							["track"] = "auto",
							["auranames"] = {
								"变形术", -- [1]
							},
							["duration"] = "1",
							["genericShowOn"] = "showOnReady",
							["subeventPrefix"] = "SPELL",
							["use_showgcd"] = true,
							["use_charges"] = false,
							["spellCount_operator"] = ">",
							["use_genericShowOn"] = true,
							["unit"] = "player",
							["type"] = "aura2",
							["debuffType"] = "HARMFUL",
							["charges_operator"] = ">",
							["charges"] = "0",
							["subeventSuffix"] = "_CAST_START",
							["unevent"] = "auto",
							["use_spellCount"] = false,
							["names"] = {
							},
							["event"] = "Cooldown Progress (Spell)",
							["use_exact_spellName"] = false,
							["realSpellName"] = "冰霜新星",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["showClones"] = true,
							["spellName"] = 122,
							["spellCount"] = "0",
							["use_track"] = true,
							["use_unit"] = true,
						},
						["untrigger"] = {
							["genericShowOn"] = "showOnReady",
						},
					}, -- [1]
					["activeTriggerMode"] = 1,
				},
				["cooldownEdge"] = true,
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["useTooltip"] = true,
				["config"] = {
				},
				["regionType"] = "icon",
				["keepAspectRatio"] = false,
				["glowYOffset"] = 0,
				["alpha"] = 1,
				["animation"] = {
					["start"] = {
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_scale"] = true,
						["colorA"] = 1,
						["colorG"] = 0,
						["duration"] = "1",
						["use_translate"] = true,
						["scalex"] = 1,
						["colorR"] = 0,
						["type"] = "preset",
						["scaleType"] = "pulse",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["x"] = 0,
						["y"] = 0,
						["colorType"] = "straightHSV",
						["translateType"] = "bounce",
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["colorB"] = 0,
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
					},
				},
				["xOffset"] = 0,
				["tocversion"] = 11302,
				["useGlowColor"] = true,
				["cooldownTextDisabled"] = false,
				["zoom"] = 0,
				["auto"] = true,
				["glowScale"] = 1,
				["id"] = "自己debuff 9",
				["authorMode"] = true,
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["width"] = 30,
				["uid"] = "8H9rtxOHA0g",
				["inverse"] = true,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = false,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["MAGE"] = true,
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["spellknown"] = 118,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["Af9UYobj)qs"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245660,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["xOffset"] = -69.777954101563,
				["yOffset"] = -155.78,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["cooldownEdge"] = false,
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 8,
				["subRegions"] = {
				},
				["height"] = 35,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["glowLines"] = 8,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["glowFrequency"] = 0.25,
				["displayIcon"] = 135964,
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["load"] = {
					["use_class"] = true,
					["race"] = {
						["single"] = "Human",
						["multi"] = {
							["Dwarf"] = true,
							["Human"] = true,
						},
					},
					["use_never"] = false,
					["use_race"] = false,
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["ROGUE"] = true,
							["PALADIN"] = true,
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["authorOptions"] = {
				},
				["config"] = {
				},
				["regionType"] = "icon",
				["icon"] = true,
				["glowYOffset"] = 0,
				["frameStrata"] = 1,
				["keepAspectRatio"] = false,
				["progressPrecision"] = 0,
				["glowScale"] = 1,
				["semver"] = "1.0.7",
				["cooldownTextDisabled"] = true,
				["zoom"] = 0.3,
				["auto"] = false,
				["tocversion"] = 11302,
				["id"] = "Paladin - Blessing of Protection",
				["width"] = 35,
				["alpha"] = 1,
				["anchorFrameType"] = "SCREEN",
				["parent"] = "Paladin 2.0",
				["uid"] = "Af9UYobj)qs",
				["inverse"] = false,
				["glowLength"] = 10,
				["triggers"] = {
					{
						["trigger"] = {
							["auranames"] = {
								"Charge", -- [1]
							},
							["use_genericShowOn"] = true,
							["genericShowOn"] = "showAlways",
							["unit"] = "target",
							["unitExists"] = true,
							["debuffType"] = "HARMFUL",
							["matchesShowOn"] = "showAlways",
							["type"] = "status",
							["subeventSuffix"] = "_CAST_START",
							["unevent"] = "auto",
							["duration"] = "1",
							["use_unit"] = true,
							["event"] = "Cooldown Progress (Spell)",
							["names"] = {
							},
							["realSpellName"] = "Blessing of Protection",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["useName"] = true,
							["spellName"] = 1022,
							["ownOnly"] = true,
							["use_track"] = true,
							["subeventPrefix"] = "SPELL",
						},
						["untrigger"] = {
							["genericShowOn"] = "showAlways",
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["use_alwaystrue"] = true,
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Conditions",
							["use_unit"] = true,
							["unit"] = "player",
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["conditions"] = {
					{
						["check"] = {
							["trigger"] = 1,
							["variable"] = "onCooldown",
							["value"] = 1,
						},
						["changes"] = {
							{
								["value"] = true,
								["property"] = "desaturate",
							}, -- [1]
						},
					}, -- [1]
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["okjiVaJnGaQ"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["sparkWidth"] = 5,
				["sparkOffsetX"] = 0,
				["color"] = {
				},
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["sparkRotation"] = 0,
				["sparkRotationMode"] = "AUTO",
				["url"] = "https://wago.io/pQukwVj27/1",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["duration"] = "1",
							["use_showCost"] = true,
							["use_unit"] = true,
							["powertype"] = 0,
							["use_powertype"] = true,
							["debuffType"] = "HELPFUL",
							["type"] = "custom",
							["subeventSuffix"] = "_CAST_START",
							["event"] = "Power",
							["names"] = {
							},
							["custom_type"] = "stateupdate",
							["events"] = "PLAYER_ENTERING_WORLD, UNIT_SPELLCAST_SUCCEEDED, UNIT_MAXPOWER, CURRENT_SPELL_CAST_CHANGED",
							["custom"] = "function(a, e, t)\n    local currentMana = UnitPower(\"player\" , 0)\n    if e == \"UNIT_SPELLCAST_SUCCEEDED\" and currentMana < aura_env.lastMana and currentMana < UnitPowerMax(\"player\", 0) then\n        aura_env.lastMana = currentMana\n        local duration = 5\n        a[\"\"] = {\n            show = true,\n            changed = true,\n            duration = duration,\n            expirationTime = GetTime() + duration,\n            progressType = \"timed\",\n            autoHide = true\n        }   \n        return true\n    end\n    aura_env.lastMana = currentMana\n    return false\nend",
							["unit"] = "player",
							["check"] = "event",
							["spellIds"] = {
							},
							["unevent"] = "auto",
							["subeventPrefix"] = "SPELL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					["activeTriggerMode"] = -10,
				},
				["icon_color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["useTooltip"] = true,
				["selfPoint"] = "CENTER",
				["barColor"] = {
					0.45098039215686, -- [1]
					0.69803921568628, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["desaturate"] = false,
				["progressPrecision"] = 0,
				["version"] = 1,
				["subRegions"] = {
					{
						["type"] = "aurabar_bar",
					}, -- [1]
					{
						["text_shadowXOffset"] = 1,
						["text_text"] = "%p",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_selfPoint"] = "BOTTOM",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["type"] = "subtext",
						["text_color"] = {
							1, -- [1]
							0.91372549019608, -- [2]
							0.96078431372549, -- [3]
							1, -- [4]
						},
						["text_font"] = "聊天",
						["text_shadowYOffset"] = -1,
						["text_fontType"] = "None",
						["text_anchorPoint"] = "SPARK",
						["text_visible"] = true,
						["text_fontSize"] = 16,
						["anchorXOffset"] = 0,
						["text_anchorYOffset"] = 2,
					}, -- [2]
				},
				["height"] = 38,
				["sparkOffsetY"] = 0,
				["load"] = {
					["use_class"] = true,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["MAGE"] = true,
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["sparkBlendMode"] = "ADD",
				["useAdjustededMax"] = false,
				["animation"] = {
					["start"] = {
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_scale"] = true,
						["colorA"] = 1,
						["colorG"] = 0,
						["duration"] = "1",
						["use_translate"] = true,
						["scalex"] = 1,
						["colorR"] = 0,
						["type"] = "preset",
						["scaleType"] = "pulse",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["x"] = 0,
						["y"] = 0,
						["colorType"] = "straightHSV",
						["translateType"] = "bounce",
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["colorB"] = 0,
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["backgroundColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					0, -- [4]
				},
				["icon"] = false,
				["uid"] = "okjiVaJnGaQ",
				["smoothProgress"] = true,
				["useAdjustededMin"] = false,
				["regionType"] = "aurabar",
				["sparkColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["authorMode"] = true,
				["icon_side"] = "RIGHT",
				["width"] = 5,
				["alpha"] = 1,
				["sparkHeight"] = 5,
				["texture"] = "Blizzard",
				["spark"] = true,
				["zoom"] = 0,
				["auto"] = true,
				["tocversion"] = 11302,
				["sparkHidden"] = "NEVER",
				["id"] = "5秒回蓝 9",
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["sparkTexture"] = "worldstate-capturebar-spark-yellow",
				["config"] = {
				},
				["inverse"] = false,
				["xOffset"] = 0,
				["orientation"] = "VERTICAL_INVERSE",
				["conditions"] = {
				},
				["internalVersion"] = 24,
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
			},
		},
		["J36Gfr1w38C"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245660,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["xOffset"] = 0,
				["yOffset"] = -155.78,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["cooldownEdge"] = false,
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 8,
				["subRegions"] = {
				},
				["height"] = 35,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["glowLines"] = 8,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["glowFrequency"] = 0.25,
				["displayIcon"] = 135928,
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["load"] = {
					["use_class"] = true,
					["race"] = {
						["single"] = "Human",
						["multi"] = {
							["Dwarf"] = true,
							["Human"] = true,
						},
					},
					["use_never"] = false,
					["use_race"] = false,
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["ROGUE"] = true,
							["PALADIN"] = true,
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["authorOptions"] = {
				},
				["config"] = {
				},
				["regionType"] = "icon",
				["icon"] = true,
				["glowYOffset"] = 0,
				["frameStrata"] = 1,
				["keepAspectRatio"] = false,
				["progressPrecision"] = 0,
				["glowScale"] = 1,
				["semver"] = "1.0.7",
				["cooldownTextDisabled"] = true,
				["zoom"] = 0.3,
				["auto"] = false,
				["tocversion"] = 11302,
				["id"] = "Paladin - Lay on Hands",
				["width"] = 35,
				["alpha"] = 1,
				["anchorFrameType"] = "SCREEN",
				["parent"] = "Paladin 2.0",
				["uid"] = "J36Gfr1w38C",
				["inverse"] = false,
				["glowLength"] = 10,
				["triggers"] = {
					{
						["trigger"] = {
							["auranames"] = {
								"Rend", -- [1]
							},
							["use_genericShowOn"] = true,
							["genericShowOn"] = "showAlways",
							["unit"] = "target",
							["unitExists"] = true,
							["debuffType"] = "HARMFUL",
							["matchesShowOn"] = "showAlways",
							["type"] = "status",
							["subeventSuffix"] = "_CAST_START",
							["unevent"] = "auto",
							["duration"] = "1",
							["use_unit"] = true,
							["event"] = "Cooldown Progress (Spell)",
							["names"] = {
							},
							["realSpellName"] = "Lay on Hands",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["useName"] = true,
							["spellName"] = 633,
							["ownOnly"] = true,
							["use_track"] = true,
							["subeventPrefix"] = "SPELL",
						},
						["untrigger"] = {
							["genericShowOn"] = "showAlways",
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["use_alwaystrue"] = true,
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Conditions",
							["use_unit"] = true,
							["unit"] = "player",
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["conditions"] = {
					{
						["check"] = {
							["trigger"] = 1,
							["variable"] = "onCooldown",
							["value"] = 1,
						},
						["changes"] = {
							{
								["value"] = true,
								["property"] = "desaturate",
							}, -- [1]
						},
					}, -- [1]
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["75DF4O2TOMv"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245660,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["authorOptions"] = {
				},
				["yOffset"] = -75,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["cooldownEdge"] = false,
				["icon"] = true,
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 8,
				["subRegions"] = {
				},
				["height"] = 49.000049591065,
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["glowLines"] = 8,
				["displayIcon"] = 135926,
				["glowFrequency"] = 0.25,
				["parent"] = "Paladin 2.0",
				["xOffset"] = 0,
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["config"] = {
				},
				["glowLength"] = 10,
				["regionType"] = "icon",
				["anchorFrameType"] = "SCREEN",
				["alpha"] = 1,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["progressPrecision"] = 0,
				["glowScale"] = 1,
				["semver"] = "1.0.7",
				["cooldownTextDisabled"] = true,
				["auto"] = false,
				["zoom"] = 0.3,
				["useGlowColor"] = true,
				["tocversion"] = 11302,
				["id"] = "Paladin - Consecration",
				["triggers"] = {
					{
						["trigger"] = {
							["track"] = "auto",
							["auranames"] = {
								"20922", -- [1]
							},
							["matchesShowOn"] = "showAlways",
							["genericShowOn"] = "showAlways",
							["use_unit"] = true,
							["unitExists"] = true,
							["debuffType"] = "HELPFUL",
							["type"] = "status",
							["duration"] = "1",
							["unevent"] = "auto",
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
							["event"] = "Cooldown Progress (Spell)",
							["use_genericShowOn"] = true,
							["realSpellName"] = "Consecration",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["names"] = {
							},
							["useName"] = true,
							["unit"] = "player",
							["use_track"] = true,
							["spellName"] = 20922,
						},
						["untrigger"] = {
							["genericShowOn"] = "showAlways",
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["use_alwaystrue"] = true,
							["subeventSuffix"] = "_CAST_START",
							["duration"] = "1",
							["event"] = "Conditions",
							["unit"] = "player",
							["unevent"] = "auto",
							["subeventPrefix"] = "SPELL",
							["use_unit"] = true,
						},
						["untrigger"] = {
						},
					}, -- [2]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["frameStrata"] = 1,
				["glowYOffset"] = 0,
				["width"] = 49,
				["uid"] = "75DF4O2TOMv",
				["inverse"] = false,
				["keepAspectRatio"] = false,
				["load"] = {
					["use_class"] = true,
					["race"] = {
						["single"] = "Human",
						["multi"] = {
							["Dwarf"] = true,
							["Human"] = true,
						},
					},
					["use_race"] = false,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["PALADIN"] = true,
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["conditions"] = {
					{
						["check"] = {
							["trigger"] = 1,
							["variable"] = "onCooldown",
							["value"] = 1,
						},
						["changes"] = {
							{
								["value"] = true,
								["property"] = "desaturate",
							}, -- [1]
						},
					}, -- [1]
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["b)x2CoRZ7tp"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245660,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["xOffset"] = -49,
				["yOffset"] = -75,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["cooldownEdge"] = false,
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["track"] = "auto",
							["auranames"] = {
								"Immolate", -- [1]
							},
							["duration"] = "1",
							["genericShowOn"] = "showAlways",
							["subeventPrefix"] = "SPELL",
							["unitExists"] = true,
							["debuffType"] = "HARMFUL",
							["use_unit"] = true,
							["use_remaining"] = false,
							["subeventSuffix"] = "_CAST_START",
							["unevent"] = "auto",
							["names"] = {
							},
							["use_genericShowOn"] = true,
							["event"] = "Cooldown Progress (Spell)",
							["spellName"] = 20271,
							["realSpellName"] = "Judgement",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["useName"] = true,
							["matchesShowOn"] = "showAlways",
							["unit"] = "target",
							["use_track"] = true,
							["type"] = "status",
						},
						["untrigger"] = {
							["genericShowOn"] = "showAlways",
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["use_alwaystrue"] = true,
							["subeventSuffix"] = "_CAST_START",
							["duration"] = "1",
							["event"] = "Conditions",
							["unit"] = "player",
							["unevent"] = "auto",
							["subeventPrefix"] = "SPELL",
							["use_unit"] = true,
						},
						["untrigger"] = {
						},
					}, -- [2]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["internalVersion"] = 24,
				["keepAspectRatio"] = false,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 8,
				["subRegions"] = {
				},
				["height"] = 49,
				["glowLength"] = 10,
				["glowLines"] = 8,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["glowFrequency"] = 0.25,
				["displayIcon"] = 135959,
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["parent"] = "Paladin 2.0",
				["useglowColor"] = false,
				["config"] = {
				},
				["regionType"] = "icon",
				["authorOptions"] = {
				},
				["anchorFrameType"] = "SCREEN",
				["frameStrata"] = 1,
				["icon"] = true,
				["progressPrecision"] = 0,
				["glowScale"] = 1,
				["semver"] = "1.0.7",
				["cooldownTextDisabled"] = true,
				["zoom"] = 0.3,
				["auto"] = false,
				["tocversion"] = 11302,
				["id"] = "Paladin - Judgement",
				["selfPoint"] = "CENTER",
				["alpha"] = 1,
				["glowYOffset"] = 0,
				["width"] = 49,
				["uid"] = "b)x2CoRZ7tp",
				["inverse"] = false,
				["load"] = {
					["use_class"] = true,
					["race"] = {
						["single"] = "Human",
						["multi"] = {
							["Dwarf"] = true,
							["Human"] = true,
						},
					},
					["use_race"] = false,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["PALADIN"] = true,
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["glowXOffset"] = 0,
				["conditions"] = {
					{
						["check"] = {
							["trigger"] = 1,
							["variable"] = "onCooldown",
							["value"] = 1,
						},
						["changes"] = {
							{
								["value"] = true,
								["property"] = "desaturate",
							}, -- [1]
						},
					}, -- [1]
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["hiQcOiRJWRR"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = true,
				["glowLength"] = 10,
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["cooldownEdge"] = true,
				["icon"] = true,
				["useglowColor"] = false,
				["useTooltip"] = true,
				["keepAspectRatio"] = false,
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
				},
				["height"] = 38,
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["glowLines"] = 8,
				["animation"] = {
					["start"] = {
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_scale"] = true,
						["colorA"] = 1,
						["colorG"] = 0,
						["duration"] = "1",
						["use_translate"] = true,
						["scalex"] = 1,
						["colorR"] = 0,
						["type"] = "preset",
						["scaleType"] = "pulse",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["x"] = 0,
						["y"] = 0,
						["colorType"] = "straightHSV",
						["translateType"] = "bounce",
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["colorB"] = 0,
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
					},
				},
				["glowFrequency"] = 0.25,
				["displayIcon"] = 136187,
				["internalVersion"] = 24,
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["url"] = "https://wago.io/pQukwVj27/1",
				["uid"] = "hiQcOiRJWRR",
				["regionType"] = "icon",
				["width"] = 38,
				["glowYOffset"] = 0,
				["alpha"] = 1,
				["glowXOffset"] = 0,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["tocversion"] = 11302,
				["authorMode"] = true,
				["cooldownTextDisabled"] = false,
				["zoom"] = 0,
				["auto"] = true,
				["glowScale"] = 1,
				["id"] = "种族-buff 9",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["xOffset"] = 0,
				["config"] = {
				},
				["inverse"] = false,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = false,
					["race"] = {
						["single"] = "Orc",
						["multi"] = {
							["Orc"] = true,
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["MAGE"] = true,
						},
					},
					["spellknown"] = 7744,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["auranames"] = {
								"26635", -- [1]
								"23234", -- [2]
								"7744", -- [3]
								"20580", -- [4]
								"20594", -- [5]
							},
							["duration"] = "1",
							["unit"] = "player",
							["use_attackable"] = true,
							["debuffType"] = "HELPFUL",
							["showClones"] = false,
							["type"] = "aura2",
							["unevent"] = "auto",
							["spellName"] = 0,
							["subeventPrefix"] = "SPELL",
							["event"] = "Unit Characteristics",
							["names"] = {
							},
							["realSpellName"] = 0,
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["use_charges"] = true,
							["useName"] = true,
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["matchesShowOn"] = "showOnActive",
						},
						["untrigger"] = {
							["unit"] = "target",
						},
					}, -- [1]
					["activeTriggerMode"] = 1,
				},
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["zhxh5irneMZ"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["xOffset"] = 0,
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["url"] = "https://wago.io/pQukwVj27/1",
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
					{
						["text_shadowXOffset"] = 0,
						["type"] = "subtext",
						["text_text"] = "%p",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = 0,
						["text_selfPoint"] = "AUTO",
						["text_visible"] = true,
						["text_fontType"] = "OUTLINE",
						["text_anchorPoint"] = "CENTER",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontSize"] = 24,
					}, -- [1]
				},
				["height"] = 52,
				["glowLines"] = 8,
				["glowFrequency"] = 0.25,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["animation"] = {
					["start"] = {
						["colorR"] = 0,
						["scalex"] = 1,
						["colorB"] = 0,
						["colorG"] = 0,
						["colorA"] = 1,
						["use_translate"] = true,
						["duration"] = "1",
						["type"] = "preset",
						["scaleType"] = "pulse",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["colorType"] = "straightHSV",
						["y"] = 0,
						["x"] = 0,
						["translateType"] = "bounce",
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["use_scale"] = true,
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "preset",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
					},
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["authorOptions"] = {
					{
						["type"] = "description",
						["text"] = "\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["cooldownEdge"] = true,
				["load"] = {
					["use_class"] = true,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["regionType"] = "icon",
				["keepAspectRatio"] = false,
				["uid"] = "zhxh5irneMZ",
				["anchorFrameType"] = "SCREEN",
				["glowYOffset"] = 0,
				["alpha"] = 1,
				["progressPrecision"] = 0,
				["cooldownTextDisabled"] = true,
				["glowScale"] = 1,
				["zoom"] = 0,
				["auto"] = true,
				["tocversion"] = 11302,
				["id"] = "功击中 主手 8",
				["glowLength"] = 10,
				["frameStrata"] = 1,
				["width"] = 52,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["config"] = {
				},
				["inverse"] = true,
				["icon"] = true,
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "status",
							["subeventSuffix"] = "_CAST_START",
							["duration"] = "1",
							["event"] = "Swing Timer",
							["unit"] = "player",
							["unevent"] = "auto",
							["subeventPrefix"] = "SPELL",
							["spellIds"] = {
							},
							["use_hand"] = true,
							["use_unit"] = true,
							["names"] = {
							},
							["hand"] = "main",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
							["hand"] = "main",
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Cast",
							["unit"] = "player",
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_inverse"] = true,
							["subeventPrefix"] = "SPELL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["activeTriggerMode"] = 1,
				},
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
			},
		},
		["YXiDGYNOvSz"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1571245791,
			["allowUpdates"] = true,
			["data"] = {
				["glow"] = false,
				["authorOptions"] = {
				},
				["yOffset"] = 0,
				["anchorPoint"] = "CENTER",
				["cooldownSwipe"] = true,
				["cooldownEdge"] = false,
				["actions"] = {
					["start"] = {
					},
					["init"] = {
					},
					["finish"] = {
					},
				},
				["useglowColor"] = false,
				["internalVersion"] = 24,
				["glowXOffset"] = 0,
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
					},
				},
				["desaturate"] = false,
				["glowColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["version"] = 1,
				["subRegions"] = {
					{
						["text_shadowXOffset"] = 0,
						["type"] = "subtext",
						["text_text"] = " ",
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["text_font"] = "Friz Quadrata TT",
						["text_shadowColor"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["text_shadowYOffset"] = 0,
						["text_selfPoint"] = "AUTO",
						["text_fontSize"] = 12,
						["text_visible"] = true,
						["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontType"] = "OUTLINE",
					}, -- [1]
				},
				["height"] = 38,
				["glowLines"] = 8,
				["glowFrequency"] = 0.25,
				["glowLength"] = 10,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["displayIcon"] = "136025",
				["url"] = "https://wago.io/pQukwVj27/1",
				["icon"] = true,
				["regionType"] = "icon",
				["xOffset"] = 0,
				["config"] = {
				},
				["width"] = 38,
				["anchorFrameType"] = "SCREEN",
				["alpha"] = 1,
				["selfPoint"] = "CENTER",
				["cooldownTextDisabled"] = false,
				["glowScale"] = 1,
				["zoom"] = 0,
				["auto"] = false,
				["tocversion"] = 11302,
				["id"] = "Find Minerals 11",
				["authorMode"] = true,
				["frameStrata"] = 1,
				["glowYOffset"] = 0,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["uid"] = "YXiDGYNOvSz",
				["inverse"] = false,
				["load"] = {
					["use_encounter"] = false,
					["talent"] = {
					},
					["spec"] = {
						["multi"] = {
						},
					},
					["use_class"] = true,
					["use_spellknown"] = true,
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["use_combat"] = false,
					["spellknown"] = 2580,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "status",
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Conditions",
							["unit"] = "player",
							["subeventPrefix"] = "SPELL",
							["spellIds"] = {
							},
							["names"] = {
							},
							["subeventSuffix"] = "_CAST_START",
							["use_alive"] = true,
							["use_unit"] = true,
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "custom",
							["custom"] = "function()\n    local isTracking = MiniMapTrackingFrame:IsShown()\n    local icon = MiniMapTrackingIcon:GetTexture()\n    return not isTracking and (icon == nil or icon == 136025)\nend",
							["subeventSuffix"] = "_CAST_START",
							["check"] = "update",
							["custom_type"] = "status",
							["event"] = "Health",
							["subeventPrefix"] = "SPELL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["activeTriggerMode"] = -10,
				},
				["conditions"] = {
				},
				["keepAspectRatio"] = false,
				["glowBorder"] = false,
			},
		},
	},
	["frame"] = {
		["xOffset"] = -484.567993164063,
		["width"] = 830,
		["height"] = 665.000122070313,
		["yOffset"] = -75.1128540039063,
	},
	["editor_theme"] = "Monokai",
}

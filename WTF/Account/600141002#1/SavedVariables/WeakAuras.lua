
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
							"25780", -- [1]
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
						["realSpellName"] = 25780,
						["use_spellName"] = true,
						["use_unit"] = true,
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["use_genericShowOn"] = true,
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
			["glowLength"] = 4,
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
			["keepAspectRatio"] = false,
			["glowLines"] = 8,
			["glowType"] = "Pixel",
			["glowThickness"] = 1,
			["progressPrecision"] = 0,
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
			["xOffset"] = 188,
			["regionType"] = "icon",
			["useglowColor"] = false,
			["config"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["width"] = 24,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = true,
			["zoom"] = 0,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "正义之怒",
			["authorOptions"] = {
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["glowYOffset"] = 0,
			["uid"] = "1qpyQAHUbcD",
			["inverse"] = false,
			["icon"] = true,
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
						["unevent"] = "auto",
						["debuffType"] = "HELPFUL",
						["spellName"] = 10310,
						["type"] = "status",
						["use_genericShowOn"] = true,
						["auraspellids"] = {
							"20293", -- [1]
							"20357", -- [2]
							"20348", -- [3]
						},
						["useExactSpellId"] = true,
						["duration"] = "1",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 10310,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["use_unit"] = true,
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
			},
			["height"] = 24,
			["glowLength"] = 10,
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
			["keepAspectRatio"] = false,
			["xOffset"] = 0,
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 3,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["selfPoint"] = "CENTER",
			["useglowColor"] = false,
			["regionType"] = "icon",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["width"] = 24,
			["anchorFrameType"] = "SCREEN",
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = false,
			["zoom"] = 0,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "圣疗术 2",
			["authorOptions"] = {
			},
			["alpha"] = 1,
			["glowYOffset"] = 0,
			["glowLines"] = 8,
			["uid"] = "0)RvRmFy0Ut",
			["inverse"] = false,
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
								["value"] = "20",
								["variable"] = "percenthealth",
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
					["text_fontSize"] = 12,
					["text_visible"] = true,
					["text_anchorPoint"] = "INNER_LEFT",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorXOffset"] = 0,
					["text_fontType"] = "None",
				}, -- [2]
			},
			["height"] = 20,
			["color"] = {
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
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["id"] = "生命值",
			["icon"] = false,
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["xOffset"] = -24,
			["authorOptions"] = {
			},
			["icon_side"] = "RIGHT",
			["zoom"] = 0,
			["sparkHeight"] = 30,
			["texture"] = "ElvUI Norm",
			["config"] = {
			},
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["auto"] = true,
			["uid"] = "mSbZZQRv1ef",
			["sparkHidden"] = "NEVER",
			["width"] = 180,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["inverse"] = false,
			["spark"] = false,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "percenthealth",
						["op"] = "<=",
						["value"] = "20",
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
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["selfPoint"] = "CENTER",
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
						["use_unit"] = true,
						["matchesShowOn"] = "showAlways",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["duration"] = "1",
						["unevent"] = "timed",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["names"] = {
						},
						["useExactSpellId"] = true,
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
						["realSpellName"] = 20293,
						["use_spellName"] = true,
						["use_unit"] = true,
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["use_genericShowOn"] = true,
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
					["text_fontSize"] = 14,
					["text_visible"] = true,
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
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
					["text_visible"] = false,
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["anchorXOffset"] = 0,
					["text_fontSize"] = 14,
				}, -- [3]
			},
			["height"] = 48,
			["selfPoint"] = "CENTER",
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
			["alpha"] = 1,
			["glowFrequency"] = 0.25,
			["glowLines"] = 8,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["glowType"] = "Pixel",
			["glowThickness"] = 3,
			["anchorFrameType"] = "SCREEN",
			["glowXOffset"] = 0,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["regionType"] = "icon",
			["useglowColor"] = false,
			["uid"] = "FUYcElT6pGE",
			["zoom"] = 0,
			["glowYOffset"] = 0,
			["authorOptions"] = {
			},
			["auto"] = true,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = true,
			["glowScale"] = 1,
			["id"] = "圣印",
			["glowLength"] = 10,
			["frameStrata"] = 1,
			["width"] = 48,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["inverse"] = false,
			["xOffset"] = -48,
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
						["variable"] = "expirationTime",
						["value"] = "5",
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
						["use_unit"] = true,
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
						["unit"] = "player",
						["type"] = "status",
						["subeventPrefix"] = "SPELL",
						["auraspellids"] = {
							"20293", -- [1]
							"20357", -- [2]
							"20348", -- [3]
						},
						["spellName"] = 10278,
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 10278,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["duration"] = "1",
						["unevent"] = "auto",
						["matchesShowOn"] = "showAlways",
						["use_track"] = true,
						["useExactSpellId"] = true,
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
			["parent"] = "Protection Paladin",
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
			["alpha"] = 1,
			["glowFrequency"] = 0.25,
			["glowXOffset"] = 0,
			["glowLines"] = 8,
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 3,
			["progressPrecision"] = 0,
			["selfPoint"] = "CENTER",
			["icon"] = true,
			["regionType"] = "icon",
			["useglowColor"] = false,
			["uid"] = "A6ZaLyqLVi8",
			["glowYOffset"] = 0,
			["anchorFrameType"] = "SCREEN",
			["zoom"] = 0,
			["auto"] = true,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = false,
			["glowScale"] = 1,
			["id"] = "保护祝福",
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
								["variable"] = "onCooldown",
								["value"] = 1,
							}, -- [1]
							{
								["variable"] = "expirationTime",
								["op"] = "<=",
								["value"] = "30",
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
				"神圣之盾", -- [1]
				"圣印", -- [2]
				"审判", -- [3]
				"奉献", -- [4]
				"奉献 2", -- [5]
				"审判效果", -- [6]
				"祝福", -- [7]
				"正义之怒", -- [8]
				"光环", -- [9]
				"保护祝福", -- [10]
				"牺牲祝福", -- [11]
				"圣疗术", -- [12]
				"生命值", -- [13]
				"魔法值", -- [14]
				"圣盾术", -- [15]
				"圣疗术 2", -- [16]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["authorOptions"] = {
			},
			["xOffset"] = 24,
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["regionType"] = "group",
			["borderSize"] = 2,
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
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
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
						["names"] = {
						},
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["event"] = "Health",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["scale"] = 1,
			["borderOffset"] = 4,
			["yOffset"] = -150,
			["selfPoint"] = "BOTTOMLEFT",
			["id"] = "Protection Paladin",
			["anchorPoint"] = "CENTER",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["borderInset"] = 1,
			["config"] = {
			},
			["internalVersion"] = 24,
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
			["uid"] = "BqpJOUGfRf)",
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
						["unit"] = "player",
						["unevent"] = "auto",
						["debuffType"] = "HELPFUL",
						["use_genericShowOn"] = true,
						["type"] = "status",
						["auraspellids"] = {
							"20293", -- [1]
							"20357", -- [2]
							"20348", -- [3]
						},
						["useExactSpellId"] = true,
						["use_unit"] = true,
						["duration"] = "1",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 20271,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["spellName"] = 20271,
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
			["glowLength"] = 10,
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
			["keepAspectRatio"] = false,
			["glowLines"] = 8,
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 3,
			["progressPrecision"] = 0,
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
			["xOffset"] = -168,
			["regionType"] = "icon",
			["useglowColor"] = false,
			["config"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["width"] = 96,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = false,
			["zoom"] = 0,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "审判",
			["authorOptions"] = {
			},
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["glowYOffset"] = 0,
			["uid"] = "L1EidKV08j)",
			["inverse"] = false,
			["icon"] = true,
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
						["use_unit"] = true,
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
						["unit"] = "player",
						["type"] = "status",
						["subeventPrefix"] = "SPELL",
						["auraspellids"] = {
							"20293", -- [1]
							"20357", -- [2]
							"20348", -- [3]
						},
						["spellName"] = 20923,
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 20923,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["duration"] = "1",
						["unevent"] = "auto",
						["matchesShowOn"] = "showAlways",
						["use_track"] = true,
						["useExactSpellId"] = true,
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
					["text_fontSize"] = 28,
					["anchorXOffset"] = 0,
					["rotateText"] = "NONE",
				}, -- [1]
			},
			["height"] = 96,
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
			["alpha"] = 1,
			["glowFrequency"] = 0.25,
			["glowXOffset"] = 0,
			["glowLines"] = 8,
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 3,
			["progressPrecision"] = 0,
			["selfPoint"] = "CENTER",
			["icon"] = true,
			["regionType"] = "icon",
			["useglowColor"] = false,
			["uid"] = "mAxuKEYLdNz",
			["glowYOffset"] = 0,
			["anchorFrameType"] = "SCREEN",
			["zoom"] = 0,
			["auto"] = true,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = false,
			["glowScale"] = 1,
			["id"] = "奉献",
			["parent"] = "Protection Paladin",
			["frameStrata"] = 1,
			["width"] = 96,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["config"] = {
			},
			["inverse"] = false,
			["xOffset"] = 120,
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
						["names"] = {
						},
						["useExactSpellId"] = true,
						["debuffType"] = "HELPFUL",
						["subeventPrefix"] = "SPELL",
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
						["realSpellName"] = 20729,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["use_unit"] = true,
						["spellName"] = 20729,
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
			["selfPoint"] = "CENTER",
			["authorOptions"] = {
			},
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 3,
			["progressPrecision"] = 0,
			["keepAspectRatio"] = false,
			["xOffset"] = -236,
			["regionType"] = "icon",
			["useglowColor"] = false,
			["config"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["width"] = 24,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = false,
			["zoom"] = 0,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "牺牲祝福",
			["parent"] = "Protection Paladin",
			["alpha"] = 1,
			["glowYOffset"] = 0,
			["glowLines"] = 8,
			["uid"] = "TDwmHVSWO9e",
			["inverse"] = false,
			["icon"] = true,
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
							"20913", -- [1]
							"19854", -- [2]
							"19838", -- [3]
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
						["use_exact_spellName"] = true,
						["unevent"] = "auto",
						["genericShowOn"] = "showAlways",
						["duration"] = "1",
						["event"] = "Cooldown Progress (Spell)",
						["subeventPrefix"] = "SPELL",
						["realSpellName"] = 20913,
						["use_spellName"] = true,
						["use_genericShowOn"] = true,
						["unit"] = "player",
						["subeventSuffix"] = "_CAST_START",
						["use_unit"] = true,
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
			["selfPoint"] = "CENTER",
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
			["alpha"] = 1,
			["glowFrequency"] = 0.25,
			["glowLines"] = 8,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["glowType"] = "Pixel",
			["glowThickness"] = 1,
			["anchorFrameType"] = "SCREEN",
			["glowXOffset"] = 0,
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["regionType"] = "icon",
			["useglowColor"] = false,
			["uid"] = "dw21I(GjC2Y",
			["zoom"] = 0,
			["glowYOffset"] = 0,
			["authorOptions"] = {
			},
			["auto"] = true,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = true,
			["glowScale"] = 1,
			["id"] = "祝福",
			["glowLength"] = 4,
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
			["xOffset"] = 188,
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
						["useExactSpellId"] = true,
						["debuffType"] = "HELPFUL",
						["subeventPrefix"] = "SPELL",
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
						["realSpellName"] = 26573,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["use_unit"] = true,
						["spellName"] = 26573,
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
					["rotateText"] = "NONE",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_visible"] = false,
				}, -- [1]
			},
			["height"] = 30,
			["parent"] = "Protection Paladin",
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
			["keepAspectRatio"] = false,
			["glowLines"] = 8,
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 3,
			["progressPrecision"] = 0,
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
			["xOffset"] = 48,
			["regionType"] = "icon",
			["useglowColor"] = false,
			["config"] = {
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["width"] = 30,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = false,
			["zoom"] = 0,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "奉献 2",
			["glowLength"] = 10,
			["alpha"] = 1,
			["glowYOffset"] = 0,
			["anchorFrameType"] = "SCREEN",
			["uid"] = "JO73YMPNNhn",
			["inverse"] = false,
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
						["use_unit"] = true,
						["matchesShowOn"] = "showAlways",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["duration"] = "1",
						["unevent"] = "timed",
						["spellIds"] = {
						},
						["auraspellids"] = {
							"20927", -- [1]
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
						["use_exact_spellName"] = true,
						["unevent"] = "auto",
						["genericShowOn"] = "showAlways",
						["duration"] = "1",
						["event"] = "Cooldown Progress (Spell)",
						["subeventPrefix"] = "SPELL",
						["realSpellName"] = 20927,
						["use_spellName"] = true,
						["use_genericShowOn"] = true,
						["unit"] = "player",
						["subeventSuffix"] = "_CAST_START",
						["use_unit"] = true,
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
			["useGlowColor"] = true,
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
			["progressPrecision"] = 0,
			["glowFrequency"] = 0.25,
			["width"] = 48,
			["frameStrata"] = 1,
			["glowType"] = "Pixel",
			["glowThickness"] = 3,
			["anchorFrameType"] = "SCREEN",
			["keepAspectRatio"] = false,
			["parent"] = "Protection Paladin",
			["regionType"] = "icon",
			["config"] = {
			},
			["glowLines"] = 8,
			["xOffset"] = 0,
			["useglowColor"] = false,
			["glowLength"] = 10,
			["authorOptions"] = {
			},
			["cooldownTextDisabled"] = false,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "神圣之盾",
			["selfPoint"] = "CENTER",
			["alpha"] = 1,
			["glowYOffset"] = 0,
			["zoom"] = 0,
			["uid"] = "TXUjWXV89zq",
			["inverse"] = false,
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
						["value"] = "3",
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
						["auraspellids"] = {
							"20355", -- [1]
							"20345", -- [2]
						},
						["subeventSuffix"] = "_CAST_START",
						["matchesShowOn"] = "showAlways",
						["duration"] = "1",
						["event"] = "Chat Message",
						["subeventPrefix"] = "SPELL",
						["unitExists"] = true,
						["useExactSpellId"] = true,
						["spellIds"] = {
						},
						["use_unit"] = true,
						["unevent"] = "timed",
						["names"] = {
						},
						["unit"] = "target",
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
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_visible"] = true,
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
			["progressPrecision"] = 0,
			["glowFrequency"] = 0.25,
			["useGlowColor"] = true,
			["frameStrata"] = 1,
			["glowType"] = "Pixel",
			["glowThickness"] = 2,
			["anchorFrameType"] = "SCREEN",
			["keepAspectRatio"] = false,
			["parent"] = "Protection Paladin",
			["regionType"] = "icon",
			["config"] = {
			},
			["glowLines"] = 8,
			["xOffset"] = -96,
			["useglowColor"] = false,
			["glowLength"] = 10,
			["authorOptions"] = {
			},
			["cooldownTextDisabled"] = false,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "审判效果",
			["selfPoint"] = "CENTER",
			["alpha"] = 1,
			["glowYOffset"] = 0,
			["zoom"] = 0,
			["uid"] = "cNRjdXU5aOF",
			["inverse"] = false,
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
						["op"] = "<=",
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
				}, -- [3]
			},
			["width"] = 28,
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
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["debuffType"] = "HELPFUL",
						["names"] = {
						},
						["type"] = "status",
						["spellName"] = 10310,
						["auraspellids"] = {
							"20293", -- [1]
							"20357", -- [2]
							"20348", -- [3]
						},
						["use_unit"] = true,
						["subeventSuffix"] = "_CAST_START",
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 10310,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["duration"] = "1",
						["useExactSpellId"] = true,
						["use_genericShowOn"] = true,
						["use_track"] = true,
						["unevent"] = "auto",
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
			["parent"] = "Protection Paladin",
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
			["alpha"] = 1,
			["glowFrequency"] = 0.25,
			["xOffset"] = -236,
			["progressPrecision"] = 0,
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 3,
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
			["glowXOffset"] = 0,
			["icon"] = true,
			["regionType"] = "icon",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["uid"] = "CshjXQjY)YR",
			["glowLines"] = 8,
			["glowYOffset"] = 0,
			["zoom"] = 0,
			["auto"] = true,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = false,
			["glowScale"] = 1,
			["id"] = "圣疗术",
			["glowLength"] = 10,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["width"] = 24,
			["config"] = {
			},
			["inverse"] = false,
			["useglowColor"] = false,
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
							"10301", -- [1]
							"10292", -- [2]
							"19746", -- [3]
							"19896", -- [4]
							"19898", -- [5]
							"19899", -- [6]
						},
						["unevent"] = "timed",
						["duration"] = "1",
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
			},
			["height"] = 24,
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
			["alpha"] = 1,
			["glowFrequency"] = 0.25,
			["glowXOffset"] = 0,
			["glowLines"] = 8,
			["glowType"] = "Pixel",
			["glowThickness"] = 1,
			["progressPrecision"] = 0,
			["selfPoint"] = "CENTER",
			["icon"] = true,
			["regionType"] = "icon",
			["useglowColor"] = false,
			["uid"] = "tafdZj)gT7t",
			["glowYOffset"] = 0,
			["anchorFrameType"] = "SCREEN",
			["zoom"] = 0,
			["auto"] = true,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = true,
			["glowScale"] = 1,
			["id"] = "光环",
			["parent"] = "Protection Paladin",
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
			["xOffset"] = 188,
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
						["unevent"] = "auto",
						["duration"] = "1",
						["event"] = "Power",
						["subeventPrefix"] = "SPELL",
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
			["authorOptions"] = {
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
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["icon_side"] = "RIGHT",
			["auto"] = true,
			["sparkHeight"] = 30,
			["texture"] = "ElvUI Norm",
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["zoom"] = 0,
			["spark"] = false,
			["config"] = {
			},
			["sparkHidden"] = "NEVER",
			["alpha"] = 1,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["width"] = 180,
			["uid"] = "(wPsZ27zPPP",
			["inverse"] = false,
			["id"] = "魔法值",
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["xOffset"] = -24,
			["icon"] = false,
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
					["text_fontType"] = "OUTLINE",
					["text_visible"] = false,
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_fontSize"] = 10,
					["anchorXOffset"] = 0,
					["rotateText"] = "NONE",
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
					["rotateText"] = "NONE",
					["text_fontType"] = "OUTLINE",
					["text_anchorPoint"] = "CENTER",
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_fontSize"] = 12,
					["anchorXOffset"] = 0,
					["text_visible"] = false,
				}, -- [2]
			},
			["height"] = 24,
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
			["alpha"] = 1,
			["glowFrequency"] = 0.25,
			["glowXOffset"] = 0,
			["xOffset"] = -48,
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 3,
			["glowColor"] = {
				1, -- [1]
				1, -- [2]
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
			["regionType"] = "icon",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["uid"] = "wPy034RpNRg",
			["glowLines"] = 8,
			["glowYOffset"] = 0,
			["zoom"] = 0,
			["auto"] = true,
			["cooldownTextDisabled"] = false,
			["useGlowColor"] = false,
			["glowScale"] = 1,
			["id"] = "圣盾术",
			["parent"] = "Protection Paladin",
			["frameStrata"] = 1,
			["width"] = 24,
			["anchorFrameType"] = "SCREEN",
			["config"] = {
			},
			["inverse"] = false,
			["triggers"] = {
				{
					["trigger"] = {
						["use_genericShowOn"] = true,
						["genericShowOn"] = "showAlways",
						["unit"] = "player",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
						["useExactSpellId"] = true,
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
						["realSpellName"] = 1020,
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["duration"] = "1",
						["unevent"] = "auto",
						["matchesShowOn"] = "showAlways",
						["use_track"] = true,
						["spellName"] = 1020,
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
						["useExactSpellId"] = true,
						["unit"] = "player",
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
						["useExactSpellId"] = true,
						["unit"] = "player",
						["debuffType"] = "HARMFUL",
					},
					["untrigger"] = {
					},
				}, -- [4]
				["activeTriggerMode"] = -10,
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
								["trigger"] = 1,
							}, -- [1]
							{
								["value"] = 1,
								["variable"] = "buffed",
								["trigger"] = 4,
								["op"] = "<=",
							}, -- [2]
						},
						["trigger"] = -2,
						["variable"] = "OR",
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
						["scalex"] = 1,
						["use_scale"] = true,
						["use_translate"] = true,
						["use_alpha"] = true,
						["translateType"] = "bounce",
						["scaleType"] = "pulse",
						["type"] = "preset",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["preset"] = "slidetop",
						["y"] = 0,
						["x"] = 0,
						["colorType"] = "straightHSV",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["duration_type"] = "seconds",
						["colorB"] = 0,
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
				["authorOptions"] = {
					{
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["type"] = "description",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["glowFrequency"] = 0.25,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = true,
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
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
				["useTooltip"] = true,
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
							["names"] = {
							},
							["subeventPrefix"] = "SPELL",
							["event"] = "Cooldown Progress (Spell)",
							["subeventSuffix"] = "_CAST_START",
							["realSpellName"] = "审判",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["hand"] = "main",
							["spellName"] = 20271,
							["use_genericShowOn"] = true,
							["use_track"] = true,
							["unit"] = "player",
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
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["unevent"] = "auto",
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
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
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
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["unevent"] = "auto",
							["use_unit"] = true,
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
					["activeTriggerMode"] = 1,
				},
				["progressPrecision"] = 0,
				["regionType"] = "icon",
				["uid"] = "26MfEG1fAlG",
				["glowYOffset"] = 0,
				["anchorFrameType"] = "SCREEN",
				["alpha"] = 1,
				["selfPoint"] = "CENTER",
				["actions"] = {
					["start"] = {
					},
					["finish"] = {
					},
					["init"] = {
						["custom"] = "\n\n",
						["do_custom"] = false,
					},
				},
				["tocversion"] = 11302,
				["zoom"] = 0,
				["cooldownTextDisabled"] = true,
				["auto"] = true,
				["glowScale"] = 1,
				["id"] = "审判",
				["keepAspectRatio"] = false,
				["frameStrata"] = 1,
				["width"] = 38,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["config"] = {
				},
				["inverse"] = true,
				["url"] = "https://wago.io/pQukwVj27/1",
				["glowLength"] = 10,
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
				["borderEdge"] = "1 Pixel",
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
					["finish"] = {
					},
					["init"] = {
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
							["buffShowOn"] = "showOnActive",
							["names"] = {
							},
							["subeventPrefix"] = "SPELL",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					["disjunctive"] = "all",
					["activeTriggerMode"] = -10,
				},
				["borderOffset"] = 4,
				["internalVersion"] = 24,
				["semver"] = "1.0.7",
				["selfPoint"] = "BOTTOMLEFT",
				["id"] = "Paladin 2.0",
				["uid"] = "eOX9jYSjl9f",
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["borderInset"] = 1,
				["config"] = {
				},
				["version"] = 8,
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
				["tocversion"] = 11302,
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
					["ingroup"] = {
						["multi"] = {
						},
					},
					["pvptalent"] = {
						["multi"] = {
						},
					},
					["role"] = {
						["multi"] = {
						},
					},
					["difficulty"] = {
						["multi"] = {
						},
					},
					["faction"] = {
						["multi"] = {
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["authorOptions"] = {
				},
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
				["glowLines"] = 8,
				["authorOptions"] = {
				},
				["glowFrequency"] = 0.25,
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
							["subeventPrefix"] = "SPELL",
							["type"] = "status",
							["subeventSuffix"] = "_CAST_START",
							["unevent"] = "auto",
							["ownOnly"] = true,
							["names"] = {
							},
							["event"] = "Cooldown Progress (Spell)",
							["useName"] = true,
							["realSpellName"] = "Blessing of Freedom",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["duration"] = "1",
							["use_genericShowOn"] = true,
							["use_unit"] = true,
							["use_track"] = true,
							["spellName"] = 1044,
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
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["xOffset"] = -34.777954101563,
				["parent"] = "Paladin 2.0",
				["uid"] = "HvyJzKiq3wv",
				["regionType"] = "icon",
				["width"] = 35,
				["anchorFrameType"] = "SCREEN",
				["frameStrata"] = 1,
				["glowLength"] = 10,
				["progressPrecision"] = 0,
				["tocversion"] = 11302,
				["auto"] = false,
				["zoom"] = 0.3,
				["cooldownTextDisabled"] = true,
				["semver"] = "1.0.7",
				["glowScale"] = 1,
				["id"] = "Paladin - Blessing of Freedom",
				["cooldownEdge"] = false,
				["alpha"] = 1,
				["glowYOffset"] = 0,
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
							["PALADIN"] = true,
							["ROGUE"] = true,
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["keepAspectRatio"] = false,
				["displayIcon"] = 135968,
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
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["type"] = "description",
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
					["finish"] = {
					},
					["init"] = {
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
						["scalex"] = 1,
						["use_scale"] = true,
						["use_translate"] = true,
						["use_alpha"] = true,
						["type"] = "preset",
						["scaleType"] = "pulse",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["preset"] = "slidetop",
						["alpha"] = 0,
						["translateType"] = "bounce",
						["y"] = 0,
						["colorType"] = "straightHSV",
						["x"] = 0,
						["scaley"] = 1,
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["duration_type"] = "seconds",
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
						["text_fontType"] = "OUTLINE",
						["text_visible"] = true,
						["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["text_fontSize"] = 12,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
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
							["unit"] = "target",
							["duration"] = "1",
							["event"] = "Health",
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["names"] = {
							},
							["spellIds"] = {
							},
							["matchesShowOn"] = "showOnActive",
							["use_unit"] = true,
							["auranames"] = {
								"毒蛇钉刺", -- [1]
							},
							["ownOnly"] = true,
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
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["use_attackable"] = false,
							["use_unit"] = true,
						},
						["untrigger"] = {
						},
					}, -- [2]
					["activeTriggerMode"] = 1,
				},
				["glowFrequency"] = 0.25,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = false,
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spellknown"] = 1978,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["url"] = "https://wago.io/pQukwVj27/1",
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["authorMode"] = true,
				["uid"] = "CRWdLShKE1B",
				["anchorFrameType"] = "SCREEN",
				["regionType"] = "icon",
				["width"] = 30,
				["frameStrata"] = 1,
				["icon"] = true,
				["progressPrecision"] = 0,
				["tocversion"] = 11302,
				["auto"] = true,
				["zoom"] = 0,
				["xOffset"] = 0,
				["cooldownTextDisabled"] = false,
				["useGlowColor"] = true,
				["glowScale"] = 1,
				["id"] = "目标- BUFF11",
				["glowLength"] = 10,
				["alpha"] = 1,
				["glowYOffset"] = 0,
				["glowXOffset"] = 0,
				["config"] = {
				},
				["inverse"] = false,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
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
					["finish"] = {
					},
					["init"] = {
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
						["duration_type"] = "seconds",
						["use_translate"] = true,
						["colorB"] = 0,
						["colorR"] = 0,
						["type"] = "preset",
						["scaleType"] = "pulse",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["translateType"] = "bounce",
						["y"] = 0,
						["x"] = 0,
						["colorType"] = "straightHSV",
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["scalex"] = 1,
						["duration"] = "1",
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
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
						["text_fontType"] = "OUTLINE",
						["text_visible"] = true,
						["text_anchorPoint"] = "OUTER_TOP",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["text_fontSize"] = 18,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
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
							["subeventSuffix"] = "_CAST_START",
							["unevent"] = "auto",
							["spellName"] = 0,
							["fetchTooltip"] = true,
							["event"] = "Unit Characteristics",
							["useName"] = true,
							["realSpellName"] = 0,
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["duration"] = "1",
							["names"] = {
							},
							["use_charges"] = true,
							["unit"] = "player",
							["subeventPrefix"] = "SPELL",
						},
						["untrigger"] = {
							["unit"] = "target",
						},
					}, -- [1]
					["activeTriggerMode"] = 1,
				},
				["authorOptions"] = {
					{
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["type"] = "description",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["authorMode"] = true,
				["regionType"] = "icon",
				["config"] = {
				},
				["anchorFrameType"] = "SCREEN",
				["glowYOffset"] = 0,
				["alpha"] = 1,
				["useTooltip"] = true,
				["glowLength"] = 10,
				["tocversion"] = 11302,
				["zoom"] = 0,
				["cooldownTextDisabled"] = false,
				["auto"] = true,
				["glowScale"] = 1,
				["id"] = "进食 buff 9",
				["icon"] = true,
				["frameStrata"] = 1,
				["width"] = 38,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = false,
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
					["spellknown"] = 1459,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["uid"] = "QjH3Q4JrpE(",
				["inverse"] = false,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["keepAspectRatio"] = false,
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
						["text_fontType"] = "OUTLINE",
						["text_visible"] = false,
						["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["text_fontSize"] = 12,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
					}, -- [1]
				},
				["height"] = 64,
				["glowLines"] = 8,
				["glowFrequency"] = 0.25,
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
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["conditions"] = {
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
							["subeventSuffix"] = "_CAST_START",
							["type"] = "aura2",
							["unit"] = "player",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [1]
					["activeTriggerMode"] = -10,
				},
				["load"] = {
					["use_class"] = true,
					["use_race"] = false,
					["ingroup"] = {
					},
					["race"] = {
						["single"] = "Human",
						["multi"] = {
							["Dwarf"] = true,
							["Human"] = true,
						},
					},
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
					["use_combat"] = true,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["regionType"] = "icon",
				["parent"] = "Paladin 2.0",
				["uid"] = "5sIquIf1M3z",
				["anchorFrameType"] = "SCREEN",
				["glowYOffset"] = 0,
				["frameStrata"] = 1,
				["cooldownEdge"] = false,
				["auto"] = false,
				["glowScale"] = 1,
				["zoom"] = 0.3,
				["semver"] = "1.0.7",
				["tocversion"] = 11302,
				["id"] = "Paladin - Blessing of Wisdom",
				["cooldownTextDisabled"] = false,
				["alpha"] = 1,
				["width"] = 64,
				["glowLength"] = 10,
				["config"] = {
				},
				["inverse"] = false,
				["authorOptions"] = {
				},
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["displayIcon"] = 135970,
				["keepAspectRatio"] = false,
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
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["use_combat"] = false,
					["role"] = {
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
							["unit"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
							["auranames"] = {
							},
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
							["use_specific_unit"] = true,
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["use_name"] = false,
							["unevent"] = "auto",
							["name"] = "",
							["subeventPrefix"] = "SPELL",
							["check"] = "event",
							["custom_type"] = "event",
							["class"] = "PRIEST",
							["hostility"] = "friendly",
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
							["class"] = "PRIEST",
							["use_character"] = true,
							["subeventPrefix"] = "SPELL",
							["use_class"] = true,
							["character"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["event"] = "Unit Characteristics",
							["unit"] = "party2",
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
							["use_specific_unit"] = true,
							["use_absorbMode"] = true,
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["event"] = "Unit Characteristics",
							["class"] = "PRIEST",
							["subeventPrefix"] = "SPELL",
							["unit"] = "party3",
						},
						["untrigger"] = {
							["unit"] = "party3",
							["use_specific_unit"] = true,
						},
					}, -- [4]
					{
						["trigger"] = {
							["use_specific_unit"] = true,
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["hostility"] = "friendly",
							["class"] = "PRIEST",
							["use_character"] = true,
							["unit"] = "party4",
							["use_class"] = true,
							["character"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["duration"] = "1",
							["use_absorbMode"] = true,
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
							["use_absorbMode"] = true,
							["duration"] = "1",
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["class"] = "PRIEST",
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["unit"] = "player",
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
						["preset"] = "slidetop",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["type"] = "preset",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
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
				["authorMode"] = true,
				["authorOptions"] = {
				},
				["text2Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["uid"] = "G53cq9A9zti",
				["desaturate"] = false,
				["text1Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["selfPoint"] = "CENTER",
				["zoom"] = 0.3,
				["anchorFrameType"] = "SCREEN",
				["text1"] = "%s",
				["actions"] = {
					["start"] = {
						["message"] = "-> %n <-",
						["do_message"] = true,
						["message_type"] = "YELL",
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
				["useglowColor"] = false,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["justify"] = "LEFT",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["id"] = "ms-noBuff 10",
				["text2Point"] = "CENTER",
				["frameStrata"] = 1,
				["width"] = 35,
				["automaticWidth"] = "Auto",
				["text1Point"] = "BOTTOMRIGHT",
				["inverse"] = false,
				["text2"] = "%p",
				["text2Font"] = "Friz Quadrata TT",
				["conditions"] = {
				},
				["tocversion"] = 11302,
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
					["finish"] = {
					},
					["init"] = {
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
						["preset"] = "slidetop",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["type"] = "preset",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
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
				["text2"] = "%p",
				["authorMode"] = true,
				["text2Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["config"] = {
				},
				["text1Containment"] = "INSIDE",
				["text1Point"] = "BOTTOMRIGHT",
				["text1Enabled"] = true,
				["automaticWidth"] = "Auto",
				["width"] = 35,
				["text1"] = "%s",
				["zoom"] = 0.3,
				["text1Font"] = "Friz Quadrata TT",
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["justify"] = "LEFT",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["id"] = "Zs-noBuff 10",
				["text2Point"] = "CENTER",
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["icon"] = true,
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
							["unit"] = "player",
							["useExactSpellId"] = true,
							["subeventPrefix"] = "SPELL",
							["auranames"] = {
							},
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
							["class"] = "WARRIOR",
							["use_name"] = false,
							["unevent"] = "auto",
							["name"] = "",
							["subeventPrefix"] = "SPELL",
							["check"] = "event",
							["custom_type"] = "event",
							["use_unit"] = true,
							["hostility"] = "friendly",
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
							["class"] = "WARRIOR",
							["use_character"] = true,
							["unit"] = "party2",
							["use_class"] = true,
							["character"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["event"] = "Unit Characteristics",
							["subeventPrefix"] = "SPELL",
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
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["event"] = "Unit Characteristics",
							["subeventPrefix"] = "SPELL",
							["use_specific_unit"] = true,
							["use_absorbMode"] = true,
						},
						["untrigger"] = {
							["use_specific_unit"] = true,
							["unit"] = "party3",
						},
					}, -- [4]
					{
						["trigger"] = {
							["use_specific_unit"] = true,
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["hostility"] = "friendly",
							["duration"] = "1",
							["use_character"] = true,
							["unit"] = "party4",
							["use_class"] = true,
							["character"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["event"] = "Unit Characteristics",
							["subeventPrefix"] = "SPELL",
							["use_absorbMode"] = true,
							["class"] = "WARRIOR",
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
							["use_absorbMode"] = true,
							["class"] = "WARRIOR",
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["duration"] = "1",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["event"] = "Unit Characteristics",
							["subeventPrefix"] = "SPELL",
							["unit"] = "player",
						},
						["untrigger"] = {
						},
					}, -- [6]
					["disjunctive"] = "custom",
					["customTriggerLogic"] = "function(trigger)\n    return trigger[1] and (trigger[2] or trigger[3] or trigger[4] or trigger[5] or trigger[6]);\nend",
					["activeTriggerMode"] = -10,
				},
				["inverse"] = false,
				["authorOptions"] = {
				},
				["wordWrap"] = "WordWrap",
				["conditions"] = {
				},
				["tocversion"] = 11302,
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
					["finish"] = {
					},
					["init"] = {
						["custom"] = "\n\n",
						["do_custom"] = false,
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
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
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
						["duration"] = "1",
						["colorR"] = 0,
						["use_translate"] = true,
						["use_alpha"] = true,
						["duration_type"] = "seconds",
						["type"] = "preset",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["preset"] = "slidetop",
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["use_color"] = true,
						["alpha"] = 0,
						["scaleType"] = "pulse",
						["y"] = 0,
						["colorType"] = "straightHSV",
						["x"] = 0,
						["scaley"] = 1,
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
							["matchesShowOn"] = "showOnActive",
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
							["type"] = "aura2",
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
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_alive"] = true,
							["subeventPrefix"] = "SPELL",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["activeTriggerMode"] = 1,
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["keepAspectRatio"] = false,
				["icon"] = true,
				["authorOptions"] = {
					{
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["type"] = "description",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["regionType"] = "icon",
				["uid"] = "PKH)ncuThwv",
				["width"] = 38,
				["glowYOffset"] = 0,
				["alpha"] = 1,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["xOffset"] = 0,
				["glowScale"] = 1,
				["zoom"] = 0,
				["cooldownTextDisabled"] = false,
				["auto"] = true,
				["tocversion"] = 11302,
				["id"] = "正义圣印-Buff",
				["progressPrecision"] = 0,
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["useTooltip"] = true,
				["config"] = {
				},
				["inverse"] = false,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["cooldownEdge"] = true,
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
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
					["finish"] = {
						["do_message"] = false,
						["message_type"] = "SAY",
					},
					["init"] = {
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
							["subeventPrefix"] = "SPELL",
							["custom_type"] = "status",
							["subeventSuffix"] = "_CAST_START",
							["percenthealth"] = "20",
							["event"] = "Health",
							["unevent"] = "auto",
							["use_absorbMode"] = true,
							["use_unit"] = true,
							["events"] = "",
							["spellIds"] = {
							},
							["check"] = "event",
							["use_percenthealth"] = true,
							["percenthealth_operator"] = "<=",
							["unit"] = "player",
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
				["wordWrap"] = "WordWrap",
				["url"] = "https://wago.io/pQukwVj27/1",
				["justify"] = "LEFT",
				["tocversion"] = 11302,
				["id"] = "99喊话  到20%血时 9",
				["fixedWidth"] = 200,
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
				["uid"] = "bVPFjtfMg9e",
				["semver"] = "1.0.20",
				["authorOptions"] = {
					{
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["type"] = "description",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["conditions"] = {
				},
				["xOffset"] = 0,
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
							["use_power"] = true,
							["type"] = "status",
							["use_health"] = true,
							["power"] = "1",
							["power_operator"] = ">",
							["event"] = "Power",
							["use_requirePowerType"] = false,
							["use_percentpower"] = false,
							["health_operator"] = ">",
							["health"] = "1",
							["spellIds"] = {
							},
							["unevent"] = "auto",
							["subeventSuffix"] = "_CAST_START",
							["names"] = {
							},
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
							["unevent"] = "auto",
							["use_alive"] = true,
							["use_unit"] = true,
							["subeventPrefix"] = "SPELL",
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
						["preset"] = "slidetop",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
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
						["text_shadowYOffset"] = -1,
						["text_fontSize"] = 12,
						["anchorXOffset"] = 0,
						["text_fontType"] = "None",
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
				["sparkOffsetY"] = 0,
				["actions"] = {
					["start"] = {
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
				["color"] = {
				},
				["backgroundColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					0.5, -- [4]
				},
				["authorMode"] = true,
				["smoothProgress"] = true,
				["useAdjustededMin"] = false,
				["regionType"] = "aurabar",
				["config"] = {
				},
				["uid"] = "SrzEFc67St1",
				["icon_side"] = "RIGHT",
				["sparkTexture"] = "XPBarAnim-OrangeSpark",
				["anchorFrameType"] = "SCREEN",
				["sparkHeight"] = 10,
				["texture"] = "Blizzard",
				["frameStrata"] = 1,
				["zoom"] = 0,
				["spark"] = true,
				["tocversion"] = 11302,
				["id"] = "MP 6",
				["auto"] = true,
				["alpha"] = 1,
				["width"] = 14,
				["sparkHidden"] = "NEVER",
				["sparkColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["inverse"] = false,
				["selfPoint"] = "CENTER",
				["orientation"] = "VERTICAL_INVERSE",
				["conditions"] = {
				},
				["xOffset"] = -2,
				["authorOptions"] = {
					{
						["text"] = "\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-",
						["type"] = "description",
						["fontSize"] = "medium",
						["width"] = 1,
					}, -- [1]
				},
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
						["text_fontType"] = "OUTLINE",
						["text_visible"] = true,
						["text_anchorPoint"] = "CENTER",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["text_fontSize"] = 24,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
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
						["duration_type"] = "seconds",
						["use_translate"] = true,
						["use_scale"] = true,
						["scaleType"] = "pulse",
						["type"] = "preset",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["translateType"] = "bounce",
						["y"] = 0,
						["colorType"] = "straightHSV",
						["x"] = 0,
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["duration"] = "1",
						["colorA"] = 1,
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["actions"] = {
					["start"] = {
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
				["authorOptions"] = {
					{
						["text"] = "\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-",
						["type"] = "description",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
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
							["names"] = {
							},
							["use_unit"] = true,
							["hand"] = "ranged",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
							["hand"] = "ranged",
						},
					}, -- [1]
					["activeTriggerMode"] = 1,
				},
				["regionType"] = "icon",
				["progressPrecision"] = 0,
				["uid"] = "ElK0(gA)67y",
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["glowYOffset"] = 0,
				["frameStrata"] = 1,
				["width"] = 52,
				["zoom"] = 0,
				["tocversion"] = 11302,
				["cooldownTextDisabled"] = true,
				["auto"] = true,
				["glowScale"] = 1,
				["id"] = "施放中 7",
				["keepAspectRatio"] = false,
				["alpha"] = 1,
				["anchorFrameType"] = "SCREEN",
				["xOffset"] = 0,
				["config"] = {
				},
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
				["cooldownEdge"] = true,
				["conditions"] = {
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
					["finish"] = {
					},
					["init"] = {
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
							["type"] = "status",
							["use_remaining"] = false,
							["unevent"] = "auto",
							["subeventSuffix"] = "_CAST_START",
							["unit"] = "target",
							["matchesShowOn"] = "showAlways",
							["event"] = "Cooldown Progress (Spell)",
							["useName"] = true,
							["realSpellName"] = "Judgement",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["spellName"] = 20271,
							["use_genericShowOn"] = true,
							["names"] = {
							},
							["use_track"] = true,
							["use_unit"] = true,
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
							["use_unit"] = true,
							["subeventPrefix"] = "SPELL",
							["unevent"] = "auto",
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
				["glowXOffset"] = 0,
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
				["useglowColor"] = false,
				["uid"] = "b)x2CoRZ7tp",
				["regionType"] = "icon",
				["width"] = 49,
				["glowYOffset"] = 0,
				["alpha"] = 1,
				["selfPoint"] = "CENTER",
				["progressPrecision"] = 0,
				["tocversion"] = 11302,
				["auto"] = false,
				["zoom"] = 0.3,
				["cooldownTextDisabled"] = true,
				["semver"] = "1.0.7",
				["glowScale"] = 1,
				["id"] = "Paladin - Judgement",
				["icon"] = true,
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["authorOptions"] = {
				},
				["config"] = {
				},
				["inverse"] = false,
				["parent"] = "Paladin 2.0",
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["displayIcon"] = 135959,
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
				["glowFrequency"] = 0.25,
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
				["keepAspectRatio"] = false,
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["actions"] = {
					["start"] = {
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
				["uid"] = "75DF4O2TOMv",
				["width"] = 49,
				["regionType"] = "icon",
				["glowYOffset"] = 0,
				["frameStrata"] = 1,
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
							["spellName"] = 20922,
							["unevent"] = "auto",
							["subeventSuffix"] = "_CAST_START",
							["unit"] = "player",
							["event"] = "Cooldown Progress (Spell)",
							["useName"] = true,
							["realSpellName"] = "Consecration",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["names"] = {
							},
							["use_genericShowOn"] = true,
							["subeventPrefix"] = "SPELL",
							["use_track"] = true,
							["duration"] = "1",
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
							["use_unit"] = true,
							["subeventPrefix"] = "SPELL",
							["unevent"] = "auto",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["progressPrecision"] = 0,
				["tocversion"] = 11302,
				["useGlowColor"] = true,
				["zoom"] = 0.3,
				["auto"] = false,
				["cooldownTextDisabled"] = true,
				["semver"] = "1.0.7",
				["glowScale"] = 1,
				["id"] = "Paladin - Consecration",
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
				["alpha"] = 1,
				["anchorFrameType"] = "SCREEN",
				["glowLength"] = 10,
				["config"] = {
				},
				["inverse"] = false,
				["xOffset"] = 0,
				["parent"] = "Paladin 2.0",
				["displayIcon"] = 135926,
				["cooldown"] = true,
				["glowBorder"] = false,
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
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["type"] = "description",
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
						["colorA"] = 1,
						["scalex"] = 1,
						["use_translate"] = true,
						["use_alpha"] = true,
						["translateType"] = "bounce",
						["type"] = "preset",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["preset"] = "slidetop",
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["scaleType"] = "pulse",
						["y"] = 0,
						["x"] = 0,
						["colorType"] = "straightHSV",
						["use_color"] = true,
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["use_scale"] = true,
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
					["finish"] = {
					},
					["init"] = {
						["custom"] = "\n\n",
						["do_custom"] = false,
					},
				},
				["url"] = "https://wago.io/pQukwVj27/1",
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["useTooltip"] = true,
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
							["duration"] = "1",
							["subeventSuffix"] = "_CAST_START",
							["event"] = "Cooldown Progress (Spell)",
							["subeventPrefix"] = "SPELL",
							["realSpellName"] = "正义圣印",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["unit"] = "player",
							["hand"] = "main",
							["spellName"] = 21084,
							["use_track"] = true,
							["names"] = {
							},
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
							["unevent"] = "auto",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
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
							["use_unit"] = true,
							["subeventPrefix"] = "SPELL",
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
							["health_operator"] = ">",
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
							["use_unit"] = true,
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
					{
						["trigger"] = {
							["type"] = "aura2",
							["unevent"] = "auto",
							["duration"] = "1",
							["event"] = "Health",
							["subeventPrefix"] = "SPELL",
							["ownOnly"] = true,
							["useName"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["unit"] = "player",
							["auranames"] = {
								"正义圣印", -- [1]
							},
							["matchesShowOn"] = "showOnMissing",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [6]
					["activeTriggerMode"] = 1,
				},
				["xOffset"] = 0,
				["regionType"] = "icon",
				["uid"] = "OYANmZnGZj)",
				["glowLength"] = 10,
				["glowYOffset"] = 0,
				["frameStrata"] = 1,
				["selfPoint"] = "CENTER",
				["progressPrecision"] = 0,
				["tocversion"] = 11302,
				["zoom"] = 0,
				["cooldownTextDisabled"] = true,
				["auto"] = true,
				["glowScale"] = 1,
				["id"] = "正义圣印",
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["alpha"] = 1,
				["width"] = 38,
				["anchorFrameType"] = "SCREEN",
				["config"] = {
				},
				["inverse"] = true,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = true,
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spellknown"] = 21084,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["keepAspectRatio"] = false,
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
					["finish"] = {
					},
					["init"] = {
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
							["subeventPrefix"] = "SPELL",
							["unevent"] = "auto",
							["events"] = "PLAYER_ENTERING_WORLD, UNIT_SPELLCAST_SUCCEEDED, UNIT_MAXPOWER, CURRENT_SPELL_CAST_CHANGED",
							["custom"] = "function(a, e, t)\n    local currentMana = UnitPower(\"player\" , 0)\n    if e == \"UNIT_SPELLCAST_SUCCEEDED\" and currentMana < aura_env.lastMana and currentMana < UnitPowerMax(\"player\", 0) then\n        aura_env.lastMana = currentMana\n        local duration = 5\n        a[\"\"] = {\n            show = true,\n            changed = true,\n            duration = duration,\n            expirationTime = GetTime() + duration,\n            progressType = \"timed\",\n            autoHide = true\n        }   \n        return true\n    end\n    aura_env.lastMana = currentMana\n    return false\nend",
							["unit"] = "player",
							["check"] = "event",
							["spellIds"] = {
							},
							["custom_type"] = "stateupdate",
							["names"] = {
							},
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
						["text_anchorYOffset"] = 2,
						["text_fontSize"] = 16,
						["anchorXOffset"] = 0,
						["text_visible"] = true,
					}, -- [2]
				},
				["height"] = 38,
				["authorOptions"] = {
					{
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["type"] = "description",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
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
				["internalVersion"] = 24,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["backgroundColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					0, -- [4]
				},
				["xOffset"] = 0,
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
				["sparkTexture"] = "worldstate-capturebar-spark-yellow",
				["icon_side"] = "RIGHT",
				["anchorFrameType"] = "SCREEN",
				["frameStrata"] = 1,
				["sparkHeight"] = 5,
				["texture"] = "Blizzard",
				["id"] = "5秒回蓝 9",
				["zoom"] = 0,
				["spark"] = true,
				["tocversion"] = 11302,
				["sparkHidden"] = "NEVER",
				["auto"] = true,
				["alpha"] = 1,
				["width"] = 5,
				["authorMode"] = true,
				["config"] = {
				},
				["inverse"] = false,
				["icon"] = false,
				["orientation"] = "VERTICAL_INVERSE",
				["conditions"] = {
				},
				["animation"] = {
					["start"] = {
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_scale"] = true,
						["colorA"] = 1,
						["colorG"] = 0,
						["duration_type"] = "seconds",
						["use_translate"] = true,
						["colorB"] = 0,
						["colorR"] = 0,
						["type"] = "preset",
						["scaleType"] = "pulse",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["translateType"] = "bounce",
						["y"] = 0,
						["x"] = 0,
						["colorType"] = "straightHSV",
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["scalex"] = 1,
						["duration"] = "1",
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["type"] = "preset",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
					},
				},
				["sparkOffsetY"] = 0,
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
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["use_combat"] = false,
					["role"] = {
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
							["unit"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
							["auranames"] = {
							},
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
							["class"] = "MAGE",
							["use_name"] = false,
							["unevent"] = "auto",
							["name"] = "",
							["subeventPrefix"] = "SPELL",
							["check"] = "event",
							["custom_type"] = "event",
							["use_unit"] = true,
							["unit"] = "party1",
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
							["class"] = "MAGE",
							["use_character"] = true,
							["subeventPrefix"] = "SPELL",
							["use_class"] = true,
							["character"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["event"] = "Unit Characteristics",
							["unit"] = "party2",
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
							["use_specific_unit"] = true,
							["duration"] = "1",
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["event"] = "Unit Characteristics",
							["class"] = "MAGE",
							["subeventPrefix"] = "SPELL",
							["unit"] = "party3",
						},
						["untrigger"] = {
							["unit"] = "party3",
							["use_specific_unit"] = true,
						},
					}, -- [4]
					{
						["trigger"] = {
							["use_specific_unit"] = true,
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["hostility"] = "friendly",
							["class"] = "MAGE",
							["use_character"] = true,
							["unit"] = "party4",
							["use_class"] = true,
							["character"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["use_absorbMode"] = true,
							["duration"] = "1",
						},
						["untrigger"] = {
							["unit"] = "party4",
							["use_specific_unit"] = true,
						},
					}, -- [5]
					{
						["trigger"] = {
							["use_absorbMode"] = true,
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["unit"] = "player",
							["duration"] = "1",
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["use_name"] = false,
							["event"] = "Unit Characteristics",
							["class"] = "MAGE",
							["subeventPrefix"] = "SPELL",
							["use_unit"] = true,
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
						["preset"] = "slidetop",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["type"] = "preset",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
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
				["authorMode"] = true,
				["authorOptions"] = {
				},
				["text2Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["uid"] = ")a(k2ZGYOat",
				["wordWrap"] = "WordWrap",
				["alpha"] = 1,
				["text2"] = "%p",
				["actions"] = {
					["start"] = {
						["message"] = "-> %n <-",
						["do_message"] = true,
						["message_type"] = "YELL",
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
				["anchorFrameType"] = "SCREEN",
				["text1"] = "%s",
				["text1Containment"] = "INSIDE",
				["zoom"] = 0.3,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["justify"] = "LEFT",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["id"] = "FS-noBuff 10",
				["text2Point"] = "CENTER",
				["frameStrata"] = 1,
				["width"] = 35,
				["useglowColor"] = false,
				["text1Point"] = "BOTTOMRIGHT",
				["inverse"] = false,
				["text2Font"] = "Friz Quadrata TT",
				["text1Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["conditions"] = {
				},
				["tocversion"] = 11302,
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
				["backgroundOffset"] = 2,
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
				["slant"] = 0,
				["conditions"] = {
				},
				["sameTexture"] = true,
				["url"] = "https://wago.io/eEPLkEuIv/1",
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
							["showClones"] = true,
							["rem"] = "20",
							["auranames"] = {
								"25780", -- [1]
							},
							["ownOnly"] = true,
							["event"] = "Health",
							["unit"] = "player",
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["spellIds"] = {
							},
							["useName"] = true,
							["remOperator"] = "<=",
							["type"] = "aura2",
							["names"] = {
							},
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
							["subeventSuffix"] = "_CAST_START",
							["type"] = "aura2",
							["ownOnly"] = true,
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
				["anchorPoint"] = "CENTER",
				["rotation"] = 0,
				["config"] = {
				},
				["desaturate"] = false,
				["discrete_rotation"] = 0,
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
				["selfPoint"] = "RIGHT",
				["useAdjustededMax"] = true,
				["fontSize"] = 12,
				["anchorFrameType"] = "SCREEN",
				["foregroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura33",
				["frameStrata"] = 1,
				["crop_y"] = 0.41,
				["mirror"] = true,
				["useAdjustededMin"] = true,
				["regionType"] = "progresstexture",
				["xOffset"] = 305.71264648438,
				["blendMode"] = "ADD",
				["tocversion"] = 11302,
				["smoothProgress"] = true,
				["slantFirst"] = false,
				["anchorFrameParent"] = false,
				["texture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura2",
				["desaturateForeground"] = false,
				["startAngle"] = 0,
				["slantMode"] = "INSIDE",
				["compress"] = false,
				["id"] = "Righteous fury",
				["textureWrapMode"] = "CLAMP",
				["alpha"] = 1,
				["width"] = 54.422419642543,
				["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
				["uid"] = "YrFx8T5DIzA",
				["inverse"] = false,
				["backgroundColor"] = {
					0.44313725490196, -- [1]
					0, -- [2]
					0.011764705882353, -- [3]
					0.5, -- [4]
				},
				["orientation"] = "VERTICAL",
				["crop_x"] = 1.22,
				["color"] = {
				},
				["slanted"] = true,
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
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["type"] = "description",
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
					["finish"] = {
					},
					["init"] = {
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
						["use_scale"] = true,
						["use_translate"] = true,
						["colorR"] = 0,
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["type"] = "preset",
						["scaleType"] = "pulse",
						["preset"] = "slidetop",
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["scalex"] = 1,
						["y"] = 0,
						["colorType"] = "straightHSV",
						["x"] = 0,
						["use_color"] = true,
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["duration"] = "1",
						["colorA"] = 1,
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["type"] = "preset",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
					},
				},
				["glowLines"] = 8,
				["glowXOffset"] = 0,
				["glowFrequency"] = 0.25,
				["conditions"] = {
				},
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
							["unevent"] = "auto",
							["subeventPrefix"] = "SPELL",
							["event"] = "Unit Characteristics",
							["useName"] = true,
							["realSpellName"] = 0,
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["spellName"] = 0,
							["use_unit"] = true,
							["use_charges"] = true,
							["names"] = {
							},
							["matchesShowOn"] = "showOnActive",
						},
						["untrigger"] = {
							["unit"] = "target",
						},
					}, -- [1]
					{
						["trigger"] = {
							["type"] = "status",
							["itemName"] = 0,
							["subeventSuffix"] = "_CAST_START",
							["unevent"] = "auto",
							["use_itemName"] = true,
							["use_genericShowOn"] = true,
							["genericShowOn"] = "showOnReady",
							["unit"] = "player",
							["realSpellName"] = "被遗忘者的意志",
							["use_spellName"] = true,
							["use_unit"] = true,
							["event"] = "Cooldown Progress (Spell)",
							["duration"] = "1",
							["subeventPrefix"] = "SPELL",
							["use_track"] = true,
							["spellName"] = 7744,
						},
						["untrigger"] = {
							["genericShowOn"] = "showOnReady",
						},
					}, -- [2]
					["activeTriggerMode"] = 1,
				},
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["glowLength"] = 10,
				["config"] = {
				},
				["regionType"] = "icon",
				["anchorFrameType"] = "SCREEN",
				["width"] = 38,
				["frameStrata"] = 1,
				["authorMode"] = true,
				["internalVersion"] = 24,
				["glowScale"] = 1,
				["icon"] = true,
				["zoom"] = 0,
				["cooldownTextDisabled"] = true,
				["auto"] = false,
				["tocversion"] = 11302,
				["id"] = "被遗忘者的意志  8",
				["cooldownEdge"] = true,
				["alpha"] = 1,
				["glowYOffset"] = 0,
				["xOffset"] = 0,
				["uid"] = "R8aK6ttRBtP",
				["inverse"] = true,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = false,
					["use_race"] = true,
					["race"] = {
						["single"] = "Scourge",
					},
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
					["spellknown"] = 20589,
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
				["displayIcon"] = 136187,
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
					["finish"] = {
					},
					["init"] = {
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
				["glowFrequency"] = 0.25,
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
							["subeventPrefix"] = "SPELL",
							["type"] = "status",
							["unevent"] = "auto",
							["subeventSuffix"] = "_CAST_START",
							["ownOnly"] = true,
							["spellName"] = 1022,
							["event"] = "Cooldown Progress (Spell)",
							["useName"] = true,
							["realSpellName"] = "Blessing of Protection",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["names"] = {
							},
							["use_unit"] = true,
							["duration"] = "1",
							["use_track"] = true,
							["matchesShowOn"] = "showAlways",
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
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["glowLength"] = 10,
				["authorOptions"] = {
				},
				["uid"] = "Af9UYobj)qs",
				["regionType"] = "icon",
				["parent"] = "Paladin 2.0",
				["anchorFrameType"] = "SCREEN",
				["alpha"] = 1,
				["width"] = 35,
				["progressPrecision"] = 0,
				["tocversion"] = 11302,
				["auto"] = false,
				["zoom"] = 0.3,
				["cooldownTextDisabled"] = true,
				["semver"] = "1.0.7",
				["glowScale"] = 1,
				["id"] = "Paladin - Blessing of Protection",
				["keepAspectRatio"] = false,
				["frameStrata"] = 1,
				["glowYOffset"] = 0,
				["icon"] = true,
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
					["use_never"] = false,
					["use_race"] = false,
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["PALADIN"] = true,
							["ROGUE"] = true,
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["displayIcon"] = 135964,
				["cooldown"] = true,
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
				["slanted"] = true,
				["user_x"] = 0,
				["parent"] = "Paladin Protection",
				["adjustedMax"] = 10,
				["adjustedMin"] = 2,
				["yOffset"] = -24.333435058594,
				["anchorPoint"] = "CENTER",
				["desaturateBackground"] = false,
				["desaturateForeground"] = false,
				["crop_x"] = 0.41,
				["sameTexture"] = true,
				["url"] = "https://wago.io/eEPLkEuIv/1",
				["backgroundColor"] = {
					0.44313725490196, -- [1]
					0, -- [2]
					0.011764705882353, -- [3]
					0.5, -- [4]
				},
				["slant"] = 0,
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
						["preset"] = "fade",
						["duration_type"] = "seconds",
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
						["colorB"] = 0.29019607843137,
						["scaley"] = 1,
						["alpha"] = 0.6,
						["duration"] = "1",
						["y"] = 0,
						["x"] = 0,
						["preset"] = "alphaPulse",
						["use_color"] = false,
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\n    end\n  ",
						["rotate"] = 0,
						["colorType"] = "straightColor",
						["scalex"] = 1,
					},
					["finish"] = {
						["type"] = "none",
						["preset"] = "shrink",
						["duration_type"] = "seconds",
					},
				},
				["authorOptions"] = {
				},
				["crop_y"] = 0.41,
				["config"] = {
				},
				["desaturate"] = false,
				["discrete_rotation"] = 0,
				["font"] = "Friz Quadrata TT",
				["version"] = 1,
				["subRegions"] = {
				},
				["height"] = 87.886688232422,
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
				["foregroundTexture"] = "165639",
				["useAdjustededMax"] = true,
				["fontSize"] = 12,
				["width"] = 88.77564239502,
				["startAngle"] = 0,
				["frameStrata"] = 1,
				["rotation"] = 0,
				["smoothProgress"] = true,
				["useAdjustededMin"] = true,
				["regionType"] = "progresstexture",
				["actions"] = {
					["start"] = {
						["do_glow"] = false,
						["sound_kit_id"] = "911",
						["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\chimes.ogg",
						["do_sound"] = false,
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
				["blendMode"] = "ADD",
				["compress"] = false,
				["textureWrapMode"] = "CLAMP",
				["slantFirst"] = false,
				["anchorFrameParent"] = false,
				["texture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura2",
				["xOffset"] = 313.71264648438,
				["selfPoint"] = "RIGHT",
				["slantMode"] = "INSIDE",
				["tocversion"] = 11302,
				["id"] = "Blessing of wisdom",
				["mirror"] = true,
				["alpha"] = 1,
				["anchorFrameType"] = "SCREEN",
				["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
				["uid"] = "Cf)OpccDm3E",
				["inverse"] = false,
				["color"] = {
				},
				["orientation"] = "VERTICAL",
				["conditions"] = {
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
							["subeventSuffix"] = "_CAST_START",
							["spellIds"] = {
							},
							["useName"] = true,
							["remOperator"] = "<=",
							["rem"] = "20",
							["subeventPrefix"] = "SPELL",
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
							["subeventSuffix"] = "_CAST_START",
							["useName"] = true,
							["ownOnly"] = true,
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["backgroundOffset"] = 2,
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
							["subeventPrefix"] = "SPELL",
							["use_remaining"] = false,
							["subeventSuffix"] = "_CAST_START",
							["unevent"] = "timed",
							["names"] = {
							},
							["duration"] = "1",
							["event"] = "Chat Message",
							["use_unit"] = true,
							["realSpellName"] = "Seal of Righteousness",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["useName"] = true,
							["spellName"] = 20293,
							["use_genericShowOn"] = true,
							["use_track"] = true,
							["type"] = "aura2",
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
				["animation"] = {
					["start"] = {
						["type"] = "preset",
						["preset"] = "fade",
						["duration_type"] = "seconds",
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
						["duration_type"] = "relative",
						["scaley"] = 1,
						["rotate"] = 0,
						["duration"] = "5",
						["colorA"] = 1,
					},
					["finish"] = {
						["type"] = "none",
						["preset"] = "grow",
						["duration_type"] = "seconds",
					},
				},
				["backgroundOffset"] = 2,
				["slant"] = 0,
				["conditions"] = {
				},
				["authorOptions"] = {
				},
				["rotation"] = 180,
				["font"] = "Friz Quadrata TT",
				["version"] = 1,
				["subRegions"] = {
				},
				["height"] = 52.552562713623,
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
				["crop_y"] = 0.41,
				["foregroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura8",
				["useAdjustededMax"] = true,
				["textureWrapMode"] = "CLAMP",
				["uid"] = "7RE5889xJbY",
				["startAngle"] = 0,
				["backgroundTexture"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Auras\\Aura3",
				["anchorFrameType"] = "SCREEN",
				["mirror"] = false,
				["useAdjustededMin"] = true,
				["regionType"] = "progresstexture",
				["frameStrata"] = 1,
				["blendMode"] = "ADD",
				["selfPoint"] = "RIGHT",
				["actions"] = {
					["start"] = {
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
				["slantMode"] = "INSIDE",
				["anchorFrameParent"] = false,
				["compress"] = false,
				["backgroundColor"] = {
					0.44313725490196, -- [1]
					0, -- [2]
					0.011764705882353, -- [3]
					0.5, -- [4]
				},
				["slantFirst"] = false,
				["xOffset"] = 289.85559082031,
				["tocversion"] = 11302,
				["id"] = "Seal of righteousness",
				["anchorPoint"] = "CENTER",
				["alpha"] = 1,
				["width"] = 55.128562927246,
				["smoothProgress"] = true,
				["config"] = {
				},
				["inverse"] = false,
				["fontSize"] = 12,
				["orientation"] = "VERTICAL",
				["crop_x"] = 0.41,
				["parent"] = "Paladin Protection",
				["slanted"] = true,
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
					["finish"] = {
					},
					["init"] = {
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
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["use_combat"] = false,
					["role"] = {
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
						["preset"] = "slidetop",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["type"] = "preset",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
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
				["authorMode"] = true,
				["font"] = "Friz Quadrata TT",
				["text2Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["desaturate"] = false,
				["alpha"] = 1,
				["text1Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["text2Font"] = "Friz Quadrata TT",
				["automaticWidth"] = "Auto",
				["width"] = 35,
				["text1"] = "%s",
				["zoom"] = 0.3,
				["text2"] = "%p",
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["justify"] = "LEFT",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["id"] = "xd1-nobuff 10",
				["text2Point"] = "CENTER",
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["icon"] = true,
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
							["useExactSpellId"] = true,
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["auraspellids"] = {
								"1126", -- [1]
								"5232", -- [2]
								"6756", -- [3]
								"5234", -- [4]
								"8907", -- [5]
								"9884", -- [6]
								"9885", -- [7]
							},
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
							["use_specific_unit"] = true,
							["event"] = "Unit Characteristics",
							["hostility"] = "friendly",
							["use_name"] = false,
							["unevent"] = "auto",
							["name"] = "",
							["subeventPrefix"] = "SPELL",
							["check"] = "event",
							["custom_type"] = "event",
							["duration"] = "1",
							["use_unit"] = true,
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
							["use_specific_unit"] = true,
							["duration"] = "1",
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
							["event"] = "Unit Characteristics",
							["class"] = "DRUID",
							["use_unit"] = true,
							["unit"] = "party2",
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
							["use_specific_unit"] = true,
							["duration"] = "1",
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
							["event"] = "Unit Characteristics",
							["class"] = "DRUID",
							["use_unit"] = true,
							["unit"] = "party3",
						},
						["untrigger"] = {
							["unit"] = "party3",
							["use_specific_unit"] = true,
						},
					}, -- [4]
					{
						["trigger"] = {
							["duration"] = "1",
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["use_specific_unit"] = true,
							["use_absorbMode"] = true,
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
							["event"] = "Unit Characteristics",
							["class"] = "DRUID",
							["use_unit"] = true,
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
							["class"] = "DRUID",
							["use_absorbMode"] = true,
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["duration"] = "1",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["event"] = "Unit Characteristics",
							["subeventPrefix"] = "SPELL",
							["unit"] = "player",
						},
						["untrigger"] = {
						},
					}, -- [6]
					["disjunctive"] = "custom",
					["customTriggerLogic"] = "function(trigger)\n    return trigger[1] and (trigger[2] or trigger[3] or trigger[4] or trigger[5] or trigger[6]);\nend",
					["activeTriggerMode"] = -10,
				},
				["inverse"] = false,
				["wordWrap"] = "WordWrap",
				["xOffset"] = 0,
				["conditions"] = {
				},
				["tocversion"] = 11302,
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
					["finish"] = {
					},
					["init"] = {
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
				["glowFrequency"] = 0.25,
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
							["subeventPrefix"] = "SPELL",
							["type"] = "status",
							["unevent"] = "auto",
							["subeventSuffix"] = "_CAST_START",
							["names"] = {
							},
							["use_unit"] = true,
							["event"] = "Cooldown Progress (Spell)",
							["useName"] = true,
							["realSpellName"] = "Stoneform",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["spellName"] = 20594,
							["ownOnly"] = true,
							["use_genericShowOn"] = true,
							["use_track"] = true,
							["duration"] = "1",
						},
						["untrigger"] = {
							["genericShowOn"] = "showAlways",
						},
					}, -- [1]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
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
							["PRIEST"] = true,
							["SHAMAN"] = true,
							["PALADIN"] = true,
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["keepAspectRatio"] = false,
				["uid"] = "Kj2Cgc0DOKL",
				["regionType"] = "icon",
				["icon"] = true,
				["glowYOffset"] = 0,
				["frameStrata"] = 1,
				["authorOptions"] = {
				},
				["progressPrecision"] = 0,
				["glowScale"] = 1,
				["auto"] = false,
				["zoom"] = 0.3,
				["cooldownTextDisabled"] = true,
				["semver"] = "1.0.7",
				["tocversion"] = 11302,
				["id"] = "Paladin - Stoneskin",
				["width"] = 35,
				["alpha"] = 1,
				["anchorFrameType"] = "SCREEN",
				["xOffset"] = 71,
				["config"] = {
				},
				["inverse"] = false,
				["parent"] = "Paladin 2.0",
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["displayIcon"] = 136225,
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
				["borderEdge"] = "1 Pixel",
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
							["names"] = {
							},
							["subeventPrefix"] = "SPELL",
							["event"] = "Health",
							["unit"] = "player",
						},
						["untrigger"] = {
						},
					}, -- [1]
				},
				["internalVersion"] = 24,
				["borderOffset"] = 4,
				["tocversion"] = 11302,
				["selfPoint"] = "BOTTOMLEFT",
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
				["authorOptions"] = {
				},
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
					["finish"] = {
						["custom"] = "WeakAuras.ScanEvents(\"TICKUPDATE\", true)",
						["do_custom"] = false,
					},
					["init"] = {
						["custom"] = "aura_env.lastMana = UnitPower(\"player\" , 0)",
						["do_custom"] = true,
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
							["unevent"] = "auto",
							["event"] = "Health",
							["custom_type"] = "stateupdate",
							["spellIds"] = {
							},
							["events"] = "UNIT_SPELLCAST_SUCCEEDED:player UNIT_POWER_FREQUENT:player",
							["custom"] = "function(a, e, t)\n    local currentMana = UnitPower(\"player\" , 0)\n    \n    if currentMana >= UnitPowerMax(\"player\", 0) then\n        return false\n    end\n    \n    if e == \"UNIT_POWER_FREQUENT\" and currentMana > aura_env.lastMana then\n        local duration = 2\n        a[\"\"] = {\n            show = true,\n            changed = true,\n            duration = duration,\n            expirationTime = GetTime() + duration,\n            progressType = \"timed\",\n            autoHide = true\n        }\n        aura_env.lastMana = currentMana\n        \n    elseif e == \"UNIT_SPELLCAST_SUCCEEDED\" and currentMana < aura_env.lastMana then\n        local duration = 6.45 -- why?\n        --local duration = 5\n        a[\"\"] = {\n            show = true,\n            changed = true,\n            duration = duration,\n            expirationTime = GetTime() + duration,\n            progressType = \"timed\",\n            autoHide = true\n        }\n        aura_env.lastMana = currentMana\n    end\n    \n    --aura_env.lastMana = currentMana\n    return true\nend",
							["use_sourceUnit"] = true,
							["check"] = "event",
							["unit"] = "player",
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
				["parent"] = "Paladin 2.0",
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
				["backdropInFront"] = false,
				["authorOptions"] = {
				},
				["barColor"] = {
					0, -- [1]
					0.23529411764706, -- [2]
					1, -- [3]
					0, -- [4]
				},
				["desaturate"] = false,
				["progressPrecision"] = 0,
				["version"] = 8,
				["sparkOffsetY"] = 0,
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
						["text_anchorYOffset"] = -10,
						["text_fontSize"] = 20,
						["anchorXOffset"] = 0,
						["text_visible"] = false,
					}, -- [2]
					{
						["border_offset"] = 5,
						["border_anchor"] = "bar",
						["type"] = "subborder",
						["border_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							0.5, -- [4]
						},
						["border_visible"] = false,
						["border_edge"] = "None",
						["border_size"] = 16,
					}, -- [3]
				},
				["height"] = 20,
				["backdropColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					0.5, -- [4]
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
				["useAdjustededMax"] = false,
				["icon"] = false,
				["uid"] = "Zn1irtWqaTG",
				["config"] = {
				},
				["backgroundColor"] = {
					0, -- [1]
					0.22352941176471, -- [2]
					1, -- [3]
					0, -- [4]
				},
				["width"] = 245,
				["smoothProgress"] = false,
				["useAdjustededMin"] = false,
				["regionType"] = "aurabar",
				["borderInFront"] = true,
				["frameStrata"] = 4,
				["icon_side"] = "RIGHT",
				["spark"] = true,
				["id"] = "Paladin - 5Second+ManaRegen",
				["sparkHeight"] = 35,
				["texture"] = "ElvUI Blank",
				["auto"] = true,
				["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
				["semver"] = "1.0.7",
				["tocversion"] = 11302,
				["sparkHidden"] = "FULL",
				["zoom"] = 0,
				["alpha"] = 1,
				["anchorFrameType"] = "SCREEN",
				["borderBackdrop"] = "Blizzard Tooltip",
				["sparkColor"] = {
					0.97254901960784, -- [1]
					0.96078431372549, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["inverse"] = false,
				["color"] = {
				},
				["orientation"] = "HORIZONTAL",
				["conditions"] = {
					{
						["check"] = {
							["trigger"] = 1,
							["op"] = "<",
							["value"] = "5",
							["variable"] = "duration",
						},
						["changes"] = {
							{
								["value"] = true,
								["property"] = "inverse",
							}, -- [1]
						},
					}, -- [1]
				},
				["stickyDuration"] = false,
				["selfPoint"] = "CENTER",
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
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
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
							["subeventSuffix"] = "_CAST_START",
							["unevent"] = "auto",
							["matchesShowOn"] = "showAlways",
							["spellName"] = 498,
							["event"] = "Cooldown Progress (Spell)",
							["useName"] = true,
							["realSpellName"] = "Divine Protection",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["use_unit"] = true,
							["use_genericShowOn"] = true,
							["names"] = {
							},
							["use_track"] = true,
							["subeventPrefix"] = "SPELL",
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
							["use_unit"] = true,
							["subeventPrefix"] = "SPELL",
							["unevent"] = "auto",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
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
				["xOffset"] = 99,
				["regionType"] = "icon",
				["uid"] = "BDQvI8HtAOa",
				["parent"] = "Paladin 2.0",
				["anchorFrameType"] = "SCREEN",
				["frameStrata"] = 1,
				["actions"] = {
					["start"] = {
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
				["zoom"] = 0.3,
				["tocversion"] = 11302,
				["auto"] = false,
				["cooldownTextDisabled"] = true,
				["semver"] = "1.0.7",
				["glowScale"] = 1,
				["id"] = "Paladin - Divine Protection",
				["width"] = 49,
				["alpha"] = 1,
				["glowYOffset"] = 0,
				["cooldownEdge"] = false,
				["config"] = {
				},
				["inverse"] = false,
				["keepAspectRatio"] = false,
				["authorOptions"] = {
				},
				["displayIcon"] = 135954,
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
					["finish"] = {
					},
					["init"] = {
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
							["unit"] = "player",
							["useExactSpellId"] = true,
							["subeventPrefix"] = "SPELL",
							["auranames"] = {
							},
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
							["use_specific_unit"] = true,
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["use_name"] = false,
							["unevent"] = "auto",
							["name"] = "",
							["subeventPrefix"] = "SPELL",
							["check"] = "event",
							["custom_type"] = "event",
							["class"] = "PALADIN",
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
							["class"] = "PALADIN",
							["use_character"] = true,
							["unit"] = "party2",
							["use_class"] = true,
							["character"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["event"] = "Unit Characteristics",
							["subeventPrefix"] = "SPELL",
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
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["event"] = "Unit Characteristics",
							["subeventPrefix"] = "SPELL",
							["use_specific_unit"] = true,
							["duration"] = "1",
						},
						["untrigger"] = {
							["use_specific_unit"] = true,
							["unit"] = "party3",
						},
					}, -- [4]
					{
						["trigger"] = {
							["use_specific_unit"] = true,
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["hostility"] = "friendly",
							["class"] = "PALADIN",
							["use_character"] = true,
							["unit"] = "party4",
							["use_class"] = true,
							["character"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["event"] = "Unit Characteristics",
							["subeventPrefix"] = "SPELL",
							["use_absorbMode"] = true,
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
							["class"] = "PALADIN",
							["duration"] = "1",
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["use_absorbMode"] = true,
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["unit"] = "player",
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
						["preset"] = "slidetop",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["type"] = "preset",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
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
				["text2"] = "%p",
				["automaticWidth"] = "Auto",
				["text2Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["authorMode"] = true,
				["authorOptions"] = {
				},
				["alpha"] = 1,
				["selfPoint"] = "CENTER",
				["icon"] = true,
				["anchorFrameType"] = "SCREEN",
				["text1"] = "%s",
				["text1Containment"] = "INSIDE",
				["useglowColor"] = false,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["justify"] = "LEFT",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["id"] = "zs-noBuff 10",
				["text2Point"] = "CENTER",
				["frameStrata"] = 1,
				["width"] = 35,
				["zoom"] = 0.3,
				["text1Point"] = "BOTTOMRIGHT",
				["inverse"] = false,
				["text2Font"] = "Friz Quadrata TT",
				["text1Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["conditions"] = {
				},
				["tocversion"] = 11302,
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
							["names"] = {
							},
							["subeventPrefix"] = "SPELL",
							["event"] = "Health",
							["unit"] = "player",
						},
						["untrigger"] = {
						},
					}, -- [1]
				},
				["columnSpace"] = 1,
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
				["rotation"] = 0,
				["radius"] = 200,
				["rowSpace"] = 1,
				["constantFactor"] = "RADIUS",
				["selfPoint"] = "LEFT",
				["borderOffset"] = 4,
				["arcLength"] = 360,
				["tocversion"] = 11302,
				["id"] = "Classic Paladin - CD's",
				["frameStrata"] = 1,
				["gridWidth"] = 5,
				["anchorFrameType"] = "SCREEN",
				["config"] = {
				},
				["uid"] = "zA)oQAUgAcu",
				["borderInset"] = 1,
				["sort"] = "none",
				["authorOptions"] = {
				},
				["conditions"] = {
				},
				["gridType"] = "RD",
				["useLimit"] = false,
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
					["finish"] = {
					},
					["init"] = {
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
						["duration_type"] = "seconds",
						["use_translate"] = true,
						["use_scale"] = true,
						["scaleType"] = "pulse",
						["type"] = "preset",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["translateType"] = "bounce",
						["y"] = 0,
						["colorType"] = "straightHSV",
						["x"] = 0,
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["duration"] = "1",
						["colorA"] = 1,
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
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
						["text_fontType"] = "OUTLINE",
						["text_visible"] = true,
						["text_anchorPoint"] = "CENTER",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["text_fontSize"] = 24,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
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
						["text"] = "\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-",
						["type"] = "description",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["selfPoint"] = "CENTER",
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
							["names"] = {
							},
							["use_unit"] = true,
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
							["subeventPrefix"] = "SPELL",
							["use_inverse"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
						},
						["untrigger"] = {
						},
					}, -- [2]
					["activeTriggerMode"] = 1,
				},
				["icon"] = true,
				["regionType"] = "icon",
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["uid"] = "0WRhSUjVEKC",
				["width"] = 52,
				["anchorFrameType"] = "SCREEN",
				["alpha"] = 1,
				["keepAspectRatio"] = false,
				["zoom"] = 0,
				["tocversion"] = 11302,
				["cooldownTextDisabled"] = true,
				["auto"] = true,
				["glowScale"] = 1,
				["id"] = "功击中 副手 8",
				["glowLength"] = 10,
				["frameStrata"] = 1,
				["glowYOffset"] = 0,
				["progressPrecision"] = 0,
				["config"] = {
				},
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
				["cooldownEdge"] = true,
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
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
					["finish"] = {
					},
					["init"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "status",
							["event"] = "Swing Timer",
							["unevent"] = "auto",
							["unit"] = "player",
							["duration"] = "1",
							["genericShowOn"] = "showOnActive",
							["names"] = {
							},
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
							["spellIds"] = {
							},
							["use_hand"] = true,
							["use_absorbMode"] = true,
							["use_unit"] = true,
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
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["event"] = "Conditions",
							["duration"] = "1",
							["subeventPrefix"] = "SPELL",
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
				["backdropInFront"] = false,
				["fontFlags"] = "OUTLINE",
				["barColor"] = {
					1, -- [1]
					0.50196078431373, -- [2]
					0.95294117647059, -- [3]
					1, -- [4]
				},
				["desaturate"] = false,
				["xOffset"] = 0,
				["version"] = 8,
				["sparkOffsetY"] = 0,
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
						["text_fontType"] = "None",
						["text_visible"] = false,
						["text_anchorPoint"] = "INNER_RIGHT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["text_fontSize"] = 12,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
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
						["text_fontType"] = "None",
						["text_visible"] = false,
						["text_anchorPoint"] = "INNER_LEFT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["text_fontSize"] = 12,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
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
						["text_fontType"] = "None",
						["text_visible"] = false,
						["text_anchorPoint"] = "ICON_CENTER",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["text_fontSize"] = 12,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
					}, -- [4]
					{
						["border_offset"] = 1,
						["border_anchor"] = "bar",
						["type"] = "subborder",
						["border_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["border_visible"] = true,
						["border_edge"] = "1 Pixel",
						["border_size"] = 1,
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
					["talent2"] = {
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
					["difficulty"] = {
						["multi"] = {
						},
					},
					["spec"] = {
						["single"] = 1,
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
				["sparkOffsetX"] = 0,
				["width"] = 244.99998474121,
				["frameStrata"] = 1,
				["useAdjustededMin"] = false,
				["regionType"] = "aurabar",
				["borderInFront"] = true,
				["spark"] = false,
				["icon_side"] = "RIGHT",
				["id"] = "Paladin - Swing Timer",
				["zoom"] = 0,
				["sparkHeight"] = 30,
				["texture"] = "ElvUI Blank",
				["auto"] = true,
				["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
				["semver"] = "1.0.7",
				["tocversion"] = 11302,
				["sparkHidden"] = "NEVER",
				["backdropColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["alpha"] = 1,
				["anchorFrameType"] = "SCREEN",
				["backgroundColor"] = {
					1, -- [1]
					0.50196078431373, -- [2]
					0.95294117647059, -- [3]
					0.60000002384186, -- [4]
				},
				["uid"] = "We3V)BlFpGH",
				["inverse"] = false,
				["sparkDesature"] = false,
				["orientation"] = "HORIZONTAL",
				["conditions"] = {
				},
				["icon"] = false,
				["stickyDuration"] = false,
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
						["duration_type"] = "seconds",
						["use_translate"] = true,
						["colorB"] = 0,
						["colorR"] = 0,
						["type"] = "preset",
						["scaleType"] = "pulse",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["translateType"] = "bounce",
						["y"] = 0,
						["x"] = 0,
						["colorType"] = "straightHSV",
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["scalex"] = 1,
						["duration"] = "1",
					},
					["main"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "shake",
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
				["selfPoint"] = "CENTER",
				["glowLines"] = 8,
				["internalVersion"] = 24,
				["authorMode"] = true,
				["conditions"] = {
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
							["spellName"] = 0,
							["useName"] = true,
							["duration"] = "3",
							["unevent"] = "timed",
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["event"] = "Combat Events",
							["eventtype"] = "PLAYER_REGEN_ENABLED",
							["realSpellName"] = 0,
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["use_eventtype"] = true,
							["type"] = "event",
							["names"] = {
							},
							["use_charges"] = true,
							["unit"] = "player",
						},
						["untrigger"] = {
							["unit"] = "target",
							["eventtype"] = "PLAYER_REGEN_ENABLED",
						},
					}, -- [1]
					["activeTriggerMode"] = 1,
				},
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = false,
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
					["spellknown"] = 1459,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["keepAspectRatio"] = false,
				["uid"] = "1YbIxpD4wQ6",
				["regionType"] = "icon",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["anchorFrameType"] = "SCREEN",
				["frameStrata"] = 1,
				["glowFrequency"] = 0.25,
				["width"] = 38,
				["tocversion"] = 11302,
				["actions"] = {
					["start"] = {
						["do_glow"] = false,
						["do_sound"] = true,
						["message_type"] = "SAY",
						["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\sonar.ogg",
						["do_message"] = false,
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
				["zoom"] = 0,
				["cooldownTextDisabled"] = true,
				["auto"] = false,
				["glowScale"] = 1,
				["id"] = "脱战 9",
				["authorOptions"] = {
					{
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["type"] = "description",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["alpha"] = 1,
				["glowYOffset"] = 0,
				["cooldownEdge"] = true,
				["config"] = {
				},
				["inverse"] = true,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["glowLength"] = 10,
				["displayIcon"] = 132932,
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
							["unevent"] = "auto",
							["type"] = "status",
							["use_health"] = true,
							["subeventSuffix"] = "_CAST_START",
							["power_operator"] = ">",
							["unit"] = "player",
							["event"] = "Power",
							["use_percentpower"] = false,
							["health_operator"] = ">",
							["spellIds"] = {
							},
							["health"] = "1",
							["power"] = "1",
							["use_requirePowerType"] = false,
							["use_power"] = true,
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
						["duration_type"] = "seconds",
						["use_translate"] = true,
						["duration"] = "1",
						["scaleType"] = "pulse",
						["type"] = "preset",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["translateType"] = "bounce",
						["y"] = 0,
						["colorType"] = "straightHSV",
						["x"] = 0,
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["use_scale"] = true,
						["colorA"] = 1,
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["type"] = "preset",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
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
						["text_fontSize"] = 18,
						["text_visible"] = true,
						["text_anchorPoint"] = "SPARK",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontType"] = "None",
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
				["xOffset"] = -2,
				["selfPoint"] = "CENTER",
				["actions"] = {
					["start"] = {
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
				["authorOptions"] = {
					{
						["text"] = "\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-",
						["type"] = "description",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["smoothProgress"] = true,
				["useAdjustededMin"] = false,
				["regionType"] = "aurabar",
				["config"] = {
				},
				["zoom"] = 0,
				["icon_side"] = "RIGHT",
				["sparkColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["auto"] = true,
				["sparkHeight"] = 10,
				["texture"] = "Blizzard",
				["anchorFrameType"] = "SCREEN",
				["sparkTexture"] = "XPBarAnim-OrangeSpark",
				["spark"] = true,
				["tocversion"] = 11302,
				["sparkHidden"] = "NEVER",
				["frameStrata"] = 1,
				["alpha"] = 1,
				["width"] = 14,
				["id"] = "点数 4",
				["uid"] = "hf46CiBubFC",
				["inverse"] = false,
				["icon"] = false,
				["orientation"] = "VERTICAL_INVERSE",
				["conditions"] = {
				},
				["color"] = {
				},
				["sparkOffsetY"] = 0,
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
						["do_custom"] = false,
						["do_message"] = false,
						["message"] = "",
					},
					["finish"] = {
					},
					["init"] = {
						["do_custom"] = false,
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
							["spellName"] = 0,
							["unevent"] = "auto",
							["names"] = {
							},
							["fetchTooltip"] = true,
							["event"] = "Unit Characteristics",
							["subeventSuffix"] = "_CAST_START",
							["realSpellName"] = 0,
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["subeventPrefix"] = "SPELL",
							["useName"] = true,
							["matchesShowOn"] = "showOnActive",
							["use_unit"] = true,
							["use_charges"] = true,
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
						["text_fontType"] = "OUTLINE",
						["text_visible"] = true,
						["text_anchorPoint"] = "OUTER_TOP",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["text_fontSize"] = 18,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
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
					["spellknown"] = 1459,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["animation"] = {
					["start"] = {
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_scale"] = true,
						["colorA"] = 1,
						["colorG"] = 0,
						["duration_type"] = "seconds",
						["use_translate"] = true,
						["colorB"] = 0,
						["colorR"] = 0,
						["type"] = "preset",
						["scaleType"] = "pulse",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["translateType"] = "bounce",
						["y"] = 0,
						["x"] = 0,
						["colorType"] = "straightHSV",
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["scalex"] = 1,
						["duration"] = "1",
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["type"] = "preset",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
					},
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["authorMode"] = true,
				["uid"] = "vZgSWvDP4VW",
				["regionType"] = "icon",
				["anchorFrameType"] = "SCREEN",
				["glowYOffset"] = 0,
				["frameStrata"] = 1,
				["glowLength"] = 10,
				["authorOptions"] = {
					{
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["type"] = "description",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["glowScale"] = 1,
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["zoom"] = 0,
				["cooldownTextDisabled"] = false,
				["auto"] = true,
				["tocversion"] = 11302,
				["id"] = "喝水 buff  9",
				["keepAspectRatio"] = false,
				["alpha"] = 1,
				["width"] = 38,
				["useTooltip"] = true,
				["config"] = {
				},
				["inverse"] = false,
				["progressPrecision"] = 0,
				["url"] = "https://wago.io/pQukwVj27/1",
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
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["type"] = "description",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["glowFrequency"] = 0.25,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = true,
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
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
						["scalex"] = 1,
						["colorB"] = 0,
						["use_translate"] = true,
						["use_alpha"] = true,
						["type"] = "preset",
						["scaleType"] = "pulse",
						["translateType"] = "bounce",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["preset"] = "slidetop",
						["y"] = 0,
						["x"] = 0,
						["colorType"] = "straightHSV",
						["use_color"] = true,
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["use_scale"] = true,
						["duration"] = "1",
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
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["useTooltip"] = true,
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "aura2",
							["match_countOperator"] = "~=",
							["matchesShowOn"] = "showOnMissing",
							["event"] = "Health",
							["unit"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["auranames"] = {
								"力量祝福", -- [1]
							},
							["spellIds"] = {
							},
							["subeventPrefix"] = "SPELL",
							["match_count"] = "1",
							["useName"] = true,
							["names"] = {
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
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_alive"] = true,
							["subeventPrefix"] = "SPELL",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["activeTriggerMode"] = 1,
				},
				["progressPrecision"] = 0,
				["regionType"] = "icon",
				["uid"] = "HOFa0L4cHSP",
				["glowYOffset"] = 0,
				["anchorFrameType"] = "SCREEN",
				["alpha"] = 1,
				["glowLength"] = 10,
				["xOffset"] = 0,
				["tocversion"] = 11302,
				["zoom"] = 0,
				["cooldownTextDisabled"] = true,
				["auto"] = true,
				["glowScale"] = 1,
				["id"] = "力量祝福-无buff",
				["keepAspectRatio"] = false,
				["frameStrata"] = 1,
				["width"] = 38,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["config"] = {
				},
				["inverse"] = true,
				["actions"] = {
					["start"] = {
					},
					["finish"] = {
					},
					["init"] = {
						["custom"] = "\n\n",
						["do_custom"] = false,
					},
				},
				["cooldownEdge"] = true,
				["conditions"] = {
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
					["finish"] = {
					},
					["init"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["unevent"] = "auto",
							["type"] = "custom",
							["subeventSuffix"] = "_CAST_START",
							["custom_type"] = "status",
							["use_unit"] = true,
							["use_absorbMode"] = true,
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
							["duration"] = "1",
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
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["authorOptions"] = {
					{
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["type"] = "description",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["justify"] = "LEFT",
				["tocversion"] = 11302,
				["id"] = "打断喊话 9",
				["fixedWidth"] = 200,
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["wordWrap"] = "WordWrap",
				["config"] = {
				},
				["uid"] = "xYtg5ixWtX0",
				["semver"] = "1.0.20",
				["url"] = "https://wago.io/pQukwVj27/1",
				["conditions"] = {
				},
				["xOffset"] = 0,
				["selfPoint"] = "BOTTOM",
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
						["scalex"] = 1,
						["colorA"] = 1,
						["use_translate"] = true,
						["use_alpha"] = true,
						["scaleType"] = "pulse",
						["type"] = "preset",
						["colorR"] = 0,
						["preset"] = "slidetop",
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["x"] = 0,
						["y"] = 0,
						["colorType"] = "straightHSV",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_color"] = true,
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["use_scale"] = true,
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
				["actions"] = {
					["start"] = {
					},
					["finish"] = {
					},
					["init"] = {
						["custom"] = "\n\n",
						["do_custom"] = false,
					},
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["useTooltip"] = true,
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
							["unit"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["useName"] = true,
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
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["use_alive"] = true,
							["names"] = {
							},
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["activeTriggerMode"] = 1,
				},
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["regionType"] = "icon",
				["uid"] = "L23)f9lqUjs",
				["keepAspectRatio"] = false,
				["width"] = 38,
				["frameStrata"] = 1,
				["xOffset"] = 0,
				["glowYOffset"] = 0,
				["tocversion"] = 11302,
				["zoom"] = 0,
				["cooldownTextDisabled"] = true,
				["auto"] = true,
				["glowScale"] = 1,
				["id"] = "虔诚光环-无buff",
				["progressPrecision"] = 0,
				["alpha"] = 1,
				["anchorFrameType"] = "SCREEN",
				["authorOptions"] = {
					{
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["type"] = "description",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["config"] = {
				},
				["inverse"] = true,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = true,
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spellknown"] = 465,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["cooldownEdge"] = true,
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
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
							["spellName"] = 853,
							["unevent"] = "auto",
							["subeventSuffix"] = "_CAST_START",
							["names"] = {
							},
							["event"] = "Cooldown Progress (Spell)",
							["subeventPrefix"] = "SPELL",
							["realSpellName"] = "Hammer of Justice",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["type"] = "status",
							["use_genericShowOn"] = true,
							["use_unit"] = true,
							["use_track"] = true,
							["matchesShowOn"] = "showAlways",
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
							["use_unit"] = true,
							["subeventPrefix"] = "SPELL",
							["unevent"] = "auto",
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
				["glowFrequency"] = 0.25,
				["actions"] = {
					["start"] = {
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
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
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["parent"] = "Paladin 2.0",
				["config"] = {
				},
				["anchorFrameType"] = "SCREEN",
				["regionType"] = "icon",
				["glowYOffset"] = 0,
				["frameStrata"] = 1,
				["xOffset"] = 50,
				["auto"] = false,
				["tocversion"] = 11302,
				["semver"] = "1.0.7",
				["cooldownTextDisabled"] = true,
				["cooldownEdge"] = false,
				["zoom"] = 0.3,
				["useGlowColor"] = true,
				["glowScale"] = 1,
				["id"] = "Paladin - Hammer of Justice",
				["authorOptions"] = {
				},
				["alpha"] = 1,
				["width"] = 49,
				["useglowColor"] = false,
				["uid"] = "4fDAaZR217H",
				["inverse"] = false,
				["keepAspectRatio"] = false,
				["progressPrecision"] = 0,
				["displayIcon"] = 135963,
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
					["finish"] = {
					},
					["init"] = {
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
							["unit"] = "target",
							["useName"] = true,
							["subeventSuffix"] = "_CAST_START",
							["unevent"] = "auto",
							["duration"] = "1",
							["names"] = {
							},
							["event"] = "Cooldown Progress (Spell)",
							["type"] = "status",
							["realSpellName"] = "The Human Spirit",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["spellName"] = 20598,
							["use_genericShowOn"] = true,
							["use_unit"] = true,
							["use_track"] = true,
							["ownOnly"] = true,
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
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
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
							["PRIEST"] = true,
							["SHAMAN"] = true,
							["PALADIN"] = true,
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["glowLength"] = 10,
				["uid"] = "WxGR7Jn4myz",
				["regionType"] = "icon",
				["parent"] = "Paladin 2.0",
				["anchorFrameType"] = "SCREEN",
				["frameStrata"] = 1,
				["useglowColor"] = false,
				["progressPrecision"] = 0,
				["tocversion"] = 11302,
				["auto"] = false,
				["zoom"] = 0.3,
				["cooldownTextDisabled"] = true,
				["semver"] = "1.0.7",
				["glowScale"] = 1,
				["id"] = "Paladin - Human Spirit",
				["icon"] = true,
				["alpha"] = 1,
				["width"] = 35,
				["glowYOffset"] = 0,
				["config"] = {
				},
				["inverse"] = false,
				["selfPoint"] = "CENTER",
				["keepAspectRatio"] = false,
				["displayIcon"] = 132874,
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
							["names"] = {
							},
							["use_unit"] = true,
							["hand"] = "ranged",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
							["hand"] = "ranged",
						},
					}, -- [1]
					["activeTriggerMode"] = -10,
				},
				["actions"] = {
					["start"] = {
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
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
				["animation"] = {
					["start"] = {
						["colorR"] = 0,
						["scalex"] = 1,
						["colorB"] = 0,
						["colorG"] = 0,
						["duration_type"] = "seconds",
						["use_translate"] = true,
						["use_scale"] = true,
						["scaleType"] = "pulse",
						["type"] = "preset",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["translateType"] = "bounce",
						["y"] = 0,
						["colorType"] = "straightHSV",
						["x"] = 0,
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["duration"] = "1",
						["colorA"] = 1,
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["uid"] = "vRsVPXrPDqb",
				["progressPrecision"] = 0,
				["anchorFrameType"] = "SCREEN",
				["alpha"] = 1,
				["glowLength"] = 10,
				["zoom"] = 0,
				["tocversion"] = 11302,
				["cooldownTextDisabled"] = true,
				["auto"] = true,
				["glowScale"] = 1,
				["id"] = "射击中 7",
				["authorOptions"] = {
					{
						["text"] = "\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-",
						["type"] = "description",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["frameStrata"] = 1,
				["width"] = 52,
				["glowYOffset"] = 0,
				["config"] = {
				},
				["inverse"] = true,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["cooldownEdge"] = true,
				["conditions"] = {
				},
				["cooldown"] = true,
				["glowBorder"] = false,
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
						["text_fontType"] = "OUTLINE",
						["text_visible"] = true,
						["text_anchorPoint"] = "CENTER",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["text_fontSize"] = 26,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
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
				["conditions"] = {
				},
				["actions"] = {
					["start"] = {
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
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
				["authorOptions"] = {
				},
				["uid"] = "c7nB(n8TlUf",
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
				["width"] = 49,
				["frameStrata"] = 1,
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
							["spellName"] = 20293,
							["use_remaining"] = false,
							["unevent"] = "timed",
							["subeventSuffix"] = "_CAST_START",
							["unit"] = "player",
							["matchesShowOn"] = "showAlways",
							["event"] = "Chat Message",
							["type"] = "aura2",
							["realSpellName"] = "Seal of Righteousness",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["use_genericShowOn"] = true,
							["names"] = {
							},
							["useName"] = true,
							["use_track"] = true,
							["use_unit"] = true,
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
							["use_unit"] = true,
							["subeventPrefix"] = "SPELL",
							["unevent"] = "auto",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["progressPrecision"] = 0,
				["tocversion"] = 11302,
				["auto"] = false,
				["zoom"] = 0.3,
				["cooldownTextDisabled"] = true,
				["semver"] = "1.0.7",
				["glowScale"] = 1,
				["id"] = "Paladin - Seal of Righteousness",
				["xOffset"] = -98,
				["alpha"] = 1,
				["anchorFrameType"] = "SCREEN",
				["glowYOffset"] = 0,
				["config"] = {
				},
				["inverse"] = false,
				["parent"] = "Paladin 2.0",
				["glowXOffset"] = 0,
				["displayIcon"] = 132325,
				["cooldown"] = true,
				["glowBorder"] = false,
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
						["text"] = "\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-",
						["type"] = "description",
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
						["text_fontType"] = "OUTLINE",
						["text_visible"] = true,
						["text_anchorPoint"] = "OUTER_TOP",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["text_fontSize"] = 18,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
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
					["finish"] = {
					},
					["init"] = {
					},
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
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
							["names"] = {
							},
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
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
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = false,
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
					["spellknown"] = 604,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["authorMode"] = true,
				["regionType"] = "icon",
				["uid"] = "xN(7f2Vk6HQ",
				["anchorFrameType"] = "SCREEN",
				["glowYOffset"] = 0,
				["alpha"] = 1,
				["animation"] = {
					["start"] = {
						["type"] = "preset",
						["preset"] = "slidetop",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["type"] = "preset",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
					},
				},
				["keepAspectRatio"] = false,
				["tocversion"] = 11302,
				["zoom"] = 0,
				["cooldownTextDisabled"] = false,
				["auto"] = true,
				["glowScale"] = 1,
				["id"] = "目标 施法 10",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["frameStrata"] = 1,
				["width"] = 38,
				["xOffset"] = 0,
				["config"] = {
				},
				["inverse"] = true,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["cooldownEdge"] = true,
				["conditions"] = {
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
						["preset"] = "slidetop",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
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
						["text_fontType"] = "OUTLINE",
						["text_visible"] = true,
						["text_anchorPoint"] = "OUTER_TOP",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["text_fontSize"] = 18,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
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
					["finish"] = {
					},
					["init"] = {
					},
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["url"] = "https://wago.io/pQukwVj27/1",
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
							["unit"] = "target",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
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
				["authorOptions"] = {
					{
						["text"] = "\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-",
						["type"] = "description",
						["fontSize"] = "medium",
						["width"] = 1,
					}, -- [1]
				},
				["regionType"] = "icon",
				["uid"] = "9BF1nEvaZu5",
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["glowYOffset"] = 0,
				["frameStrata"] = 1,
				["authorMode"] = true,
				["selfPoint"] = "CENTER",
				["tocversion"] = 11302,
				["zoom"] = 0,
				["cooldownTextDisabled"] = false,
				["auto"] = true,
				["glowScale"] = 1,
				["id"] = "目标 引导法术 10",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["alpha"] = 1,
				["width"] = 38,
				["anchorFrameType"] = "SCREEN",
				["config"] = {
				},
				["inverse"] = true,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = false,
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
					["spellknown"] = 604,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["glowLength"] = 10,
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
				["version"] = 8,
				["subRegions"] = {
				},
				["height"] = 35,
				["authorOptions"] = {
				},
				["glowLines"] = 8,
				["glowLength"] = 10,
				["glowFrequency"] = 0.25,
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
							["subeventPrefix"] = "SPELL",
							["type"] = "status",
							["subeventSuffix"] = "_CAST_START",
							["unevent"] = "auto",
							["ownOnly"] = true,
							["names"] = {
							},
							["event"] = "Cooldown Progress (Spell)",
							["useName"] = true,
							["realSpellName"] = "Repentance",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["duration"] = "1",
							["use_genericShowOn"] = true,
							["use_unit"] = true,
							["use_track"] = true,
							["spellName"] = 20066,
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
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["selfPoint"] = "CENTER",
				["keepAspectRatio"] = false,
				["uid"] = "zxFkI03OXw4",
				["regionType"] = "icon",
				["parent"] = "Paladin 2.0",
				["glowYOffset"] = 0,
				["frameStrata"] = 1,
				["actions"] = {
					["start"] = {
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
				["progressPrecision"] = 0,
				["tocversion"] = 11302,
				["auto"] = false,
				["zoom"] = 0.3,
				["cooldownTextDisabled"] = true,
				["semver"] = "1.0.7",
				["glowScale"] = 1,
				["id"] = "Paladin - Repentance",
				["xOffset"] = 36,
				["alpha"] = 1,
				["width"] = 35,
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
					["use_never"] = false,
					["use_race"] = false,
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["PALADIN"] = true,
							["ROGUE"] = true,
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["displayIcon"] = 135942,
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
					["finish"] = {
					},
					["init"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["debuffType"] = "HELPFUL",
							["type"] = "custom",
							["names"] = {
							},
							["custom_type"] = "status",
							["subeventPrefix"] = "SPELL",
							["duration"] = "1",
							["event"] = "Chat Message",
							["unit"] = "player",
							["customDuration"] = "function()\n    return false\nend",
							["custom"] = "function()\n    local region = aura_env.region\n    local plate = C_NamePlate.GetNamePlateForUnit(\"target\")\n    if plate then\n        region:ClearAllPoints()\n        --位置 Left right center\n        region:SetPoint(\"LEFT\", plate, \"LEFT\",-80, -25)\n        return true\n    else\n        return false\n    end\nend",
							["spellIds"] = {
							},
							["events"] = "aura_env.region",
							["check"] = "update",
							["unevent"] = "timed",
							["subeventSuffix"] = "_CAST_START",
							["custom_hide"] = "timed",
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
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["main"] = {
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["scalex"] = 1.3,
						["colorA"] = 1,
						["colorG"] = 1,
						["type"] = "custom",
						["colorB"] = 1,
						["use_color"] = false,
						["scaley"] = 1.3,
						["preset"] = "pulse",
						["alpha"] = 0,
						["x"] = 0,
						["y"] = 0,
						["colorType"] = "custom",
						["duration_type"] = "seconds",
						["scaleType"] = "pulse",
						["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    name, rank, icon, castTime, minRange, maxRange, spellId = GetSpellInfo(\"Aimed Shot\")\n    --tmin, tmax = WeakAuras.getRange(\"target\")\n    --print(maxRange)\n    --print(WeakAuras.GetRange(\"target\"))\n    if WeakAuras.CheckRange(\"target\", 8, \"<=\") then\n        return 1,0,0,1\n    end\n    if WeakAuras.CheckRange(\"target\", 25, \"<=\") then\n        return 1,0.6,0,1\n    end\n    if WeakAuras.CheckRange(\"target\", 40, \"<=\") then\n        return 1,1,0,1\n    end\n    if IsSpellInRange(\"Aimed Shot\") == 1 then \n        return 0,1,0,1\n    end\n    return 1,1,1,1\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["rotate"] = 0,
						["colorR"] = 1,
						["use_scale"] = true,
					},
					["finish"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
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
				["discrete_rotation"] = 0,
				["color"] = {
					1, -- [1]
					0.95294117647059, -- [2]
					0.96470588235294, -- [3]
					1, -- [4]
				},
				["semver"] = "1.0.0",
				["tocversion"] = 11302,
				["id"] = "目标指示(Classic) 9",
				["width"] = 80,
				["frameStrata"] = 9,
				["anchorFrameType"] = "SCREEN",
				["authorOptions"] = {
					{
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["type"] = "description",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["config"] = {
				},
				["uid"] = "CB4amWD3(UX",
				["xOffset"] = 0,
				["alpha"] = 1,
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
				["selfPoint"] = "CENTER",
				["desaturate"] = false,
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
					["finish"] = {
					},
					["init"] = {
					},
				},
				["triggers"] = {
					{
						["trigger"] = {
							["type"] = "custom",
							["subeventSuffix"] = "_CAST_START",
							["debuffType"] = "HELPFUL",
							["duration"] = "1",
							["event"] = "Health",
							["subeventPrefix"] = "SPELL",
							["custom_type"] = "event",
							["custom"] = "function() \n    SetCVar(\"alwaysCompareItems\", \"1\")--装备对比，0 关\n\nend",
							["events"] = "PLAYER_ENTERING_WORLD",
							["names"] = {
							},
							["check"] = "event",
							["spellIds"] = {
							},
							["unit"] = "player",
							["custom_hide"] = "timed",
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
				["url"] = "https://wago.io/pQukwVj27/1",
				["justify"] = "LEFT",
				["tocversion"] = 11302,
				["id"] = "SetCVar 15",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["fixedWidth"] = 200,
				["config"] = {
				},
				["uid"] = "x2D48dATgs9",
				["xOffset"] = 0,
				["authorOptions"] = {
					{
						["text"] = "\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-",
						["type"] = "description",
						["fontSize"] = "medium",
						["width"] = 1,
					}, -- [1]
				},
				["conditions"] = {
				},
				["wordWrap"] = "WordWrap",
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
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["use_combat"] = false,
					["role"] = {
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
						["preset"] = "slidetop",
						["duration_type"] = "seconds",
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["type"] = "preset",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
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
				["alpha"] = 1,
				["text2"] = "%p",
				["text2Color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["authorMode"] = true,
				["config"] = {
				},
				["xOffset"] = 0,
				["selfPoint"] = "CENTER",
				["actions"] = {
					["start"] = {
						["message"] = "-> %n <-",
						["do_message"] = true,
						["message_type"] = "YELL",
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
				["anchorFrameType"] = "SCREEN",
				["text1"] = "%s",
				["zoom"] = 0.3,
				["text1Containment"] = "INSIDE",
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["justify"] = "LEFT",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["id"] = "xd2-noBuff 10",
				["text2Point"] = "CENTER",
				["frameStrata"] = 1,
				["width"] = 35,
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
							["unit"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["names"] = {
							},
							["auranames"] = {
							},
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
							["class"] = "DRUID",
							["use_name"] = false,
							["unevent"] = "auto",
							["name"] = "",
							["subeventPrefix"] = "SPELL",
							["check"] = "event",
							["custom_type"] = "event",
							["use_unit"] = true,
							["hostility"] = "friendly",
						},
						["untrigger"] = {
							["use_specific_unit"] = true,
							["unit"] = "party1",
						},
					}, -- [2]
					{
						["trigger"] = {
							["use_specific_unit"] = true,
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["hostility"] = "friendly",
							["class"] = "DRUID",
							["use_character"] = true,
							["unit"] = "party2",
							["use_class"] = true,
							["character"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["event"] = "Unit Characteristics",
							["subeventPrefix"] = "SPELL",
							["duration"] = "1",
							["use_absorbMode"] = true,
						},
						["untrigger"] = {
							["unit"] = "party2",
							["use_specific_unit"] = true,
						},
					}, -- [3]
					{
						["trigger"] = {
							["use_specific_unit"] = true,
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["hostility"] = "friendly",
							["class"] = "DRUID",
							["use_character"] = true,
							["unit"] = "party3",
							["use_class"] = true,
							["character"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["event"] = "Unit Characteristics",
							["subeventPrefix"] = "SPELL",
							["use_absorbMode"] = true,
							["duration"] = "1",
						},
						["untrigger"] = {
							["unit"] = "party3",
							["use_specific_unit"] = true,
						},
					}, -- [4]
					{
						["trigger"] = {
							["use_specific_unit"] = true,
							["type"] = "status",
							["use_hostility"] = true,
							["unevent"] = "auto",
							["hostility"] = "friendly",
							["class"] = "DRUID",
							["use_character"] = true,
							["unit"] = "party4",
							["use_class"] = true,
							["character"] = "player",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["event"] = "Unit Characteristics",
							["subeventPrefix"] = "SPELL",
							["use_absorbMode"] = true,
							["duration"] = "1",
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
							["class"] = "DRUID",
							["use_absorbMode"] = true,
							["use_character"] = true,
							["hostility"] = "friendly",
							["use_class"] = true,
							["character"] = "player",
							["duration"] = "1",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["event"] = "Unit Characteristics",
							["subeventPrefix"] = "SPELL",
							["unit"] = "player",
						},
						["untrigger"] = {
						},
					}, -- [6]
					["disjunctive"] = "custom",
					["customTriggerLogic"] = "function(trigger)\n    return trigger[1] and (trigger[2] or trigger[3] or trigger[4] or trigger[5] or trigger[6]);\nend",
					["activeTriggerMode"] = -10,
				},
				["text1Point"] = "BOTTOMRIGHT",
				["inverse"] = false,
				["text1Font"] = "Friz Quadrata TT",
				["text2Font"] = "Friz Quadrata TT",
				["conditions"] = {
				},
				["tocversion"] = 11302,
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
							["unit"] = "player",
							["event"] = "Power",
							["use_showCost"] = true,
							["unevent"] = "auto",
							["spellIds"] = {
							},
							["health"] = "0",
							["health_operator"] = ">=",
							["duration"] = "1",
							["use_unit"] = true,
							["custom_hide"] = "timed",
							["names"] = {
							},
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
				["fontFlags"] = "OUTLINE",
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
				["backdropInFront"] = false,
				["parent"] = "Paladin 2.0",
				["barColor"] = {
					0, -- [1]
					0.33725490196078, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["desaturate"] = false,
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
						["text_fontType"] = "None",
						["text_visible"] = false,
						["text_anchorPoint"] = "INNER_RIGHT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["text_fontSize"] = 15,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
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
						["text_fontType"] = "None",
						["text_visible"] = true,
						["text_anchorPoint"] = "INNER_LEFT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["text_fontSize"] = 18,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
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
						["text_fontType"] = "None",
						["text_visible"] = false,
						["text_anchorPoint"] = "ICON_CENTER",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["text_fontSize"] = 12,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
					}, -- [4]
					{
						["border_offset"] = 1,
						["border_anchor"] = "bar",
						["type"] = "subborder",
						["border_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["border_visible"] = true,
						["border_edge"] = "1 Pixel",
						["border_size"] = 1,
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
					["ingroup"] = {
						["multi"] = {
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
					["pvptalent"] = {
						["multi"] = {
						},
					},
					["faction"] = {
						["multi"] = {
						},
					},
					["role"] = {
						["multi"] = {
						},
					},
					["use_class"] = true,
					["spec"] = {
						["single"] = 1,
						["multi"] = {
							true, -- [1]
							[3] = true,
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
				["backdropColor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["anchorFrameType"] = "SCREEN",
				["frameStrata"] = 3,
				["icon"] = false,
				["useAdjustededMin"] = false,
				["regionType"] = "aurabar",
				["borderInFront"] = true,
				["id"] = "Paladin - Mana Bar",
				["icon_side"] = "RIGHT",
				["semver"] = "1.0.7",
				["spark"] = false,
				["sparkHeight"] = 30,
				["texture"] = "ElvUI Blank",
				["zoom"] = 0,
				["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
				["auto"] = true,
				["tocversion"] = 11302,
				["sparkHidden"] = "NEVER",
				["sparkOffsetY"] = 0,
				["alpha"] = 1,
				["width"] = 245,
				["actions"] = {
					["start"] = {
					},
					["finish"] = {
					},
					["init"] = {
						["custom"] = "if aura_env.region then\n    local r = aura_env.region\n    if not r.text3 then\n        local text3 = r.bar:CreateFontString(nil, \"OVERLAY\")\n        r.text3 = text3\n        r.text3:SetJustifyH(\"CENTER\")\n        r.text3:SetJustifyV(\"MIDDLE\")\n        r.text3:SetPoint(\"CENTER\", r.bar, \"CENTER\")\n        r.text3:Show()\n    end\n    r.text3:SetShadowOffset(1, -1)\n    r.text3:SetFont(r.text:GetFont())\n    r.text3:SetTextColor(r.text:GetTextColor())\nend\n\n\n\n\n\n\n",
						["do_custom"] = true,
					},
				},
				["config"] = {
				},
				["inverse"] = false,
				["sparkDesature"] = false,
				["orientation"] = "HORIZONTAL",
				["conditions"] = {
				},
				["stickyDuration"] = false,
				["selfPoint"] = "CENTER",
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
					["finish"] = {
					},
					["init"] = {
					},
				},
				["useglowColor"] = false,
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
						["text_fontType"] = "OUTLINE",
						["text_visible"] = true,
						["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["text_fontSize"] = 12,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
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
				["cooldownEdge"] = false,
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["conditions"] = {
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
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_alive"] = true,
							["names"] = {
							},
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
				["regionType"] = "icon",
				["icon"] = true,
				["uid"] = "agZ8Y9tweva",
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["width"] = 38,
				["frameStrata"] = 1,
				["glowFrequency"] = 0.25,
				["zoom"] = 0,
				["tocversion"] = 11302,
				["cooldownTextDisabled"] = false,
				["auto"] = false,
				["glowScale"] = 1,
				["id"] = "Find Treasure 11",
				["anchorFrameType"] = "SCREEN",
				["alpha"] = 1,
				["glowYOffset"] = 0,
				["xOffset"] = 0,
				["config"] = {
				},
				["inverse"] = false,
				["keepAspectRatio"] = false,
				["selfPoint"] = "CENTER",
				["displayIcon"] = "135725",
				["glowLength"] = 10,
				["glowBorder"] = false,
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
					["finish"] = {
					},
					["init"] = {
					},
				},
				["useglowColor"] = false,
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
						["text_fontType"] = "OUTLINE",
						["text_visible"] = true,
						["text_anchorPoint"] = "CENTER",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["text_fontSize"] = 26,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
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
				["triggers"] = {
					{
						["trigger"] = {
							["duration"] = "1",
							["genericShowOn"] = "showOnCooldown",
							["unit"] = "target",
							["debuffType"] = "HARMFUL",
							["type"] = "status",
							["subeventSuffix"] = "_CAST_START",
							["spellName"] = 853,
							["subeventPrefix"] = "SPELL",
							["event"] = "Cooldown Progress (Spell)",
							["unevent"] = "auto",
							["realSpellName"] = "Hammer of Justice",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["use_genericShowOn"] = true,
							["useName"] = true,
							["use_unit"] = true,
							["use_track"] = true,
							["names"] = {
							},
						},
						["untrigger"] = {
						},
					}, -- [1]
					["activeTriggerMode"] = -10,
				},
				["icon"] = true,
				["regionType"] = "icon",
				["parent"] = "Classic Paladin - CD's",
				["uid"] = "dTdOnqsm(Jz",
				["width"] = 35,
				["glowYOffset"] = 0,
				["frameStrata"] = 1,
				["glowLength"] = 10,
				["zoom"] = 0.3,
				["tocversion"] = 11302,
				["cooldownTextDisabled"] = true,
				["auto"] = true,
				["glowScale"] = 1,
				["id"] = "Paladin - Hammer of Justice",
				["authorOptions"] = {
				},
				["alpha"] = 1,
				["anchorFrameType"] = "SCREEN",
				["xOffset"] = 1,
				["config"] = {
				},
				["inverse"] = false,
				["selfPoint"] = "CENTER",
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
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["type"] = "description",
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
				["glowLength"] = 10,
				["glowLines"] = 8,
				["actions"] = {
					["start"] = {
						["message"] = "我中了-> %n <-",
						["do_message"] = true,
						["message_type"] = "SAY",
					},
					["finish"] = {
					},
					["init"] = {
						["do_custom"] = false,
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
							["use_unit"] = true,
							["use_track"] = true,
							["spellCount"] = "0",
							["spellName"] = 122,
							["showClones"] = true,
							["debuffType"] = "HARMFUL",
							["charges_operator"] = ">",
							["type"] = "aura2",
							["unevent"] = "auto",
							["subeventSuffix"] = "_CAST_START",
							["use_spellCount"] = false,
							["names"] = {
							},
							["event"] = "Cooldown Progress (Spell)",
							["use_exact_spellName"] = false,
							["realSpellName"] = "冰霜新星",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["charges"] = "0",
							["unit"] = "player",
							["use_genericShowOn"] = true,
							["spellCount_operator"] = ">",
							["use_charges"] = false,
						},
						["untrigger"] = {
							["genericShowOn"] = "showOnReady",
						},
					}, -- [1]
					["activeTriggerMode"] = 1,
				},
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = false,
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
					["spellknown"] = 118,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["useTooltip"] = true,
				["uid"] = "8H9rtxOHA0g",
				["regionType"] = "icon",
				["width"] = 30,
				["anchorFrameType"] = "SCREEN",
				["frameStrata"] = 1,
				["authorMode"] = true,
				["xOffset"] = 0,
				["glowScale"] = 1,
				["auto"] = true,
				["zoom"] = 0,
				["cooldownTextDisabled"] = false,
				["useGlowColor"] = true,
				["tocversion"] = 11302,
				["id"] = "自己debuff 9",
				["animation"] = {
					["start"] = {
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_scale"] = true,
						["colorA"] = 1,
						["colorG"] = 0,
						["duration_type"] = "seconds",
						["use_translate"] = true,
						["colorB"] = 0,
						["colorR"] = 0,
						["type"] = "preset",
						["scaleType"] = "pulse",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["translateType"] = "bounce",
						["y"] = 0,
						["x"] = 0,
						["colorType"] = "straightHSV",
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["scalex"] = 1,
						["duration"] = "1",
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["alpha"] = 1,
				["glowYOffset"] = 0,
				["keepAspectRatio"] = false,
				["config"] = {
				},
				["inverse"] = true,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["cooldownEdge"] = true,
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
							["subeventPrefix"] = "SPELL",
							["names"] = {
							},
							["event"] = "Health",
							["unit"] = "player",
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
				["rotation"] = 0,
				["internalVersion"] = 24,
				["yOffset"] = -240.21807861328,
				["rowSpace"] = 1,
				["constantFactor"] = "RADIUS",
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
				["borderOffset"] = 4,
				["xOffset"] = -184.35302734375,
				["tocversion"] = 11302,
				["id"] = "圣骑士 QS(动态 怀旧 Classic)",
				["uid"] = "Z7AwBEvsHD7",
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["gridWidth"] = 5,
				["config"] = {
				},
				["borderInset"] = 1,
				["sort"] = "none",
				["arcLength"] = 360,
				["conditions"] = {
				},
				["gridType"] = "RD",
				["selfPoint"] = "BOTTOMLEFT",
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
					["finish"] = {
					},
					["init"] = {
					},
				},
				["useglowColor"] = false,
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
						["text_fontType"] = "OUTLINE",
						["text_visible"] = true,
						["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["text_fontSize"] = 12,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
					}, -- [1]
				},
				["height"] = 38,
				["glowLines"] = 8,
				["glowFrequency"] = 0.25,
				["selfPoint"] = "CENTER",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["conditions"] = {
				},
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
							["subeventPrefix"] = "SPELL",
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
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["regionType"] = "icon",
				["url"] = "https://wago.io/pQukwVj27/1",
				["uid"] = "iLFYe(OE6jf",
				["width"] = 38,
				["anchorFrameType"] = "SCREEN",
				["alpha"] = 1,
				["glowLength"] = 10,
				["zoom"] = 0,
				["tocversion"] = 11302,
				["cooldownTextDisabled"] = false,
				["auto"] = false,
				["glowScale"] = 1,
				["id"] = "Find Herbs 11",
				["icon"] = true,
				["frameStrata"] = 1,
				["glowYOffset"] = 0,
				["authorOptions"] = {
				},
				["config"] = {
				},
				["inverse"] = false,
				["keepAspectRatio"] = false,
				["authorMode"] = true,
				["displayIcon"] = "133939",
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
				["glowBorder"] = false,
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
					["finish"] = {
					},
					["init"] = {
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
				["glowFrequency"] = 0.25,
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
							["subeventPrefix"] = "SPELL",
							["type"] = "status",
							["unevent"] = "auto",
							["subeventSuffix"] = "_CAST_START",
							["ownOnly"] = true,
							["spellName"] = 633,
							["event"] = "Cooldown Progress (Spell)",
							["useName"] = true,
							["realSpellName"] = "Lay on Hands",
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["names"] = {
							},
							["use_unit"] = true,
							["duration"] = "1",
							["use_track"] = true,
							["matchesShowOn"] = "showAlways",
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
							["subeventSuffix"] = "_CAST_START",
							["subeventPrefix"] = "SPELL",
							["debuffType"] = "HELPFUL",
						},
						["untrigger"] = {
						},
					}, -- [2]
					["disjunctive"] = "any",
					["activeTriggerMode"] = -10,
				},
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["glowLength"] = 10,
				["authorOptions"] = {
				},
				["uid"] = "J36Gfr1w38C",
				["regionType"] = "icon",
				["parent"] = "Paladin 2.0",
				["anchorFrameType"] = "SCREEN",
				["alpha"] = 1,
				["width"] = 35,
				["progressPrecision"] = 0,
				["tocversion"] = 11302,
				["auto"] = false,
				["zoom"] = 0.3,
				["cooldownTextDisabled"] = true,
				["semver"] = "1.0.7",
				["glowScale"] = 1,
				["id"] = "Paladin - Lay on Hands",
				["keepAspectRatio"] = false,
				["frameStrata"] = 1,
				["glowYOffset"] = 0,
				["icon"] = true,
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
					["use_never"] = false,
					["use_race"] = false,
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
							["PALADIN"] = true,
							["ROGUE"] = true,
						},
					},
					["size"] = {
						["multi"] = {
						},
					},
				},
				["url"] = "https://wago.io/Y7SYk2ATp/8",
				["displayIcon"] = 135928,
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
							["names"] = {
							},
							["subeventSuffix"] = "_CAST_START",
							["spellIds"] = {
							},
							["health"] = "1",
							["use_unit"] = true,
							["unit"] = "player",
							["use_percenthealth"] = false,
							["percenthealth_operator"] = "<",
							["unevent"] = "auto",
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
							["subeventSuffix"] = "_CAST_START",
							["use_alive"] = true,
							["subeventPrefix"] = "SPELL",
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
						["text_anchorYOffset"] = 2,
						["text_fontSize"] = 12,
						["anchorXOffset"] = 0,
						["text_visible"] = true,
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
				["color"] = {
				},
				["actions"] = {
					["start"] = {
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
				["xOffset"] = -2,
				["icon"] = false,
				["smoothProgress"] = true,
				["useAdjustededMin"] = false,
				["regionType"] = "aurabar",
				["sparkOffsetY"] = 0,
				["zoom"] = 0,
				["icon_side"] = "RIGHT",
				["config"] = {
				},
				["auto"] = true,
				["sparkHeight"] = 10,
				["texture"] = "Blizzard",
				["anchorFrameType"] = "SCREEN",
				["sparkTexture"] = "XPBarAnim-OrangeSpark",
				["spark"] = true,
				["tocversion"] = 11302,
				["id"] = "HP-(进入战斗中显示) 8",
				["alpha"] = 1,
				["frameStrata"] = 1,
				["width"] = 14,
				["sparkHidden"] = "NEVER",
				["sparkColor"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["inverse"] = false,
				["uid"] = "rMkrlBHkIzL",
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
				["animation"] = {
					["start"] = {
						["type"] = "none",
						["duration_type"] = "seconds",
						["preset"] = "slidetop",
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["type"] = "none",
						["preset"] = "slidebottom",
						["duration_type"] = "seconds",
					},
				},
				["authorOptions"] = {
				},
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
						["colorA"] = 1,
						["colorR"] = 0,
						["use_translate"] = true,
						["use_alpha"] = true,
						["duration_type"] = "seconds",
						["type"] = "preset",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["preset"] = "slidetop",
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["use_color"] = true,
						["alpha"] = 0,
						["scaleType"] = "pulse",
						["y"] = 0,
						["x"] = 0,
						["colorType"] = "straightHSV",
						["scaley"] = 1,
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["use_scale"] = true,
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
				["keepAspectRatio"] = false,
				["glowLines"] = 8,
				["internalVersion"] = 24,
				["glowFrequency"] = 0.25,
				["authorOptions"] = {
					{
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["type"] = "description",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
				["actions"] = {
					["start"] = {
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["uid"] = "Hp56JmSW6RR",
				["anchorFrameType"] = "SCREEN",
				["regionType"] = "icon",
				["glowYOffset"] = 0,
				["frameStrata"] = 1,
				["progressPrecision"] = 0,
				["selfPoint"] = "CENTER",
				["glowScale"] = 1,
				["useGlowColor"] = true,
				["zoom"] = 0,
				["authorMode"] = true,
				["cooldownTextDisabled"] = false,
				["auto"] = true,
				["tocversion"] = 11302,
				["id"] = "目标- DEBUFF11",
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = false,
					["spec"] = {
						["multi"] = {
						},
					},
					["class"] = {
						["single"] = "PALADIN",
						["multi"] = {
						},
					},
					["spellknown"] = 1978,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["alpha"] = 1,
				["width"] = 30,
				["xOffset"] = 0,
				["config"] = {
				},
				["inverse"] = false,
				["triggers"] = {
					{
						["trigger"] = {
							["showClones"] = true,
							["type"] = "aura2",
							["auranames"] = {
								"毒蛇钉刺", -- [1]
							},
							["ownOnly"] = true,
							["matchesShowOn"] = "showOnActive",
							["event"] = "Health",
							["subeventPrefix"] = "SPELL",
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
							["spellIds"] = {
							},
							["duration"] = "1",
							["names"] = {
							},
							["unevent"] = "auto",
							["unit"] = "target",
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
				["cooldownEdge"] = true,
				["conditions"] = {
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
						["text"] = "https://wago.io/axtxakK9c       本WA字符\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-\n喂养宠物: 这功能有什么问题请用/relaod\nWA设置：Rubot's PetFeeder Classic (fork by Slime7) -> 动作 ->可加入给BB吃的ID \n这功能BUG很多，请多用/reload",
						["type"] = "description",
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
						["duration_type"] = "seconds",
						["use_translate"] = true,
						["colorB"] = 0,
						["colorR"] = 0,
						["type"] = "preset",
						["scaleType"] = "pulse",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["translateType"] = "bounce",
						["y"] = 0,
						["x"] = 0,
						["colorType"] = "straightHSV",
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["scalex"] = 1,
						["duration"] = "1",
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["glowFrequency"] = 0.25,
				["conditions"] = {
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
							["matchesShowOn"] = "showOnActive",
							["subeventSuffix"] = "_CAST_START",
							["event"] = "Unit Characteristics",
							["use_unit"] = true,
							["realSpellName"] = 0,
							["use_spellName"] = true,
							["spellIds"] = {
							},
							["useName"] = true,
							["use_charges"] = true,
							["names"] = {
							},
							["subeventPrefix"] = "SPELL",
							["spellName"] = 0,
						},
						["untrigger"] = {
							["unit"] = "target",
						},
					}, -- [1]
					["activeTriggerMode"] = 1,
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["load"] = {
					["use_class"] = true,
					["use_spellknown"] = false,
					["race"] = {
						["single"] = "Orc",
						["multi"] = {
							["Orc"] = true,
						},
					},
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
					["spellknown"] = 7744,
					["size"] = {
						["multi"] = {
						},
					},
				},
				["url"] = "https://wago.io/pQukwVj27/1",
				["config"] = {
				},
				["regionType"] = "icon",
				["xOffset"] = 0,
				["anchorFrameType"] = "SCREEN",
				["frameStrata"] = 1,
				["actions"] = {
					["start"] = {
					},
					["finish"] = {
					},
					["init"] = {
					},
				},
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["glowScale"] = 1,
				["authorMode"] = true,
				["zoom"] = 0,
				["cooldownTextDisabled"] = false,
				["auto"] = true,
				["tocversion"] = 11302,
				["id"] = "种族-buff 9",
				["glowXOffset"] = 0,
				["alpha"] = 1,
				["width"] = 38,
				["glowYOffset"] = 0,
				["uid"] = "hiQcOiRJWRR",
				["inverse"] = false,
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["internalVersion"] = 24,
				["displayIcon"] = 136187,
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
					["finish"] = {
					},
					["init"] = {
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
				["animation"] = {
					["start"] = {
						["colorR"] = 0,
						["scalex"] = 1,
						["colorB"] = 0,
						["colorG"] = 0,
						["duration_type"] = "seconds",
						["use_translate"] = true,
						["use_scale"] = true,
						["scaleType"] = "pulse",
						["type"] = "preset",
						["scaleFunc"] = "    function(progress, startX, startY, scaleX, scaleY)\n      local angle = (progress * 2 * math.pi) - (math.pi / 2)\n      return startX + (((math.sin(angle) + 1)/2) * (scaleX - 1)), startY + (((math.sin(angle) + 1)/2) * (scaleY - 1))\n    end\n  ",
						["use_color"] = true,
						["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local bounceDistance = math.sin(progress * math.pi)\n      return startX + (bounceDistance * deltaX), startY + (bounceDistance * deltaY)\n    end\n  ",
						["scaley"] = 1,
						["alpha"] = 0,
						["translateType"] = "bounce",
						["y"] = 0,
						["colorType"] = "straightHSV",
						["x"] = 0,
						["preset"] = "slidetop",
						["colorFunc"] = "    function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n      return WeakAuras.GetHSVTransition(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    end\n  ",
						["rotate"] = 0,
						["duration"] = "1",
						["colorA"] = 1,
					},
					["main"] = {
						["duration_type"] = "seconds",
						["type"] = "none",
					},
					["finish"] = {
						["type"] = "preset",
						["duration_type"] = "seconds",
						["preset"] = "slidebottom",
					},
				},
				["glowType"] = "Pixel",
				["glowThickness"] = 1,
				["authorOptions"] = {
					{
						["text"] = "\nhttps://wago.io/p/husandro2   其他WA字符\n---\n如果wa插件占内存大，请/RELOAD ,完后 不要 再 打开wa插件选项界面\n-",
						["type"] = "description",
						["fontSize"] = "medium",
						["width"] = 2,
					}, -- [1]
				},
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
							["names"] = {
							},
							["use_unit"] = true,
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
							["subeventPrefix"] = "SPELL",
							["use_inverse"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_unit"] = true,
						},
						["untrigger"] = {
						},
					}, -- [2]
					["activeTriggerMode"] = 1,
				},
				["icon"] = true,
				["regionType"] = "icon",
				["keepAspectRatio"] = false,
				["config"] = {
				},
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["width"] = 52,
				["frameStrata"] = 1,
				["glowLength"] = 10,
				["zoom"] = 0,
				["tocversion"] = 11302,
				["cooldownTextDisabled"] = true,
				["auto"] = true,
				["glowScale"] = 1,
				["id"] = "功击中 主手 8",
				["progressPrecision"] = 0,
				["alpha"] = 1,
				["anchorFrameType"] = "SCREEN",
				["glowYOffset"] = 0,
				["uid"] = "zhxh5irneMZ",
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
				["cooldownEdge"] = true,
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
					["finish"] = {
					},
					["init"] = {
					},
				},
				["useglowColor"] = false,
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
						["text_fontType"] = "OUTLINE",
						["text_visible"] = true,
						["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["text_fontSize"] = 12,
						["anchorXOffset"] = 0,
						["rotateText"] = "NONE",
					}, -- [1]
				},
				["height"] = 38,
				["glowLines"] = 8,
				["glowFrequency"] = 0.25,
				["glowLength"] = 10,
				["keepAspectRatio"] = false,
				["glowType"] = "buttonOverlay",
				["glowThickness"] = 1,
				["conditions"] = {
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
							["use_unit"] = true,
							["subeventSuffix"] = "_CAST_START",
							["use_alive"] = true,
							["names"] = {
							},
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
				["regionType"] = "icon",
				["xOffset"] = 0,
				["uid"] = "YXiDGYNOvSz",
				["parent"] = "圣骑士 QS(动态 怀旧 Classic)",
				["glowYOffset"] = 0,
				["frameStrata"] = 1,
				["authorMode"] = true,
				["zoom"] = 0,
				["tocversion"] = 11302,
				["cooldownTextDisabled"] = false,
				["auto"] = false,
				["glowScale"] = 1,
				["id"] = "Find Minerals 11",
				["selfPoint"] = "CENTER",
				["alpha"] = 1,
				["width"] = 38,
				["anchorFrameType"] = "SCREEN",
				["config"] = {
				},
				["inverse"] = false,
				["icon"] = true,
				["url"] = "https://wago.io/pQukwVj27/1",
				["displayIcon"] = "136025",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["glowBorder"] = false,
			},
		},
	},
	["minimap"] = {
		["minimapPos"] = 199.002195712601,
		["hide"] = false,
	},
	["lastUpgrade"] = 1570214941,
	["dbVersion"] = 24,
	["clearOldHistory"] = 30,
	["registered"] = {
	},
	["login_squelch_time"] = 10,
	["frame"] = {
		["xOffset"] = -46.34521484375,
		["yOffset"] = -51.1129150390625,
		["height"] = 665.000122070313,
		["width"] = 830,
	},
	["editor_theme"] = "Monokai",
}


WeakAurasSaved = {
	["dynamicIconCache"] = {
	},
	["displays"] = {
		["正义之怒"] = {
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
						["matchesShowOn"] = "showAlways",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["auraspellids"] = {
							"25780", -- [1]
						},
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
						["duration"] = "1",
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["remaining"] = "0",
						["debuffType"] = "HELPFUL",
						["type"] = "status",
						["use_genericShowOn"] = true,
						["useExactSpellId"] = true,
						["remaining_operator"] = ">=",
						["use_remaining"] = false,
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["spellName"] = 0,
						["use_track"] = true,
						["unevent"] = "auto",
					},
					["untrigger"] = {
					},
				}, -- [2]
				["disjunctive"] = "any",
				["activeTriggerMode"] = 1,
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
					["text_font"] = "伤害数字",
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
						0.976470588235294, -- [2]
						0.376470588235294, -- [3]
						1, -- [4]
					},
					["text_font"] = "伤害数字",
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
					["text_visible"] = true,
				}, -- [2]
			},
			["height"] = 48,
			["load"] = {
				["use_class"] = true,
				["talent"] = {
					["single"] = 35,
				},
				["size"] = {
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
					["multi"] = {
					},
				},
				["use_talent"] = true,
			},
			["authorMode"] = true,
			["glowFrequency"] = 0.25,
			["glowYOffset"] = 0,
			["zoom"] = 0,
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 1,
			["glowLines"] = 8,
			["anchorFrameType"] = "SCREEN",
			["keepAspectRatio"] = false,
			["regionType"] = "icon",
			["parent"] = "防骑",
			["actions"] = {
				["start"] = {
					["do_glow"] = true,
					["glow_type"] = "buttonOverlay",
					["glow_action"] = "show",
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["useglowColor"] = false,
			["uid"] = "F9QpR9nxJfp",
			["alpha"] = 1,
			["selfPoint"] = "CENTER",
			["cooldownTextDisabled"] = true,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "正义之怒",
			["authorOptions"] = {
			},
			["frameStrata"] = 1,
			["width"] = 48,
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
						["trigger"] = 2,
						["variable"] = "onCooldown",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.2.text_visible",
						}, -- [1]
						{
							["value"] = {
								1, -- [1]
								0.192156862745098, -- [2]
								0.219607843137255, -- [3]
								1, -- [4]
							},
							["property"] = "sub.2.text_color",
						}, -- [2]
					},
				}, -- [3]
			},
			["cooldown"] = true,
			["glowBorder"] = false,
		},
		["神圣之盾"] = {
			["glow"] = false,
			["parent"] = "防骑",
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
						["matchesShowOn"] = "showAlways",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["names"] = {
						},
						["useExactSpellId"] = true,
						["unit"] = "player",
						["auraspellids"] = {
							"20927", -- [1]
						},
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["duration"] = "1",
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["remaining"] = "0",
						["debuffType"] = "HELPFUL",
						["type"] = "status",
						["use_genericShowOn"] = true,
						["useExactSpellId"] = true,
						["remaining_operator"] = ">=",
						["use_remaining"] = false,
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 20927,
						["use_spellName"] = true,
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["spellName"] = 20927,
						["use_track"] = true,
						["unevent"] = "auto",
					},
					["untrigger"] = {
					},
				}, -- [2]
				["disjunctive"] = "any",
				["activeTriggerMode"] = 1,
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
					["text_font"] = "伤害数字",
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
				{
					["text_shadowXOffset"] = 0,
					["type"] = "subtext",
					["text_text"] = "%p",
					["text_color"] = {
						1, -- [1]
						0.976470588235294, -- [2]
						0.376470588235294, -- [3]
						1, -- [4]
					},
					["text_font"] = "伤害数字",
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
					["text_visible"] = true,
				}, -- [2]
			},
			["height"] = 48,
			["load"] = {
				["use_class"] = true,
				["talent"] = {
					["single"] = 35,
				},
				["use_talent"] = true,
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
			["authorMode"] = true,
			["glowFrequency"] = 0.25,
			["width"] = 48,
			["glowLength"] = 10,
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 1,
			["useglowColor"] = false,
			["anchorFrameType"] = "SCREEN",
			["keepAspectRatio"] = false,
			["regionType"] = "icon",
			["actions"] = {
				["start"] = {
					["do_glow"] = true,
					["glow_action"] = "show",
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["xOffset"] = 0,
			["selfPoint"] = "CENTER",
			["config"] = {
			},
			["frameStrata"] = 1,
			["authorOptions"] = {
			},
			["zoom"] = 0,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "神圣之盾",
			["cooldownTextDisabled"] = true,
			["alpha"] = 1,
			["glowYOffset"] = 0,
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["uid"] = "hYHN)WRQInA",
			["inverse"] = false,
			["glowLines"] = 8,
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
						["trigger"] = 2,
						["variable"] = "onCooldown",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.2.text_visible",
						}, -- [1]
						{
							["value"] = {
								1, -- [1]
								0.192156862745098, -- [2]
								0.219607843137255, -- [3]
								1, -- [4]
							},
							["property"] = "sub.2.text_color",
						}, -- [2]
					},
				}, -- [3]
			},
			["cooldown"] = true,
			["glowBorder"] = false,
		},
		["智慧祝福"] = {
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
						["matchesShowOn"] = "showAlways",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["spellIds"] = {
						},
						["names"] = {
						},
						["auraspellids"] = {
							"19854", -- [1]
						},
						["unit"] = "player",
						["useExactSpellId"] = true,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["duration"] = "1",
						["genericShowOn"] = "showOnCooldown",
						["use_unit"] = true,
						["remaining"] = "0",
						["debuffType"] = "HELPFUL",
						["type"] = "status",
						["use_genericShowOn"] = true,
						["useExactSpellId"] = true,
						["remaining_operator"] = ">=",
						["use_remaining"] = false,
						["event"] = "Cooldown Progress (Spell)",
						["use_exact_spellName"] = true,
						["realSpellName"] = 0,
						["use_spellName"] = true,
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["spellName"] = 0,
						["use_track"] = true,
						["unevent"] = "auto",
					},
					["untrigger"] = {
					},
				}, -- [2]
				["disjunctive"] = "any",
				["activeTriggerMode"] = 1,
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
					["text_font"] = "伤害数字",
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
						0.976470588235294, -- [2]
						0.376470588235294, -- [3]
						1, -- [4]
					},
					["text_font"] = "伤害数字",
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
					["text_visible"] = true,
				}, -- [2]
			},
			["height"] = 48,
			["load"] = {
				["use_class"] = true,
				["talent"] = {
					["single"] = 35,
				},
				["size"] = {
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
				["use_talent"] = true,
			},
			["authorMode"] = true,
			["glowFrequency"] = 0.25,
			["glowYOffset"] = 0,
			["zoom"] = 0,
			["glowType"] = "buttonOverlay",
			["glowThickness"] = 1,
			["glowLines"] = 8,
			["parent"] = "防骑",
			["anchorFrameType"] = "SCREEN",
			["regionType"] = "icon",
			["keepAspectRatio"] = false,
			["actions"] = {
				["start"] = {
					["do_glow"] = true,
					["glow_action"] = "show",
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["useglowColor"] = false,
			["uid"] = "yD)6NjqcgnL",
			["alpha"] = 1,
			["selfPoint"] = "CENTER",
			["cooldownTextDisabled"] = true,
			["auto"] = true,
			["glowScale"] = 1,
			["id"] = "智慧祝福",
			["authorOptions"] = {
			},
			["frameStrata"] = 1,
			["width"] = 48,
			["glowLength"] = 10,
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
						["trigger"] = 2,
						["variable"] = "onCooldown",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.2.text_visible",
						}, -- [1]
						{
							["value"] = {
								1, -- [1]
								0.192156862745098, -- [2]
								0.219607843137255, -- [3]
								1, -- [4]
							},
							["property"] = "sub.2.text_color",
						}, -- [2]
					},
				}, -- [3]
			},
			["cooldown"] = true,
			["glowBorder"] = false,
		},
		["防骑"] = {
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["controlledChildren"] = {
				"正义之怒", -- [1]
				"智慧祝福", -- [2]
				"神圣之盾", -- [3]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["authorOptions"] = {
			},
			["scale"] = 1,
			["border"] = false,
			["yOffset"] = -97.777587890625,
			["anchorPoint"] = "CENTER",
			["borderSize"] = 2,
			["config"] = {
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
			["xOffset"] = -82.8888549804688,
			["internalVersion"] = 24,
			["borderEdge"] = "Square Full White",
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
			["id"] = "防骑",
			["regionType"] = "group",
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["selfPoint"] = "BOTTOMLEFT",
			["borderInset"] = 1,
			["borderOffset"] = 4,
			["subRegions"] = {
			},
			["conditions"] = {
			},
			["load"] = {
				["use_class"] = "true",
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
			["uid"] = "NOn5hMjD9iU",
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
		["eOX9jYSjl9f"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1570261999,
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
				["yOffset"] = -171,
				["border"] = false,
				["borderEdge"] = "1 Pixel",
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
				["internalVersion"] = 24,
				["borderOffset"] = 4,
				["semver"] = "1.0.7",
				["tocversion"] = 11302,
				["id"] = "Paladin 2.0",
				["borderInset"] = 1,
				["frameStrata"] = 1,
				["anchorFrameType"] = "SCREEN",
				["uid"] = "eOX9jYSjl9f",
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
				["selfPoint"] = "BOTTOMLEFT",
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
					["faction"] = {
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
					["pvptalent"] = {
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
		["Af9UYobj)qs"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1570261999,
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
		["5sIquIf1M3z"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1570261999,
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
						["text_visible"] = false,
						["text_fontType"] = "OUTLINE",
						["text_anchorPoint"] = "INNER_BOTTOMRIGHT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontSize"] = 12,
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
					["use_combat"] = true,
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
				["parent"] = "Paladin 2.0",
				["uid"] = "5sIquIf1M3z",
				["glowYOffset"] = 0,
				["anchorFrameType"] = "SCREEN",
				["frameStrata"] = 1,
				["cooldownEdge"] = false,
				["auto"] = false,
				["glowScale"] = 1,
				["cooldownTextDisabled"] = false,
				["semver"] = "1.0.7",
				["tocversion"] = 11302,
				["id"] = "Paladin - Blessing of Wisdom",
				["zoom"] = 0.3,
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
		["We3V)BlFpGH"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1570261999,
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
				["stickyDuration"] = false,
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
						["text_visible"] = false,
						["text_fontType"] = "None",
						["text_anchorPoint"] = "INNER_RIGHT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontSize"] = 12,
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
						["text_visible"] = false,
						["text_fontType"] = "None",
						["text_anchorPoint"] = "INNER_LEFT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontSize"] = 12,
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
						["text_visible"] = false,
						["text_fontType"] = "None",
						["text_anchorPoint"] = "ICON_CENTER",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontSize"] = 12,
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
					["role"] = {
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
					["use_spec"] = true,
					["faction"] = {
						["multi"] = {
						},
					},
					["pvptalent"] = {
						["multi"] = {
						},
					},
					["use_class"] = true,
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
				["auto"] = true,
				["icon_side"] = "RIGHT",
				["id"] = "Paladin - Swing Timer",
				["zoom"] = 0,
				["sparkHeight"] = 30,
				["texture"] = "ElvUI Blank",
				["spark"] = false,
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
				["desaturate"] = false,
			},
		},
		["HvyJzKiq3wv"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1570261999,
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
				["anchorFrameType"] = "SCREEN",
				["width"] = 35,
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
		["b)x2CoRZ7tp"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1570261999,
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
							["use_remaining"] = false,
							["type"] = "status",
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
				["glowYOffset"] = 0,
				["width"] = 49,
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
			["lastUpdate"] = 1570261999,
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
				["glowYOffset"] = 0,
				["regionType"] = "icon",
				["width"] = 49,
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
		["4fDAaZR217H"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1570261999,
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
				["glowYOffset"] = 0,
				["regionType"] = "icon",
				["anchorFrameType"] = "SCREEN",
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
		["XJR7hKBCnbG"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1570261999,
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
							["health"] = "0",
							["spellIds"] = {
							},
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
				["selfPoint"] = "CENTER",
				["backdropInFront"] = false,
				["parent"] = "Paladin 2.0",
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
						["text_visible"] = false,
						["text_fontType"] = "None",
						["text_anchorPoint"] = "INNER_RIGHT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontSize"] = 15,
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
						["text_visible"] = true,
						["text_fontType"] = "None",
						["text_anchorPoint"] = "INNER_LEFT",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontSize"] = 18,
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
						["text_visible"] = false,
						["text_fontType"] = "None",
						["text_anchorPoint"] = "ICON_CENTER",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontSize"] = 12,
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
					["faction"] = {
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
				["desaturate"] = false,
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
		["J36Gfr1w38C"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1570261999,
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
		["Zn1irtWqaTG"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1570261999,
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
				["selfPoint"] = "CENTER",
				["backdropInFront"] = false,
				["authorOptions"] = {
				},
				["barColor"] = {
					0, -- [1]
					0.23529411764706, -- [2]
					1, -- [3]
					0, -- [4]
				},
				["stickyDuration"] = false,
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
				["auto"] = true,
				["id"] = "Paladin - 5Second+ManaRegen",
				["sparkHeight"] = 35,
				["texture"] = "ElvUI Blank",
				["spark"] = true,
				["zoom"] = 0,
				["semver"] = "1.0.7",
				["tocversion"] = 11302,
				["sparkHidden"] = "FULL",
				["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
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
				["desaturate"] = false,
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
		["WxGR7Jn4myz"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1570261999,
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
				["glowYOffset"] = 0,
				["width"] = 35,
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
		["Kj2Cgc0DOKL"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1570261999,
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
		["c7nB(n8TlUf"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1570261999,
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
						["text_visible"] = true,
						["text_fontType"] = "OUTLINE",
						["text_anchorPoint"] = "CENTER",
						["anchorYOffset"] = 0,
						["text_justify"] = "CENTER",
						["rotateText"] = "NONE",
						["anchorXOffset"] = 0,
						["text_fontSize"] = 26,
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
				["glowYOffset"] = 0,
				["anchorFrameType"] = "SCREEN",
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
		["zxFkI03OXw4"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1570261999,
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
				["anchorFrameType"] = "SCREEN",
				["width"] = 35,
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
		["BDQvI8HtAOa"] = {
			["skippedVersions"] = {
			},
			["source"] = "import",
			["lastUpdate"] = 1570261999,
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
							["unevent"] = "auto",
							["subeventSuffix"] = "_CAST_START",
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
	},
	["frame"] = {
		["xOffset"] = -437.445190429688,
		["width"] = 830,
		["height"] = 665.000122070313,
		["yOffset"] = -61.2777709960938,
	},
	["editor_theme"] = "Monokai",
}

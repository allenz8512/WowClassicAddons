--------------------
-- Levels Cooking --
--------------------
MTSL_DATA["Cooking"]["levels"] = {
	{
		["trainers"] = {
			["price"] = 100,
			["sources"] = {
				1355, -- [1]
				1382, -- [2]
				1430, -- [3]
				1699, -- [4]
				3026, -- [5]
				3067, -- [6]
				3087, -- [7]
				3399, -- [8]
				4210, -- [9]
				4552, -- [10]
				5159, -- [11]
				5482, -- [12]
				6286, -- [13]
				8306, -- [14]
			},
		},
		["name"] = {
			["German"] = MTSLUI_LOCALES_PROFESSION_RANKS["German"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["German"]["Cooking"],
			["Spanish"] = MTSLUI_LOCALES_PROFESSION_RANKS["Spanish"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Spanish"]["Cooking"],
			["Russian"] = MTSLUI_LOCALES_PROFESSION_RANKS["Russian"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Russian"]["Cooking"],
			["Portuguese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Portuguese"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Portuguese"]["Cooking"],
			["French"] = MTSLUI_LOCALES_PROFESSION_RANKS["French"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["French"]["Cooking"],
			["English"] = MTSLUI_LOCALES_PROFESSION_RANKS["English"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["English"]["Cooking"],
			["Korean"] = MTSLUI_LOCALES_PROFESSION_RANKS["Korean"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Korean"]["Cooking"],
			["Chinese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Chinese"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Chinese"]["Cooking"],
		},
		["min_skill"] = 0,
		["id"] = 2550,
		["max_skill"] = 75,
	}, -- [1]
	{
		["trainers"] = {
			["price"] = 500,
			["sources"] = {
				1355, -- [1]
				1382, -- [2]
				1430, -- [3]
				1699, -- [4]
				3026, -- [5]
				3067, -- [6]
				3087, -- [7]
				3399, -- [8]
				4210, -- [9]
				4552, -- [10]
				5159, -- [11]
				5482, -- [12]
				6286, -- [13]
				8306, -- [14]
			},
		},
		["name"] = {
			["German"] = MTSLUI_LOCALES_PROFESSION_RANKS["German"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["German"]["Cooking"],
			["Spanish"] = MTSLUI_LOCALES_PROFESSION_RANKS["Spanish"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Spanish"]["Cooking"],
			["Russian"] = MTSLUI_LOCALES_PROFESSION_RANKS["Russian"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Russian"]["Cooking"],
			["Portuguese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Portuguese"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Portuguese"]["Cooking"],
			["French"] = MTSLUI_LOCALES_PROFESSION_RANKS["French"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["French"]["Cooking"],
			["English"] = MTSLUI_LOCALES_PROFESSION_RANKS["English"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["English"]["Cooking"],
			["Korean"] = MTSLUI_LOCALES_PROFESSION_RANKS["Korean"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Korean"]["Cooking"],
			["Chinese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Chinese"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Chinese"]["Cooking"],
		},
		["min_skill"] = 50,
		["id"] = 3102,
		["max_skill"] = 150,
	}, -- [2]
	{
		["name"] = {
			["German"] = MTSLUI_LOCALES_PROFESSION_RANKS["German"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["German"]["Cooking"],
			["Spanish"] = MTSLUI_LOCALES_PROFESSION_RANKS["Spanish"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Spanish"]["Cooking"],
			["Russian"] = MTSLUI_LOCALES_PROFESSION_RANKS["Russian"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Russian"]["Cooking"],
			["Portuguese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Portuguese"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Portuguese"]["Cooking"],
			["French"] = MTSLUI_LOCALES_PROFESSION_RANKS["French"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["French"]["Cooking"],
			["English"] = MTSLUI_LOCALES_PROFESSION_RANKS["English"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["English"]["Cooking"],
			["Korean"] = MTSLUI_LOCALES_PROFESSION_RANKS["Korean"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Korean"]["Cooking"],
			["Chinese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Chinese"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Chinese"]["Cooking"],
		},
		["min_skill"] = 125,
		["id"] = 3413,
		["max_skill"] = 225,
		["item"] = 16072,
	}, -- [3]
	{
		["min_xp_level"] = 35,
		["name"] = {
			["German"] = MTSLUI_LOCALES_PROFESSION_RANKS["German"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["German"]["Cooking"],
			["Spanish"] = MTSLUI_LOCALES_PROFESSION_RANKS["Spanish"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Spanish"]["Cooking"],
			["Russian"] = MTSLUI_LOCALES_PROFESSION_RANKS["Russian"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Russian"]["Cooking"],
			["Portuguese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Portuguese"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Portuguese"]["Cooking"],
			["French"] = MTSLUI_LOCALES_PROFESSION_RANKS["French"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["French"]["Cooking"],
			["English"] = MTSLUI_LOCALES_PROFESSION_RANKS["English"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["English"]["Cooking"],
			["Korean"] = MTSLUI_LOCALES_PROFESSION_RANKS["Korean"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Korean"]["Cooking"],
			["Chinese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Chinese"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Chinese"]["Cooking"],
		},
		["min_skill"] = 200,
		["id"] = 18260,
		["quests"] = {
			6610, -- [1]
		},
		["max_skill"] = 300,
	}, -- [4]
}
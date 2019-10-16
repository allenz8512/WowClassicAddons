--------------------
-- Levels Alchemy --
--------------------
MTSL_DATA["Alchemy"]["levels"] = {
	{
		["trainers"] = {
			["price"] = 10,
			["sources"] = {
				1215, -- [1]
				1246, -- [2]
				1386, -- [3]
				1470, -- [4]
				2132, -- [5]
				2391, -- [6]
				3009, -- [7]
				3184, -- [8]
				3347, -- [9]
				3603, -- [10]
				3964, -- [11]
				4160, -- [12]
				4609, -- [13]
				4611, -- [14]
				4900, -- [15]
				5177, -- [16]
				5499, -- [17]
				5500, -- [18]
				7948, -- [19]
				11041, -- [20]
				11042, -- [21]
				11044, -- [22]
				11046, -- [23]
				11047, -- [24]
			},
		},
		["name"] = {
			["German"] = MTSLUI_LOCALES_PROFESSION_RANKS["German"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["German"]["Alchemy"],
			["Spanish"] = MTSLUI_LOCALES_PROFESSION_RANKS["Spanish"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Spanish"]["Alchemy"],
			["Russian"] = MTSLUI_LOCALES_PROFESSION_RANKS["Russian"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Russian"]["Alchemy"],
			["Portuguese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Portuguese"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Portuguese"]["Alchemy"],
			["French"] = MTSLUI_LOCALES_PROFESSION_RANKS["French"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["French"]["Alchemy"],
			["English"] = MTSLUI_LOCALES_PROFESSION_RANKS["English"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["English"]["Alchemy"],
			["Korean"] = MTSLUI_LOCALES_PROFESSION_RANKS["Korean"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Korean"]["Alchemy"],
			["Chinese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Chinese"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Chinese"]["Alchemy"],
		},
		["min_skill"] = 0,
		["id"] = 2259,
		["max_skill"] = 75,
		["min_xp_level"] = 5,
	}, -- [1]
	{
		["trainers"] = {
			["price"] = 500,
			["sources"] = {
				1386, -- [1]
				2391, -- [2]
				3347, -- [3]
				3964, -- [4]
				4160, -- [5]
				4609, -- [6]
				4611, -- [7]
				4900, -- [8]
				5177, -- [9]
				5499, -- [10]
				7948, -- [11]
				11042, -- [12]
			},
		},
		["name"] = {
			["German"] = MTSLUI_LOCALES_PROFESSION_RANKS["German"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["German"]["Alchemy"],
			["Spanish"] = MTSLUI_LOCALES_PROFESSION_RANKS["Spanish"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Spanish"]["Alchemy"],
			["Russian"] = MTSLUI_LOCALES_PROFESSION_RANKS["Russian"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Russian"]["Alchemy"],
			["Portuguese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Portuguese"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Portuguese"]["Alchemy"],
			["French"] = MTSLUI_LOCALES_PROFESSION_RANKS["French"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["French"]["Alchemy"],
			["English"] = MTSLUI_LOCALES_PROFESSION_RANKS["English"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["English"]["Alchemy"],
			["Korean"] = MTSLUI_LOCALES_PROFESSION_RANKS["Korean"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Korean"]["Alchemy"],
			["Chinese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Chinese"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Chinese"]["Alchemy"],
		},
		["min_skill"] = 50,
		["id"] = 3101,
		["max_skill"] = 150,
	}, -- [2]
	{
		["trainers"] = {
			["price"] = 5000,
			["sources"] = {
				1386, -- [1]
				4160, -- [2]
				4611, -- [3]
				7948, -- [4]
			},
		},
		["name"] = {
			["German"] = MTSLUI_LOCALES_PROFESSION_RANKS["German"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["German"]["Alchemy"],
			["Spanish"] = MTSLUI_LOCALES_PROFESSION_RANKS["Spanish"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Spanish"]["Alchemy"],
			["Russian"] = MTSLUI_LOCALES_PROFESSION_RANKS["Russian"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Russian"]["Alchemy"],
			["Portuguese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Portuguese"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Portuguese"]["Alchemy"],
			["French"] = MTSLUI_LOCALES_PROFESSION_RANKS["French"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["French"]["Alchemy"],
			["English"] = MTSLUI_LOCALES_PROFESSION_RANKS["English"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["English"]["Alchemy"],
			["Korean"] = MTSLUI_LOCALES_PROFESSION_RANKS["Korean"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Korean"]["Alchemy"],
			["Chinese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Chinese"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Chinese"]["Alchemy"],
		},
		["min_skill"] = 125,
		["id"] = 3464,
		["max_skill"] = 225,
	}, -- [3]
	{
		["min_xp_level"] = 35,
		["trainers"] = {
			["price"] = 50000,
			["sources"] = {
				1386, -- [1]
				7948, -- [2]
			},
		},
		["name"] = {
			["German"] = MTSLUI_LOCALES_PROFESSION_RANKS["German"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["German"]["Alchemy"],
			["Spanish"] = MTSLUI_LOCALES_PROFESSION_RANKS["Spanish"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Spanish"]["Alchemy"],
			["Russian"] = MTSLUI_LOCALES_PROFESSION_RANKS["Russian"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Russian"]["Alchemy"],
			["Portuguese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Portuguese"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Portuguese"]["Alchemy"],
			["French"] = MTSLUI_LOCALES_PROFESSION_RANKS["French"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["French"]["Alchemy"],
			["English"] = MTSLUI_LOCALES_PROFESSION_RANKS["English"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["English"]["Alchemy"],
			["Korean"] = MTSLUI_LOCALES_PROFESSION_RANKS["Korean"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Korean"]["Alchemy"],
			["Chinese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Chinese"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Chinese"]["Alchemy"],
		},
		["min_skill"] = 200,
		["id"] = 11611,
		["max_skill"] = 300,
	}, -- [4]
}
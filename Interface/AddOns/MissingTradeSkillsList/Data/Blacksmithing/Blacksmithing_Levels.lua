--------------------------
-- Levels Blacksmithing --
--------------------------
MTSL_DATA["Blacksmithing"]["levels"] = {
	{
		["trainers"] = {
			["price"] = 10,
			["sources"] = {
				514, -- [1]
				957, -- [2]
				1241, -- [3]
				1383, -- [4]
				2836, -- [5]
				2998, -- [6]
				3174, -- [7]
				3355, -- [8]
				3557, -- [9]
				4258, -- [10]
				4605, -- [11]
				5511, -- [12]
				6299, -- [13]
				10266, -- [14]
				10276, -- [15]
				10277, -- [16]
				10278, -- [17]
			},
		},
		["name"] = {
			["German"] = MTSLUI_LOCALES_PROFESSION_RANKS["German"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["German"]["Blacksmithing"],
			["Spanish"] = MTSLUI_LOCALES_PROFESSION_RANKS["Spanish"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Spanish"]["Blacksmithing"],
			["Russian"] = MTSLUI_LOCALES_PROFESSION_RANKS["Russian"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Russian"]["Blacksmithing"],
			["Portuguese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Portuguese"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Portuguese"]["Blacksmithing"],
			["French"] = MTSLUI_LOCALES_PROFESSION_RANKS["French"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["French"]["Blacksmithing"],
			["English"] = MTSLUI_LOCALES_PROFESSION_RANKS["English"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["English"]["Blacksmithing"],
			["Korean"] = MTSLUI_LOCALES_PROFESSION_RANKS["Korean"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Korean"]["Blacksmithing"],
			["Chinese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Chinese"]["Apprentice"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Chinese"]["Blacksmithing"],
		},
		["min_skill"] = 0,
		["id"] = 2018,
		["max_skill"] = 75,
		["min_xp_level"] = 5,
	}, -- [1]
	{
		["trainers"] = {
			["price"] = 500,
			["sources"] = {
				1383, -- [1]
				2836, -- [2]
				2998, -- [3]
				3136, -- [4]
				3355, -- [5]
				3478, -- [6]
				4258, -- [7]
				4596, -- [8]
				5511, -- [9]
				10276, -- [10]
			},
		},
		["name"] = {
			["German"] = MTSLUI_LOCALES_PROFESSION_RANKS["German"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["German"]["Blacksmithing"],
			["Spanish"] = MTSLUI_LOCALES_PROFESSION_RANKS["Spanish"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Spanish"]["Blacksmithing"],
			["Russian"] = MTSLUI_LOCALES_PROFESSION_RANKS["Russian"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Russian"]["Blacksmithing"],
			["Portuguese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Portuguese"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Portuguese"]["Blacksmithing"],
			["French"] = MTSLUI_LOCALES_PROFESSION_RANKS["French"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["French"]["Blacksmithing"],
			["English"] = MTSLUI_LOCALES_PROFESSION_RANKS["English"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["English"]["Blacksmithing"],
			["Korean"] = MTSLUI_LOCALES_PROFESSION_RANKS["Korean"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Korean"]["Blacksmithing"],
			["Chinese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Chinese"]["Journeyman"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Chinese"]["Blacksmithing"],
		},
		["min_skill"] = 50,
		["id"] = 3100,
		["max_skill"] = 150,
	}, -- [2]
	{
		["trainers"] = {
			["price"] = 5000,
			["sources"] = {
				2836, -- [1]
				3355, -- [2]
				4258, -- [3]
			},
		},
		["name"] = {
			["German"] = MTSLUI_LOCALES_PROFESSION_RANKS["German"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["German"]["Blacksmithing"],
			["Spanish"] = MTSLUI_LOCALES_PROFESSION_RANKS["Spanish"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Spanish"]["Blacksmithing"],
			["Russian"] = MTSLUI_LOCALES_PROFESSION_RANKS["Russian"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Russian"]["Blacksmithing"],
			["Portuguese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Portuguese"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Portuguese"]["Blacksmithing"],
			["French"] = MTSLUI_LOCALES_PROFESSION_RANKS["French"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["French"]["Blacksmithing"],
			["English"] = MTSLUI_LOCALES_PROFESSION_RANKS["English"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["English"]["Blacksmithing"],
			["Korean"] = MTSLUI_LOCALES_PROFESSION_RANKS["Korean"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Korean"]["Blacksmithing"],
			["Chinese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Chinese"]["Expert"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Chinese"]["Blacksmithing"],
		},
		["min_skill"] = 125,
		["id"] = 3538,
		["max_skill"] = 225,
	}, -- [3]
	{
		["min_xp_level"] = 35,
		["trainers"] = {
			["price"] = 50000,
			["sources"] = {
				2836, -- [1]
			},
		},
		["name"] = {
			["German"] = MTSLUI_LOCALES_PROFESSION_RANKS["German"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["German"]["Blacksmithing"],
			["Spanish"] = MTSLUI_LOCALES_PROFESSION_RANKS["Spanish"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Spanish"]["Blacksmithing"],
			["Russian"] = MTSLUI_LOCALES_PROFESSION_RANKS["Russian"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Russian"]["Blacksmithing"],
			["Portuguese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Portuguese"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Portuguese"]["Blacksmithing"],
			["French"] = MTSLUI_LOCALES_PROFESSION_RANKS["French"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["French"]["Blacksmithing"],
			["English"] = MTSLUI_LOCALES_PROFESSION_RANKS["English"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["English"]["Blacksmithing"],
			["Korean"] = MTSLUI_LOCALES_PROFESSION_RANKS["Korean"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Korean"]["Blacksmithing"],
			["Chinese"] = MTSLUI_LOCALES_PROFESSION_RANKS["Chinese"]["Artisan"] .. " " .. MTSLUI_LOCALES_PROFESSIONS["Chinese"]["Blacksmithing"],
		},
		["min_skill"] = 200,
		["id"] = 9785,
		["max_skill"] = 300,
	}, -- [4]
}
--------------------------------------
-- Items First Aid
--------------------------------------
MTSL_DATA["First Aid"]["items"] = {
	{
		["phase"] = 1,
		["id"] = 6454,
		["drops"] = {
			["mobs_range"] = {
				["min_xp_level"] = 10,
				["max_xp_level"] = 37,
			},
		},
		["name"] = {
			["Russian"] = "Учебник: сильное противоядие",
			["Portuguese"] = "Manual: Antipeçonha Forte",
			["Chinese"] = "手册：强力抗毒药剂",
			["Spanish"] = "Manual: antídoto fuerte",
			["French"] = "Manuel : Sérum anti-venin supérieur",
			["German"] = "Handbuch: Starkes Gegengift",
			["Korean"] = "처방전: 강한 해독제",
			["English"] = "Manual: Strong Anti-Venom",
		},
		["quality"] = "uncommon",
	}, -- [1]
	{
		["vendors"] = {
			["sources"] = {
				2805, -- [1]
				13476, -- [2]
			},
			["price"] = 10000,
		},
		["id"] = 16084,
		["name"] = {
			["Russian"] = "Умелец первой помощи: снимая покровы",
			["Portuguese"] = "Socorrista Perito &ndash; Enfaixado",
			["Chinese"] = "中级急救教材 - 绷带缚体",
			["Spanish"] = "Primeros auxilios para expertos: Entre vendas",
			["French"] = "Expert en premiers soins - Sous les pansements",
			["German"] = "Erste Hilfe für Experten - Verbinden, aber richtig",
			["Korean"] = "고급 응급치료서",
			["English"] = "Expert First Aid - Under Wraps",
		},
		["quality"] = "common",
		["phase"] = 1,
	}, -- [2]
	{
		["vendors"] = {
			["sources"] = {
				2805, -- [1]
				13476, -- [2]
			},
			["price"] = 2200,
		},
		["id"] = 16112,
		["name"] = {
			["Russian"] = "Учебник: плотные шелковые бинты",
			["Portuguese"] = "Manual: Bandagem Grossa de Seda",
			["Chinese"] = "手册：厚丝质绷带",
			["Spanish"] = "Manual: venda de seda pesada",
			["French"] = "Manuel : Bandage épais en soie",
			["German"] = "Handbuch: Schwerer Seidenverband",
			["Korean"] = "처방전: 두꺼운 비단 붕대",
			["English"] = "Manual: Heavy Silk Bandage",
		},
		["quality"] = "common",
		["phase"] = 1,
	}, -- [3]
	{
		["vendors"] = {
			["sources"] = {
				2805, -- [1]
				13476, -- [2]
			},
			["price"] = 5000,
		},
		["id"] = 16113,
		["name"] = {
			["Russian"] = "Учебник: бинты из магической ткани",
			["Portuguese"] = "Manual: Bandagem de Magitrama",
			["Chinese"] = "手册：魔纹绷带",
			["Spanish"] = "Manual: venda de paño mágico",
			["French"] = "Manuel : Bandage en tisse-mage",
			["German"] = "Handbuch: Magiestoffverband",
			["Korean"] = "처방전: 마법 붕대",
			["English"] = "Manual: Mageweave Bandage",
		},
		["quality"] = "common",
		["phase"] = 1,
	}, -- [4]
	{
		["vendors"] = {
			["sources"] = {
				10856, -- [1]
				10857, -- [2]
				11536, -- [3]
			},
			["price"] = 100000,
		},
		["id"] = 19442,
		["name"] = {
			["Russian"] = "Формула: мощное противоядие",
			["Portuguese"] = "Fórmula: Antipeçonha Poderoso",
			["Chinese"] = "配方：特效抗毒药剂",
			["Spanish"] = "Fórmula: antídoto potente",
			["French"] = "Formule : Anti-venin puissant",
			["German"] = "Formel: Mächtiges Gegengift",
			["Korean"] = "처방전: 강력한 해독제",
			["English"] = "Formula: Powerful Anti-Venom",
		},
		["quality"] = "common",
		["phase"] = 3,
	}, -- [5]
}

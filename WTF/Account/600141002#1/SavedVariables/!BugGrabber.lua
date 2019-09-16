
BugGrabberDB = {
	["session"] = 128,
	["lastSanitation"] = 3,
	["errors"] = {
		{
			["message"] = "[string \"MonkeyQuestFrame:OnUpdate\"]:1: attempt to call global 'MonkeyQuest_OnUpdate' (a nil value)",
			["time"] = "2019/09/10 12:09:47",
			["locals"] = "self = MonkeyQuestFrame {\n 0 = <userdata>\n}\nelapsed = 0.010000\n(*temporary) = nil\n(*temporary) = MonkeyQuestFrame {\n 0 = <userdata>\n}\n(*temporary) = 0.010000\n(*temporary) = \"attempt to call global 'MonkeyQuest_OnUpdate' (a nil value)\"\n",
			["stack"] = "[string \"*:OnUpdate\"]:1: in function <[string \"*:OnUpdate\"]:1>",
			["session"] = 77,
			["counter"] = 635,
		}, -- [1]
		{
			["message"] = "integer overflow attempting to store 2207119077",
			["time"] = "2019/09/10 23:25:38",
			["locals"] = "InCombatSkipped",
			["stack"] = "[C]: in function `format'\n...\\Libraries\\LibClassicHealComm\\LibClassicHealComm.lua:1727: in function `?'\n...\\Libraries\\LibClassicHealComm\\LibClassicHealComm.lua:2073: in function <...\\Libraries\\LibClassicHealComm\\LibClassicHealComm.lua:2072>",
			["session"] = 85,
			["counter"] = 1,
		}, -- [2]
		{
			["message"] = "integer overflow attempting to store 2207119877",
			["time"] = "2019/09/10 23:25:40",
			["locals"] = "InCombatSkipped",
			["stack"] = "[C]: in function `format'\n...\\Libraries\\LibClassicHealComm\\LibClassicHealComm.lua:1727: in function `?'\n...\\Libraries\\LibClassicHealComm\\LibClassicHealComm.lua:2073: in function <...\\Libraries\\LibClassicHealComm\\LibClassicHealComm.lua:2072>",
			["session"] = 85,
			["counter"] = 1,
		}, -- [3]
		{
			["message"] = "integer overflow attempting to store 2208551055",
			["time"] = "2019/09/10 23:49:30",
			["locals"] = "InCombatSkipped",
			["stack"] = "[C]: in function `format'\n...\\Libraries\\LibClassicHealComm\\LibClassicHealComm.lua:1727: in function `?'\n...\\Libraries\\LibClassicHealComm\\LibClassicHealComm.lua:2073: in function <...\\Libraries\\LibClassicHealComm\\LibClassicHealComm.lua:2072>",
			["session"] = 85,
			["counter"] = 1,
		}, -- [4]
		{
			["message"] = "integer overflow attempting to store 2208551855",
			["time"] = "2019/09/10 23:49:32",
			["locals"] = "InCombatSkipped",
			["stack"] = "[C]: in function `format'\n...\\Libraries\\LibClassicHealComm\\LibClassicHealComm.lua:1727: in function `?'\n...\\Libraries\\LibClassicHealComm\\LibClassicHealComm.lua:2073: in function <...\\Libraries\\LibClassicHealComm\\LibClassicHealComm.lua:2072>",
			["session"] = 85,
			["counter"] = 1,
		}, -- [5]
		{
			["message"] = "Couldn't open Interface\\AddOns\\BadBoy\\Libs\\LibChatAnims-2\\LibChatAnims.xml",
			["time"] = "2019/09/13 22:45:52",
			["session"] = 105,
			["counter"] = 8,
		}, -- [6]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] 插件 'ItemRack' 尝试调用保护功能 'AttemptToSaveBindings()'。",
			["time"] = "2019/09/15 01:25:14",
			["locals"] = "InCombatSkipped",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[C]: in function `AttemptToSaveBindings'\nInterface\\AddOns\\ItemRack\\ItemRack-3.11.nil.lua:1829: in function `SetSetBindings'\nInterface\\AddOns\\ItemRack\\ItemRack-3.11.nil.lua:385: in function `InitCore'\nInterface\\AddOns\\ItemRack\\ItemRack-3.11.nil.lua:187: in function `func'\nInterface\\AddOns\\ItemRack\\ItemRack-3.11.nil.lua:797: in function `OnUpdate'\n[string \"*:OnUpdate\"]:1: in function <[string \"*:OnUpdate\"]:1>",
			["session"] = 110,
			["counter"] = 1,
		}, -- [7]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] 插件 'Atlas' 尝试调用保护功能 'MultiBarBottomLeft:SetFrameStrata()'。",
			["time"] = "2019/09/13 23:51:04",
			["locals"] = "InCombatSkipped",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[C]: in function `SetFrameStrata'\nInterface\\AddOns\\Atlas\\Atlas-1.0(1.13.0).lua:379: in function `Atlas_Init'\nInterface\\AddOns\\Atlas\\Atlas-1.0(1.13.0).lua:326: in function `Atlas_OnEvent'\n[string \"*:OnEvent\"]:1: in function <[string \"*:OnEvent\"]:1>\n[C]: ?\n[C]: in function `LoadAddOn'\nInterface\\FrameXML\\UIParent.lua:353: in function `UIParentLoadAddOn'\nInterface\\FrameXML\\UIParent.lua:403: in function `RaidFrame_LoadUI'\nInterface\\FrameXML\\RaidFrame.lua:59: in function <Interface\\FrameXML\\RaidFrame.lua:50>",
			["session"] = 116,
			["counter"] = 2,
		}, -- [8]
		{
			["message"] = "...e\\AddOns\\Quartz\\libs\\AceBucket-3.0\\AceBucket-3.0-4.lua:209: attempt to index upvalue 'AceEvent' (a nil value)",
			["time"] = "2019/09/10 22:52:30",
			["stack"] = "...e\\AddOns\\Quartz\\libs\\AceBucket-3.0\\AceBucket-3.0-4.lua:209: in function `UnregisterBucket'\n...e\\AddOns\\Quartz\\libs\\AceBucket-3.0\\AceBucket-3.0-4.lua:233: in function `UnregisterAllBuckets'\n...e\\AddOns\\Quartz\\libs\\AceBucket-3.0\\AceBucket-3.0-4.lua:259: in function <...e\\AddOns\\Quartz\\libs\\AceBucket-3.0\\AceBucket-3.0.lua:258>\n[C]: ?\n...xternal\\Wildpants\\libs\\AceAddon-3.0\\AceAddon-3.0-12.lua:70: in function <...xternal\\Wildpants\\libs\\AceAddon-3.0\\AceAddon-3.0.lua:65>\n...xternal\\Wildpants\\libs\\AceAddon-3.0\\AceAddon-3.0-12.lua:569: in function <...xternal\\Wildpants\\libs\\AceAddon-3.0\\AceAddon-3.0.lua:555>\n(tail call): ?\n(tail call): ?\n...Details\\Libs\\ThreatClassic-1.0\\ThreatClassic-1.0-4.lua:245: in function `?'\n...ssic\\lib\\CallbackHandler-1.0\\CallbackHandler-1.0-7.lua:119: in function <...ssic\\lib\\CallbackHandler-1.0\\CallbackHandler-1.0.lua:119>\n[C]: ?\n...ssic\\lib\\CallbackHandler-1.0\\CallbackHandler-1.0-7.lua:29: in function <...ssic\\lib\\CallbackHandler-1.0\\CallbackHandler-1.0.lua:25>\n...ssic\\lib\\CallbackHandler-1.0\\CallbackHandler-1.0-7.lua:64: in function `Fire'\n...xternal\\Wildpants\\libs\\AceEvent-3.0\\AceEvent-3.0-4.lua:120: in function <...xternal\\Wildpants\\libs\\AceEvent-3.0\\AceEvent-3.0.lua:119>",
			["session"] = 116,
			["counter"] = 4,
		}, -- [9]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] 插件 'Bagnon' 尝试调用保护功能 'PutItemInBag()'。",
			["time"] = "2019/09/15 23:47:44",
			["locals"] = "InCombatSkipped",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[C]: in function `PutItemInBag'\n...\\AddOns\\Bagnon\\external\\Wildpants\\components\\bag-0.lua:93: in function <...\\AddOns\\Bagnon\\external\\Wildpants\\components\\bag.lua:80>",
			["session"] = 116,
			["counter"] = 1,
		}, -- [10]
		{
			["message"] = "...rface\\AddOns\\CensusPlusClassic\\CensusPlusClassic-1.13.2.lua:3300: attempt to perform arithmetic on local 'lastSeenTime' (a nil value)",
			["time"] = "2019/09/15 19:35:37",
			["locals"] = "nDays = 30\nsServer = false\npruneTime = 2592000\n(for generator) = <function> defined =[C]:-1\n(for state) = <table> {\n 4497_碧玉矿洞 = <table> {\n }\n}\n(for control) = \"4497_碧玉矿洞\"\nrealmName = \"4497_碧玉矿洞\"\nrealmDatabase = <table> {\n Alliance = <table> {\n }\n}\n(for generator) = <function> defined =[C]:-1\n(for state) = <table> {\n Alliance = <table> {\n }\n}\n(for control) = \"Alliance\"\nfactionName = \"Alliance\"\nfactionDatabase = <table> {\n 人类 = <table> {\n }\n 亡灵 = <table> {\n }\n 暗夜精灵 = <table> {\n }\n 巨魔 = <table> {\n }\n 侏儒 = <table> {\n }\n 矮人 = <table> {\n }\n 兽人 = <table> {\n }\n}\n(for generator) = <function> defined =[C]:-1\n(for state) = <table> {\n 人类 = <table> {\n }\n 亡灵 = <table> {\n }\n 暗夜精灵 = <table> {\n }\n 巨魔 = <table> {\n }\n 侏儒 = <table> {\n }\n 矮人 = <table> {\n }\n 兽人 = <table> {\n }\n}\n(for control) = \"人类\"\nraceName = \"人类\"\nraceDatabase = <table> {\n 潜行者 = <table> {\n }\n 圣骑士 = <table> {\n }\n 战士 = <table> {\n }\n 法师 = <table> {\n }\n 术士 = <table> {\n }\n 牧师 = <table> {\n }\n}\n(for generator) = <function> defined =[C]:-1\n(for state) = <table> {\n 潜行者 = <table> {\n }\n 圣骑士 = <table> {\n }\n 战士 = <table> {\n }\n 法师 = <table> {\n }\n 术士 = <table> {\n }\n 牧师 = <table> {\n }\n}\n(for control) = \"潜行者\"\nclassName = \"潜行者\"\nclassDatabase = <table> {\n 辉映 = <table> {\n }\n 将夜 = <table> {\n }\n 黑桐谷歌 = <table> {\n }\n 伊薇丶弗莱 = <table> {\n }\n 邪恶小海龟 = <table> {\n }\n Jasmo = <table> {\n }\n 飘逸如哥 = <table> {\n }\n 一捅八方 = <table> {\n }\n 斯达巴克斯 = <table> {\n }\n 梦回千年 = <table> {\n }\n 怀旧经典 = <table> {\n }\n 小花猪 = <table> {\n }\n 赤色慧星 = <table> {\n }\n 幽魂之心 = <table> {\n }\n 詹老爷丶 = <table> {\n }\n 野蛮灵丹 = <table> {\n }\n 天九刺 = <table> {\n }\n 鲍师傅 = <table> {\n }\n 卿本佳人丶 = <table> {\n }\n 假不假 = <table> {\n }\n 余笙丶 = <table> {\n }\n Changer = <table> {\n }\n 橘子汽水猫 = <table> {\n }\n 尤莉娅 = <table> {\n }\n 焊武帝 = <table> {\n }\n 花名小蘑菇 = <table> {\n }\n 蒙眼抄人 = <table> {\n }\n 犽塚 = <table> {\n }\n 黑色珍珠 = <table> {\n }\n 露西娅 = <table> {\n }\n 蓝天流云 = <table> {\n }\n 筑梦之旅 = <table> {\n }\n 小小敏儿 = <table> {\n }\n 雷云 = <table> {\n }\n 太妹 = <table> {\n }\n 罗杰摩尔 = <table> {\n }\n Troubleo = <table> {\n }\n 稳你笨七 = <table> {\n }\n Leoneven = <table> {\n }\n 奥术水晶 = <table> {\n }\n 花酒 = <table> {\n }\n 寻找天使 = <table> {\n }\n 红苕 = <table> {\n }\n 范达尔丶锅盔 = <table> {\n }\n Ssdcx = <table> {\n }\n 指尖书君名 = <table> {\n }\n Jeiks = <table> {\n }\n 水一轩 = <table> {\n }\n 阿熊家的行者 = <table> {\n }\n 夜下幽魂 = <table> {\n }\n 来打我呀笨淡 = <table> {\n }\n Niwor = <table> {\n }\n 华府九五二七 = <table> {\n }\n Lbx = <table> {\n }\n 空空如影 = <table> {\n }\n 寒小巫 = <table> {\n }\n 内酷太难 = <table> {\n }\n 四字有姓 = <table> {\n }\n 小太刀 = <table> {\n }\n 只为伊人 = <table> {\n }\n 一个刺客 = <table> {\n }\n 可口卖萌 = <table> {\n }\n 忆之霜 = <table> {\n }\n 安苏娜洛薩 = <table> {\n }\n 三千明月落 = <table> {\n }\n 酸柠檬 = <table> {\n }\n 偷心的賊 = <table> {\n }\n Ayo = <table> {\n }\n 乄范克里夫灬 = <table> {\n }\n 项楽 = <table> {\n }\n 毒犽 = <table> {\n }\n 小八十二 = <table> {\n }\n 跳跃灵魂 = <table> {\n }\n 战匡 = <table> {\n }\n 凌羽 = <table> {\n }\n 初夜给了谁 = <table> {\n }\n 一本稻 = <table> {\n }\n 百合的性感 = <table> {\n }\n 血匕 = <table> {\n }\n 送你回墓地 = <table> {\n }\n 夜里的耗子 = <table> {\n }\n 呢喃低语 = <table> {\n }\n 圣光羽翼 = <table> {\n }\n 娇喘娇喘 = <table> {\n }\n 猫里奥 = <table> {\n }\n Fsrfawfsfedf = <table> {\n }\n 军情七处斥候 = <table> {\n }\n 五千米要及格 = <table> {\n }\n 军情特使 = <table> {\n }\n 孤芳不自赏 = <table> {\n }\n 赫耳丶墨斯 = <table> {\n }\n 卖裆佬 = <table> {\n }\n 我爱萤火虫 = <table> {\n }\n Annabella = <table> {\n }\n 超级爆米花 = <table> {\n }\n 暗色检测 = <table> {\n }\n 猫南北 = <table> {\n }\n 刘老�",
			["stack"] = "...rface\\AddOns\\CensusPlusClassic\\CensusPlusClassic-1.13.2.lua:3300: in function `CENSUSPLUS_PRUNEData'\n[string \"*:OnClick\"]:1: in function <[string \"*:OnClick\"]:1>",
			["session"] = 117,
			["counter"] = 3,
		}, -- [11]
		{
			["message"] = "Frame RecipeRadarAvailabilityTooltip: Unknown script element OnTooltipAddMoney",
			["session"] = 124,
			["time"] = "2019/09/16 10:46:52",
			["counter"] = 6,
		}, -- [12]
		{
			["message"] = "Frame RecipeRadarAvailabilityTooltip: Unknown script element OnTooltipCleared",
			["session"] = 124,
			["time"] = "2019/09/16 10:46:52",
			["counter"] = 6,
		}, -- [13]
		{
			["message"] = "Frame RecipeRadarAvailabilityTooltip: Unknown script element OnTooltipSetDefaultAnchor",
			["session"] = 124,
			["time"] = "2019/09/16 10:46:52",
			["counter"] = 8,
		}, -- [14]
		{
			["message"] = "Interface\\AddOns\\RecipeRadarClassic\\SkillDB.lua:101: attempt to index field '?' (a nil value)",
			["time"] = "2019/09/16 10:47:07",
			["locals"] = "prof_type = \"trade\"\nprofs = <table> {\n Fishing = <table> {\n }\n 工程学 = <table> {\n }\n}\nprof_name = \"工程学\"\nprof_rank = 188\nmax_rank = 225\n(*temporary) = nil\n(*temporary) = <table> {\n}\n(*temporary) = 225\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = \"attempt to index field '?' (a nil value)\"\n",
			["stack"] = "Interface\\AddOns\\RecipeRadarClassic\\SkillDB.lua:101: in function `RecipeRadar_SkillDB_Refresh'\n...ace\\AddOns\\RecipeRadarClassic\\RecipeRadarClassic-1.0.0.6.lua:207: in function `RecipeRadar_OnEvent'\n[string \"*:OnEvent\"]:1: in function <[string \"*:OnEvent\"]:1>\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: in function `UseAction'\nInterface\\FrameXML\\SecureTemplates.lua:338: in function `handler'\nInterface\\FrameXML\\SecureTemplates.lua:616: in function <Interface\\FrameXML\\SecureTemplates.lua:564>\n[C]: ?\n[C]: ?\nInterface\\FrameXML\\SecureHandlers.lua:266: in function <Interface\\FrameXML\\SecureHandlers.lua:263>\n[C]: ?\nInterface\\FrameXML\\SecureHandlers.lua:296: in function <Interface\\FrameXML\\SecureHandlers.lua:279>\n(tail call): ?",
			["session"] = 124,
			["counter"] = 63,
		}, -- [15]
	},
}

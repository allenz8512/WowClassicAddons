
BugGrabberDB = {
	["lastSanitation"] = 3,
	["session"] = 383,
	["errors"] = {
		{
			["message"] = "Interface\\AddOns\\MBB\\MBB-4.0.lua:602: LibDBIcon10_AHDBminimapButton:SetPoint(): trying to anchor to itself",
			["time"] = "2019/10/06 15:53:52",
			["locals"] = "(*temporary) = LibDBIcon10_AHDBminimapButton {\n 0 = <userdata>\n fadeOut = <unnamed> {\n }\n ohide = <function> defined =[C]:-1\n isMouseDown = false\n PixelSnapDisabled = true\n oclick = <function> defined @Interface\\AddOns\\AtlasLootClassic\\Libs\\LibDBIcon-1.0\\LibDBIcon-1.0.lua:142\n opoint = <table> {\n }\n db = <table> {\n }\n icon = <unnamed> {\n }\n Hide = <function> defined @Interface\\AddOns\\MBB\\MBB.lua:380\n ClearAllPoints = <function> defined @Interface\\AddOns\\MBB\\MBB.lua:492\n dataObject = <table> {\n }\n parentisvisible = true\n oenter = <function> defined @Interface\\AddOns\\AtlasLootClassic\\Libs\\LibDBIcon-1.0\\LibDBIcon-1.0.lua:60\n oleave = <function> defined @Interface\\AddOns\\AtlasLootClassic\\Libs\\LibDBIcon-1.0\\LibDBIcon-1.0.lua:81\n Show = <function> defined @Interface\\AddOns\\MBB\\MBB.lua:363\n oshow = <function> defined =[C]:-1\n SetPoint = <function> defined @Interface\\AddOns\\MBB\\MBB.lua:494\n osize = <table> {\n }\n osetpoint = <function> defined =[C]:-1\n oclearallpoints = <function> defined =[C]:-1\n isvisible = true\n}\n(*temporary) = \"RIGHT\"\n(*temporary) = LibDBIcon10_AHDBminimapButton {\n 0 = <userdata>\n fadeOut = <unnamed> {\n }\n ohide = <function> defined =[C]:-1\n isMouseDown = false\n PixelSnapDisabled = true\n oclick = <function> defined @Interface\\AddOns\\AtlasLootClassic\\Libs\\LibDBIcon-1.0\\LibDBIcon-1.0.lua:142\n opoint = <table> {\n }\n db = <table> {\n }\n icon = <unnamed> {\n }\n Hide = <function> defined @Interface\\AddOns\\MBB\\MBB.lua:380\n ClearAllPoints = <function> defined @Interface\\AddOns\\MBB\\MBB.lua:492\n dataObject = <table> {\n }\n parentisvisible = true\n oenter = <function> defined @Interface\\AddOns\\AtlasLootClassic\\Libs\\LibDBIcon-1.0\\LibDBIcon-1.0.lua:60\n oleave = <function> defined @Interface\\AddOns\\AtlasLootClassic\\Libs\\LibDBIcon-1.0\\LibDBIcon-1.0.lua:81\n Show = <function> defined @Interface\\AddOns\\MBB\\MBB.lua:363\n oshow = <function> defined =[C]:-1\n SetPoint = <function> defined @Interface\\AddOns\\MBB\\MBB.lua:494\n osize = <table> {\n }\n osetpoint = <function> defined =[C]:-1\n oclearallpoints = <function> defined =[C]:-1\n isvisible = true\n}\n(*temporary) = \"LEFT\"\n(*temporary) = 0\n(*temporary) = 0\n",
			["stack"] = "[C]: in function `osetpoint'\nInterface\\AddOns\\MBB\\MBB-4.0.lua:602: in function `MBB_SetPositions'\nInterface\\AddOns\\MBB\\MBB-4.0.lua:725: in function `MBB_OnUpdate'\n[string \"*:OnUpdate\"]:1: in function <[string \"*:OnUpdate\"]:1>",
			["session"] = 317,
			["counter"] = 1,
		}, -- [1]
		{
			["message"] = "Interface\\AddOns\\MarketWatcher\\MarketWatcher-2.2.3c.lua:1513: bad argument #2 to 'strsplit' (string expected, got nil)",
			["time"] = "2019/10/08 01:42:09",
			["locals"] = "(*temporary) = \"|\"\n(*temporary) = nil\n(*temporary) = \"string expected, got nil\"\n",
			["stack"] = "[C]: in function `strsplit'\nInterface\\AddOns\\MarketWatcher\\MarketWatcher-2.2.3c.lua:1513: in function `DecodeItemLink'\nInterface\\AddOns\\MarketWatcher\\Scan.lua:2734: in function `VerifyListCache'\nInterface\\AddOns\\MarketWatcher\\Scan.lua:173: in function `ScanFrame_OnShow'\n[string \"*:OnShow\"]:1: in function <[string \"*:OnShow\"]:1>\n[C]: in function `Show'\nInterface\\AddOns\\MarketWatcher\\Scan.lua:157: in function <Interface\\AddOns\\MarketWatcher\\Scan.lua:140>\n[C]: ?",
			["session"] = 324,
			["counter"] = 1,
		}, -- [2]
		{
			["message"] = "...rface\\AddOns\\BetterVendorPrice\\BetterVendorPrice-v1.04.00.lua:209: nil GetMouseFocus()",
			["time"] = "2019/10/06 23:37:01",
			["locals"] = "(*temporary) = \"nil GetMouseFocus()\"\n",
			["stack"] = "[C]: in function `error'\n...rface\\AddOns\\BetterVendorPrice\\BetterVendorPrice-v1.04.00.lua:209: in function <...rface\\AddOns\\BetterVendorPrice\\BetterVendorPrice.lua:180>\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: in function `SetAuctionSellItem'\nInterface\\AddOns\\Auctionator\\Auctionator-8.1.0.lua:1218: in function `Atr_GetSellItemInfo'\nInterface\\AddOns\\Auctionator\\Auctionator-8.1.0.lua:3113: in function `Atr_SetDepositText'\nInterface\\AddOns\\Auctionator\\Auctionator-8.1.0.lua:4487: in function `func'\nInterface\\FrameXML\\UIDropDownMenu.lua:958: in function `UIDropDownMenuButton_OnClick'\n[string \"*:OnClick\"]:1: in function <[string \"*:OnClick\"]:1>",
			["session"] = 324,
			["counter"] = 3,
		}, -- [3]
		{
			["message"] = "Interface\\AddOns\\KiwiItemInfo\\Locale.lua:45: attempt to index local 'toret' (a nil value)",
			["time"] = "2019/10/09 15:00:34",
			["locals"] = "str = \"KII_THANKS\"\ntoret = nil\n(*temporary) = \"zhCN\"\n(*temporary) = nil\n(*temporary) = \"attempt to index local 'toret' (a nil value)\"\nlocale = \"zhCN\"\n",
			["stack"] = "Interface\\AddOns\\KiwiItemInfo\\Locale.lua:45: in function <Interface\\AddOns\\KiwiItemInfo\\Locale.lua:42>\nInterface\\AddOns\\KiwiItemInfo\\KiwiItemInfo-v2.2.1.lua:89: in function `Enable'\nInterface\\AddOns\\KiwiItemInfo\\KiwiItemInfo-v2.2.1.lua:150: in function `?'\nInterface\\AddOns\\KiwiItemInfo\\KiwiItemInfo-v2.2.1.lua:162: in function <Interface\\AddOns\\KiwiItemInfo\\KiwiItemInfo.lua:161>",
			["session"] = 338,
			["counter"] = 1,
		}, -- [4]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] 插件 'ItemRack' 尝试调用保护功能 'AutoEquipCursorItem()'。",
			["time"] = "2019/10/12 23:09:12",
			["locals"] = "InCombatSkipped",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[C]: in function `AutoEquipCursorItem'\n[string \"*:OnMouseUp\"]:4: in function `oldCharacterModelFrame_OnMouseUp'\nInterface\\AddOns\\ItemRack\\ItemRackButtons.lua:101: in function <Interface\\AddOns\\ItemRack\\ItemRackButtons.lua:97>",
			["session"] = 349,
			["counter"] = 1,
		}, -- [5]
		{
			["message"] = "...olkTracker\\Libs\\NoTaintUIDropDown\\UIDropDownMenu.lua:820: Usage: PlaySound(soundKitID, optional[\"SFX\",\"Music\",\"Ambience\", \"Dialog\" or \"Master\"], [forceNoDuplicates, runFinishCallback])",
			["time"] = "2019/10/11 12:29:19",
			["locals"] = "(*temporary) = \"UChatScrollButton\"\n",
			["stack"] = "[C]: ?\n...olkTracker\\Libs\\NoTaintUIDropDown\\UIDropDownMenu.lua:820: in function `Lib_UIDropDownMenuButton_OnClick'\n[string \"*:OnClick\"]:1: in function <[string \"*:OnClick\"]:1>",
			["session"] = 349,
			["counter"] = 4,
		}, -- [6]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] 插件 'RecipeRadarClassic' 尝试调用保护功能 'CompactRaidFrameContainer:Hide()'。",
			["time"] = "2019/10/13 02:04:46",
			["locals"] = "InCombatSkipped",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[C]: in function `Hide'\n...mpactRaidFrames\\Blizzard_CompactRaidFrameManager.lua:494: in function `CompactRaidFrameManager_UpdateContainerVisibility'\n...mpactRaidFrames\\Blizzard_CompactRaidFrameManager.lua:439: in function <...mpactRaidFrames\\Blizzard_CompactRaidFrameManager.lua:428>\n...mpactRaidFrames\\Blizzard_CompactRaidFrameManager.lua:478: in function `CompactRaidFrameManager_SetSetting'\n...rd_CUFProfiles\\Blizzard_CompactUnitFrameProfiles.lua:565: in function `func'\n...rd_CUFProfiles\\Blizzard_CompactUnitFrameProfiles.lua:542: in function `CompactUnitFrameProfiles_ApplyProfile'\n...rd_CUFProfiles\\Blizzard_CompactUnitFrameProfiles.lua:173: in function `CompactUnitFrameProfiles_ApplyCurrentSettings'\n...rd_CUFProfiles\\Blizzard_CompactUnitFrameProfiles.lua:82: in function `CompactUnitFrameProfiles_CancelChanges'\n...rd_CUFProfiles\\Blizzard_CompactUnitFrameProfiles.lua:75: in function <...rd_CUFProfiles\\Blizzard_CompactUnitFrameProfiles.lua:73>\n[C]: in function `pcall'\nInterface\\FrameXML\\InterfaceOptionsFrame.lua:217: in function <Interface\\FrameXML\\InterfaceOptionsFrame.lua:216>\n[C]: in function `securecall'\nInterface\\FrameXML\\InterfaceOptionsFrame.lua:252: in function <Interface\\FrameXML\\InterfaceOptionsFrame.lua:248>",
			["session"] = 354,
			["counter"] = 1,
		}, -- [7]
		{
			["message"] = "Interface\\AddOns\\Auctionator\\AuctionatorLocalize.lua:150: Wrong object type for function",
			["time"] = "2019/10/06 15:54:13",
			["locals"] = "(*temporary) = <table> {\n}\n(*temporary) = nil\n",
			["stack"] = "[C]: in function `IsForbidden'\nInterface\\AddOns\\Auctionator\\AuctionatorLocalize.lua:150: in function `Atr_FrameIsAccessible'\nInterface\\AddOns\\Auctionator\\AuctionatorLocalize.lua:138: in function `Atr_IsAuctionatorFrame'\nInterface\\AddOns\\Auctionator\\AuctionatorLocalize.lua:77: in function <Interface\\AddOns\\Auctionator\\AuctionatorLocalize.lua:76>\nInterface\\AddOns\\Auctionator\\AuctionatorLocalize.lua:132: in function `Atr_LocalizeFrames'\nInterface\\AddOns\\Auctionator\\Auctionator-8.1.0.lua:1178: in function `Atr_Init'\nInterface\\AddOns\\Auctionator\\Auctionator-8.1.0.lua:917: in function `Atr_OnAddonLoaded'\nInterface\\AddOns\\Auctionator\\Auctionator-8.1.0.lua:168: in function `Atr_EventHandler'\n[string \"*:OnEvent\"]:1: in function <[string \"*:OnEvent\"]:1>\n[C]: ?\n[C]: in function `LoadAddOn'\nInterface\\FrameXML\\UIParent.lua:353: in function `UIParentLoadAddOn'\nInterface\\FrameXML\\UIParent.lua:364: in function `AuctionFrame_LoadUI'\nInterface\\FrameXML\\UIParent.lua:1124: in function <Interface\\FrameXML\\UIParent.lua:658>",
			["session"] = 355,
			["counter"] = 10,
		}, -- [8]
		{
			["message"] = "Error loading Interface\\AddOns\\Postal_Classic\\locales\\esMX-西班牙语（拉丁美洲）.lua",
			["session"] = 356,
			["time"] = "2019/10/09 15:00:35",
			["counter"] = 76,
		}, -- [9]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] 插件 'Atlas' 尝试调用保护功能 'MultiBarBottomLeft:SetFrameStrata()'。",
			["time"] = "2019/10/06 11:28:25",
			["locals"] = "InCombatSkipped",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[C]: in function `SetFrameStrata'\nInterface\\AddOns\\Atlas\\Atlas-1.0(1.13.0).lua:379: in function `Atlas_Init'\nInterface\\AddOns\\Atlas\\Atlas-1.0(1.13.0).lua:326: in function `Atlas_OnEvent'\n[string \"*:OnEvent\"]:1: in function <[string \"*:OnEvent\"]:1>\n[C]: ?\n[C]: in function `LoadAddOn'\nInterface\\FrameXML\\UIParent.lua:353: in function `UIParentLoadAddOn'\nInterface\\FrameXML\\UIParent.lua:403: in function `RaidFrame_LoadUI'\nInterface\\FrameXML\\RaidFrame.lua:59: in function <Interface\\FrameXML\\RaidFrame.lua:50>",
			["session"] = 361,
			["counter"] = 11,
		}, -- [10]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] 插件 'AuctionDB' 尝试调用保护功能 'ClearOverrideBindings()'。",
			["time"] = "2019/10/06 14:55:12",
			["locals"] = "InCombatSkipped",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[C]: in function `ClearOverrideBindings'\nInterface\\AddOns\\AuctionDB\\AuctionDB-v1.01.03.lua:166: in function `HideDoItButton'\nInterface\\AddOns\\AuctionDB\\AuctionDB-v1.01.03.lua:588: in function `HandleOk'\nInterface\\AddOns\\AuctionDB\\AuctionDB-v1.01.03.lua:605: in function <Interface\\AddOns\\AuctionDB\\AuctionDB.lua:596>\n[C]: in function `pcall'\nInterface\\FrameXML\\InterfaceOptionsFrame.lua:209: in function <Interface\\FrameXML\\InterfaceOptionsFrame.lua:208>\n[C]: in function `securecall'\nInterface\\FrameXML\\InterfaceOptionsFrame.lua:232: in function <Interface\\FrameXML\\InterfaceOptionsFrame.lua:224>",
			["session"] = 361,
			["counter"] = 2,
		}, -- [11]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] 插件 'SpellbookAbridged' 尝试调用保护功能 'SpellBookSpellIconsFrame:Show()'。",
			["time"] = "2019/10/13 14:24:40",
			["locals"] = "InCombatSkipped",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[C]: in function `Show'\nInterface\\FrameXML\\SpellBookFrame.lua:148: in function `origSpellBookFrame_Update'\n...rface\\AddOns\\SpellbookAbridged\\SpellBookAbridged-2.2.lua:200: in function <...rface\\AddOns\\SpellbookAbridged\\SpellBookAbridged.lua:192>\n[C]: in function `SpellBookFrame_Update'\nInterface\\FrameXML\\SpellBookFrame.lua:97: in function <Interface\\FrameXML\\SpellBookFrame.lua:96>\n[C]: in function `Show'\nInterface\\FrameXML\\UIParent.lua:2078: in function `SetUIPanel'\nInterface\\FrameXML\\UIParent.lua:1923: in function `ShowUIPanel'\nInterface\\FrameXML\\UIParent.lua:1784: in function <Interface\\FrameXML\\UIParent.lua:1780>\n[C]: in function `SetAttribute'\nInterface\\FrameXML\\UIParent.lua:2526: in function `ShowUIPanel'\nInterface\\FrameXML\\SpellBookFrame.lua:46: in function `ToggleSpellBook'\n[string \"TOGGLESPELLBOOK\"]:1: in function <[string \"TOGGLESPELLBOOK\"]:1>",
			["session"] = 361,
			["counter"] = 1,
		}, -- [12]
		{
			["message"] = "Interface\\FrameXML\\SpellBookFrame.lua:323: Invalid spell slot in GameTooltip:SetSpell",
			["time"] = "2019/10/13 14:25:07",
			["locals"] = "InCombatSkipped",
			["stack"] = "[C]: in function `SetSpellBookItem'\nInterface\\FrameXML\\SpellBookFrame.lua:323: in function `SpellButton_OnEnter'\n...rface\\AddOns\\SpellbookAbridged\\SpellBookAbridged-2.2.lua:94: in function `SBA_SpellButton_OnEnter'\n[string \"*:OnEnter\"]:1: in function <[string \"*:OnEnter\"]:1>",
			["session"] = 361,
			["counter"] = 2,
		}, -- [13]
		{
			["message"] = "...ce\\AddOns\\MissingTradeSkillsList\\UI\\EventHandler.lua:168: attempt to index field '?' (a nil value)",
			["time"] = "2019/10/16 14:22:57",
			["locals"] = "self = <table> {\n TRADE_SKILL_SHOW = <function> defined @Interface\\AddOns\\MissingTradeSkillsList\\UI\\EventHandler.lua:132\n PLAYER_LOGIN = <function> defined @Interface\\AddOns\\MissingTradeSkillsList\\UI\\EventHandler.lua:15\n Initialise = <function> defined @Interface\\AddOns\\MissingTradeSkillsList\\UI\\EventHandler.lua:227\n TRAINER_UPDATE = <function> defined @Interface\\AddOns\\MissingTradeSkillsList\\UI\\EventHandler.lua:181\n ui_craft_open = 0\n addon_loaded = 1\n TRADE_SKILL_UPDATE = <function> defined @Interface\\AddOns\\MissingTradeSkillsList\\UI\\EventHandler.lua:150\n CRAFT_CLOSE = <function> defined @Interface\\AddOns\\MissingTradeSkillsList\\UI\\EventHandler.lua:58\n RefreshSkills = <function> defined @Interface\\AddOns\\MissingTradeSkillsList\\UI\\EventHandler.lua:166\n SwapToProfession = <function> defined @Interface\\AddOns\\MissingTradeSkillsList\\UI\\EventHandler.lua:268\n ui_trade_open = 0\n TRADE_SKILL_CLOSE = <function> defined @Interface\\AddOns\\MissingTradeSkillsList\\UI\\EventHandler.lua:116\n CRAFT_UPDATE = <function> defined @Interface\\AddOns\\MissingTradeSkillsList\\UI\\EventHandler.lua:93\n SLASH_COMMAND = <function> defined @Interface\\AddOns\\MissingTradeSkillsList\\UI\\EventHandler.lua:205\n SKILL_LINES_CHANGED = <function> defined @Interface\\AddOns\\MissingTradeSkillsList\\UI\\EventHandler.lua:106\n IsAddonLoaded = <function> defined @Interface\\AddOns\\MissingTradeSkillsList\\UI\\EventHandler.lua:258\n CRAFT_SHOW = <function> defined @Interface\\AddOns\\MissingTradeSkillsList\\UI\\EventHandler.lua:74\n}\nprofession_name = \"Cooking\"\ncurrent_skill_level = 300\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = nil\n(*temporary) = \"attempt to index field '?' (a nil value)\"\n",
			["stack"] = "...ce\\AddOns\\MissingTradeSkillsList\\UI\\EventHandler.lua:168: in function `RefreshSkills'\n...ce\\AddOns\\MissingTradeSkillsList\\UI\\EventHandler.lua:156: in function `?'\n...ce\\AddOns\\MissingTradeSkillsList\\UI\\EventHandler.lua:234: in function <...ce\\AddOns\\MissingTradeSkillsList\\UI\\EventHandler.lua:231>",
			["session"] = 369,
			["counter"] = 1,
		}, -- [14]
		{
			["message"] = "AtlasQuestFrame: Couldn't find relative frame: AtlasFrame",
			["session"] = 378,
			["time"] = "2019/10/16 15:11:14",
			["counter"] = 2,
		}, -- [15]
		{
			["message"] = "Couldn't find frame parent: AtlasFrame",
			["session"] = 378,
			["time"] = "2019/10/16 15:11:14",
			["counter"] = 8,
		}, -- [16]
		{
			["message"] = "Interface\\AddOns\\KiwiItemInfo\\Locale.lua:47: attempt to index local 'toret' (a nil value)",
			["time"] = "2019/10/16 15:18:08",
			["locals"] = "str = \"KII_THANKS\"\ntoret = nil\n(*temporary) = \"zhCN\"\n(*temporary) = nil\n(*temporary) = \"attempt to index local 'toret' (a nil value)\"\nlocale = \"zhCN\"\n",
			["stack"] = "Interface\\AddOns\\KiwiItemInfo\\Locale.lua:47: in function <Interface\\AddOns\\KiwiItemInfo\\Locale.lua:44>\nInterface\\AddOns\\KiwiItemInfo\\KiwiItemInfo-v2.2.3.lua:82: in function `Enable'\nInterface\\AddOns\\KiwiItemInfo\\KiwiItemInfo-v2.2.3.lua:131: in function `?'\nInterface\\AddOns\\KiwiItemInfo\\KiwiItemInfo-v2.2.3.lua:145: in function <Interface\\AddOns\\KiwiItemInfo\\KiwiItemInfo.lua:144>",
			["session"] = 380,
			["counter"] = 179,
		}, -- [17]
		{
			["message"] = "Interface\\AddOns\\Questie\\Modules\\QuestieTooltips.lua:80: Usage: UnitGUID(\"unit\")",
			["time"] = "2019/10/06 11:44:47",
			["locals"] = "InCombatSkipped",
			["stack"] = "[C]: in function `UnitGUID'\nInterface\\AddOns\\Questie\\Modules\\QuestieTooltips.lua:80: in function <Interface\\AddOns\\Questie\\Modules\\QuestieTooltips.lua:75>\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: in function `SetUnit'\nInterface\\FrameXML\\UnitFrame.lua:291: in function `UnitFrame_UpdateTooltip'\nInterface\\FrameXML\\UnitFrame.lua:277: in function <Interface\\FrameXML\\UnitFrame.lua:264>",
			["session"] = 382,
			["counter"] = 17,
		}, -- [18]
		{
			["message"] = "Couldn't open Interface\\AddOns\\RecipeRadarClassic\\Libs\\LibTouristClassic-1.0-90228\\CallbackHandler-1.0-7\\CallbackHandler-1.0.xml",
			["session"] = 383,
			["time"] = "2019/10/13 01:35:41",
			["counter"] = 155,
		}, -- [19]
		{
			["message"] = "...tails\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:962: attempt to index field 'dropdown' (a nil value)",
			["time"] = "2019/10/16 15:33:49",
			["locals"] = "object = <table> {\n IsJoystickEnabled = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n SetScript = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n SetAlpha = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n NoOptionSelected = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:332\n CanChangeAttribute = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n GetEffectiveScale = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n StopMovingOrSizing = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n SetFrameStrata = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:257\n GetPropagateKeyboardInput = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n GetScript = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n RegisterForClicks = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n GetAttribute = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n SetResizable = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n SetHook = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\fw.lua:1600\n SetUserPlaced = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n IsShown = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:169\n GetFrameStrata = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:254\n LockHighlight = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n SetHitRectInsets = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n SetTemplate = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:859\n SetClampedToScreen = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n GetNormalTexture = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n StartSizing = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n SetMenuSize = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:180\n GetHitRectInsets = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n IsRectValid = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n GetMenuSize = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:188\n GetRegions = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n RegisterUnitEvent = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n SetAttribute = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n IsMouseClickEnabled = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n IsVisible = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n StopAnimating = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n GetAnimationGroups = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n GetEffectiveDepth = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:961\n SetMouseClickEnabled = <function> defined @Interface\\AddOns\\Details\\Libs\\DF\\Details-Framework-Clas",
			["stack"] = "...tails\\Libs\\DF\\Details-Framework-Classic\\dropdown.lua:962: in function `HookScript'\n...rface\\AddOns\\CensusPlusClassic\\CensusPlusClassic-1.13.2.lua:529: in function `InitializeExperimental'\n...rface\\AddOns\\CensusPlusClassic\\CensusPlusClassic-1.13.2.lua:1685: in function <...rface\\AddOns\\CensusPlusClassic\\CensusPlusClassic.lua:1655>",
			["session"] = 383,
			["counter"] = 2,
		}, -- [20]
		{
			["message"] = "...nfig-3.0\\AceConfigDialog-3.0\\AceConfigDialog-3.0-78.lua:204: attempt to index local 'group' (a nil value)",
			["time"] = "2019/10/16 17:14:59",
			["stack"] = "...nfig-3.0\\AceConfigDialog-3.0\\AceConfigDialog-3.0-78.lua:204: in function <...nfig-3.0\\AceConfigDialog-3.0\\AceConfigDialog-3.0.lua:169>\n...nfig-3.0\\AceConfigDialog-3.0\\AceConfigDialog-3.0-78.lua:511: in function <...nfig-3.0\\AceConfigDialog-3.0\\AceConfigDialog-3.0.lua:501>\n[C]: ?\n...terface\\AddOns\\Fizzle\\Libs\\AceGUI-3.0\\AceGUI-3.0-40.lua:72: in function <...terface\\AddOns\\Fizzle\\Libs\\AceGUI-3.0\\AceGUI-3.0.lua:70>\n...terface\\AddOns\\Fizzle\\Libs\\AceGUI-3.0\\AceGUI-3.0-40.lua:290: in function `Fire'\n...ste\\Lib\\AceGUI-3.0-40\\widgets\\AceGUIWidget-DropDown.lua:367: in function <...ste\\Lib\\AceGUI-3.0\\widgets\\AceGUIWidget-DropDown.lua:365>",
			["session"] = 383,
			["counter"] = 2,
		}, -- [21]
		{
			["message"] = "integer overflow attempting to store -nan(ind)",
			["time"] = "2019/10/16 15:07:48",
			["locals"] = "(*temporary) = <unnamed> {\n 0 = <userdata>\n fontStyle = \"OUTLINE\"\n fontSize = 12.777778\n}\n(*temporary) = \"|cffffffff%d|r\"\n(*temporary) = Infinite\n(*temporary) = nil\n",
			["stack"] = "[C]: in function `SetFormattedText'\nInterface\\AddOns\\ElvUI\\Core\\Cooldowns.lua:40: in function <Interface\\AddOns\\ElvUI\\Core\\Cooldowns.lua:17>",
			["session"] = 383,
			["counter"] = 404,
		}, -- [22]
	},
}

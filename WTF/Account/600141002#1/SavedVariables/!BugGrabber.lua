
BugGrabberDB = {
	["lastSanitation"] = 3,
	["session"] = 347,
	["errors"] = {
		{
			["message"] = "[ADDON_ACTION_BLOCKED] 插件 'AuctionDB' 尝试调用保护功能 'ClearOverrideBindings()'。",
			["time"] = "2019/10/06 14:55:12",
			["locals"] = "InCombatSkipped",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[C]: in function `ClearOverrideBindings'\nInterface\\AddOns\\AuctionDB\\AuctionDB-v1.01.03.lua:166: in function `HideDoItButton'\nInterface\\AddOns\\AuctionDB\\AuctionDB-v1.01.03.lua:588: in function `HandleOk'\nInterface\\AddOns\\AuctionDB\\AuctionDB-v1.01.03.lua:605: in function <Interface\\AddOns\\AuctionDB\\AuctionDB.lua:596>\n[C]: in function `pcall'\nInterface\\FrameXML\\InterfaceOptionsFrame.lua:209: in function <Interface\\FrameXML\\InterfaceOptionsFrame.lua:208>\n[C]: in function `securecall'\nInterface\\FrameXML\\InterfaceOptionsFrame.lua:232: in function <Interface\\FrameXML\\InterfaceOptionsFrame.lua:224>",
			["session"] = 317,
			["counter"] = 1,
		}, -- [1]
		{
			["message"] = "Interface\\AddOns\\MBB\\MBB-4.0.lua:602: LibDBIcon10_AHDBminimapButton:SetPoint(): trying to anchor to itself",
			["time"] = "2019/10/06 15:53:52",
			["locals"] = "(*temporary) = LibDBIcon10_AHDBminimapButton {\n 0 = <userdata>\n fadeOut = <unnamed> {\n }\n ohide = <function> defined =[C]:-1\n isMouseDown = false\n PixelSnapDisabled = true\n oclick = <function> defined @Interface\\AddOns\\AtlasLootClassic\\Libs\\LibDBIcon-1.0\\LibDBIcon-1.0.lua:142\n opoint = <table> {\n }\n db = <table> {\n }\n icon = <unnamed> {\n }\n Hide = <function> defined @Interface\\AddOns\\MBB\\MBB.lua:380\n ClearAllPoints = <function> defined @Interface\\AddOns\\MBB\\MBB.lua:492\n dataObject = <table> {\n }\n parentisvisible = true\n oenter = <function> defined @Interface\\AddOns\\AtlasLootClassic\\Libs\\LibDBIcon-1.0\\LibDBIcon-1.0.lua:60\n oleave = <function> defined @Interface\\AddOns\\AtlasLootClassic\\Libs\\LibDBIcon-1.0\\LibDBIcon-1.0.lua:81\n Show = <function> defined @Interface\\AddOns\\MBB\\MBB.lua:363\n oshow = <function> defined =[C]:-1\n SetPoint = <function> defined @Interface\\AddOns\\MBB\\MBB.lua:494\n osize = <table> {\n }\n osetpoint = <function> defined =[C]:-1\n oclearallpoints = <function> defined =[C]:-1\n isvisible = true\n}\n(*temporary) = \"RIGHT\"\n(*temporary) = LibDBIcon10_AHDBminimapButton {\n 0 = <userdata>\n fadeOut = <unnamed> {\n }\n ohide = <function> defined =[C]:-1\n isMouseDown = false\n PixelSnapDisabled = true\n oclick = <function> defined @Interface\\AddOns\\AtlasLootClassic\\Libs\\LibDBIcon-1.0\\LibDBIcon-1.0.lua:142\n opoint = <table> {\n }\n db = <table> {\n }\n icon = <unnamed> {\n }\n Hide = <function> defined @Interface\\AddOns\\MBB\\MBB.lua:380\n ClearAllPoints = <function> defined @Interface\\AddOns\\MBB\\MBB.lua:492\n dataObject = <table> {\n }\n parentisvisible = true\n oenter = <function> defined @Interface\\AddOns\\AtlasLootClassic\\Libs\\LibDBIcon-1.0\\LibDBIcon-1.0.lua:60\n oleave = <function> defined @Interface\\AddOns\\AtlasLootClassic\\Libs\\LibDBIcon-1.0\\LibDBIcon-1.0.lua:81\n Show = <function> defined @Interface\\AddOns\\MBB\\MBB.lua:363\n oshow = <function> defined =[C]:-1\n SetPoint = <function> defined @Interface\\AddOns\\MBB\\MBB.lua:494\n osize = <table> {\n }\n osetpoint = <function> defined =[C]:-1\n oclearallpoints = <function> defined =[C]:-1\n isvisible = true\n}\n(*temporary) = \"LEFT\"\n(*temporary) = 0\n(*temporary) = 0\n",
			["stack"] = "[C]: in function `osetpoint'\nInterface\\AddOns\\MBB\\MBB-4.0.lua:602: in function `MBB_SetPositions'\nInterface\\AddOns\\MBB\\MBB-4.0.lua:725: in function `MBB_OnUpdate'\n[string \"*:OnUpdate\"]:1: in function <[string \"*:OnUpdate\"]:1>",
			["session"] = 317,
			["counter"] = 1,
		}, -- [2]
		{
			["message"] = "Interface\\AddOns\\MarketWatcher\\MarketWatcher-2.2.3c.lua:1513: bad argument #2 to 'strsplit' (string expected, got nil)",
			["time"] = "2019/10/08 01:42:09",
			["locals"] = "(*temporary) = \"|\"\n(*temporary) = nil\n(*temporary) = \"string expected, got nil\"\n",
			["stack"] = "[C]: in function `strsplit'\nInterface\\AddOns\\MarketWatcher\\MarketWatcher-2.2.3c.lua:1513: in function `DecodeItemLink'\nInterface\\AddOns\\MarketWatcher\\Scan.lua:2734: in function `VerifyListCache'\nInterface\\AddOns\\MarketWatcher\\Scan.lua:173: in function `ScanFrame_OnShow'\n[string \"*:OnShow\"]:1: in function <[string \"*:OnShow\"]:1>\n[C]: in function `Show'\nInterface\\AddOns\\MarketWatcher\\Scan.lua:157: in function <Interface\\AddOns\\MarketWatcher\\Scan.lua:140>\n[C]: ?",
			["session"] = 324,
			["counter"] = 1,
		}, -- [3]
		{
			["message"] = "...rface\\AddOns\\BetterVendorPrice\\BetterVendorPrice-v1.04.00.lua:209: nil GetMouseFocus()",
			["time"] = "2019/10/06 23:37:01",
			["locals"] = "(*temporary) = \"nil GetMouseFocus()\"\n",
			["stack"] = "[C]: in function `error'\n...rface\\AddOns\\BetterVendorPrice\\BetterVendorPrice-v1.04.00.lua:209: in function <...rface\\AddOns\\BetterVendorPrice\\BetterVendorPrice.lua:180>\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: in function `SetAuctionSellItem'\nInterface\\AddOns\\Auctionator\\Auctionator-8.1.0.lua:1218: in function `Atr_GetSellItemInfo'\nInterface\\AddOns\\Auctionator\\Auctionator-8.1.0.lua:3113: in function `Atr_SetDepositText'\nInterface\\AddOns\\Auctionator\\Auctionator-8.1.0.lua:4487: in function `func'\nInterface\\FrameXML\\UIDropDownMenu.lua:958: in function `UIDropDownMenuButton_OnClick'\n[string \"*:OnClick\"]:1: in function <[string \"*:OnClick\"]:1>",
			["session"] = 324,
			["counter"] = 3,
		}, -- [4]
		{
			["message"] = "Interface\\AddOns\\KiwiItemInfo\\Locale.lua:45: attempt to index local 'toret' (a nil value)",
			["time"] = "2019/10/09 15:00:34",
			["locals"] = "str = \"KII_THANKS\"\ntoret = nil\n(*temporary) = \"zhCN\"\n(*temporary) = nil\n(*temporary) = \"attempt to index local 'toret' (a nil value)\"\nlocale = \"zhCN\"\n",
			["stack"] = "Interface\\AddOns\\KiwiItemInfo\\Locale.lua:45: in function <Interface\\AddOns\\KiwiItemInfo\\Locale.lua:42>\nInterface\\AddOns\\KiwiItemInfo\\KiwiItemInfo-v2.2.1.lua:89: in function `Enable'\nInterface\\AddOns\\KiwiItemInfo\\KiwiItemInfo-v2.2.1.lua:150: in function `?'\nInterface\\AddOns\\KiwiItemInfo\\KiwiItemInfo-v2.2.1.lua:162: in function <Interface\\AddOns\\KiwiItemInfo\\KiwiItemInfo.lua:161>",
			["session"] = 338,
			["counter"] = 1,
		}, -- [5]
		{
			["message"] = "Interface\\AddOns\\Questie\\Modules\\QuestieTooltips.lua:80: Usage: UnitGUID(\"unit\")",
			["time"] = "2019/10/06 11:44:47",
			["locals"] = "InCombatSkipped",
			["stack"] = "[C]: in function `UnitGUID'\nInterface\\AddOns\\Questie\\Modules\\QuestieTooltips.lua:80: in function <Interface\\AddOns\\Questie\\Modules\\QuestieTooltips.lua:75>\n[C]: ?\n[C]: ?\n[C]: ?\n[C]: in function `SetUnit'\nInterface\\FrameXML\\UnitFrame.lua:291: in function `UnitFrame_UpdateTooltip'\nInterface\\FrameXML\\UnitFrame.lua:277: in function <Interface\\FrameXML\\UnitFrame.lua:264>",
			["session"] = 339,
			["counter"] = 10,
		}, -- [6]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] 插件 'Atlas' 尝试调用保护功能 'MultiBarBottomLeft:SetFrameStrata()'。",
			["time"] = "2019/10/06 11:28:25",
			["locals"] = "InCombatSkipped",
			["stack"] = "Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[C]: in function `SetFrameStrata'\nInterface\\AddOns\\Atlas\\Atlas-1.0(1.13.0).lua:379: in function `Atlas_Init'\nInterface\\AddOns\\Atlas\\Atlas-1.0(1.13.0).lua:326: in function `Atlas_OnEvent'\n[string \"*:OnEvent\"]:1: in function <[string \"*:OnEvent\"]:1>\n[C]: ?\n[C]: in function `LoadAddOn'\nInterface\\FrameXML\\UIParent.lua:353: in function `UIParentLoadAddOn'\nInterface\\FrameXML\\UIParent.lua:403: in function `RaidFrame_LoadUI'\nInterface\\FrameXML\\RaidFrame.lua:59: in function <Interface\\FrameXML\\RaidFrame.lua:50>",
			["session"] = 340,
			["counter"] = 5,
		}, -- [7]
		{
			["message"] = "Interface\\AddOns\\Auctionator\\AuctionatorLocalize.lua:150: Wrong object type for function",
			["time"] = "2019/10/06 15:54:13",
			["locals"] = "(*temporary) = <table> {\n}\n(*temporary) = nil\n",
			["stack"] = "[C]: in function `IsForbidden'\nInterface\\AddOns\\Auctionator\\AuctionatorLocalize.lua:150: in function `Atr_FrameIsAccessible'\nInterface\\AddOns\\Auctionator\\AuctionatorLocalize.lua:138: in function `Atr_IsAuctionatorFrame'\nInterface\\AddOns\\Auctionator\\AuctionatorLocalize.lua:77: in function <Interface\\AddOns\\Auctionator\\AuctionatorLocalize.lua:76>\nInterface\\AddOns\\Auctionator\\AuctionatorLocalize.lua:132: in function `Atr_LocalizeFrames'\nInterface\\AddOns\\Auctionator\\Auctionator-8.1.0.lua:1178: in function `Atr_Init'\nInterface\\AddOns\\Auctionator\\Auctionator-8.1.0.lua:917: in function `Atr_OnAddonLoaded'\nInterface\\AddOns\\Auctionator\\Auctionator-8.1.0.lua:168: in function `Atr_EventHandler'\n[string \"*:OnEvent\"]:1: in function <[string \"*:OnEvent\"]:1>\n[C]: ?\n[C]: in function `LoadAddOn'\nInterface\\FrameXML\\UIParent.lua:353: in function `UIParentLoadAddOn'\nInterface\\FrameXML\\UIParent.lua:364: in function `AuctionFrame_LoadUI'\nInterface\\FrameXML\\UIParent.lua:1124: in function <Interface\\FrameXML\\UIParent.lua:658>",
			["session"] = 340,
			["counter"] = 6,
		}, -- [8]
		{
			["message"] = "Error loading Interface\\AddOns\\Postal_Classic\\locales\\esMX-西班牙语（拉丁美洲）.lua",
			["session"] = 347,
			["time"] = "2019/10/09 15:00:35",
			["counter"] = 40,
		}, -- [9]
		{
			["message"] = "...olkTracker\\Libs\\NoTaintUIDropDown\\UIDropDownMenu.lua:820: Usage: PlaySound(soundKitID, optional[\"SFX\",\"Music\",\"Ambience\", \"Dialog\" or \"Master\"], [forceNoDuplicates, runFinishCallback])",
			["time"] = "2019/10/11 12:29:19",
			["locals"] = "(*temporary) = \"UChatScrollButton\"\n",
			["stack"] = "[C]: ?\n...olkTracker\\Libs\\NoTaintUIDropDown\\UIDropDownMenu.lua:820: in function `Lib_UIDropDownMenuButton_OnClick'\n[string \"*:OnClick\"]:1: in function <[string \"*:OnClick\"]:1>",
			["session"] = 347,
			["counter"] = 1,
		}, -- [10]
	},
}

--[[--
	alex@0
--]]--
----------------------------------------------------------------------------------------------------
local ADDON, NS = ...;
----------------------------------------------------------------------------------------------------
NS.L = NS.L or {EMOTE = {}, };
local L = NS.L;
----------------------------------------------------------------------------------------------------
L.EMOTE["enUS"] = {
    Angel = "Angel",
    Angry = "Angry",
    Biglaugh = "Biglaugh",
    Clap = "Clap",
    Cool = "Cool",
    Cry = "Cry",
    Cute = "Cute",
    Despise = "Despise",
    Dreamsmile = "Dreamsmile",
    Embarras = "Embarras",
    Evil = "Evil",
    Excited = "Excited",
    Faint = "Faint",
    Fight = "Fight",
    Flu = "Flu",
    Freeze = "Freeze",
    Frown = "Frown",
    Greet = "Greet",
    Grimace = "Grimace",
    Growl = "Growl",
    Happy = "Happy",
    Heart = "Heart",
    Horror = "Horror",
    Ill = "Ill",
    Innocent = "Innocent",
    Kongfu = "Kongfu",
    Love = "Love",
    Mail = "Mail",
    Makeup = "Makeup",
    Mario = "Mario",
    Meditate = "Meditate",
    Miserable = "Miserable",
    Okay = "Okay",
    Pretty = "Pretty",
    Puke = "Puke",
    Shake = "Shake",
    Shout = "Shout",
    Silent = "Silent",
    Shy = "Shy",
    Sleep = "Sleep",
    Smile = "Smile",
    Suprise = "Suprise",
    Surrender = "Surrender",
    Sweat = "Sweat",
    Tear = "Tear",
    Tears = "Tears",
    Think = "Think",
    Titter = "Titter",
    Ugly = "Ugly",
    Victory = "Victory",
    Volunteer = "Volunteer",
    Wronged = "Wronged",
};
----------------------------------------------------------------------------------------------------
if L.Locale ~= nil and L.Locale ~= "" then return;end
L.Locale = "enUS";
L.DBIcon_Text = "Toggle Config Frame";
L.SC_DATA1 = {
	CHAT_WHISPER_GET = "[W]%s: ",
	CHAT_WHISPER_INFORM_GET = "[W]to%s: ",
	CHAT_MONSTER_WHISPER_GET = "[W]%s: ",
	CHAT_BN_WHISPER_GET = "[W]%s: ",
	CHAT_BN_WHISPER_INFORM_GET = "[W]to%s: ",
	CHAT_BN_CONVERSATION_GET = "%s:",
	CHAT_BN_CONVERSATION_GET_LINK = "|Hchannel:BN_CONVERSATION:%d|h[%s.C]|h",
	CHAT_SAY_GET = "[S]%s: ",
	CHAT_MONSTER_SAY_GET = "[S]%s: ",
	CHAT_YELL_GET = "[Y]%s: ",
	CHAT_MONSTER_YELL_GET = "[Y]%s: ",
	CHAT_GUILD_GET = "|Hchannel:Guild|h[G]|h%s: ",
	CHAT_OFFICER_GET = "|Hchannel:OFFICER|h[O]|h%s: ",
	CHAT_PARTY_GET = "|Hchannel:Party|h[P]|h%s: ",
	CHAT_PARTY_LEADER_GET = "|Hchannel:PARTY|h[P]|h%s: ",
	CHAT_MONSTER_PARTY_GET = "|Hchannel:Party|h[P]|h%s: ",
	CHAT_PARTY_GUIDE_GET = "|Hchannel:PARTY|h[I]|h%s: ",
	CHAT_INSTANCE_CHAT_GET = "|Hchannel:INSTANCE_CHAT|h[I]|h%s: ",
	CHAT_INSTANCE_CHAT_LEADER_GET = "|Hchannel:INSTANCE_CHAT|h[I]|h%s: ",
	CHAT_RAID_GET = "|Hchannel:raid|h[R]|h%s: ",
	CHAT_RAID_LEADER_GET = "|Hchannel:raid|h[R]|h%s: ",
	CHAT_RAID_WARNING_GET = "[R]%s: ",

	CHAT_AFK_GET = "[AFK]%s: ",
	CHAT_DND_GET = "[DND]%s: ",
	CHAT_EMOTE_GET = "%s: ",
	CHAT_PET_BATTLE_INFO_GET = "|Hchannel:PET_BATTLE_INFO|h[Pet]|h: ",
	CHAT_PET_BATTLE_COMBAT_LOG_GET = "|Hchannel:PET_BATTLE_COMBAT_LOG|h[Pet]|h: ",
	CHAT_CHANNEL_LIST_GET = "|Hchannel:CHANNEL:%d|h[%s]|h",
	CHAT_CHANNEL_GET = "%s: ",
}
L.SC_DATA2 = {
		{"General",			1,7,	"G",},
		{"Trade",       	1,5,	"T",},
		{"LocalDefense",    1,12,	"D",},
		{"LookingForGroup", 1,15,	"L",},
		{"大脚世界频道",1,18,"世",},
};
L.SC_DATA3 = {
	"General - ",
	"^LookingForGroup$"
};
L.CHATBAR = {
	ALAC_CHANNELBAR = "<\124cff00ff00alaChat\124r> Hotkey for channel",
	T_SAY = "S",
	T_PARTY = "P",
	T_RAID = "R",
	T_RW = "W",
	T_INSTANCE_CHAT = "I",
	T_GUILD = "G",
	T_YELL = "Y",
	T_WHISPER = "W",
	T_OFFICER = "O",
	LINE_DBM1 = "\124cff80ffffDBM/BW Countdown\124r",
	LINE_DBM2 = "\124cff80ffffLeft click to start a 6s countdown\124r",
	LINE_DBM3 = "\124cff80ffffRight click to cancel countdown\124r",
	T_STAT = "Stat Report",
	LINE_STAT1 = "Stat Report",
	KEYWORDHEIGHLIGHT_0 = "Key Word Highlight",
	KEYWORDHEIGHLIGHT_1 = "Left Click to Edit Key Word",
	KEYWORDHEIGHLIGHT_2 = "Right Click to Clear All Key Words",
	READYCHECK = "Do Ready Check",
};
L.EMOTE_STRING = {
	Emote_Panel_STRING_1 = "Emote Panel",
	Emote_Panel_STRING_2 = "Click to open panel",
	Emote_Panel_STRING_3 = "<Ctrl>Move Icon",
};
L.WTG_STRING = {
	FORMAT_WELCOME = [[Welcome]],
	WELCOME_NOTES = "#GUILD# for guildName\n#PLAYER# for selfName\n#REALM# for realmName\n#NAME#for playerName\n#CLASS# for playerClass\n#LEVEL# for playerLevel\n#AREA# for player Current Area",
	FORMAT_BROADCAST = "New Guild Member:%1$s Lv-%3$s %2$s",--name,class,level,area,achievement points
	WTG_STRING_1 = "\124cffffffffWelcome To Guild\124r",
	WTG_STRING_2 = "\124cff80ffffLeft Click To Switch\124r",
	WTG_STRING_3 = "\124cff80ffffRight Click To Display\124r",
	WTG_STRING_ON = "\124cff40ff40On\124r",
	WTG_STRING_OFF = "\124cffff4040Off\124r",
};
L.CONFIG = {
	wel					 = "\124cffff3f3falaChat\124r Loaded./alac or /alachat to open config window. \nConfig window is moved to [ESC - Interface Options - Addons(at topleft) - alaChat_Classic]",
	title				 = "Settings",

	position			 = "Position",
	scale				 = "Bar Scale",
	alpha				 = "ALPHA",
	barStyle			 = "Style of button",

	shortChannelName	 = "Short channel name",
	hyperLinkEnhanced	 = "Hyperlink in chat msg.(Shift click spell in the spellbook also works)",
	chatEmote			 = "Emote",
	ColorNameByClass	 = "Color Name By Class In ChatFrame",
	shamanColor			 = "Change color for \124cfff48cbashaman\124r to \124cff006fdcBLUE\124r.";
	channelBarStyle		 = "Channel bar style",
	channelBarChannel	 = 
	{
		SAY,
		PARTY,
		RAID,
		RAID_WARNING,
		INSTANCE_CHAT,
		GUILD,
		YELL,
		WHISPER,
		OFFICER,
		GENERAL,
		TRADE,
		LOCAL_DEFENSE,
		LOOK_FOR_GROUP,
		label			 = "Channel bar",
	},
	filterQuestAnn		 = "NONE",
	--
	--
	--chatFrameScroll		 = "Add a scroll to bottom button to the left of chatFrame",
	roll				 = "Roll",
	DBMCountDown		 = "Count down(need DBM)",
	broadCastNewMember	 = "Broadcast new guild member",
	welcomeToGuild		 = "Welcome",
	welcometoGuildMsg	 = "Welcome Msg",
	ReadyCheck			 = "Do Ready Check",
	statReport			 = "Stat Report",
	copy				 = "Copy chat",
	copyTagColor		 = "Color for timestamp",
	copyTagFormat		 = "Format of tag [#s for original format]",
	level				 = "Show guild member's level in chat frame",
	--hideConfBtn			 = "Hide conf wheel",
	editBoxTab			 = "Press tab to switch channel when chatbox is shown",
	restoreAfterWhisper	 = "Reset to previous channel after whisper and channel",
	hyperLinkHoverShow	 = "Show tooltip when mouse hovered hyperlink in chat frame",
	keyWordHighlight	 = "Highlight key word",
	keyWordColor		 = "Highlight color",
};
L.REPORT = {
	neckLevel			 = "neck",
	azLevel				 = "Lv",
};

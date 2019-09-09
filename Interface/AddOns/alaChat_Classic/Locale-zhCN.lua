--[[--
	alex@0
--]]--
----------------------------------------------------------------------------------------------------
local ADDON,NS = ...;
----------------------------------------------------------------------------------------------------
NS.L = NS.L or {EMOTE = {}, };
local L = NS.L;
----------------------------------------------------------------------------------------------------
L.EMOTE["zhCN"] = {
    Angel = "天使",
    Angry = "生气",
    Biglaugh = "大笑",
    Clap = "鼓掌",
    Cool = "酷",
    Cry = "哭",
    Cute = "可爱",
    Despise = "鄙视",
    Dreamsmile = "美梦",
    Embarras = "尴尬",
    Evil = "邪恶",
    Excited = "兴奋",
    Faint = "晕",
    Fight = "打架",
    Flu = "流感",
    Freeze = "呆",
    Frown = "皱眉",
    Greet = "致敬",
    Grimace = "鬼脸",
    Growl = "龇牙",
    Happy = "开心",
    Heart = "心",
    Horror = "恐惧",
    Ill = "生病",
    Innocent = "无辜",
    Kongfu = "功夫",
    Love = "花痴",
    Mail = "邮件",
    Makeup = "化妆",
    Mario = "马里奥",
    Meditate = "沉思",
    Miserable = "可怜",
    Okay = "好",
    Pretty = "漂亮",
    Puke = "吐",
    Shake = "握手",
    Shout = "喊",
    Silent = "闭嘴",
    Shy = "害羞",
    Sleep = "睡觉",
    Smile = "微笑",
    Suprise = "吃惊",
    Surrender = "失败",
    Sweat = "流汗",
    Tear = "流泪",
    Tears = "悲剧",
    Think = "想",
    Titter = "偷笑",
    Ugly = "猥琐",
    Victory = "胜利",
    Volunteer = "雷锋",
    Wronged = "委屈",
};
----------------------------------------------------------------------------------------------------
if GetLocale() ~= "zhCN" then return;end
L.Locale = "zhCN";
L.DBIcon_Text = "开关设置窗口";
L.SC_DATA1 = {
	CHAT_WHISPER_GET = "[密]%s说: ",
	CHAT_WHISPER_INFORM_GET = "[密]对%s说: ",
	CHAT_MONSTER_WHISPER_GET = "[密]%s说: ",
	CHAT_BN_WHISPER_GET = "[密]%s说: ",
	CHAT_BN_WHISPER_INFORM_GET = "[密]对%s说: ",
	CHAT_BN_CONVERSATION_GET = "%s:",
	CHAT_BN_CONVERSATION_GET_LINK = "|Hchannel:BN_CONVERSATION:%d|h[%s.对话]|h",
	CHAT_SAY_GET = "[说]%s: ",
	CHAT_MONSTER_SAY_GET = "[说]%s: ",
	CHAT_YELL_GET = "[喊]%s: ",
	CHAT_MONSTER_YELL_GET = "[喊]%s: ",
	CHAT_GUILD_GET = "|Hchannel:Guild|h[会]|h%s: ",
	CHAT_OFFICER_GET = "|Hchannel:OFFICER|h[官]|h%s: ",
	CHAT_PARTY_GET = "|Hchannel:Party|h[队]|h%s: ",
	CHAT_PARTY_LEADER_GET = "|Hchannel:PARTY|h[队]|h%s: ",
	CHAT_MONSTER_PARTY_GET = "|Hchannel:Party|h[队]|h%s: ",
	CHAT_PARTY_GUIDE_GET = "|Hchannel:PARTY|h[副]|h%s: ",
	CHAT_INSTANCE_CHAT_GET = "|Hchannel:INSTANCE_CHAT|h[副]|h%s: ",
	CHAT_INSTANCE_CHAT_LEADER_GET = "|Hchannel:INSTANCE_CHAT|h[副]|h%s: ",
	CHAT_RAID_GET = "|Hchannel:raid|h[团]|h%s: ",
	CHAT_RAID_LEADER_GET = "|Hchannel:raid|h[团]|h%s: ",
	CHAT_RAID_WARNING_GET = "[团]%s: ",

	CHAT_AFK_GET = "[AFK]%s: ",
	CHAT_DND_GET = "[DND]%s: ",
	CHAT_EMOTE_GET = "%s: ",
	CHAT_PET_BATTLE_INFO_GET = "|Hchannel:PET_BATTLE_INFO|h[宠]|h: ",
	CHAT_PET_BATTLE_COMBAT_LOG_GET = "|Hchannel:PET_BATTLE_COMBAT_LOG|h[宠]|h: ",
	CHAT_CHANNEL_LIST_GET = "|Hchannel:频道:%d|h[%s]|h",
	CHAT_CHANNEL_GET = "%s: ",
};
L.SC_DATA2 = {--短频道名字，每行最后一个字符串为显示名字
	{"综合",        1,6, "综",},
	{"交易",        1,6, "交",},
	{"本地防务",    1,12,"本",},
	{"寻求组队",    1,12,"组",},
	{"大脚世界频道",1,18,"世",},
};
L.SC_DATA3 = {
	"^综合 - ",
	"^寻求组队$",
};
L.CHATBAR = {
	T_SAY = "说",
	T_PARTY = "队",
	T_RAID = "团",
	T_RW = "通",
	T_INSTANCE_CHAT = "副",
	T_GUILD = "会",
	T_YELL = "喊",
	T_WHISPER = "密",
	T_OFFICER = "官",
	LINE_DBM1 = "\124cff80ffffDBM/BW倒计时\124r",
	LINE_DBM2 = "\124cff80ffff左键点击6秒倒计时\124r",
	LINE_DBM3 = "\124cff80ffff右键点击取消倒计时\124r",
	T_STAT = "属性通报",
	LINE_STAT1 = "属性报告",
	READYCHECK = "就位确认",
};
L.EMOTE_STRING = {
	Emote_Panel_STRING_1 = "表情面板",
	Emote_Panel_STRING_2 = "点击打开面板",
	Emote_Panel_STRING_3 = "<按住Ctrl拖动>移动图标",
};
L.WTG_STRING = {
	FORMAT_WELCOME = [[
		欢迎
	]],
	FORMAT_BROADCAST = "新公会成员：%1$s Lv-%3$s %2$s",--name,class,level,area,achievement points
	WTG_STRING_1 = "\124cffffffff入会欢迎语\124r",
	WTG_STRING_2 = "\124cff80ffff左键点击切换\124r",
	WTG_STRING_3 = "\124cff80ffff右键点击展示\124r",
	WTG_STRING_ON = "\124cff40ff40已开启\124r",
	WTG_STRING_OFF = "\124cffff4040已关闭\124r",
};
L.CONFIG = {
	wel						 = "\124cffff3f3falaChat\124r已加载,/alac或/alachat打开设置",
	title					 = "设置",
	itemLinkEnhanced		 = "公共频道物品链接",
	shortChannelName		 = "短频道名",
	chatEmote				 = "聊天表情",
	ColorNameByClass		 = "聊天职业着色",
	filterQuestAnn			 = "屏蔽任务进度通报(大脚、有爱)",
	channelBarChannel		 = 
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
		"本地防务",
		LOOK_FOR_GROUP,
		label				 = "频道切换栏",
	},
	bfWorld_Ignore_Switch	 = "启用\"屏蔽世界频道按钮\"",
	bfWorld_Ignore_BtnSize	 = "",
	chatFrameScroll			 = "聊天框左侧滚动到底部按钮",
	roll					 = "Roll",
	DBMCountDown			 = "倒计时按钮",
	welcomeToGuild			 = "欢迎新公会成员",
	broadCastNewMember		 = "通报新公会成员",
	ReadyCheck				 = "就位确认",
	statReport				 = "属性通报",
	copy					 = "复制聊天",
	level					 = "聊天框显示公会成员等级",
	scale					 = "缩放",
	position				 = "位置",
	hideConfBtn				 = "隐藏设置按钮",
};
L.REPORT = {
	neckLevel			 = "项链",
	azLevel				 = "等级",
};

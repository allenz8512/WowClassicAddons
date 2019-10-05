--[[--
	alex@0
--]]--
----------------------------------------------------------------------------------------------------
local ADDON, NS = ...;
local FUNC = NS.FUNC;
if not FUNC then return;end
local L = NS.L;
if not L then return;end
----------------------------------------------------------------------------------------------------
local math, table, string, pairs, type, select, tonumber, unpack = math, table, string, pairs, type, select, tonumber, unpack;
local _G = _G;
----------------------------------------------------------------------------------------------------
local SC_DATA1 = L.SC_DATA1;
local SC_DATA2 = L.SC_DATA2;
local SC_DATA3 = L.SC_DATA3;
if not SC_DATA1 or not SC_DATA2 or not SC_DATA3 then return;end
----------------------------------------------------------------------------------------------------
if not __alaBase then
	return;
end
----------------------------------------------------------------------------------------------------short Channel Name
local control_shortChannelName = false;
local backup_shortChannelName = {};
local chatFrame = {};
for i = 1, NUM_CHAT_WINDOWS do
	chatFrame[i] = _G["ChatFrame"..i];
end
eventCall("PLAYER_LOGOUT", 
	function(_, event)
		if control_shortChannelName then
			for i = 1, NUM_CHAT_WINDOWS do
				if i ~= 2 then
					local f = chatFrame[i];
					for _, c in pairs(SC_DATA2) do
						for k, v in pairs(f.channelList) do
							if v == c[4] then
								f.channelList[k] = c[1];
							end
						end
					end
				end
			end
		end
	end
);
hooksecurefunc(SlashCmdList, "JOIN", 
	function(msg)
		if  control_shortChannelName then
			local c = string.gsub(msg, "%s*([^%s]+).*", "%1");
			for i = 1, NUM_CHAT_WINDOWS do
				if i ~= 2 then
					for k, v in pairs(chatFrame[i].channelList) do
						if v == c then
							for _, ct in pairs(SC_DATA2) do
								if string.sub(c, ct[2], ct[3]) == ct[1] then
									chatFrame[i].channelList[k] = ct[4];
								end
							end
							break;
						end
					end
				end
			end
		end
	end
);
hooksecurefunc(SlashCmdList, "LEAVE", 
	function(msg)
		local c = string.gsub(msg, "%s*([^%s]+).*", "%1");
		if  control_shortChannelName then
			local s = nil;
			for k, v in pairs(SC_DATA2) do
				if c == v[1] then
					s = v[4];
				end
			end
			for i = 1, NUM_CHAT_WINDOWS do
				if i ~= 2 then
					local f = chatFrame[i];
					for k, v in pairs(f.channelList) do
						if v == s or v == c then
							table.remove(f.channelList, k);
							break;
						end
					end
				end
			end
		else
			for i = 1, NUM_CHAT_WINDOWS do
				if i ~= 2 then
					local f = chatFrame[i];
					for k, v in pairs(f.channelList) do
						if v == c then
							table.remove(f.channelList, k);
							break;
						end
					end
				end
			end
		end
	end
);
hooksecurefunc("ChatFrame_AddChannel", 
	function(self, c)
		if control_shortChannelName then
			for k, v in pairs(self.channelList) do
				if v == c then
					for _, ct in pairs(SC_DATA2) do
						if string.sub(c, ct[2], ct[3]) == ct[1] then
							local sc = ct[4];
							for i = 1, k do
								if self.channelList[i] == ct[4] then
									sc = nil;
									break;
								end
							end
							self.channelList[k] = sc;
							break;
						end
					end
					break;
				end
			end
		end
	end
);
hooksecurefunc("ChatFrame_RemoveChannel", 
	function(self, c)
		if control_shortChannelName then
			for k, v in pairs(SC_DATA2) do
				if string.sub(c, v[2], v[3]) == v[1] then
					c = v[4];
					break;
				end
			end
			for k, v in pairs(self.channelList) do
				if v == c then
					self.channelList[k] = nil;
					break;
				end
			end
		end
	end
);
hooksecurefunc("CreateChatChannelList", 
	function(self, ...)
		if control_shortChannelName then
			local channelList = FCF_GetCurrentChatFrame().channelList;
			local zoneChannelList = FCF_GetCurrentChatFrame().zoneChannelList;
			for _, v in pairs(CHAT_CONFIG_CHANNEL_LIST) do
				for _, c in pairs(SC_DATA2) do
				    if v.channelName and string.sub(v.channelName, c[2], c[3]) == c[1] then
					    --v.channelName = c[4];
						--v.text = string.sub(v.text, 1, 2)..c[4];
						local checked = nil;
					    if (channelList) then
					    	for _, v2 in pairs(channelList) do
					    		if (v2 == c[4] or v2 == c[1]) then
					    			checked = 1;
									break;
					    		end
					    	end
					    end
					    if (zoneChannelList) then
					    	for _, v2 in pairs(zoneChannelList) do
					    		if (v2 == c[4] or v2 == c[1]) then
					    			checked = 1;
									break;
					    		end
					    	end
					    end
						v.checked = checked;
						break;
					end
				end
			end
		end
	end
);
local function _cf_short_channel_name(self, event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, ...)--main function
	for k, v in pairs(SC_DATA2) do
		if arg9 == v[1] or string.sub(arg9, v[2], v[3]) == v[1] then
			arg9 = v[4];
			arg4 = arg8..". "..arg9;
			break;
		end
	end
	return false, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, ...;
end
local function shortChannelName_ToggleOn()
	if control_shortChannelName then
		return;
	end
	control_shortChannelName = true;
	for i = 1, NUM_CHAT_WINDOWS do
		if i ~= 2 then
			local f = chatFrame[i];
			for _, c in pairs(SC_DATA2) do
				for k, v in pairs(f.channelList) do
					if string.sub(v, c[2], c[3]) == c[1] then
						f.channelList[k] = c[4];
					end
				end
			end
		end
	end
	for get, str in pairs(SC_DATA1) do
		backup_shortChannelName[get] = _G[get];
		_G[get] = str;
	end
	ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", _cf_short_channel_name);
	return control_shortChannelName;
end
local function shortChannelName_ToggleOff()
	if not control_shortChannelName then
		return;
	end
	control_shortChannelName = false;
	for i = 1, NUM_CHAT_WINDOWS do
		if i ~= 2 then
			local f = chatFrame[i];
			for _, c in pairs(SC_DATA2) do
				for k, v in pairs(f.channelList) do
					if v == c[4] then
						f.channelList[k] = c[1];
					end
				end
			end
		end
	end
	for get, str in pairs(backup_shortChannelName) do
		_G[get] = str;
	end
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_CHANNEL", _cf_short_channel_name);
	return control_shortChannelName;
end
FUNC.ON.shortChannelName = shortChannelName_ToggleOn;
FUNC.OFF.shortChannelName = shortChannelName_ToggleOff;
----------------------------------------------------------------------------------------------------filter questAnn
local control_filterQuestAnn = false;
local function _cf_filter_quest_ann(self, event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, ...)
	local msg, sender, line = arg1, arg2, arg11;
	if string.find(msg, "^大脚任务进度提示:") or string.find(msg, "^【网.易.有.爱】") then
		return true;
	end
	return false, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, ...;
end
local function filterQuestAnn_ToggleOn()
	if control_filterQuestAnn then
		return;
	end
	control_filterQuestAnn = true;
	ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT", _cf_filter_quest_ann);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT_LEADER", _cf_filter_quest_ann);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", _cf_filter_quest_ann);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", _cf_filter_quest_ann);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", _cf_filter_quest_ann);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", _cf_filter_quest_ann);
	return control_filterQuestAnn;
end
local function filterQuestAnn_ToggleOff()
	if not control_filterQuestAnn then
		return;
	end
	control_filterQuestAnn = false;
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_INSTANCE_CHAT", _cf_filter_quest_ann);
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_INSTANCE_CHAT_LEADER", _cf_filter_quest_ann);
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_PARTY", _cf_filter_quest_ann);
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_PARTY_LEADER", _cf_filter_quest_ann);
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_RAID", _cf_filter_quest_ann);
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_RAID_LEADER", _cf_filter_quest_ann);
	return control_filterQuestAnn;
end
FUNC.ON.filterQuestAnn = filterQuestAnn_ToggleOn;
FUNC.OFF.filterQuestAnn = filterQuestAnn_ToggleOff;
----------------------------------------------------------------------------------------------------level
local control_level = false;
local memCache = {  };
local function cache_MemInfo()
	for i=1,GetNumGuildMembers() do
		local name,rank,rankindex0,level,class,area,_,_,_,_,eClass,ach=GetGuildRosterInfo(i);
		name=string.split("-",name);
		memCache[name]=level;
	end
end

local pRealm = GetRealmName();
local _GetPlayerLink = _G.GetPlayerLink;
_G.GetPlayerLink = function(fullName, nameApp, lineId, cType, cTarget)
	if control_level then
		local sender, realm = string.split("-", fullName);
		if not realm or realm == pRealm then
			local level = memCache[sender];
			if level then
				--nameApp = nameApp .. level;
				nameApp = string.gsub(nameApp, sender, sender .. ":" .. level);
			end
		end
		cTarget = cTarget or "";
		return "\124Hplayer:" .. fullName .. ":" .. lineId .. ":" .. cType .. "\124h" .. nameApp .. "\124h";
	else
		return _GetPlayerLink(fullName, nameApp, lineId, cType, cTarget);
	end
end
local repeat_cache=nil;
local function level_ToggleOn()
	if control_level then
		return;
	end
	control_level=true;
	--repeat_cache=delayCall(cache_MemInfo, 1, true);
	cache_MemInfo();
	repeat_cache=C_Timer.NewTicker(4, cache_MemInfo);
end
local function level_ToggleOff()
	if not control_level then
		return;
	end
	control_level=false;
	--editdCall(repeat_cache);
	if repeat_cache then
		repeat_cache:Cancel();
		repeat_cache = nil;
	end
end
FUNC.ON.level=level_ToggleOn;
FUNC.OFF.level=level_ToggleOff;
----------------------------------------------------------------------------------------------------colored name
-- --colorNameByClass
-- --Chat_ShouldColorChatByClass
-- -- local __Chat_ShouldColorChatByClass = Chat_ShouldColorChatByClass;
-- -- local Chat_ShouldColorChatByClass_AlywaysOn = function() return true; end
-- -- local __ChatClassColorOverrideShown = ChatClassColorOverrideShown;
-- -- local ChatClassColorOverrideShown_AlwaysOn = function() return true; end
-- local function ColorNameByClass_ToggleOn()
-- 	-- Chat_ShouldColorChatByClass = Chat_ShouldColorChatByClass_AlywaysOn;
-- 	-- ChatClassColorOverrideShown = ChatClassColorOverrideShown_AlwaysOn;
-- 	SetCVar("chatClassColorOverride", "0");
-- end
-- local function ColorNameByClass_ToggleOff()
-- 	-- Chat_ShouldColorChatByClass = __Chat_ShouldColorChatByClass;
-- 	-- ChatClassColorOverrideShown = __ChatClassColorOverrideShown;
-- 	SetCVar("chatClassColorOverride", "1");
-- end
FUNC.ON.ColorNameByClass = function()
	SetCVar("chatClassColorOverride", "0");
end
FUNC.OFF.ColorNameByClass = function()
	SetCVar("chatClassColorOverride", "1");
end
----------------------------------------------------------------------------------------------------editBox tab
local control_editBoxTab = false;

local __ChatEdit_CustomTabPressed = ChatEdit_CustomTabPressed;
--local chatType = { "SAY", "EMOTE", "YELL", "GUILD", "OFFICER", "WHISPER", "PARTY", "RAID", "RAID_WARNING", --[["INSTANCE", ]]};
--local chatHeader = { "/s ", "/e ", "/y ", "/g ", "/o ", "/w ", "/p ", "/raid ", "/rw ", "/bg " };
local chatType = { "SAY", "PARTY", "GUILD", "RAID", --[["INSTANCE", ]]};
local chatHeader = { "/s ", "/p ", "/g ", "/raid ", };
local function OnTabPressed(self)
	local cType = self:GetAttribute("chatType");
	if cType ~= "WHISPER" and cType ~= "BN_WHISPER" then
		for i = 1, #chatType do
			if cType == chatType[i] then
				if i == #chatType then
					self:SetAttribute("chatType", chatType[1]);
					ChatEdit_UpdateHeader(self);
					--self:SetText(chatHeader[1]);
					--print(chatType[1]);
				else
					self:SetAttribute("chatType", chatType[i + 1]);
					ChatEdit_UpdateHeader(self);
					--self:SetText(chatHeader[i + 1]);
					--print(chatType[i + 1]);
				end
				return true;
			end
		end
		self:SetAttribute("chatType", "SAY");
		ChatEdit_UpdateHeader(self);
	end
	-- end
end
local function editBoxTab_ToggleOn()
	if not control_editBoxTab then
		for i=1,NUM_CHAT_WINDOWS do
			local editbox=_G["ChatFrame"..i.."EditBox"];
			--editbox:SetScript("OnTabPressed", OnTabPressed);
			ChatEdit_CustomTabPressed = OnTabPressed;
		end
		control_editBoxTab = true;
	end
end
local function editBoxTab_ToggleOff()
	if control_editBoxTab then
		for i=1,NUM_CHAT_WINDOWS do
			local editbox=_G["ChatFrame"..i.."EditBox"];
			--editbox:SetScript("OnTabPressed", ChatEdit_OnTabPressed);
			ChatEdit_CustomTabPressed = __ChatEdit_CustomTabPressed;
		end
		control_editBoxTab = false;
	end
end
FUNC.ON.editBoxTab = editBoxTab_ToggleOn
FUNC.OFF.editBoxTab = editBoxTab_ToggleOff
----------------------------------------------------------------------------------------------------
-- local control_restoreAfterWhisper = false;
FUNC.ON.restoreAfterWhisper = function()
	--control_restoreAfterWhisper = true;
	ChatTypeInfo["WHISPER"].sticky = 0;
	ChatTypeInfo["BN_WHISPER"].sticky = 0;
	ChatTypeInfo["CHANNEL"].sticky = 0;
end
FUNC.OFF.restoreAfterWhisper = function()
	--control_restoreAfterWhisper = false;
	ChatTypeInfo["WHISPER"].sticky = 1;
	ChatTypeInfo["BN_WHISPER"].sticky = 1;
	ChatTypeInfo["CHANNEL"].sticky	= 1;
end
----------------------------------------------------------------------------------------------------shamanColor
local control_shamanColor = false;
local orig_shamanColor_r = RAID_CLASS_COLORS.SHAMAN.r;
local orig_shamanColor_g = RAID_CLASS_COLORS.SHAMAN.g;
local orig_shamanColor_b = RAID_CLASS_COLORS.SHAMAN.b;
local retail_r = 0.0;
local retail_g = 0.4392147064209;
local retail_b = 0.86666476726532;
local function shamanColor_ToggleOn()
	if not control_shamanColor then
		RAID_CLASS_COLORS.SHAMAN.r = retail_r;
		RAID_CLASS_COLORS.SHAMAN.g = retail_g;
		RAID_CLASS_COLORS.SHAMAN.b = retail_b;
		control_shamanColor = true;
	end
end
local function shamanColor_ToggleOff()
	if control_shamanColor then
		RAID_CLASS_COLORS.SHAMAN.r = orig_shamanColor_r;
		RAID_CLASS_COLORS.SHAMAN.g = orig_shamanColor_g;
		RAID_CLASS_COLORS.SHAMAN.b = orig_shamanColor_b;
		control_shamanColor = false;
	end
end
--string.format("\124cff%.2x%.2x%.2x", 0, 0.4392147064209 * 255, 0.86666476726532 * 255)
--string.format("\124cff%.2x%.2x%.2x", 0.96 * 255, 0.55 * 255, 0.73 * 255)
FUNC.ON.shamanColor = shamanColor_ToggleOn;
FUNC.OFF.shamanColor = shamanColor_ToggleOff;
----------------------------------------------------------------------------------------------------
local locale_match = GetLocale() == "zhCN" or GetLocale() == "zhTW";
if locale_match then

	local ICON_PATH = NS.ICON_PATH;
	local bfwName = "大脚世界频道";

	--大脚世界频道开关按钮
	local control_bfWorld_Ignore_Switch = false;
	local control_bfWorld_Ignore = false;
	local bfwBtn = nil;
	local function find_bfw()
		local t = {GetChannelList()};
		for i = 1, #t/3 do
			if t[i*3-1] == bfwName then
				return t[i*3-2];
			end
		end
		return -1;
	end
	local function _cf_bgWorld_Toggle(self, event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, ...)
		--if control_bfWorld_Ignore and control_bfWorld_Ignore_Switch then
			if arg8 == find_bfw() then
				return true;
			end
		--end
		return false, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, ...;
	end
	local function bfWorld_Ignore_ToggleOn()
		control_bfWorld_Ignore = true;
		if not control_bfWorld_Ignore_Switch then
			return;
		end
		ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", _cf_bgWorld_Toggle);
			if bfwBtn then
				-- bfwBtn:SetNormalTexture(ICON_PATH.."bfw");
				-- bfwBtn:SetPushedTexture(ICON_PATH.."bfw");
				bfwBtn:GetNormalTexture():SetVertexColor(1.0, 0.0, 0.0, 1.0);
				bfwBtn:GetPushedTexture():SetVertexColor(0.25, 0.0, 0.0, 0.5);
				bfwBtn:GetHighlightTexture():SetVertexColor(1.0, 0.0, 0.0, 1.0);
			end
	end
	local function bfWorld_Ignore_ToggleOff(loading)
		control_bfWorld_Ignore = false;
		if not control_bfWorld_Ignore_Switch then
			return;
		end
		ChatFrame_RemoveMessageEventFilter("CHAT_MSG_CHANNEL", _cf_bgWorld_Toggle);
		if not loading then
			if find_bfw()<0 then
				--JoinChannelByName(bfwName);
				--SlashCmdList["JOIN"](bfwName, ChatFrame1EditBox);
				--delayCall(SlashCmdList["JOIN"], 4, false, bfwName, ChatFrame1EditBox);
				if not select(2, JoinPermanentChannel(bfwName, nil, DEFAULT_CHAT_FRAME:GetID(), 1)) then
					delayCall(JoinPermanentChannel, 4, false, bfwName, nil, DEFAULT_CHAT_FRAME:GetID(), 1);
					delayCall(ChatFrame_AddChannel, 4.5, false, DEFAULT_CHAT_FRAME, bfwName);
				end
				ChatFrame_AddChannel(DEFAULT_CHAT_FRAME, bfwName);
			end
			if bfwBtn then
				-- bfwBtn:SetNormalTexture(ICON_PATH.."bfw");
				-- bfwBtn:SetPushedTexture(ICON_PATH.."bfw");
				bfwBtn:GetNormalTexture():SetVertexColor(1.0, 1.0, 1.0, 1.0);
				bfwBtn:GetPushedTexture():SetVertexColor(0.25, 0.25, 0.25, 0.5);
				bfwBtn:GetHighlightTexture():SetVertexColor(1.0, 1.0, 1.0, 1.0);
			end
		end
	end
	--alaChatConfig.bfWorld_Ignore

	local function bfWorld_Ignore_Init()
		bfwBtn = CreateFrame("Button", "_alaChat_bfwBtn_bfwToggle", GeneralDockManager);
		bfwBtn:SetWidth(28);
		bfwBtn:SetHeight(28);
		bfwBtn:SetNormalTexture(ICON_PATH.."bfw");
		bfwBtn:SetPushedTexture(ICON_PATH.."bfw");
		bfwBtn:GetPushedTexture():SetVertexColor(0.25, 0.25, 0.25, 0.25);
		bfwBtn:SetHighlightTexture(ICON_PATH.."bfw");
		bfwBtn:GetHighlightTexture():SetBlendMode("ADD");
		bfwBtn:SetAlpha(0.75);
		bfwBtn:SetFrameLevel(ChatFrame1:GetFrameLevel()+1);
		bfwBtn:SetMovable(false);
		bfwBtn:EnableMouse(true);
		bfwBtn:ClearAllPoints();
		bfwBtn:SetPoint("TOPRIGHT", ChatFrame1, "TOPRIGHT", -4, -4);
		bfwBtn:RegisterForClicks("LeftButtonUp", "RightButtonUp");
		bfwBtn:SetScript("OnClick", function()
				if control_bfWorld_Ignore then
					bfWorld_Ignore_ToggleOff();
					FUNC._CONFIGSET("bfWorld_Ignore", false);
				else
					bfWorld_Ignore_ToggleOn();
					FUNC._CONFIGSET("bfWorld_Ignore", true);
				end
			end);
		bfwBtn._timer = 0;
		bfwBtn._counting = false;
		bfwBtn._fadding = false;
		bfwBtn._faddingAlpha = 0.75;
		bfwBtn:SetScript("OnUpdate", function(_, elapsed)
				if bfwBtn._counting then
					bfwBtn._timer = bfwBtn._timer-elapsed;
					if bfwBtn._timer <= 0 then
						bfwBtn._fadding = true;
						bfwBtn._counting = false;
					end
				end
				if bfwBtn._fadding then
					bfwBtn._faddingAlpha = bfwBtn._faddingAlpha-elapsed*0.5;
					if bfwBtn._faddingAlpha <= 0.25 then
						bfwBtn:SetAlpha(0.25);
						bfwBtn._fadding = false;
					else
						bfwBtn:SetAlpha(bfwBtn._faddingAlpha);
					end
				end
			end)
		bfwBtn:SetScript("OnEnter", function()
				bfwBtn._timer = 1;
				bfwBtn._counting = false;
				bfwBtn:SetAlpha(0.75);
				bfwBtn._fadding = false;
				bfwBtn._faddingAlpha = 0.75;
			end)
		bfwBtn:SetScript("OnLeave", function()
				bfwBtn._timer = 1;
				bfwBtn._counting = true;
				bfwBtn._fadding = false;
				bfwBtn._faddingAlpha = 0.75
			end)
		bfwBtn:Show();
	end

	FUNC.ON.bfWorld_Ignore = bfWorld_Ignore_ToggleOn;
	FUNC.OFF.bfWorld_Ignore = bfWorld_Ignore_ToggleOff;
	FUNC.INIT.bfWorld_Ignore = bfWorld_Ignore_Init;

	FUNC.ON.bfWorld_Ignore_Switch = function(loading)
		if bfwBtn then
			bfwBtn:Show();
			control_bfWorld_Ignore_Switch = true;
			if control_bfWorld_Ignore then
				bfWorld_Ignore_ToggleOn(loading);
			else
				bfWorld_Ignore_ToggleOff(loading);
			end
		end
	end;
	FUNC.OFF.bfWorld_Ignore_Switch = function(loading)
		if bfwBtn then
			bfwBtn:Hide();
			control_bfWorld_Ignore_Switch = false;
		end
		ChatFrame_RemoveMessageEventFilter("CHAT_MSG_CHANNEL", _cf_bgWorld_Toggle);
	end
	--FUNC.INIT.bfWorld_Ignore_Switch;
	FUNC.SETVALUE.bfWorld_Ignore_BtnSize = function(size, init)
		if bfwBtn then
			bfwBtn:SetSize(size, size);
		end
	end

end
----------------------------------------------------------------------------------------------------

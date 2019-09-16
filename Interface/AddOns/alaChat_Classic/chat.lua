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

-- local _SendChatMessage_Level = SendChatMessage;
-- local function _cf_SendChatMessage_Level(msg, ctype, lang, id, ...)
-- 	if control_level then
-- 		if ctype == "WHISPER" then
-- 			id = string.split(":", id);
-- 		end
-- 	end
-- 	return _SendChatMessage_Level(msg, ctype, lang, id, ...);
-- end
-- _G.SendChatMessage = _cf_SendChatMessage_Level;
local pRealm = GetRealmName();
local function levelFilter(self, event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, ...)
	local sender = string.split("-", arg2);
	local level = memCache[sender];
	if level then
		local _, class = GetPlayerInfoByGUID(arg12);
		local classColorTable = RAID_CLASS_COLORS[class];
		if classColorTable then
			--string.format("\124cff%.2x%.2x%.2x", classColorTable.r * 255, classColorTable.g * 255, classColorTable.b * 255) .. arg2 .. "\124r"
		end
		arg1 = arg2 .. ":" .. level;
	end
	return false, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, ...;
end

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
	repeat_cache=delayCall(cache_MemInfo, 1, true);
	-- ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", levelFilter)
	-- ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL_JOIN", levelFilter)
	-- ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL_LEAVE", levelFilter)
	-- ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", levelFilter)
	-- ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", levelFilter)
	-- ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", levelFilter)
	-- ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER", levelFilter)
	-- ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM", levelFilter)
	-- ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", levelFilter)
	-- ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", levelFilter)
	-- ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_WARNING", levelFilter)
	-- ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", levelFilter)
	-- ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", levelFilter)
	-- ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT", levelFilter)
	-- ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT_LEADER", levelFilter)
	-- ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", levelFilter)
	-- ChatFrame_AddMessageEventFilter("CHAT_MSG_OFFICER", levelFilter)
	-- ChatFrame_AddMessageEventFilter("CHAT_MSG_AFK", levelFilter)
	-- ChatFrame_AddMessageEventFilter("CHAT_MSG_EMOTE", levelFilter)
	-- ChatFrame_AddMessageEventFilter("CHAT_MSG_DND", levelFilter)
end
local function level_ToggleOff()
	if not control_level then
		return;
	end
	control_level=false;
	editdCall(repeat_cache);
	-- ChatFrame_RemoveMessageEventFilter("CHAT_MSG_CHANNEL", levelFilter)
	-- ChatFrame_RemoveMessageEventFilter("CHAT_MSG_CHANNEL_JOIN", levelFilter)
	-- ChatFrame_RemoveMessageEventFilter("CHAT_MSG_CHANNEL_LEAVE", levelFilter)
	-- ChatFrame_RemoveMessageEventFilter("CHAT_MSG_SAY", levelFilter)
	-- ChatFrame_RemoveMessageEventFilter("CHAT_MSG_YELL", levelFilter)
	-- ChatFrame_RemoveMessageEventFilter("CHAT_MSG_WHISPER", levelFilter)
	-- ChatFrame_RemoveMessageEventFilter("CHAT_MSG_BN_WHISPER", levelFilter)
	-- ChatFrame_RemoveMessageEventFilter("CHAT_MSG_WHISPER_INFORM", levelFilter)
	-- ChatFrame_RemoveMessageEventFilter("CHAT_MSG_RAID", levelFilter)
	-- ChatFrame_RemoveMessageEventFilter("CHAT_MSG_RAID_LEADER", levelFilter)
	-- ChatFrame_RemoveMessageEventFilter("CHAT_MSG_RAID_WARNING", levelFilter)
	-- ChatFrame_RemoveMessageEventFilter("CHAT_MSG_PARTY", levelFilter)
	-- ChatFrame_RemoveMessageEventFilter("CHAT_MSG_PARTY_LEADER", levelFilter)
	-- ChatFrame_RemoveMessageEventFilter("CHAT_MSG_INSTANCE_CHAT", levelFilter)
	-- ChatFrame_RemoveMessageEventFilter("CHAT_MSG_INSTANCE_CHAT_LEADER", levelFilter)
	-- ChatFrame_RemoveMessageEventFilter("CHAT_MSG_GUILD", levelFilter)
	-- ChatFrame_RemoveMessageEventFilter("CHAT_MSG_OFFICER", levelFilter)
	-- ChatFrame_RemoveMessageEventFilter("CHAT_MSG_AFK", levelFilter)
	-- ChatFrame_RemoveMessageEventFilter("CHAT_MSG_EMOTE", levelFilter)
	-- ChatFrame_RemoveMessageEventFilter("CHAT_MSG_DND", levelFilter)
end
FUNC.ON.level=level_ToggleOn;
FUNC.OFF.level=level_ToggleOff;
----------------------------------------------------------------------------------------------------colored name
--colorNameByClass
--Chat_ShouldColorChatByClass
local __Chat_ShouldColorChatByClass = Chat_ShouldColorChatByClass;
local Chat_ShouldColorChatByClass_AlywaysOn = function() return true; end
local __ChatClassColorOverrideShown = ChatClassColorOverrideShown;
local ChatClassColorOverrideShown_AlwaysOn = function() return true; end
local function ColorNameByClass_ToggleOn()
	Chat_ShouldColorChatByClass = Chat_ShouldColorChatByClass_AlywaysOn;
	ChatClassColorOverrideShown = ChatClassColorOverrideShown_AlwaysOn;
end
local function ColorNameByClass_ToggleOff()
	Chat_ShouldColorChatByClass = __Chat_ShouldColorChatByClass;
	ChatClassColorOverrideShown = __ChatClassColorOverrideShown;
end
FUNC.ON.ColorNameByClass = ColorNameByClass_ToggleOn;
FUNC.OFF.ColorNameByClass = ColorNameByClass_ToggleOff;
----------------------------------------------------------------------------------------------------editBox tab
local control_editBoxTab = false;

local __ChatEdit_CustomTabPressed = ChatEdit_CustomTabPressed;
--local chatType = { "SAY", "EMOTE", "YELL", "GUILD", "OFFICER", "WHISPER", "PARTY", "RAID", "RAID_WARNING", --[["INSTANCE", ]]};
--local chatHeader = { "/s ", "/e ", "/y ", "/g ", "/o ", "/w ", "/p ", "/raid ", "/rw ", "/bg " };
local chatType = { "SAY", "PARTY", "GUILD", "RAID", --[["INSTANCE", ]]};
local chatHeader = { "/s ", "/p ", "/g ", "/raid ", };
local function OnTabPressed(self)
	local cType = self:GetAttribute("chatType");
	--print(cType);
	-- if cType == "RAID" then
	-- 	--self:SetAttribute("chatType", "WHISPER");
	-- 	--if not self:GetAttribute("tellTarget") or self:GetAttribute("tellTarget") == "" then
	-- 	--	self:SetAttribute("tellTarget", UnitName("player"));
	-- 	--end
	-- 	--ChatEdit_UpdateHeader(self);
	-- 	if string.sub(self:GetText(), 1, 4) == "/w  " then
	-- 		self:SetAttribute("chatType", "PARTY");
	-- 		ChatEdit_UpdateHeader(self);
	-- 		--string.match(self:GetText(), "/w [^ ]* (.+)")
	-- 		self:SetText(string.sub(self:GetText(), 4));
	-- 		self:SetCursorPosition(string.len(self:GetText()));
	-- 	else
	-- 		self:SetText("/w  " .. self:GetText());
	-- 		self:SetCursorPosition(3);
	-- 	end
	-- 	--print("WHISPER");
	-- 	return true;
	-- else
	if cType == "WHISPER" or cType == "BN_WHISPER" then
	else
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
	ChatTypeInfo["WHISPER"].sticky = true;
	ChatTypeInfo["BN_WHISPER"].sticky = true;
end
FUNC.OFF.restoreAfterWhisper = function()
	--control_restoreAfterWhisper = false;
	ChatTypeInfo["WHISPER"].sticky = false;
	ChatTypeInfo["BN_WHISPER"].sticky = false;
end
----------------------------------------------------------------------------------------------------itemLinkEnhanced
local control_itemLinkEnhanced = false;
local __SendChatMessage_itemLinkEnhanced = SendChatMessage;
local function _cf_itemLinkEnhanced(self, event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, ...)
	local _, cn = GetChannelName(arg8);
	if cn and (string.find(cn, SC_DATA3[1]) or string.find(cn, SC_DATA3[2])) then
		--if _T_ then print(arg1) end
		while true do
			local s, e, f1, f2 = string.find(arg1, "#([[][^#]+[]])#([^#]+)#");
			if not s then break;end
			if string.find(f2, ":") then
				local id = string.match(f2, "^:(%d+)");
				if id then
					local _, link = GetItemInfo(id);
					if link then
						link = string.gsub(link, "[:0-9]+", f2);
						arg1 = string.sub(arg1, 1, s-1) .. link .. string.sub(arg1, e + 1);
					else
						arg1 = string.sub(arg1, 1, s-1) .. f1 .. string.sub(arg1, e + 1);
					end
				else
					arg1 = string.sub(arg1, 1, s-1) .. f1 .. string.sub(arg1, e + 1);
				end
			else
				local _, link = GetItemInfo(f2);
				if not link then
					link = f1;
				end
				arg1 = string.sub(arg1, 1, s-1) .. link .. string.sub(arg1, e + 1);
			end
		end
	end
	return false, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, ...
end
local function _cf__SendChatMessage_itemLinkEnhanced(msg, ctype, lang, id, ...)
	if control_itemLinkEnhanced then
		if ctype == "CHANNEL" then
			local _, cn = GetChannelName(id);
			if string.find(cn, SC_DATA3[1]) or string.find(cn, SC_DATA3[2]) then
				while true do
					local s, e, c, n = string.find(msg, "\124cff%x%x%x%x%x%x\124Hitem([:0-9]+)\124h([[][^\124]+[]])\124h\124r");
					if not s then break;end
					local id = string.match(c, "^:(%d+)");
					if not id then break;end
					--id = tonumber(id);
					--if not id then break;end
					local _, link = GetItemInfo(id);
					if not link then break;end
					--if _T_ then print(c) end
					if string.find(link, c) or string.len(c) >= 20 then
						msg = string.sub(msg, 1, s-1) .. "#" .. n .. "#" .. id .. "#" .. string.sub(msg, e + 1);
					else
						msg = string.sub(msg, 1, s-1) .. "#" .. n .. "#" .. c .. "#" .. string.sub(msg, e + 1);
					end
				end
				--if _T_ then print(msg) end
			end
		end
	end
	return __SendChatMessage_itemLinkEnhanced(msg, ctype, lang, id, ...);
end
_G.SendChatMessage = _cf__SendChatMessage_itemLinkEnhanced;
local function itemLinkEnhanced_ToggleOn()
	if not control_itemLinkEnhanced then
		control_itemLinkEnhanced = true;
		ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", _cf_itemLinkEnhanced);
	end
end
local function itemLinkEnhanced_ToggleOff()
	if control_itemLinkEnhanced then
		control_itemLinkEnhanced = false;
		ChatFrame_RemoveMessageEventFilter("CHAT_MSG_CHANNEL", _cf_itemLinkEnhanced);
	end
end
FUNC.ON.itemLinkEnhanced = itemLinkEnhanced_ToggleOn
FUNC.OFF.itemLinkEnhanced = itemLinkEnhanced_ToggleOff
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
local control_hyperLinkHoverShow = false;
local LinkHoverType = {
	["achievement"] = true,
	["enchant"] = true,
	["glyph"] = true,
	["item"] = true,
	["quest"] = true,
	["spell"] = true,
	["talent"] = true,
	["unit"] = true,
}
---------------- > Show tooltips when hovering a link in chat (credits to Adys for his LinkHover)
local function _OnHyperlinkEnter(_this, linkData, link)
	if control_hyperLinkHoverShow then
		local t = linkData:match("^(.-):");
		if LinkHoverType[t] then
			ShowUIPanel(GameTooltip)
			GameTooltip:SetOwner(_this, "ANCHOR_RIGHT");
			GameTooltip:SetHyperlink(link);
			GameTooltip:Show();
		end
	end
end
local function _OnHyperlinkLeave(_this, linkData, link)
	if control_hyperLinkHoverShow then
		if GameTooltip:IsOwned(_this) then
		--local t = linkData:match("^(.-):");
		--if LinkHoverType[t] then
			HideUIPanel(GameTooltip);
		end
	end
end
local function main()
	for i = 1, NUM_CHAT_WINDOWS do
		local frame = _G["ChatFrame"..i]
		frame:SetScript("OnHyperlinkEnter", _OnHyperlinkEnter)
		frame:SetScript("OnHyperlinkLeave", _OnHyperlinkLeave)
	end
end
FUNC.INIT.hyperLinkHoverShow = main;
FUNC.ON.hyperLinkHoverShow=function()
	if not control_hyperLinkHoverShow then
		control_hyperLinkHoverShow = true;
	end
end
FUNC.OFF.hyperLinkHoverShow=function()
	if control_hyperLinkHoverShow then
		control_hyperLinkHoverShow = false;
	end
end
----------------------------------------------------------------------------------------------------
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
	if control_bfWorld_Ignore and control_bfWorld_Ignore_Switch then
		local bfWorldID = find_bfw();
		if bfWorldID>0 then
			local msg, sender, channelID, channel, line = arg1, arg2, arg8, arg9, arg11;
			if bfWorldID == channelID then
				return true;
			end
		end
	end
	return false, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, ...;
end
local function bfWorld_Ignore_ToggleOn()
	control_bfWorld_Ignore = true;
	if not control_bfWorld_Ignore_Switch then
		return;
	end
	if GetLocale() == "zhCN" then
		if bfwBtn then
			-- bfwBtn:SetNormalTexture(ICON_PATH.."bfw");
			-- bfwBtn:SetPushedTexture(ICON_PATH.."bfw");
			bfwBtn:GetNormalTexture():SetVertexColor(1.0, 0.0, 0.0, 1.0);
			bfwBtn:GetPushedTexture():SetVertexColor(0.25, 0.0, 0.0, 0.5);
			bfwBtn:GetHighlightTexture():SetVertexColor(1.0, 0.0, 0.0, 1.0);
		end
	end
end
local function bfWorld_Ignore_ToggleOff()
	control_bfWorld_Ignore = false;
	if not control_bfWorld_Ignore_Switch then
		return;
	end
	if GetLocale() == "zhCN" then
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
	if GetLocale() == "zhCN" then
		ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", _cf_bgWorld_Toggle);
		if alaChatConfig then
			bfwBtn = CreateFrame("Button", "_alaChat_bfwBtn_bfwToggle");
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
						alaChatConfig.bfWorld_Ignore = false;
					else
						bfWorld_Ignore_ToggleOn();
						alaChatConfig.bfWorld_Ignore = true;
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
	end
end

if GetLocale() == "zhCN" or GetLocale() == "zhTW" then

	FUNC.ON.bfWorld_Ignore = bfWorld_Ignore_ToggleOn;
	FUNC.OFF.bfWorld_Ignore = bfWorld_Ignore_ToggleOff;
	FUNC.INIT.bfWorld_Ignore = bfWorld_Ignore_Init;

	FUNC.ON.bfWorld_Ignore_Switch = function()
		if bfwBtn then
			bfwBtn:Show();
			control_bfWorld_Ignore_Switch = true;
			if control_bfWorld_Ignore then
				bfWorld_Ignore_ToggleOn();
			else
				bfWorld_Ignore_ToggleOff();
			end
		end
	end;
	FUNC.OFF.bfWorld_Ignore_Switch = function()
		if bfwBtn then
			bfwBtn:Hide();
			control_bfWorld_Ignore_Switch = false;
		end
	end
	--FUNC.INIT.bfWorld_Ignore_Switch;
	FUNC.SETVALUE.bfWorld_Ignore_BtnSize = function(size, init)
		if bfwBtn then
			bfwBtn:SetSize(size, size);
		end
	end

end
----------------------------------------------------------------------------------------------------

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
local SC_DATA3 = L.SC_DATA3;
if not SC_DATA3 then return;end
----------------------------------------------------------------------------------------------------
if not __alaBase then
	return;
end
----------------------------------------------------------------------------------------------------
_G.ALA_GetSpellLink = _G.ALA_GetSpellLink or  function(id, name)
	--\124cff71d5ff\124Hspell:355\124h[嘲讽]\124h\124r
	name = name or GetSpellInfo(id);
	if name then
		if alac_hyperLink and alac_hyperLink() then
			return "\124cff71d5ff\124Hspell:" .. id .. "\124h[" .. name .. "]\124h\124r";
		else
			return name;
		end
	else
		return nil;
	end
end
local _GetSpellLink = _G.ALA_GetSpellLink;
----------------------------------------------------------------------------------------------------hyperLinkEnhanced
local control_hyperLinkEnhanced = false;
local __SendChatMessage_hyperLinkEnhanced = SendChatMessage;
local SpellButtons = {};
for i = 1, 999 do
	local b = _G["SpellButton" .. i];
	if b then
		SpellButtons[i] = b;
	else
		break;
	end
end
local Orig_SpellButton_OnModifiedClick = SpellButton_OnModifiedClick;
function SpellButton_OnModifiedClick(self, button, ...)
	if control_hyperLinkEnhanced and IsShiftKeyDown() then
		local slot, slotType, slotID = SpellBook_GetSpellBookSlot(self);
		local spellName, _, spellId = GetSpellBookItemName(slot, SpellBookFrame.bookType);
		--print(spellName, _, spellId);
		local link = _GetSpellLink(spellId, spellName);
		if link then
			local editBox = ChatEdit_ChooseBoxForSend();
			editBox:Show();
			editBox:SetFocus();
			editBox:Insert(link);
			return;
		end
	end
	return Orig_SpellButton_OnModifiedClick(self, button, ...)
end
local function _cf_itemLinkEnhanced(self, event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, ...)
	local _, cn = GetChannelName(arg8);
	if cn and (string.find(cn, SC_DATA3[1]) or string.find(cn, SC_DATA3[2])) then
		--if _T_ then print(arg1) end
		while true do
			local s, e, f1, f2 = string.find(arg1, "#([[][^#]+[]])#([0-9:]+)#");
			--#[****]#****#
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
local function _cf_spellLinkEnhanced(self, event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, ...)
	while true do
		local s, e, f1, f2 = string.find(arg1, "#([[][^#]+[]])#spell:([0-9]+)#");
		--#[NAME]#spell:ID/DATA#
		if not s then break;end
		local link = _GetSpellLink(f2);
		if not link then
			link = f1;
		-- elseif ATEMU and ATEMU.QueryInfoFromDB then
		-- 	local eClass, class, specIndex, spec, id, row, col, rank = ATEMU.QueryInfoFromDB(f2);
		-- 	if eClass then
		-- 		local classColorTable = RAID_CLASS_COLORS[string.upper(eClass)];
		-- 		link = link .. ":{" .. string.format("\124cff%.2x%.2x%.2x", classColorTable.r * 255, classColorTable.g * 255, classColorTable.b * 255) .. class .. "\124r" .. "-" .. spec .. " R" .. row .. "-C" .. col .. "-L" .. rank .. "}";
		-- 	end
		end
		arg1 = string.sub(arg1, 1, s-1) .. link .. string.sub(arg1, e + 1);
	end
	return false, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, ...
end
local function _cf__SendChatMessage_hyperLinkEnhanced(msg, ctype, lang, id, ...)
	if control_hyperLinkEnhanced then
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
		while true do
			local s, e, id, n = string.find(msg, "\124cff%x%x%x%x%x%x\124H(spell:[0-9]+)\124h([[][^\124]+[]])\124h\124r");
			if not s then break;end
			msg = string.sub(msg, 1, s-1) .. "#" .. n .. "#" .. id .. "#" .. string.sub(msg, e + 1);
		end
	end
	return __SendChatMessage_hyperLinkEnhanced(msg, ctype, lang, id, ...);
end
_G.SendChatMessage = _cf__SendChatMessage_hyperLinkEnhanced;
local function hyperLinkEnhanced_ToggleOn()
	if not control_hyperLinkEnhanced then
		control_hyperLinkEnhanced = true;
		ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", _cf_itemLinkEnhanced);
		ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", _cf_spellLinkEnhanced)
		--ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL_JOIN", _cf_spellLinkEnhanced)
		--ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL_LEAVE", _cf_spellLinkEnhanced)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", _cf_spellLinkEnhanced)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", _cf_spellLinkEnhanced)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", _cf_spellLinkEnhanced)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER", _cf_spellLinkEnhanced)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM", _cf_spellLinkEnhanced)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", _cf_spellLinkEnhanced)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", _cf_spellLinkEnhanced)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_WARNING", _cf_spellLinkEnhanced)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", _cf_spellLinkEnhanced)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", _cf_spellLinkEnhanced)
		--ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT", _cf_spellLinkEnhanced)
		--ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT_LEADER", _cf_spellLinkEnhanced)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", _cf_spellLinkEnhanced)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_OFFICER", _cf_spellLinkEnhanced)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_AFK", _cf_spellLinkEnhanced)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_EMOTE", _cf_spellLinkEnhanced)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_DND", _cf_spellLinkEnhanced)
		ChatFrame_AddMessageEventFilter("CHAT_MSG_COMMUNITIES_CHANNEL", _cf_spellLinkEnhanced)
	end
end
local function hyperLinkEnhanced_ToggleOff()
	if control_hyperLinkEnhanced then
		control_hyperLinkEnhanced = false;
		ChatFrame_RemoveMessageEventFilter("CHAT_MSG_CHANNEL", _cf_itemLinkEnhanced);
		ChatFrame_RemoveMessageEventFilter("CHAT_MSG_CHANNEL", _cf_spellLinkEnhanced)
		--ChatFrame_RemoveMessageEventFilter("CHAT_MSG_CHANNEL_JOIN", _cf_spellLinkEnhanced)
		--ChatFrame_RemoveMessageEventFilter("CHAT_MSG_CHANNEL_LEAVE", _cf_spellLinkEnhanced)
		ChatFrame_RemoveMessageEventFilter("CHAT_MSG_SAY", _cf_spellLinkEnhanced)
		ChatFrame_RemoveMessageEventFilter("CHAT_MSG_YELL", _cf_spellLinkEnhanced)
		ChatFrame_RemoveMessageEventFilter("CHAT_MSG_WHISPER", _cf_spellLinkEnhanced)
		ChatFrame_RemoveMessageEventFilter("CHAT_MSG_BN_WHISPER", _cf_spellLinkEnhanced)
		ChatFrame_RemoveMessageEventFilter("CHAT_MSG_WHISPER_INFORM", _cf_spellLinkEnhanced)
		ChatFrame_RemoveMessageEventFilter("CHAT_MSG_RAID", _cf_spellLinkEnhanced)
		ChatFrame_RemoveMessageEventFilter("CHAT_MSG_RAID_LEADER", _cf_spellLinkEnhanced)
		ChatFrame_RemoveMessageEventFilter("CHAT_MSG_RAID_WARNING", _cf_spellLinkEnhanced)
		ChatFrame_RemoveMessageEventFilter("CHAT_MSG_PARTY", _cf_spellLinkEnhanced)
		ChatFrame_RemoveMessageEventFilter("CHAT_MSG_PARTY_LEADER", _cf_spellLinkEnhanced)
		--ChatFrame_RemoveMessageEventFilter("CHAT_MSG_INSTANCE_CHAT", _cf_spellLinkEnhanced)
		--ChatFrame_RemoveMessageEventFilter("CHAT_MSG_INSTANCE_CHAT_LEADER", _cf_spellLinkEnhanced)
		ChatFrame_RemoveMessageEventFilter("CHAT_MSG_GUILD", _cf_spellLinkEnhanced)
		ChatFrame_RemoveMessageEventFilter("CHAT_MSG_OFFICER", _cf_spellLinkEnhanced)
		ChatFrame_RemoveMessageEventFilter("CHAT_MSG_AFK", _cf_spellLinkEnhanced)
		ChatFrame_RemoveMessageEventFilter("CHAT_MSG_EMOTE", _cf_spellLinkEnhanced)
		ChatFrame_RemoveMessageEventFilter("CHAT_MSG_DND", _cf_spellLinkEnhanced)
		ChatFrame_RemoveMessageEventFilter("CHAT_MSG_COMMUNITIES_CHANNEL", _cf_spellLinkEnhanced)
	end
end
FUNC.ON.hyperLinkEnhanced = hyperLinkEnhanced_ToggleOn
FUNC.OFF.hyperLinkEnhanced = hyperLinkEnhanced_ToggleOff
_G.alac_hyperLink = function()
	return control_hyperLinkEnhanced;
end
----------------------------------------------------------------------------------------------------

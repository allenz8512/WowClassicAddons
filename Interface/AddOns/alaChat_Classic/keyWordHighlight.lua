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
local GameTooltip = GameTooltip;
----------------------------------------------------------------------------------------------------
local LCONFIG = L.CONFIG;
if not LCONFIG then
	return;
end
local CB_DATA = L.CHATBAR;
if not CB_DATA then return;end
----------------------------------------------------------------------------------------------------
local alaBaseBtn = __alaBaseBtn;
if not alaBaseBtn then
	return;
end
----------------------------------------------------------------------------------------------------main
local control_keyWordHighlight = false;
local btn_keyWordHighlight = nil;
local btnPackIndex = 3;
local editBox = nil;
local highlight_color = "00ff00";
local keyWord = {};
local repKeyWord = {};

local function updateRepKeyWord()
	repKeyWord = {};
	for i = 1,#keyWord do
		repKeyWord[i] = "\124cff" .. highlight_color .. keyWord[i] .. "\124r";
	end
end

local function keyWordHighlight_SetColor(r, g, b)
	highlight_color = string.format("%.2x%.2x%.2x", r * 255, g * 255, b* 255);
	updateRepKeyWord();
end
local function keyWordHighlight_SetVal(val)
	val = val .. "\n\n";
	val = string.gsub(val, "%%", "%%%%");
	keyWord = {};
	for v in string.gmatch(val,"%s*([^\n]+)\n") do
		table.insert(keyWord,v);
	end
	updateRepKeyWord();
end

local function KEYWORDHEIGHLIGHT_ONCLICK(button, mouse)
	if mouse == "LeftButton" then
		if not editBox then
			editBox = CreateFrame("EditBox", "alaChatConfigFrame_Input_keyWordHighlight");
			editBox:SetWidth(min(320, GetScreenWidth()));
			editBox:SetFontObject(GameFontHighlightSmall);
			editBox:SetAutoFocus(false);
			editBox:SetJustifyH("LEFT");
			editBox:Hide();
			editBox:SetMultiLine(true);
			editBox:EnableMouse(true);
			--editBox:SetScript("OnEnterPressed", function(self)
				--self:SetText(self:GetText().."\n");
			--end);
			editBox:SetScript("OnEscapePressed", function(self)
				self:ClearFocus();
				--self:SetText(alaChatConfig and alaChatConfig["keyWord"] or "");
				self:Hide();
			end);
			editBox:SetPoint("TOPLEFT", button, "BOTTOMRIGHT", 4, 4);
			editBox:SetBackdrop({
				bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", 
				edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", 
				tile = true, 
				tileSize = 2, 
				edgeSize = 2, 
				insets = { left = 2, right = 2, top = 2, bottom = 2 }
			});
			editBox:SetFrameStrata("FULLSCREEN_DIALOG");
			editBox:SetClampedToScreen(true);

			-- f:SetPoint("TOPLEFT", editBox, "TOPLEFT", - 4, 28);
			-- f:SetPoint("BOTTOMRIGHT", editBox, "BOTTOMRIGHT", 4, - 28);
			-- f:Hide();
			-- f:SetFrameStrata("FULLSCREEN_DIALOG");

			local eOK = CreateFrame("Button", "alaChatConfigFrame_InputOK_keyWordHighlight", editBox);
			eOK:SetSize(20, 20);
			eOK:SetNormalTexture("Interface\\Buttons\\ui-checkbox-check");
			eOK:SetPushedTexture("Interface\\Buttons\\ui-checkbox-check");
			eOK:SetHighlightTexture("Interface\\Buttons\\ui-panel-minimizebutton-highlight");
			eOK:SetPoint("BOTTOMLEFT", editBox, "TOPLEFT", 4, 0);
			eOK:SetScript("OnClick", function(self)
				editBox:Hide();
				alaChatConfig["keyWord"] = editBox:GetText();
				FUNC.SETVALUE["keyWord"](editBox:GetText());
			end);
			editBox.OK = eOK;

			local eClose = CreateFrame("Button", "alaChatConfigFrame_InputClose_keyWordHighlight", editBox);
			eClose:SetSize(20, 20);
			eClose:SetNormalTexture("Interface\\Buttons\\UI-StopButton");
			eClose:SetPushedTexture("Interface\\Buttons\\UI-StopButton");
			eClose:SetHighlightTexture("Interface\\Buttons\\CheckButtonHilight");
			eClose:SetPoint("LEFT", eOK, "RIGHT", 4, 0);
			eClose:SetScript("OnClick", function(self) editBox:Hide(); end);
			editBox.close = eClose;

			button:HookScript("OnHide", function() editBox:Hide(); end);
		end;
		if editBox:IsShown() then
			editBox:Hide();
		else
			editBox:Show();
			editBox:SetText(alaChatConfig["keyWord"] and alaChatConfig["keyWord"] or "");
		end
	else
		alaChatConfig["keyWord"] = "";
		keyWordHighlight_SetVal("");
		editBox:Hide();
	end
end

local function keyWordHighlight_Filter(self, event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, ...)
	for i = 1, #keyWord do
		if string.find(arg1, keyWord[i]) then
			arg1 = string.gsub(arg1, keyWord[i], repKeyWord[i]);
		end
	end
	return false, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, ...;
end

local function keyWordHighlight_On()
	ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", keyWordHighlight_Filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL_JOIN", keyWordHighlight_Filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL_LEAVE", keyWordHighlight_Filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", keyWordHighlight_Filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", keyWordHighlight_Filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", keyWordHighlight_Filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER", keyWordHighlight_Filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM", keyWordHighlight_Filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", keyWordHighlight_Filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", keyWordHighlight_Filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_WARNING", keyWordHighlight_Filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", keyWordHighlight_Filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", keyWordHighlight_Filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT", keyWordHighlight_Filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT_LEADER", keyWordHighlight_Filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", keyWordHighlight_Filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_OFFICER", keyWordHighlight_Filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_AFK", keyWordHighlight_Filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_EMOTE", keyWordHighlight_Filter)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_DND", keyWordHighlight_Filter)

	if btn_keyWordHighlight then
		alaBaseBtn:AddBtn(btnPackIndex,-1,btn_keyWordHighlight,true,false,true);
	else
		btn_keyWordHighlight=alaBaseBtn:CreateBtn(
				btnPackIndex,
				-1,
				"btn_keyWordHighlight",
				"char",
				"K",
				nil,
				function(self,button)
					KEYWORDHEIGHLIGHT_ONCLICK(self, button);
				end,
				{
					CB_DATA.KEYWORDHEIGHLIGHT_0,
					"",
					CB_DATA.KEYWORDHEIGHLIGHT_1,
					CB_DATA.KEYWORDHEIGHLIGHT_2,
				}
		);
	end
end
local function keyWordHighlight_Off()
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_CHANNEL", keyWordHighlight_Filter)
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_CHANNEL_JOIN", keyWordHighlight_Filter)
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_CHANNEL_LEAVE", keyWordHighlight_Filter)
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_SAY", keyWordHighlight_Filter)
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_YELL", keyWordHighlight_Filter)
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_WHISPER", keyWordHighlight_Filter)
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_BN_WHISPER", keyWordHighlight_Filter)
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_WHISPER_INFORM", keyWordHighlight_Filter)
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_RAID", keyWordHighlight_Filter)
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_RAID_LEADER", keyWordHighlight_Filter)
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_RAID_WARNING", keyWordHighlight_Filter)
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_PARTY", keyWordHighlight_Filter)
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_PARTY_LEADER", keyWordHighlight_Filter)
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_INSTANCE_CHAT", keyWordHighlight_Filter)
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_INSTANCE_CHAT_LEADER", keyWordHighlight_Filter)
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_GUILD", keyWordHighlight_Filter)
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_OFFICER", keyWordHighlight_Filter)
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_AFK", keyWordHighlight_Filter)
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_EMOTE", keyWordHighlight_Filter)
	ChatFrame_RemoveMessageEventFilter("CHAT_MSG_DND", keyWordHighlight_Filter)
	alaBaseBtn:RemoveBtn(btn_keyWordHighlight,true);
end

local function keyWordHighlight_Init()
end

FUNC.ON.keyWordHighlight = keyWordHighlight_On;
FUNC.OFF.keyWordHighlight = keyWordHighlight_Off;

FUNC.SETVALUE.keyWord = keyWordHighlight_SetVal;
FUNC.SETVALUE.keyWordColor = keyWordHighlight_SetColor;


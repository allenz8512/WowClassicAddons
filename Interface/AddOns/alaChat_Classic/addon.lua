--[[--
	alex@0
--]]--
----------------------------------------------------------------------------------------------------
local ADDON, NS = ...;
NS.FUNC = NS.FUNC or { ON = { }, OFF = { }, INIT = { }, TOOLTIPS = { }, SETVALUE = { }, SETSTYLE = {  }, };
local FUNC = NS.FUNC;
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
----------------------------------------------------------------------------------------------------main
local alaBaseBtn = __alaBaseBtn;
if not alaBaseBtn then
	return;
end

local NAME = "alaChat_Classic";
local btnPackIndex = 16;

local function debug(...)
	print("\124cffff0000alaChat addon:\124r",...);
end
local function FUNC_CALL(t,k,...)
	if FUNC[t] then
		if FUNC[t][k] then
			return FUNC[t][k](...);
		elseif k ~= "_version" then
			debug("Missing FUNC handler",t,k);
		end
	elseif t ~= "_version" then
		debug("Missing FUNC table",t);
	end
	return nil;
end
--------------------------------------------------
local configFrame = CreateFrame("Frame","alaChatConfigFrame",UIParent);
configFrame:Hide();
NS.configFrame = configFrame;

local titleHeight = 30;

local CBLineHeight = 28;

local MCLineHeight0 = 24;
local MCLineHeight1 = 20;
local MCLineHeight2 = 20;
local MCLineHeight3 = 24;
local MCWidth = 24;
local MCInter = 16;

local SLLineHeight = 36;
local SLWidth = 120;

local DDLineHeight = 24;

local INLineHeight = 24;

local OptionsCheckButtonSize = 26;
local OptionsSetButtonWidth = 45;
local space_Header_Label = 4;
local space_Label_Obejct = 8;
local space_SubConfig = 12;
local borderWidth = 6;
local borderHeight = 4;
--local labelTexture = "interface\\minimap\\templeofkotmogu_ball_orange";
local labelTexture = "interface\\minimap\\raid";

local config = nil;

local key = {
	"position",
	"scale",
	"alpha",
	"barStyle",
	
	"shortChannelName",
	"hyperLinkEnhanced",
	"chatEmote",
	"ColorNameByClass",
	"shamanColor",
	"filterQuestAnn",
	"channelBarChannel",
	"channelBarStyle",
	
	"bfWorld_Ignore_Switch",
	"bfWorld_Ignore",
	"bfWorld_Ignore_BtnSize",
	
	"welcomeToGuild",
	"welcometoGuildMsg",
	"broadCastNewMember",
	"roll",
	"DBMCountDown",
	"ReadyCheck",
	"level",
	"copy",
	"copyTagColor",
	"copyTagFormat",
	
	"editBoxTab",
	"restoreAfterWhisper",
	"hyperLinkHoverShow",

	"keyWordHighlight",
	"keyWordColor",
	"keyWord",
};
local default = {
	_version				 = 190830.0,
	_overrideVersion		 = 190830.0,

	position				 = "BELOW_EDITBOX",
	scale					 = 1.0,
	alpha					 = 1.0,
	barStyle				 = "ala",

	shortChannelName		 = true,
	hyperLinkEnhanced		 = true,
	chatEmote				 = true,
	ColorNameByClass		 = true,
	shamanColor				 = false,
	filterQuestAnn			 = false,
	channelBarChannel		 = { true,true,true,true,true,true,true,true,true,true,true,true,true,true },
	channelBarStyle			 = "CHAR",

	bfWorld_Ignore_Switch	 = false,
	bfWorld_Ignore			 = false,
	bfWorld_Ignore_BtnSize	 = 28,

	--chatFrameScroll			 = false,
	welcomeToGuild			 = false,
	welcometoGuildMsg		 = L.WTG_STRING and L.WTG_STRING.FORMAT_WELCOME or "Welcome!",
	broadCastNewMember		 = false,
	roll 					 = true,
	DBMCountDown			 = true,
	ReadyCheck				 = true,
	--statReport				 = true,
	level					 = false,
	copy					 = false,
	copyTagColor			 = { 0.25, 0.25, 1.00 },
	copyTagFormat			 = "#s";

	--hideConfBtn				 = true,
	editBoxTab				 = true,
	restoreAfterWhisper		 = true,
	hyperLinkHoverShow		 = false,

	keyWordHighlight		 = true,
	keyWordColor			 = { 0.00, 1.00, 0.00 },
	keyWord					 = "",
};
local override = {
	_version				 = 190921.0,
	level					 = false,
	copy					 = false,
};
local buttons = {
	--[[1]]	{ 				name = "position"				,type = "DropDownMenu"	,label = LCONFIG.position				,key = "position"				,value = { "BELOW_EDITBOX", "ABOVE_EDITOBX", "ABOVE_CHATFRAME" }, },
	--[[2]]	{ 				name = "scale"					,type = "Slider"		,label = LCONFIG.scale					,key = "scale"					,minRange = 0.1	,maxRange = 2.0	,stepSize = 0.1	, },
	--[[3]]	{ sub = true,	name = "alpha"					,type = "Slider"		,label = LCONFIG.alpha					,key = "alpha"					,minRange = 0.0	,maxRange = 1.0	,stepSize = 0.05	, },
	--[[4]] { sub = true,	name = "barStyle"				,type = "DropDownMenu"	,label = LCONFIG.barStyle				,key = "barStyle"				,value = { "ala", "blz" }, },

	--[[5]]	{ 				name = "shortChannelName"		,type = "CheckButton"	,label = LCONFIG.shortChannelName		,key = "shortChannelName"		, },
	--[[6]]	{ 				name = "hyperLinkEnhanced"		,type = "CheckButton"	,label = LCONFIG.hyperLinkEnhanced		,key = "hyperLinkEnhanced"		, },
	--[[7]]	{ 				name = "chatEmote"				,type = "CheckButton"	,label = LCONFIG.chatEmote				,key = "chatEmote"				, },
	--[[8]]	{ 				name = "ColorNameByClass"		,type = "CheckButton"	,label = LCONFIG.ColorNameByClass		,key = "ColorNameByClass"		, },
	--[[9]]	{ sub = true,	name = "shamanColor"			,type = "CheckButton"	,label = LCONFIG.shamanColor			,key = "shamanColor"			, },
	--      { 				name = "filterQuestAnn"			,type = "CheckButton"	,label = LCONFIG.filterQuestAnn			,key = "filterQuestAnn"			, },
	--[[10]]{ 				name = "channelBarStyle"		,type = "DropDownMenu"	,label = LCONFIG.channelBarStyle		,key = "channelBarStyle"			,value = { "CHAR", "CIRCLE", "SQUARE" }, },
	--[[11]]{ 				name = "channelBarChannel"		,type = "MultiCB"		,label = LCONFIG.channelBarChannel		,key = "channelBarChannel"		, },
	--[[12]]{ 				name = "bfWorld_Ignore_Switch"	,type = "CheckButton"	,label = LCONFIG.bfWorld_Ignore_Switch	,key = "bfWorld_Ignore_Switch"	, },
	--[[13]]{ sub = true,	name = "bfWorld_Ignore_BtnSize"	,type = "Slider"		,label = LCONFIG.bfWorld_Ignore_BtnSize	,key = "bfWorld_Ignore_BtnSize"	,minRange = 12	,maxRange = 96	,stepSize = 4		, },

	--[[14]]{ 				name = "broadCastNewMember"		,type = "CheckButton"	,label = LCONFIG.broadCastNewMember		,key = "broadCastNewMember"		, },
	--[[15]]{ sub = true,	name = "welcomeToGuild"			,type = "CheckButton"	,label = LCONFIG.welcomeToGuild			,key = "welcomeToGuild"			, },
	--[[16]]{ sub = true,	name = "welcometoGuildMsg"		,type = "Input"			,label = LCONFIG.welcometoGuildMsg		,key = "welcometoGuildMsg"		,note = L.WTG_STRING.WELCOME_NOTES	,multiLine = true	,width = 640,  },
	--[[17]]{ 				name = "roll"					,type = "CheckButton"	,label = LCONFIG.roll					,key = "roll"					, },
	--[[18]]{ sub = true,	name = "DBMCountDown"			,type = "CheckButton"	,label = LCONFIG.DBMCountDown			,key = "DBMCountDown"			, },
	--[[19]]{ sub = true,	name = "ReadyCheck"				,type = "CheckButton"	,label = LCONFIG.ReadyCheck				,key = "ReadyCheck"				, },
	--      { 				name = "statReport"				,type = "CheckButton"	,label = LCONFIG.statReport				,key = "statReport"				, },
	--[[20]]{ 				name = "copy"					,type = "CheckButton"	,label = LCONFIG.copy					,key = "copy"					, },
	--[[21]]{ sub = true,	name = "copyTagColor"			,type = "ColorSelect"	,label = LCONFIG.copyTagColor			,key = "copyTagColor"			, },
	--[[22]]{ sub = true,	name = "copyTagFormat"			,type = "Input"			,label = LCONFIG.copyTagFormat			,key = "copyTagFormat"			,note = LCONFIG.copyTagFormat		,multiLine = false	,width = 240,  },
	--[[23]]{ 				name = "level"					,type = "CheckButton"	,label = LCONFIG.level					,key = "level"					, },
	--[[24]]{ 				name = "editBoxTab"				,type = "CheckButton"	,label = LCONFIG.editBoxTab				,key = "editBoxTab"				, },
	--[[25]]{ 				name = "restoreAfterWhisper"	,type = "CheckButton"	,label = LCONFIG.restoreAfterWhisper	,key = "restoreAfterWhisper"	, },
	--[[26]]{ 				name = "hyperLinkHoverShow"		,type = "CheckButton"	,label = LCONFIG.hyperLinkHoverShow		,key = "hyperLinkHoverShow"		, },
	--[[27]]{ 				name = "keyWordHighlight"		,type = "CheckButton"	,label = LCONFIG.keyWordHighlight		,key = "keyWordHighlight"		, },
	--[[28]]{ sub = true,	name = "keyWordColor"			,type = "ColorSelect"	,label = LCONFIG.keyWordColor			,key = "keyWordColor"			, },

	--{ name = "hideConfBtn"				,type = "CheckButton"	,label = LCONFIG.hideConfBtn				,key = "hideConfBtn"				, },
};
if GetLocale() ~= "zhCN" and GetLocale() ~= "zhTW" then
	table.remove(buttons, 13);
	default.bfWorld_Ignore_BtnSize = nil;
	override.bfWorld_Ignore_BtnSize = nil;
	--key.bfWorld_Ignore_BtnSize = nil;
	table.remove(key, 15);
	table.remove(buttons, 12);
	default.bfWorld_Ignore_Switch = nil;
	override.bfWorld_Ignore_Switch = nil;
	--key.bfWorld_Ignore_Switch = nil;
	table.remove(key, 14);
	default.bfWorld_Ignore = nil;
	override.bfWorld_Ignore = nil;
	--key.bfWorld_Ignore = nil;
	table.remove(key, 13);
	--table.remove(buttons, 9);
	--default.filterQuestAnn = nil;
end

local function resetButtonOnClick()
	for k, v in pairs(default) do
		if config[k] ~= v then
			if type(v) == "boolean" then
				config[k] = v;
				if v then
					FUNC_CALL("ON", k);
				else
					FUNC_CALL("OFF", k);
				end
			elseif type(v) == "table" then
				config[k] = { };
				for k1, v1 in pairs(v) do
					config[k][k1] = v1;
					if type(v1) == "boolean" then
						if v1 then
							FUNC_CALL("ON", k, k1);
						else
							FUNC_CALL("OFF", k, k1);
						end
					else
						FUNC_CALL("SETVALUE", k, k1, v1);
					end
				end
			else
				config[k] = v;
				FUNC_CALL("SETVALUE", k, v);
			end
			local object = configFrame.objects[k];
			if object then
				if object.type == "CheckButton" then
					object.object:SetChecked(config[k]);
				elseif object.type == "MultiCB" then
					for i = 1, #v.object do
						object.object[i]:SetChecked(config[k][i]);
					end
				elseif object.type == "Slider" or object.type == "DropDownMenu" then
					object.object:SetValue(config[k]);
				end
			end
		end
	end
end
local function closeButtonOnClick()
	configFrame:Hide();
end


local function MultiCheckButtonOnClick(self)
	if config[self.key][self.idx] then
		config[self.key][self.idx] = false;
		FUNC_CALL("OFF", self.key, self.idx);
	else
		config[self.key][self.idx] = true;
		FUNC_CALL("ON", self.key, self.idx);
	end
end
local function CheckButtonOnClick(self)
	if config[self.key] then
		config[self.key] = false;
		FUNC_CALL("OFF", self.key);
	else
		config[self.key] = true;
		FUNC_CALL("ON", self.key);
	end
end
local function CheckButtonOnEnter(self)
	if self.tooltipText then
		GameTooltip:SetOwner(self, self.tooltipOwnerPoint or "ANCHOR_RIGHT");
		if type(self.tooltipText) == "string" then
			GameTooltip:SetText(self.tooltipText, nil, nil, nil, nil, true);
		elseif type(self.tooltipText) == "function" then
			GameTooltip:SetText(self.tooltipText(), nil, nil, nil, nil, true);
		end
	end
end
local function sliderDisable(self)
	self.text:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
	self.minText:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
	self.maxText:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
	self.valueBox:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
	self.valueBox:SetEnabled(false)
end
local function sliderEnable(self)
	self.text:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
	self.minText:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
	self.maxText:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
	self.valueBox:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
	self.valueBox:SetEnabled(true)
end
local function sliderRefresh(self)
	self:SetValue(config[self.key]);
	self.valueBox:SetText(config[self.key]);
end
local function sliderOnValueChanged(self, value, userInput)
	local value = floor(value / self.stepSize + 0.5) * self.stepSize;
	if userInput then
		config[self.key] = value;
		FUNC_CALL("SETVALUE", self.key, value);
	end
	self.valueBox:SetText(value);
end
local function sliderValueBoxOnEscapePressed(self)
	self:SetText(config[self.parent.key]);
	self:ClearFocus();
end
local function sliderValueBoxOnEnterPressed(self)
	local value = tonumber(self:GetText()) or 0.0
	value = floor(value / self.parent.stepSize + 0.5) * self.parent.stepSize
	value = max(self.parent.minRange, min(self.parent.maxRange, value))
	self.parent:SetValue(value)
	config[self.parent.key] = value;
	self:SetText(value);
	FUNC_CALL("SETVALUE", self.parent.key, value);
	self:ClearFocus();
end
local function sliderValueBoxOnOnChar(self)
	self:SetText(self:GetText():gsub("[^%.0-9]+", ""):gsub("(%..*)%.", "%1"))
end
local function dropOnClick(button, drop, funcIndex, key, val, ...)
	drop.label:SetText(val);
	config[key] = val;
	FUNC_CALL(funcIndex, key, val, ...);
end

local function configFrame_Init(configFrame)

	local objects = { };
	configFrame.objects = objects;

	local maxWidth = - 1;

	local yOfs = 10;

	local prevAnchorObj = nil;
	local prevWidth = 0;

	for _, t in pairs(buttons) do
		if t.type == "CheckButton" then
			local cb = CreateFrame("CheckButton", "alaChatConfigFrame_CheckButton_"..t.name, configFrame, "OptionsBaseCheckButtonTemplate");
			cb:SetHitRectInsets(0, 0, 0, 0);
			cb:GetNormalTexture():SetVertexColor(0.0, 1.0, 0.0, 1.0);
			cb:GetPushedTexture():SetVertexColor(0.0, 1.0, 0.0, 1.0);
			cb:GetCheckedTexture():SetVertexColor(0.0, 1.0, 0.0, 1.0);
			cb.key = t.key;
			cb.tooltipText = t.text;

			cb:ClearAllPoints();

			cb:SetScript("OnClick", CheckButtonOnClick);

			local label = configFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
			label:SetText(t.label);
			cb.label = label;

			label:SetPoint("LEFT", cb, "RIGHT", space_Header_Label, 0);

			objects[t.key] = { type = t.type, head = cb, object = cb, label = label, };
			if t.sub and prevAnchorObj then
				cb:SetPoint("LEFT", prevAnchorObj, "RIGHT", space_SubConfig, 0);
				prevWidth = prevWidth + space_SubConfig + OptionsCheckButtonSize + space_Header_Label + label:GetWidth();
				maxWidth = math.max(maxWidth, prevWidth);
			else
				cb:SetPoint("TOPLEFT", configFrame, "TOPLEFT", borderWidth, - yOfs);
				yOfs = yOfs + CBLineHeight;
				prevWidth = OptionsCheckButtonSize + space_Header_Label + label:GetWidth();
				maxWidth = math.max(maxWidth, prevWidth);
			end
			prevAnchorObj = label;
		elseif t.type == "MultiCB" then
			local cfg = config[t.key];
			local num = #cfg;

			local texture = configFrame:CreateTexture(nil, "ARTWORK");
			texture:SetSize(OptionsCheckButtonSize, OptionsCheckButtonSize);
			texture:SetTexture(labelTexture);
			texture:SetPoint("TOPLEFT", configFrame, "TOPLEFT", borderWidth, - yOfs);

			local label = configFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
			label:SetText(t.label.label);
			label:SetPoint("LEFT", texture, "RIGHT", space_Header_Label, 0);

			objects[t.key] = { type = t.type, object = { }, label = label, }

			local xOfs = 0;
			local anchor = nil;
			if t.sub and prevAnchorObj then
				anchor = { "LEFT", prevAnchorObj, "RIGHT", space_SubConfig, 0 };
				xOfs = space_SubConfig;
				prevWidth = prevWidth + space_SubConfig + MCWidth * num + MCInter * (num - 1) + 30;
				maxWidth = math.max(maxWidth, prevWidth);
			else
				anchor = { "TOPLEFT", configFrame, "TOPLEFT", 30 + borderWidth, - yOfs - MCLineHeight0 - MCLineHeight1 };
				xOfs = 0;
				yOfs = yOfs + (MCLineHeight0 + MCLineHeight1 + MCLineHeight2 + MCLineHeight3);
				prevWidth = MCWidth * num + MCInter * (num - 1) + 30;
				maxWidth = math.max(maxWidth, prevWidth);
			end

			for i = 1, num do

				local cb = CreateFrame("CheckButton", "alaChatConfigFrame_MultiCheckButton_"..t.name..i, configFrame, "OptionsBaseCheckButtonTemplate");
				cb:GetNormalTexture():SetVertexColor(0.0, 1.0, 0.0, 1.0);
				cb:GetPushedTexture():SetVertexColor(0.0, 1.0, 0.0, 1.0);
				cb:GetCheckedTexture():SetVertexColor(0.0, 1.0, 0.0, 1.0);
				cb:SetHitRectInsets(0, 0, 0, 0);
				cb.key = t.key;
				cb.idx = i;
				cb.tooltipText = t.text;

				cb:ClearAllPoints();
				if i == 1 then
					cb:SetPoint(unpack(anchor));
				else
					cb:SetPoint("LEFT", objects[t.key].object[i - 1], "RIGHT", MCInter, 0);
				end

				cb:SetScript("OnClick", MultiCheckButtonOnClick);

				local subLabel = configFrame:CreateFontString(nil, "ARTWORK");
				local font, size = GameFontHighlight:GetFont();
				subLabel:SetFont(font, size - 2, "OUTLINE");
				subLabel:SetText(t.label[i]);
				cb.label = subLabel;

				if i%2 == 0 then
					subLabel:SetPoint("TOP", cb, "BOTTOM", 0, space_Header_Label);
				else
					subLabel:SetPoint("BOTTOM", cb, "TOP", 0, space_Header_Label);
				end

				objects[t.key].object[i] = cb;
			end

			prevAnchorObj = objects[t.key].object[num];
			objects[t.key].head = objects[t.key].object[1];
		elseif t.type == "Slider" then
			local texture = configFrame:CreateTexture(nil, "ARTWORK");
			texture:SetSize(OptionsCheckButtonSize, OptionsCheckButtonSize);
			texture:SetTexture(labelTexture);

			local label = configFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
			label:SetText(t.label);

			label:SetPoint("LEFT", texture, "RIGHT", space_Header_Label, 0);

			local slider = CreateFrame("Slider", "alaChatConfigFrame_CheckButton_" .. t.name, configFrame, "OptionsSliderTemplate");
			slider.key = t.key;

			slider:ClearAllPoints();
			slider:SetPoint("LEFT", label, "RIGHT", space_Label_Obejct, 0);
			slider:SetWidth(SLWidth);
			slider:SetHeight(20);

			slider:SetScript("OnShow", sliderRefresh);
			slider:HookScript("OnValueChanged", sliderOnValueChanged)
			slider:HookScript("OnDisable", sliderDisable)
			slider:HookScript("OnEnable", sliderEnable)
			slider.stepSize = t.stepSize;
			slider:SetValueStep(t.stepSize);
			slider:SetObeyStepOnDrag(true);

			slider:SetMinMaxValues(t.minRange, t.maxRange)
			slider.minRange = t.minRange;
			slider.maxRange = t.maxRange;
			slider.minText = _G[slider:GetName() .. "Low"];
			slider.maxText = _G[slider:GetName() .. "High"];
			slider.text = _G[slider:GetName() .. "Text"];
			slider.minText:SetText(t.minRange)
			slider.maxText:SetText(t.maxRange)
			--slider.text:SetText(t.label);

			local valueBox = CreateFrame("EditBox", nil, slider);
			valueBox:SetPoint("TOP", slider, "BOTTOM", 0, 0);
			valueBox:SetSize(60, 14);
			valueBox:SetFontObject(GameFontHighlightSmall);
			valueBox:SetAutoFocus(false);
			valueBox:SetJustifyH("CENTER");
			valueBox:SetScript("OnEscapePressed", sliderValueBoxOnEscapePressed);
			valueBox:SetScript("OnEnterPressed", sliderValueBoxOnEnterPressed);
			valueBox:SetScript("OnChar", sliderValueBoxOnOnChar);
			valueBox:SetMaxLetters(5)

			valueBox:SetBackdrop({
				bgFile = "Interface/ChatFrame/ChatFrameBackground", 
				edgeFile = "Interface/ChatFrame/ChatFrameBackground", 
				tile = true, edgeSize = 1, tileSize = 5, 
			 })
			valueBox:SetBackdropColor(0, 0, 0, 0.5)
			valueBox:SetBackdropBorderColor(0.3, 0.3, 0.3, 0.8)
			valueBox.parent = slider;

			slider.valueBox = valueBox

			objects[t.key] = { type = t.type, head = texture, object = slider, label = label, object2 = valueBox, };
			if t.sub and prevAnchorObj then
				texture:SetPoint("LEFT", prevAnchorObj, "RIGHT", space_SubConfig, 0);
				prevWidth = prevWidth + space_Header_Label + OptionsCheckButtonSize + space_Header_Label + label:GetWidth() + space_Label_Obejct + slider:GetWidth();
				maxWidth = math.max(maxWidth, prevWidth);
			else
				texture:SetPoint("TOPLEFT", configFrame, "TOPLEFT", borderWidth, - yOfs);
				yOfs = yOfs + SLLineHeight;
				prevWidth = OptionsCheckButtonSize + space_Header_Label + label:GetWidth() + space_Label_Obejct + slider:GetWidth();
				maxWidth = math.max(maxWidth, prevWidth);
			end
			prevAnchorObj = slider;
		elseif t.type == "DropDownMenu" then
			local texture = configFrame:CreateTexture(nil, "ARTWORK");
			texture:SetSize(OptionsCheckButtonSize, OptionsCheckButtonSize);
			texture:SetTexture(labelTexture);
			--texture:SetPoint("TOPLEFT", configFrame, "TOPLEFT", borderWidth, - yOfs);

			local label = configFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
			label:SetText(t.label);

			label:SetPoint("LEFT", texture, "RIGHT", space_Header_Label, 0);

			local drop = CreateFrame("Button", "alaChatConfigFrame_Drop_" .. t.name, configFrame);
			drop:SetSize(28, 28)
			drop:EnableMouse(true);
			drop:SetNormalTexture("interface\\mainmenubar\\ui-mainmenu-scrolldownbutton-up")
			--drop:GetNormalTexture():SetTexCoord(0.0, 1.0, 0.0, 0.5);
			drop:SetPushedTexture("interface\\mainmenubar\\ui-mainmenu-scrolldownbutton-down")
			--drop:GetPushedTexture():SetTexCoord(0.0, 1.0, 0.0, 0.5);
			drop:SetHighlightTexture("Interface\\mainmenubar\\ui-mainmenu-scrolldownbutton-highlight");
			drop:SetPoint("LEFT", label, "RIGHT", space_Label_Obejct, 0);
			local dropfs = configFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
			dropfs:SetPoint("LEFT", drop, "RIGHT", 0, 0);
			drop.label = dropfs;
			drop.key = t.key;
			local db = {
				handler = dropOnClick, 
				elements = { }, 
			};
			local dropfsWidth = 0;
			for i = 1, #t.value do
				db.elements[i] = {
					para = { drop, "SETVALUE", t.key, t.value[i], };
					text = t.value[i];
				 };
				dropfs:SetText(t.value[i]);
				dropfsWidth = math.max(dropfsWidth, dropfs:GetWidth());
			end
			dropfs:SetText(config and config[t.key] or "");
			drop:SetScript("OnClick", function(self) ALADROP(self, "BOTTOMRIGHT", db); end);
			function drop:SetValue(val)
				self.label:SetText(val);
			end

			objects[t.key] = { type = t.type, head = texture, object = drop, label = label, object2 = dropfs, };

			if t.sub and prevAnchorObj then
				texture:SetPoint("LEFT", prevAnchorObj, "RIGHT", space_SubConfig, 0);
				prevWidth = prevWidth + space_SubConfig + OptionsCheckButtonSize + space_Header_Label + label:GetWidth() + space_Label_Obejct + 28 + dropfsWidth;
				maxWidth = math.max(maxWidth, prevWidth);
			else
				texture:SetPoint("TOPLEFT", configFrame, "TOPLEFT", borderWidth, - yOfs);
				yOfs = yOfs + DDLineHeight;
				prevWidth = OptionsCheckButtonSize + space_Header_Label + label:GetWidth() + space_Label_Obejct + 28 + dropfsWidth;
				maxWidth = math.max(maxWidth, prevWidth);
			end
			prevAnchorObj = button;
		elseif t.type == "Input" then
			local texture = configFrame:CreateTexture(nil, "ARTWORK");
			texture:SetSize(OptionsCheckButtonSize, OptionsCheckButtonSize);
			texture:SetTexture(labelTexture);

			local label = configFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
			label:SetText(t.label);
			label:SetPoint("LEFT", texture, "RIGHT", space_Header_Label, 0);

			local button = CreateFrame("Button", "alaChatConfigFrame_InputButton_"..t.name, configFrame);
			button:SetSize(OptionsSetButtonWidth, 20);
			button:SetPoint("LEFT", label, "RIGHT", space_Label_Obejct, 0);

			button:SetNormalTexture("Interface\\Buttons\\ui-panel-button-up");
			button:SetPushedTexture("Interface\\Buttons\\ui-panel-button-up");
			button:GetNormalTexture():SetTexCoord(1 / 128, 79 / 128, 1 / 32, 22 / 32);
			button:GetPushedTexture():SetTexCoord(1 / 128, 79 / 128, 1 / 32, 22 / 32);
			button:SetHighlightTexture("Interface\\Buttons\\ui-panel-minimizebutton-highlight");
			button:SetScript("OnEnter", function(self)
				if self.note then
					GameTooltip:ClearAllPoints();
					GameTooltip:SetOwner(self, "ANCHOR_LEFT");
					GameTooltip:SetText(self.note, 1.0, 1.0, 1.0);
				end
			end);
			button:SetScript("OnLeave", function(self)	if GameTooltip:IsOwned(self) then GameTooltip:Hide();end end);
			button.note = t.note;
			local fontString = button:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
			fontString:SetText("\124cff00ff00SET\124r");
			fontString:SetPoint("CENTER");
			button.fontString = fontString;

			-- local f = CreateFrame("Frame", nil, configFrame);
			-- f:EnableMouse(true);
			-- f:SetBackdrop({
			-- 	bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", 
			-- 	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", 
			-- 	tile = true, 
			-- 	tileSize = 2, 
			-- 	edgeSize = 2, 
			-- 	insets = { left = 2, right = 2, top = 2, bottom = 2 }
			-- });
			-- f:SetBackdropColor(1, 1, 1, 1)

			local editBox = CreateFrame("EditBox", nil, configFrame);
			editBox:SetWidth(min(t.width or 320, GetScreenWidth()));
			editBox:SetFontObject(GameFontHighlightSmall);
			editBox:SetAutoFocus(false);
			editBox:SetJustifyH("LEFT");
			editBox:Hide();
			editBox:SetMultiLine(true);
			editBox:EnableMouse(true);
			editBox:SetBackdrop({
				bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", 
				edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", 
				tile = true, 
				tileSize = 2, 
				edgeSize = 2, 
				insets = { left = 2, right = 2, top = 2, bottom = 2 }
			});
			--editBox:SetScript("OnEnterPressed", function(self)
				--self:SetText(self:GetText().."\n");
			--end);
			if not t.multiLine then
				editBox:SetScript("OnEnterPressed", function(self)
					self:SetText(string.gsub(self:GetText(), "\n", ""));
				end);
			end
			editBox:SetScript("OnEscapePressed", function(self)
				self:ClearFocus();
				self:SetText(config[t.key] or "");
				self:Hide();
			end);
			-- editBox:SetScript("OnChar", function()
			-- 	editBox:SetText(string.gsub(editBox:GetText(), "%%", ""));
			-- end);
			editBox:SetPoint("LEFT", button, "RIGHT", 4, 0);
			editBox:SetBackdrop({
				bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", 
				edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", 
				tile = true, 
				tileSize = 2, 
				edgeSize = 2, 
				insets = { left = 2, right = 2, top = 2, bottom = 2 }
			 });
			editBox:SetFrameStrata("FULLSCREEN_DIALOG");

			-- f:SetPoint("TOPLEFT", editBox, "TOPLEFT", - 4, 28);
			-- f:SetPoint("BOTTOMRIGHT", editBox, "BOTTOMRIGHT", 4, - 28);
			-- f:Hide();
			-- f:SetFrameStrata("FULLSCREEN_DIALOG");

			local eOK = CreateFrame("Button", "alaChatConfigFrame_InputButtonOK_"..t.name, editBox);
			eOK:SetSize(20, 20);
			eOK:SetNormalTexture("Interface\\Buttons\\ui-checkbox-check");
			eOK:SetPushedTexture("Interface\\Buttons\\ui-checkbox-check");
			eOK:SetHighlightTexture("Interface\\Buttons\\ui-panel-minimizebutton-highlight");
			eOK:SetPoint("BOTTOMLEFT", editBox, "TOPLEFT", 4, 0);
			eOK:SetScript("OnClick", function(self)
				editBox:Hide();
				local text = string.gsub(editBox:GetText(), "%%", "%%%%");
				config[t.key] = editBox:GetText();
				FUNC.SETVALUE[t.key](editBox:GetText());
			end);
			editBox.OK = eOK;

			local eClose = CreateFrame("Button", "alaChatConfigFrame_InputButtonClose_"..t.name, editBox);
			eClose:SetSize(20, 20);
			eClose:SetNormalTexture("Interface\\Buttons\\UI-StopButton");
			eClose:SetPushedTexture("Interface\\Buttons\\UI-StopButton");
			eClose:SetHighlightTexture("Interface\\Buttons\\CheckButtonHilight");
			eClose:SetPoint("LEFT", eOK, "RIGHT", 4, 0);
			eClose:SetScript("OnClick", function(self) editBox:Hide(); end);
			editBox.close = eClose;

			button.editBox = editBox;
			button:SetScript("OnClick", function(self)
				if editBox:IsShown() then
					editBox:Hide();
				else
					editBox:Show();
					editBox:SetText(config[t.key] or "");
				end
			end);
			button:SetScript("OnHide", function(self)
				editBox:Hide();
			end)
		
			objects[t.key] = { type = t.type, head = texture, object = button, label = label, };
			if t.sub and prevAnchorObj then
				texture:SetPoint("LEFT", prevAnchorObj, "RIGHT", space_SubConfig, 0);
				prevWidth = prevWidth + space_SubConfig + OptionsCheckButtonSize + space_Header_Label + label:GetWidth() + space_Label_Obejct + OptionsSetButtonWidth;
				maxWidth = math.max(maxWidth, prevWidth);
			else
				texture:SetPoint("TOPLEFT", configFrame, "TOPLEFT", borderWidth, - yOfs);
				yOfs = yOfs + INLineHeight;
				prevWidth = OptionsCheckButtonSize + space_Header_Label + label:GetWidth() + space_Label_Obejct + OptionsSetButtonWidth;
				maxWidth = math.max(maxWidth, prevWidth);
			end
			prevAnchorObj = button;
		elseif t.type == "ColorSelect" then
			local texture = configFrame:CreateTexture(nil, "ARTWORK");
			texture:SetSize(OptionsCheckButtonSize, OptionsCheckButtonSize);
			texture:SetTexture(labelTexture);

			local label = configFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
			label:SetText(t.label);
			label:SetPoint("LEFT", texture, "RIGHT", space_Header_Label, 0);

			local button = CreateFrame("Button", "alaChatConfigFrame_ColorSelect"..t.name, configFrame);
			button:SetSize(OptionsSetButtonWidth, 20);
			button:SetPoint("LEFT", label, "RIGHT", space_Label_Obejct, 0);

			button:SetNormalTexture("Interface\\Buttons\\ui-panel-button-up");
			button:SetPushedTexture("Interface\\Buttons\\ui-panel-button-up");
			button:GetNormalTexture():SetTexCoord(1 / 128, 79 / 128, 1 / 32, 22 / 32);
			button:GetPushedTexture():SetTexCoord(1 / 128, 79 / 128, 1 / 32, 22 / 32);
			button:SetHighlightTexture("Interface\\Buttons\\ui-panel-minimizebutton-highlight");
			button:SetScript("OnEnter", function(self)
				if self.note then
					GameTooltip:ClearAllPoints();
					GameTooltip:SetOwner(self, "ANCHOR_LEFT");
					GameTooltip:SetText(self.note, 1.0, 1.0, 1.0);
				end
			end);
			button:SetScript("OnLeave", function(self)	if GameTooltip:IsOwned(self) then GameTooltip:Hide();end end);
			button.note = t.note;
			local fontString = button:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
			fontString:SetText("\124cff00ff00SET\124r");
			fontString:SetPoint("CENTER");
			button.fontString = fontString;

			button:SetScript("OnClick", function(self)
				if ColorPickerFrame:IsShown() then
					ColorPickerFrame:Hide();
				else
					ColorPickerFrame.func = nil;
					ColorPickerFrame.cancelFunc = nil;
					ColorPickerFrame:SetColorRGB(unpack(config[t.key]));
					--ColorPickerFrame:SetText(config[t.key] or "");
					--ColorPickerFrame.opacity(1);
					ColorPickerFrame.func = function()
							local r, g, b = ColorPickerFrame:GetColorRGB();
							config[t.key] = { r, g, b, };
							FUNC_CALL("SETVALUE", t.key, r, g, b);
					end
					ColorPickerFrame.cancelFunc = function()
						local r, g, b = ColorPickerFrame:GetColorRGB();
						config[t.key] = { r, g, b, };
						FUNC_CALL("SETVALUE", t.key, r, g, b);
					end
					ColorPickerFrame:SetPoint("BOTTOMLEFT", button, "TOPRIGHT", 12, 12);
					ColorPickerFrame:Show();
				end
			end);
			button:SetScript("OnHide", function(self)
				--colorSelect:Hide();
			end)

			objects[t.key] = { type = t.type, head = texture, object = button, label = label, object2 = colorSelect, };
			if t.sub and prevAnchorObj then
				texture:SetPoint("LEFT", prevAnchorObj, "RIGHT", space_SubConfig, 0);
				prevWidth = prevWidth + space_SubConfig + OptionsCheckButtonSize + space_Header_Label + label:GetWidth() + space_Label_Obejct + OptionsSetButtonWidth;
				maxWidth = math.max(maxWidth, prevWidth);
			else
				texture:SetPoint("TOPLEFT", configFrame, "TOPLEFT", borderWidth, - yOfs);
				yOfs = yOfs + INLineHeight;
				prevWidth = OptionsCheckButtonSize + space_Header_Label + label:GetWidth() + space_Label_Obejct + OptionsSetButtonWidth;
				maxWidth = math.max(maxWidth, prevWidth);
			end
			prevAnchorObj = button;
		end
	end

	configFrame:SetWidth(borderWidth + maxWidth + borderWidth);
	configFrame:SetHeight(yOfs);

end

local function configFrame_Create()
	configFrame:SetPoint("CENTER");
	configFrame:SetFrameStrata("HIGH");
	--configFrame:SetToplevel(true);
	configFrame:SetMovable(true);
	--configFrame:SetClampedToScreen(true);
	configFrame:SetBackdrop(
		{
			bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", 
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", 
			tile = true, 
			tileSize = 16, 
			edgeSize = 16, 
			insets = { left = 5, right = 5, top = 5, bottom = 5 }
		 }
	);
	configFrame:SetBackdropColor(0, 0, 0);
	--[[
		--configFrame:EnableMouse(true);
		--configFrame:RegisterForDrag("LeftButton");
		--configFrame:SetScript("OnDragStart", function(self) self:StartMoving();end);
		--configFrame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing();end);
		-- local title = configFrame:CreateFontString("alaChatConfigFrame_Title", "ARTWORK", "GameFontHighlight");
		-- title:SetPoint("CENTER", configFrame, "TOP", 0, * 0.5);
		-- title:SetText(LCONFIG.title);

		-- configFrame.title = title;

		-- local closeButton = CreateFrame("Button", "alaChatConfigFrame_CloseButton", configFrame);
		-- closeButton:SetSize(18, 18);
		-- closeButton:SetNormalTexture("Interface\\Buttons\\UI-StopButton");
		-- closeButton:SetPushedTexture("Interface\\Buttons\\UI-StopButton");
		-- closeButton:SetHighlightTexture("Interface\\Buttons\\CheckButtonHilight");
		-- closeButton:SetPoint("TOPRIGHT", - 6, - 6);
		-- closeButton:SetScript("OnClick", closeButtonOnClick);

		-- configFrame.closeButton = closeButton;

		-- local resetButton = CreateFrame("Button", "alaChatConfigFrame_CloseButton", configFrame);
		-- resetButton:SetSize(18, 18);
		-- resetButton:SetNormalTexture("Interface\\Buttons\\UI-RefreshButton");
		-- resetButton:SetPushedTexture("Interface\\Buttons\\UI-RefreshButton");
		-- resetButton:SetHighlightTexture("Interface\\Buttons\\CheckButtonHilight");
		-- resetButton:SetPoint("TOPLEFT", 6, - 6);
		-- resetButton:SetScript("OnClick", resetButtonOnClick);

		-- configFrame.resetButton = resetButton;
	--]]
	configFrame_Init(configFrame);
	configFrame:SetSize(100, 100);
	configFrame:SetScript("OnShow", function(self)
		for k, v in pairs(self.objects) do
			if v.type == "CheckButton" then
				v.object:SetChecked(config[k]);
			elseif v.type == "MultiCB" then
				for i = 1, #v.object do
					v.object[i]:SetChecked(config[k][i]);
				end
			elseif v.type == "Slider" or v.type == "DropDownMenu" then
				v.object:SetValue(config[k]);
			end
		end
	end);
	configFrame.name = NAME;
	InterfaceOptions_AddCategory(configFrame);
end

local function __ShowConfig()
	InterfaceOptionsFrame_Show();
	InterfaceOptionsFrame_OpenToCategory(NAME);
end
local function __OnClick(self, button)
	__ShowConfig();
end
local function alaC_Init()
	if _G["ElvUI"] then
		default.position = "ABOVE_CHATFRAME";
	end
	if alaChatConfig and (alaChatConfig._version and alaChatConfig._version >= default._version) then
		for k, v in pairs(alaChatConfig) do
			if default[k] == nil then
				alaChatConfig[k] = nil;
			elseif type(v) == "table" then
				for k2, v2 in pairs(default[k]) do
					if default[k][k2] == nil then
						v[k2] = nil;
					end
				end
			end
		end
		for k, v in pairs(default) do
			if alaChatConfig[k] == nil then
				if type(v) == "table" then
					alaChatConfig[k] = { };
					for k1, v1 in pairs(v) do
						alaChatConfig[k][k1] = v1;
					end
				else
					alaChatConfig[k] = v;
				end
			end
		end
	else
		alaChatConfig = default;
	end

	config = alaChatConfig;

	if not config._overrideVersion or (config._overrideVersion and config._overrideVersion < override._version) then
		for k, v in pairs(override) do
			config[k] = v;
		end
		config._overrideVersion = override._version;
	end
	if GetLocale() == "zhCN" or GetLocale() == "zhTW" then
		if config.channelBarChannel[14] == nil then
			config.channelBarChannel[14] = true;
		end
	else
		config.channelBarChannel[14] = nil;
	end

	for k, v in pairs(FUNC.INIT) do
		v();
	end
	for i = 1, #key do
		local k = key[i];
		local v = default[k];
		if type(v) == "boolean" then
			if config[k] then
				FUNC_CALL("ON", k, true);
			else
				FUNC_CALL("OFF", k, true);
			end
		elseif type(v) == "table" then
			if type(v[1]) == "boolean" then
				for k1, v1 in pairs(config[k]) do
						if v1 then
							FUNC_CALL("ON", k, k1, true)
						else
							FUNC_CALL("OFF", k, k1, true)
						end
				end
			else
				FUNC_CALL("SETVALUE", k, unpack(config[k]));
			end
		else
			FUNC_CALL("SETVALUE", k, config[k], true);
		end
	end

	alaChatConfigFrame.config = config;
	configFrame_Create();
	--[[if LibStub then
		local icon = LibStub("LibDBIcon-1.0", true);
		if icon then
			icon:Register("alaChat_Classic", 
			{
				icon = "Interface\\AddOns\\alaChat_Classic\\icon\\emote_nor", 
				OnClick = __OnClick, 
				text = nil, 
				OnTooltipShow = function(tt)
						tt:AddLine("alaChat_Classic");
						tt:AddLine(" ");
						tt:AddLine(L.DBIcon_Text);
					end
			 }, 
			{
				minimapPos = 15, 
			 }
			);
		end
	end]]
	print(LCONFIG.wel);
end
eventCall(
	"PLAYER_ENTERING_WORLD", 
	alaC_Init
	--function() C_Timer.After(0.01, alaC_Init) end
);

FUNC._CONFIGSET = function(config, set)
	alaChatConfig[config] = set;
end


function _gp(f)
	local a, b, c, d, e = f:GetPoint();
	if type(a) == "table" then
		print(a:GetName(), b, c, d, e);
	elseif type(b) == "table" then
		print(a, b:GetName(), c, d, e);
	else
		print(a, b, c, d, e);
	end
end
function _gi(f, p)
	if type(f) ~= "table" then
		print("not table");
	end
	p = p or f:GetParent();
	if p then
		for k, v in pairs(p) do
			if v == f then
				print("KEY", k);
				return;
			end
		end
	else
		print("no parent");
	end
end


alaChatConfigFrame.FUNC = FUNC;

FUNC.SETVALUE.position = function(pos, init)
	if not init then
		alaBaseBtn:Pos(pos);
		-- if pos == 1 then
		-- 	alaBaseBtn:Pos("BELOW_EDITBOX");
		-- elseif pos == 2 then
		-- 	alaBaseBtn:Pos("ABOVE_EDITOBX");
		-- elseif pos == 3 then
		-- 	alaBaseBtn:Pos("ABOVE_CHATFRAME");
		-- end
		--config.position = pos;
	end
end
FUNC.SETVALUE.scale = function(scale, init)
	if not init then
		alaBaseBtn:Scale(scale);
	end
end
FUNC.SETVALUE.alpha = function(alpha, init)
	if not init then
		alaBaseBtn:Alpha(alpha);
	end
end
FUNC.SETVALUE.barStyle = function(style, init)
	if not init then
		alaBaseBtn:Style(style);
	end
	for _, v in pairs(FUNC.SETSTYLE) do
		v(style);
	end
end
local configButton = nil;
FUNC.ON.hideConfBtn = function(init)
	if init or config.hideConfBtn then
		alaBaseBtn:RemoveBtn(configButton, true);
		config.hideConfBtn = true;
	end
end
FUNC.OFF.hideConfBtn = function(init)
	if init or not config.hideConfBtn then
		if configButton then
			__alaBaseBtn:AddBtn(btnPackIndex, 1, configButton, false, false, true);
			config.hideConfBtn = false;
		else
			configButton = alaBaseBtn:CreateBtn(
				btnPackIndex, 
				1, 
				"alaChatConfig", 
				"Interface\\Buttons\\UI-OptionsButton", 
				"Interface\\Buttons\\UI-OptionsButton", 
				nil, 
				__OnClick, 
				{
					"\124cffffffffalaChat Config\124r", 
				 }
		);
		end
	end
end

SLASH_ALACHAT1 = "/alac";
SLASH_ALACHAT2 = "/alachat";
SlashCmdList["ALACHAT"] = function()
    __OnClick();
end


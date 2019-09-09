--[[--
	alex@0
--]]--
----------------------------------------------------------------------------------------------------
local ADDON,NS=...;
NS.FUNC=NS.FUNC or {ON={},OFF={},INIT={},TOOLTIPS={},SETVALUE={},};
local FUNC=NS.FUNC;
local L=NS.L;
if not L then return;end
----------------------------------------------------------------------------------------------------
local math,table,string,pairs,type,select,tonumber,unpack=math,table,string,pairs,type,select,tonumber,unpack;
local _G=_G;
local GameTooltip=GameTooltip;
----------------------------------------------------------------------------------------------------
local LCONFIG=L.CONFIG;
if not LCONFIG then
	return;
end
----------------------------------------------------------------------------------------------------main
local alaBaseBtn=__alaBaseBtn;
if not alaBaseBtn then
	return;
end

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
local configFrame=CreateFrame("Frame","alaChatConfigFrame",UIParent);
configFrame:Hide();
NS.configFrame=configFrame;

local titleHeight=30;
local CBLineHeight=30;
local MCLineHeight0=20;
local MCLineHeight1=20;
local MCLineHeight2=20;
local MCLineHeight3=20;
local MCWidth=48;
local MCInter=2;
local SLLineHeight=50;
local DDLineHeight=30;
local OptionsCheckButtonSize=26;
local space_CheckButton_FontString=2;
local space_DropDownMenu_FontString=40;
local borderWidth=6;
local borderHeight=4;

local config=nil;

local default={
	_version				=190830,

	shortChannelName		=true,
	itemLinkEnhanced		=true,
	filterQuestAnn			=false,
	chatEmote				=true,
	ColorNameByClass		=true,
	channelBarChannel		={true,true,true,true,true,true,true,true,true,true,true,true,true,true},

	bfWorld_Ignore_Switch	=false,
	bfWorld_Ignore			=false,
	bfWorld_Ignore_BtnSize	=28,

	--chatFrameScroll			=false,
	roll 					=true,
	DBMCountDown			=true,
	welcomeToGuild			=false,
	broadCastNewMember		=false,
	ReadyCheck				=true,
	--statReport				=true,
	level					=true;
	copy					=true;

	scale					=1.0;

	position				="BELOW_EDITBOX";

	hideConfBtn				=true,
};
local buttons={
	{name="shortChannelName"		,type="CheckButton"	,label=LCONFIG.shortChannelName			,key="shortChannelName"			,},
	{name="itemLinkEnhanced"		,type="CheckButton"	,label=LCONFIG.itemLinkEnhanced			,key="itemLinkEnhanced"			,},
	{name="chatEmote"				,type="CheckButton"	,label=LCONFIG.chatEmote				,key="chatEmote"				,},
	{name="ColorNameByClass"		,type="CheckButton" ,label=LCONFIG.ColorNameByClass			,key="ColorNameByClass"			,},
	{name="filterQuestAnn"			,type="CheckButton"	,label=LCONFIG.filterQuestAnn			,key="filterQuestAnn"			,},
	{name="channelBarChannel"		,type="MultiCB"		,label=LCONFIG.channelBarChannel		,key="channelBarChannel"		,},
	{name="bfWorld_Ignore_Switch"	,type="CheckButton"	,label=LCONFIG.bfWorld_Ignore_Switch	,key="bfWorld_Ignore_Switch"	,},
	{name="bfWorld_Ignore_BtnSize"	,type="Slider"		,label=LCONFIG.bfWorld_Ignore_BtnSize	,key="bfWorld_Ignore_BtnSize"	,minRange=12	,maxRange=96	,stepSize=4		,},

	{name="roll"					,type="CheckButton"	,label=LCONFIG.roll						,key="roll"						,},
	{name="DBMCountDown"			,type="CheckButton"	,label=LCONFIG.DBMCountDown				,key="DBMCountDown"				,},
	{name="welcomeToGuild"			,type="CheckButton"	,label=LCONFIG.welcomeToGuild			,key="welcomeToGuild"			,},
	{name="broadCastNewMember"		,type="CheckButton"	,label=LCONFIG.broadCastNewMember		,key="broadCastNewMember"		,},
	{name="ReadyCheck"				,type="CheckButton"	,label=LCONFIG.ReadyCheck				,key="ReadyCheck"				,},
	--{name="statReport"				,type="CheckButton"	,label=LCONFIG.statReport				,key="statReport"				,},
	{name="copy"					,type="CheckButton"	,label=LCONFIG.copy						,key="copy"						,},
	{name="level"					,type="CheckButton"	,label=LCONFIG.level					,key="level"					,},

	{name="scale"					,type="Slider"		,label=LCONFIG.scale					,key="scale"					,minRange=0.1	,maxRange=2.0	,stepSize=0.1	,},
	--{name="position"				,type="Slider"		,label=LCONFIG.position					,key="position"					,minRange=1		,maxRange=3		,stepSize=1		,},
	{name="position"				,type="DropDownMenu",label=LCONFIG.position					,key="position"					,value={"BELOW_EDITBOX","ABOVE_EDITOBX","ABOVE_CHATFRAME"},},

	{name="hideConfBtn"				,type="CheckButton"	,label=LCONFIG.hideConfBtn				,key="hideConfBtn"				,},
};
if GetLocale()~="zhCN" then
	table.remove(buttons,8);
	default.bfWorld_Ignore_BtnSize=nil;
	table.remove(buttons,7);
	default.bfWorld_Ignore_Switch=nil;
	default.bfWorld_Ignore=nil;
	table.remove(buttons,5);
	default.filterQuestAnn=nil;
end

local function resetButtonOnClick()
	for k,v in pairs(default) do
		if config[k]~=v then
			if type(v)=="boolean" then
				config[k]=v;
				if v then
					FUNC_CALL("ON",k);
				else
					FUNC_CALL("OFF",k);
				end
			elseif type(v)=="table" then
				config[k]={};
				for k1,v1 in pairs(v) do
					config[k][k1]=v1;
					if type(v1)=="boolean" then
						if v1 then
							FUNC_CALL("ON",k,k1);
						else
							FUNC_CALL("OFF",k,k1);
						end
					else
						FUNC_CALL("SETVALUE",k,k1,v1);
					end
				end
			else
				config[k]=v;
				FUNC_CALL("SETVALUE",k,v);
			end
			if configFrame.checkButtons[k] then
				configFrame.checkButtons[k]:SetChecked(v);
			elseif configFrame.sliders[k] then
				configFrame.sliders[k]:SetValue(v);
			end
		end
	end
end
local function closeButtonOnClick()
	configFrame:Hide();
end


local function MultiCheckButtonOnClick(self)
	if config[self.key][self.idx] then
		config[self.key][self.idx]=false;
		FUNC_CALL("OFF",self.key,self.idx);
	else
		config[self.key][self.idx]=true;
		FUNC_CALL("ON",self.key,self.idx);
	end
end
local function CheckButtonOnClick(self)
	if config[self.key] then
		config[self.key]=false;
		FUNC_CALL("OFF",self.key);
	else
		config[self.key]=true;
		FUNC_CALL("ON",self.key);
	end
end
local function CheckButtonOnEnter(self)
	if self.tooltipText then
		GameTooltip:SetOwner(self,self.tooltipOwnerPoint or "ANCHOR_RIGHT");
		if type(self.tooltipText)=="string" then
			GameTooltip:SetText(self.tooltipText,nil,nil,nil,nil,true);
		elseif type(self.tooltipText)=="function" then
			GameTooltip:SetText(self.tooltipText(),nil,nil,nil,nil,true);
		end
	end
end
local function sliderDisable(self)
	self.text:SetTextColor(GRAY_FONT_COLOR.r,GRAY_FONT_COLOR.g,GRAY_FONT_COLOR.b)
	self.minText:SetTextColor(GRAY_FONT_COLOR.r,GRAY_FONT_COLOR.g,GRAY_FONT_COLOR.b)
	self.maxText:SetTextColor(GRAY_FONT_COLOR.r,GRAY_FONT_COLOR.g,GRAY_FONT_COLOR.b)
	self.valueBox:SetTextColor(GRAY_FONT_COLOR.r,GRAY_FONT_COLOR.g,GRAY_FONT_COLOR.b)
	self.valueBox:SetEnabled(false)
end
local function sliderEnable(self)
	self.text:SetTextColor(HIGHLIGHT_FONT_COLOR.r,HIGHLIGHT_FONT_COLOR.g,HIGHLIGHT_FONT_COLOR.b)
	self.minText:SetTextColor(HIGHLIGHT_FONT_COLOR.r,HIGHLIGHT_FONT_COLOR.g,HIGHLIGHT_FONT_COLOR.b)
	self.maxText:SetTextColor(HIGHLIGHT_FONT_COLOR.r,HIGHLIGHT_FONT_COLOR.g,HIGHLIGHT_FONT_COLOR.b)
	self.valueBox:SetTextColor(HIGHLIGHT_FONT_COLOR.r,HIGHLIGHT_FONT_COLOR.g,HIGHLIGHT_FONT_COLOR.b)
	self.valueBox:SetEnabled(true)
end
local function sliderRefresh(self)
	self:SetValue(config[self.key]);
	self.valueBox:SetText(config[self.key]);
end
local function sliderOnValueChanged(self,value,userInput)
	local value=floor(value / self.stepSize + 0.5) * self.stepSize;
	if userInput then
		config[self.key]=value;
		FUNC_CALL("SETVALUE",self.key,value);
	end
	self.valueBox:SetText(value);
end
local function sliderValueBoxOnEscapePressed(self)
	self:SetText(config[self.parent.key]);
	self:ClearFocus()
end
local function sliderValueBoxOnEnterPressed(self)
	local value=tonumber(self:GetText()) or 0.0
	value=floor(value / self.parent.stepSize + 0.5) * self.parent.stepSize
	value=max(self.parent.minRange,min(self.parent.maxRange,value))
	self.parent:SetValue(value)
	config[self.parent.key]=value;
	self:SetText(value);
	FUNC_CALL("SETVALUE",self.parent.key,value);
	self:ClearFocus();
end
local function sliderValueBoxOnOnChar(self)
	self:SetText(self:GetText():gsub("[^%.0-9]+",""):gsub("(%..*)%.","%1"))
end
local function dropDownInitialize(self)
	for i,v in pairs(self.value) do
		local info=UIDropDownMenu_CreateInfo();
		info.text=v;
		info.value=v;
		info.func=function(_)
			config[self.key]=v;
			FUNC_CALL("SETVALUE",self.key,v);
			UIDropDownMenu_SetSelectedValue(self,v);
		end;
		UIDropDownMenu_AddButton(info);
	end
	UIDropDownMenu_SetSelectedValue(self,config[self.key]);
end


local function configFrame_Init()

	configFrame:SetPoint("CENTER");
	configFrame:SetFrameStrata("HIGH");
	configFrame:SetToplevel(true);
	configFrame:SetMovable(true);
	configFrame:SetClampedToScreen(true);
	configFrame:SetBackdrop(
		{
			bgFile="Interface\\Tooltips\\UI-Tooltip-Background",
			edgeFile="Interface\\Tooltips\\UI-Tooltip-Border",
			tile=true,
			tileSize=16,
			edgeSize=16,
			insets= {left=5,right=5,top=5,bottom=5 }
		}
	);
	configFrame:SetBackdropColor(0,0,0);
	configFrame:EnableMouse(true);
	configFrame:RegisterForDrag("LeftButton");
	configFrame:SetScript("OnDragStart",function(self) self:StartMoving();end);
	configFrame:SetScript("OnDragStop",function(self) self:StopMovingOrSizing();end);

	local title=configFrame:CreateFontString("alaChatConfigFrame_Title","ARTWORK","GameFontHighlight");
	title:SetPoint("CENTER",configFrame,"TOP",0,-titleHeight*0.5);
	title:SetText(LCONFIG.title);

	configFrame.title=title;

	local closeButton=CreateFrame("Button","alaChatConfigFrame_CloseButton",configFrame);
	closeButton:SetSize(18,18);
	closeButton:SetNormalTexture("Interface\\Buttons\\UI-StopButton");
	closeButton:SetPushedTexture("Interface\\Buttons\\UI-StopButton");
	closeButton:SetHighlightTexture("Interface\\Buttons\\CheckButtonHilight");
	closeButton:SetPoint("TOPRIGHT",-6,-6);
	closeButton:SetScript("OnClick",closeButtonOnClick);

	configFrame.closeButton=closeButton;

	local resetButton=CreateFrame("Button","alaChatConfigFrame_CloseButton",configFrame);
	resetButton:SetSize(18,18);
	resetButton:SetNormalTexture("Interface\\Buttons\\UI-RefreshButton");
	resetButton:SetPushedTexture("Interface\\Buttons\\UI-RefreshButton");
	resetButton:SetHighlightTexture("Interface\\Buttons\\CheckButtonHilight");
	resetButton:SetPoint("TOPLEFT",6,-6);
	resetButton:SetScript("OnClick",resetButtonOnClick);

	configFrame.resetButton=resetButton;

	configFrame.checkButtons={};
	configFrame.multiCB={};
	configFrame.sliders={};
	configFrame.dropDowns={};

	local numCBLines=0;
	local numMCLines=0;
	local numSLLines=0;
	local numDDLines=0;
	local maxWidth=-1;
	for _,t in pairs(buttons) do
		if t.type=="CheckButton" then
			local cb=CreateFrame("CheckButton","alaChatConfigFrame_CheckButton_"..t.name,configFrame,"OptionsBaseCheckButtonTemplate");
			cb.key=t.key;
			cb.tooltipText=t.text;

			cb:ClearAllPoints();
			cb:SetPoint("TOPLEFT",configFrame,"TOPLEFT",borderWidth,-titleHeight-CBLineHeight*numCBLines-(MCLineHeight0+MCLineHeight1+MCLineHeight2+MCLineHeight3)*numMCLines-SLLineHeight*numSLLines-DDLineHeight*numDDLines);

			cb:SetScript("OnClick",CheckButtonOnClick);

			local fs=configFrame:CreateFontString(nil,"ARTWORK","GameFontHighlight");
			fs:SetText(t.label);
			cb.fontString=fs;

			fs:SetPoint("LEFT",cb,"RIGHT",space_CheckButton_FontString,0);

			configFrame.checkButtons[t.key]=cb;
			maxWidth=math.max(maxWidth,fs:GetWidth());
			numCBLines=numCBLines+1;
		elseif t.type=="MultiCB" then
			configFrame.multiCB[t.key]={};
			local cfg=config[t.key];
			local num=#cfg;

			local label=configFrame:CreateFontString(nil,"ARTWORK","GameFontHighlight");
			label:SetText(t.label.label);
			label:SetPoint("TOPLEFT",configFrame,"TOPLEFT",26+borderWidth,-titleHeight-CBLineHeight*numCBLines-(MCLineHeight0+MCLineHeight1+MCLineHeight2+MCLineHeight3)*numMCLines-SLLineHeight*numSLLines-DDLineHeight*numDDLines);

			for i=1,num do

				local cb=CreateFrame("CheckButton","alaChatConfigFrame_MultiCheckButton_"..t.name..i,configFrame,"OptionsBaseCheckButtonTemplate");
				cb:SetHitRectInsets(0,0,0,0);
				cb.key=t.key;
				cb.idx=i;
				cb.tooltipText=t.text;

				cb:ClearAllPoints();
				cb:SetPoint("TOPLEFT",configFrame,"TOPLEFT",30+borderWidth+(MCWidth+MCInter)*(i-1),-titleHeight-CBLineHeight*numCBLines-(MCLineHeight0+MCLineHeight1+MCLineHeight2+MCLineHeight3)*numMCLines-MCLineHeight0-MCLineHeight1-SLLineHeight*numSLLines-DDLineHeight*numDDLines);

				cb:SetScript("OnClick",MultiCheckButtonOnClick);

				local fs=configFrame:CreateFontString(nil,"ARTWORK","GameFontHighlight");
				fs:SetText(t.label[i]);
				cb.fontString=fs;

				if i%2==0 then
					fs:SetPoint("TOP",cb,"BOTTOM",0,space_CheckButton_FontString);
				else
					fs:SetPoint("BOTTOM",cb,"TOP",0,space_CheckButton_FontString);
				end

				configFrame.multiCB[t.key][i]=cb;
			end
			maxWidth=math.max(maxWidth,MCWidth*num+MCInter*(num-1));
			numMCLines=numMCLines+1;
		elseif t.type=="Slider" then
			local slider=CreateFrame("Slider","alaChatConfigFrame_CheckButton_" .. t.name,configFrame,"OptionsSliderTemplate");
			slider.key=t.key;

			slider:ClearAllPoints();
			slider:SetPoint("TOPLEFT",configFrame,"TOPLEFT",borderWidth,-titleHeight-CBLineHeight*numCBLines-(MCLineHeight0+MCLineHeight1+MCLineHeight2+MCLineHeight3)*numMCLines-SLLineHeight*numSLLines-DDLineHeight*numDDLines);
			slider:SetWidth(maxWidth);
			slider:SetHeight(20);

			slider:SetScript("OnShow",sliderRefresh);
			slider:HookScript("OnValueChanged",sliderOnValueChanged)
			slider:HookScript("OnDisable",sliderDisable)
			slider:HookScript("OnEnable",sliderEnable)
			slider.stepSize=t.stepSize;
			slider:SetValueStep(t.stepSize);
			slider:SetObeyStepOnDrag(true);

			slider:SetMinMaxValues(t.minRange,t.maxRange)
			slider.minRange=t.minRange;
			slider.maxRange=t.maxRange;
			slider.minText=_G[slider:GetName() .. "Low"];
			slider.maxText=_G[slider:GetName() .. "High"];
			slider.text=_G[slider:GetName() .. "Text"];
			slider.minText:SetText(t.minRange)
			slider.maxText:SetText(t.maxRange)
			slider.text:SetText(t.label);

			local valueBox=CreateFrame("editbox",nil,slider);
			valueBox:SetPoint("TOP",slider,"BOTTOM",0,0);
			valueBox:SetSize(60,14);
			valueBox:SetFontObject(GameFontHighlightSmall);
			valueBox:SetAutoFocus(false);
			valueBox:SetJustifyH("CENTER");
			valueBox:SetScript("OnEscapePressed",sliderValueBoxOnEscape);
			valueBox:SetScript("OnEnterPressed",sliderValueBoxOnEnterPressed);
			valueBox:SetScript("OnChar",sliderValueBoxOnOnChar);
			valueBox:SetMaxLetters(5)

			valueBox:SetBackdrop({
				bgFile="Interface/ChatFrame/ChatFrameBackground",
				edgeFile="Interface/ChatFrame/ChatFrameBackground",
				tile=true,edgeSize=1,tileSize=5,
			})
			valueBox:SetBackdropColor(0,0,0,0.5)
			valueBox:SetBackdropBorderColor(0.3,0.3,0.3,0.8)
			valueBox.parent=slider;

			slider.valueBox=valueBox

			configFrame.sliders[t.key]=slider;
			numSLLines=numSLLines+1;
		elseif t.type=="DropDownMenu" then
			local fs=configFrame:CreateFontString(nil,"ARTWORK","GameFontHighlight");
			fs:SetText(t.label);

			fs:SetPoint("TOPLEFT",configFrame,"TOPLEFT",borderWidth,-titleHeight-CBLineHeight*numCBLines-(MCLineHeight0+MCLineHeight1+MCLineHeight2+MCLineHeight3)*numMCLines-SLLineHeight*numSLLines-DDLineHeight*numDDLines);

			--local dropDown=CreateFrame("Frame","alaChatConfigFrame_DropDownMenu_" .. t.name,configFrame,"UIDropDownMenuTemplate");
			--dropDown.key=t.key;

			--dropDown:ClearAllPoints();
			--dropDown:SetPoint("LEFT",fs,"RIGHT",space_DropDownMenu_FontString,0);
			--dropDown:SetPoint("TOPLEFT",configFrame,"TOPLEFT",borderWidth,-titleHeight-CBLineHeight*numCBLines-SLLineHeight*numSLLines-DDLineHeight*numDDLines);

			--dropDown.value=t.value;
			--UIDropDownMenu_Initialize(dropDown,dropDownInitialize);

			--configFrame.dropDowns[t.key]=dropDown;

			local drop = CreateFrame("Button","alaChatConfigFrame_Drop_" .. t.name,configFrame);
			drop:SetSize(28, 28)
			drop:EnableMouse(true);
			drop:SetNormalTexture("interface\\mainmenubar\\ui-mainmenu-scrolldownbutton-up")
			--drop:GetNormalTexture():SetTexCoord(0.0, 1.0, 0.0, 0.5);
			drop:SetPushedTexture("interface\\mainmenubar\\ui-mainmenu-scrolldownbutton-down")
			--drop:GetPushedTexture():SetTexCoord(0.0, 1.0, 0.0, 0.5);
			drop:SetHighlightTexture("Interface\\mainmenubar\\ui-mainmenu-scrolldownbutton-highlight");
			drop:SetPoint("LEFT",fs,"RIGHT",4,0);
			local dropfs=configFrame:CreateFontString(nil,"ARTWORK","GameFontHighlight");
			dropfs:SetText(config and config[t.key] or "");
			dropfs:SetPoint("LEFT",drop,"RIGHT",4,0);
			drop.fs=dropfs;
			drop.key=t.key;
			local db = {
				handler = function(funcIndex, key, val, ...)
					dropfs:SetText(val);
					FUNC_CALL(funcIndex, key, val, ...);
				end,
				elements = {},
			};
			for i = 1, #t.value do
				db.elements[i]={
					para = { "SETVALUE", t.key, t.value[i], };
					text = t.value[i];
				};
			end
			drop:SetScript("OnClick" ,function(self) ALADROP(self, "BOTTOMRIGHT", db); end);


			configFrame.dropDowns[t.key]=drop;
			numDDLines=numDDLines+1;
		end
	end
	configFrame:SetWidth(OptionsCheckButtonSize+borderWidth*2+space_CheckButton_FontString+maxWidth+DDLineHeight*numDDLines);
	configFrame:SetHeight(titleHeight+CBLineHeight*numCBLines+(MCLineHeight0+MCLineHeight1+MCLineHeight2+MCLineHeight3)*numMCLines+SLLineHeight*numSLLines+borderHeight+DDLineHeight*numDDLines);
end

local function __OnClick(self,button)
	if configFrame:IsShown() then
		HideUIPanel(configFrame);
	else
		ShowUIPanel(configFrame);
		for _,cb in pairs(configFrame.checkButtons) do
			local key=cb.key;
			cb:SetChecked(config[key]);
		end
		for k,mc in pairs(configFrame.multiCB) do
			for i,cb in pairs(mc) do
				local key=cb.key;
				local idx=cb.idx;
				cb:SetChecked(config[key][idx]);
			end
		end
	end
end
eventCall(
	"PLAYER_ENTERING_WORLD",
	function()
		if alaChatConfig then
			if not alaChatConfig._version or (alaChatConfig._version and alaChatConfig._version < default._version) then
				alaChatConfig=default;
			else
				for k,v in pairs(alaChatConfig) do
					if default[k]==nil then
						alaChatConfig[k]=nil;
					end
				end
			end
		else
			alaChatConfig=default;
		end
		--alaChatConfig=alaChatConfig or default;
		local svConfig=alaChatConfig;
		alaChatConfig={};
		config=alaChatConfig;
		for k,v in pairs(FUNC.INIT) do
			v();
		end
		if not svConfig.channelBarChannel then
			svConfig.channelBarChannel={};
			for k1,v1 in pairs(default.channelBarChannel) do
				svConfig.channelBarChannel[k1]=v1;
			end
		else
			for k1,v1 in pairs(default.channelBarChannel) do
				if svConfig.channelBarChannel[k1]==nil then
					svConfig.channelBarChannel[k1]=v1;
				end
			end
		end
		if GetLocale()=="zhCN" then
			if svConfig.channelBarChannel[14]==nil then
				svConfig.channelBarChannel[14]=true;
			end
		else
			svConfig.channelBarChannel[14]=nil;
		end
		for k,v in pairs(default) do
			if svConfig[k]==nil then
				if type(v)=="table" then
					config[k]={};
					for k1,v1 in pairs(v) do
						config[k][k1]=v1;
					end
				else
					config[k]=v;
				end
			else
				config[k]=svConfig[k];
			end
			if type(v)=="boolean" then
				if config[k] then
					FUNC_CALL("ON",k,true);
				else
					FUNC_CALL("OFF",k,true);
				end
			elseif type(v)=="table" then
				for k1,v1 in pairs(config[k]) do
					if v1 then
						FUNC_CALL("ON",k,k1,true)
					else
						FUNC_CALL("OFF",k,k1,true)
					end
				end
			else
				FUNC_CALL("SETVALUE",k,config[k],true);
			end
		end
		config._version=default._version;
		alaChatConfigFrame.config=config;
		configFrame_Init();
		if LibStub then
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
				nil);
			end
		end
		print(LCONFIG.wel);
	end
);
function _gp(f)
	local a,b,c,d,e=f:GetPoint();
	if type(a)=="table" then
		print(a:GetName(),b,c,d,e);
	elseif type(b)=="table" then
		print(a,b:GetName(),c,d,e);
	else
		print(a,b,c,d,e);
	end
end
function _gi(f,p)
	if type(f)~="table" then
		print("not table");
	end
	p=p or f:GetParent();
	if p then
		for k,v in pairs(p) do
			if v==f then
				print("KEY",k);
				return;
			end
		end
	else
		print("no parent");
	end
end


alaChatConfigFrame.FUNC=FUNC;

FUNC.SETVALUE.scale=function(scale,init)
	if not init then
		alaBaseBtn:Scale(scale);
	end
end
FUNC.SETVALUE.position=function(pos,init)
	if not init then
		alaBaseBtn:Pos(pos);
		-- if pos == 1 then
		-- 	alaBaseBtn:Pos("BELOW_EDITBOX");
		-- elseif pos == 2 then
		-- 	alaBaseBtn:Pos("ABOVE_EDITOBX");
		-- elseif pos == 3 then
		-- 	alaBaseBtn:Pos("ABOVE_CHATFRAME");
		-- end
		alaChatConfig.position=pos;
	end
end
FUNC.ON.position=function()
		alaBaseBtn:Pos("ABOVE_CHATFRAME");
		alaChatConfig.position=true;
end
FUNC.OFF.position=function()
		alaBaseBtn:Pos("BELOW_EDITBOX");
		alaChatConfig.position=false;
end
local configButton = nil;
FUNC.ON.hideConfBtn=function(init)
	if init or alaChatConfig.hideConfBtn then
		alaBaseBtn:RemoveBtn(configButton, true);
		alaChatConfig.hideConfBtn = true;
	end
end
FUNC.OFF.hideConfBtn=function(init)
	if init or not alaChatConfig.hideConfBtn then
		if configButton then
			__alaBaseBtn:AddBtn(btnPackIndex, 1, configButton, false, false, true);
			alaChatConfig.hideConfBtn = false;
		else
			configButton=alaBaseBtn:CreateBtn(
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
SlashCmdList["ALACHAT"]=function()
    __OnClick();
end


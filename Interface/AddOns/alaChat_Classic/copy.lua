--[[--
	alex@0
--]]--
----------------------------------------------------------------------------------------------------
local ADDON,NS=...;
local FUNC=NS.FUNC;
if not FUNC then return;end
local L=NS.L;
if not L then return;end
----------------------------------------------------------------------------------------------------
local math,table,string,pairs,type,select,tonumber,unpack=math,table,string,pairs,type,select,tonumber,unpack;
local _G=_G;
----------------------------------------------------------------------------------------------------
local alaBaseBtn=__alaBaseBtn;
if not alaBaseBtn then
	return;
end
--------------------------------------------------copy
local control_copy=false;
local function insertEditBox(text)
	local editBox=ChatEdit_ChooseBoxForSend();
	ChatEdit_ActivateChat(editBox);
	editBox:SetText(text);
end

local orig_timeStamp=CHAT_TIMESTAMP_FORMAT;

local copy_color = "7f7fff";
local stamp_fmt = "#s";
local gsubfmt = "";

local function set(fmt)
	if fmt then
		--\cffffff\Hcopy:id::::\h[time]\h\r
		CHAT_TIMESTAMP_FORMAT="\124cff" .. copy_color .. "\124HalaCCopy:-1\124h" .. string.gsub(stamp_fmt, "#s", string.gsub(fmt, "%%", "%%%%")) .. "\124h\124r";
	else
		CHAT_TIMESTAMP_FORMAT="\124cff" .. copy_color .. "\124HalaCCopy:-1\124h" .. string.gsub(stamp_fmt, "#s", "**") .. "\124h\124r";
	end
	gsubfmt = "\124cff" .. copy_color .. "\124HalaCCopy:-1\124h**\124h\124r";
end
local function setColor(r, g, b)
	copy_color = string.format("%.2x%.2x%.2x", r * 255, g * 255, b* 255);
	if control_copy then
		set(orig_timeStamp);
	end
end
local function setStamp(fmt)
	fmt = string.gsub(fmt, "%%", "%%%%");
	stamp_fmt = fmt;
	if fmt then
		fmt = string.gsub(fmt, "\n", "");
	end
	if not fmt or fmt == "" then
		CHAT_TIMESTAMP_FORMAT = nil;
	else
		if control_copy then
			set(orig_timeStamp);
		end
	end
end

local _SetHyperlink = ItemRefTooltip.SetHyperlink;
local function hook_SetHyperlink(self,link)
	if link=="alaCCopy:-1" then
		local m=GetMouseFocus();
		if not m:IsObjectType("FontString") then
			m=m:GetParent();
			if not m:IsObjectType("FontString") then
				return;
			end
		end
		local tx=m:GetText();
		if type(tx)~="string" then
			return;
		end
		--tx=string.gsub(tx,"\124cff%x%x%x%x%x%x\124H[^:]+[1-9-:]+\124h(.*)\124h\124r")
		--tx=string.gsub(tx,"\124cffffffff\124H[^:]+[1-9-:]+\124h(.*)\124h\124r","%1");
		tx=string.gsub(tx,gsubfmt,"");
		tx=string.gsub(tx,"\124H.-\124h","");
		tx=string.gsub(tx,"\124cff%x%x%x%x%x%x","");
		tx=string.gsub(tx,"\124h","");
		tx=string.gsub(tx,"\124r","");
		insertEditBox(tx);
	else
		return _SetHyperlink(self, link);
	end
end
local function copy_Init()
	orig_timeStamp=CHAT_TIMESTAMP_FORMAT;
	hookfCall(InterfaceOptionsSocialPanelTimestamps,"SetValue",function(_,fmt)
			if fmt=="none" then
				orig_timeStamp=nil;
			else
				orig_timeStamp=fmt;
			end
			if control_copy then
				set(orig_timeStamp);
			end
		end
		);
end
local function copy_ToggleOn()
	if control_copy then
		return;
	end
	ItemRefTooltip.SetHyperlink = hook_SetHyperlink;
	control_copy=true;
	set(orig_timeStamp);
	return control_copy;
end
local function copy_ToggleOff(loading)
	if not control_copy or loading then
		return;
	end
	ItemRefTooltip.SetHyperlink = _SetHyperlink;
	control_copy=false;
	CHAT_TIMESTAMP_FORMAT=orig_timeStamp;
	return control_copy;
end
FUNC.INIT.copy = copy_Init;
FUNC.ON.copy = copy_ToggleOn;
FUNC.OFF.copy = copy_ToggleOff;

--FUNC.ON.copyTagColor=function()end
--FUNC.OFF.copyTagColor=function()end
FUNC.SETVALUE.copyTagColor = setColor;
FUNC.SETVALUE.copyTagFormat = setStamp;
----------------------------------------------------------------------------------------------------

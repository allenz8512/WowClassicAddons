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

local orig_ChatFrame_OnHyperlinkShow=ChatFrame_OnHyperlinkShow;
local orig_timeStamp=CHAT_TIMESTAMP_FORMAT;
local function set(fmt)
	if fmt then
		--\cffffff\Hcopy:id::::\h[time]\h\r
		CHAT_TIMESTAMP_FORMAT="\124cff7f7fff\124HalaCCopy:-1\124h"..fmt.."\124h\124r";
	else
		CHAT_TIMESTAMP_FORMAT="\124cff7f7fff\124HalaCCopy:-1\124h**\124h\124r";
	end
end
local function copy_Init()
	ItemRefTooltip._SetHyperlink=ItemRefTooltip.SetHyperlink;
	ItemRefTooltip.SetHyperlink=function(self,link)
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
			tx=string.gsub(tx,"\124cff7f7fff\124HalaCCopy:-1\124h**\124h\124r","");
			tx=string.gsub(tx,"\124H.-\124h","");
			tx=string.gsub(tx,"\124cff%x%x%x%x%x%x","");
			tx=string.gsub(tx,"\124h","");
			tx=string.gsub(tx,"\124r","");
			insertEditBox(tx);
			--print(gsub(tx,"\124","__"));
		else
			return self:_SetHyperlink(link);
		end
	end
	-- orig_ChatFrame_OnHyperlinkShow=ChatFrame_OnHyperlinkShow;
	-- ChatFrame_OnHyperlinkShow=function(chatframe,link,text,button,...)
	-- 	if link=="alaCCopy:-1" then
	-- 		local m=GetMouseFocus();
	-- 		if not m:IsObjectType("FontString") then
	-- 			m=m:GetParent();
	-- 			if not m:IsObjectType("FontString") then
	-- 				return;
	-- 			end
	-- 		end
	-- 		local tx=m:GetText();
	-- 		if type(tx)~="string" then
	-- 			return;
	-- 		end
	-- 		--tx=string.gsub(tx,"\124cff%x%x%x%x%x%x\124H[^:]+[1-9-:]+\124h(.*)\124h\124r")
	-- 		--tx=string.gsub(tx,"\124cffffffff\124H[^:]+[1-9-:]+\124h(.*)\124h\124r","%1");
	-- 		tx=string.gsub(tx,"\124cff7f7fff\124HalaCCopy:-1\124h**\124h\124r","");
	-- 		tx=string.gsub(tx,"\124H.-\124h","");
	-- 		tx=string.gsub(tx,"\124cff%x%x%x%x%x%x","");
	-- 		tx=string.gsub(tx,"\124h","");
	-- 		tx=string.gsub(tx,"\124r","");
	-- 		insertEditBox(tx);
	-- 		--print(gsub(tx,"\124","__"));
	-- 	else
	-- 		return orig_ChatFrame_OnHyperlinkShow(chatframe,link,text,button,...);
	-- 	end
	-- end
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
	--set(orig_timeStamp);
end
local function copy_ToggleOn()
	if control_copy then
		return;
	end
	control_copy=true;
	set(orig_timeStamp);
	return control_copy;
end
local function copy_ToggleOff()
	if not control_copy then
		return;
	end
	control_copy=false;
	CHAT_TIMESTAMP_FORMAT=orig_timeStamp;
	return control_copy;
end
FUNC.INIT.copy=copy_Init;
FUNC.ON.copy=copy_ToggleOn;
FUNC.OFF.copy=copy_ToggleOff;
----------------------------------------------------------------------------------------------------

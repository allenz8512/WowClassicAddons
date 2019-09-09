--[[--
	alex@0
--]]--
----------------------------------------------------------------------------------------------------
local ADDON,NS = ...;
local FUNC = NS.FUNC;
if not FUNC then return;end
local L = NS.L;
if not L then return;end
----------------------------------------------------------------------------------------------------
local math,table,string,pairs,type,select,tonumber,unpack = math,table,string,pairs,type,select,tonumber,unpack;
local _G = _G;
----------------------------------------------------------------------------------------------------
local CB_DATA = L.CHATBAR;
if not CB_DATA then return;end
local SC_DATA2 = L.SC_DATA2
if not SC_DATA2 then return;end
----------------------------------------------------------------------------------------------------
local alaBaseBtn = __alaBaseBtn;
if not alaBaseBtn then
	return;
end

local btnPackIndex = 2;
--------------------------------------------------channel Bar
local function insertEditBox(text)
	local editBox = ChatEdit_ChooseBoxForSend();
	ChatEdit_ActivateChat(editBox);
	editBox:SetText(text);
end
local ChatTypeInfo = ChatTypeInfo;

local btn = {};
local toggle = {};
local shown = {false,false,false,false,false,false,false,false,false,false};
local function nPrevShown(index)
	local n = 0;
	for i = 1, index - 1 do
		if shown[i] then
			n = n + 1;
		end
	end
	--print(n);
	return n;
end
toggle[1] = function(on)
	local idx = 1;
	if (shown[idx] and on) or (not shown[idx] and not on) then
		return
	end
	shown[idx] = on;
	if on then
		if btn[idx] then
			alaBaseBtn:AddBtn(btnPackIndex,nPrevShown(idx) + 1,btn[idx],true,false,true);
		else
			btn[idx] = alaBaseBtn:CreateBtn(
					btnPackIndex,
					nPrevShown(idx) + 1,
					"ChatBar_".."SAY",
					"char",
					string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.SAY.r*255,ChatTypeInfo.SAY.g*255,ChatTypeInfo.SAY.b*255)..CB_DATA.T_SAY.."\124r",
					nil,
					function(self,button)
						insertEditBox("/s ");
					end,
					{
						string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.SAY.r*255,ChatTypeInfo.SAY.g*255,ChatTypeInfo.SAY.b*255)..SAY.."\124r",
					}
			);
		end
	else
		alaBaseBtn:RemoveBtn(btn[idx],true);
	end
end
toggle[2] = function(on)
	local idx = 2;
	if (shown[idx] and on) or (not shown[idx] and not on) then
		return
	end
	shown[idx] = on;
	if on then
		if btn[idx] then
			alaBaseBtn:AddBtn(btnPackIndex,nPrevShown(idx) + 1,btn[idx],true,false,true);
		else
			btn[idx] = alaBaseBtn:CreateBtn(
					btnPackIndex,
					nPrevShown(idx) + 1,
					"ChatBar_".."PARTY",
					"char",
					string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.PARTY.r*255,ChatTypeInfo.PARTY.g*255,ChatTypeInfo.PARTY.b*255)..CB_DATA.T_PARTY.."\124r",
					nil,
					function(self,button)
						insertEditBox("/p ");
					end,
					{
						string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.PARTY.r*255,ChatTypeInfo.PARTY.g*255,ChatTypeInfo.PARTY.b*255)..PARTY.."\124r",
					}
			);
		end
	else
		alaBaseBtn:RemoveBtn(btn[idx],true);
	end
end
toggle[3] = function(on)
	local idx = 3;
	if (shown[idx] and on) or (not shown[idx] and not on) then
		return
	end
	shown[idx] = on;
	if on then
		if btn[idx] then
			alaBaseBtn:AddBtn(btnPackIndex,nPrevShown(idx) + 1,btn[idx],true,false,true);
		else
			btn[idx] = alaBaseBtn:CreateBtn(
					btnPackIndex,
					nPrevShown(idx) + 1,
					"ChatBar_".."RAID",
					"char",
					string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.RAID.r*255,ChatTypeInfo.RAID.g*255,ChatTypeInfo.RAID.b*255)..CB_DATA.T_RAID.."\124r",
					nil,
					function(self,button)
						insertEditBox("/raid ");
					end,
					{
						string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.RAID.r*255,ChatTypeInfo.RAID.g*255,ChatTypeInfo.RAID.b*255)..RAID.."\124r",
					}
			);
		end
	else
		alaBaseBtn:RemoveBtn(btn[idx],true);
	end
end
toggle[4] = function(on)
	local idx = 4;
	if (shown[idx] and on) or (not shown[idx] and not on) then
		return
	end
	shown[idx] = on;
	if on then
		if btn[idx] then
			alaBaseBtn:AddBtn(btnPackIndex,nPrevShown(idx) + 1,btn[idx],true,false,true);
		else
			btn[idx] = alaBaseBtn:CreateBtn(
					btnPackIndex,
					nPrevShown(idx) + 1,
					"ChatBar_".."RW",
					"char",
					string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.RAID_WARNING.r*255,ChatTypeInfo.RAID_WARNING.g*255,ChatTypeInfo.RAID_WARNING.b*255)..CB_DATA.T_RW.."\124r",
					nil,
					function(self,button)
						insertEditBox("/rw ");
					end,
					{
						string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.RAID_WARNING.r*255,ChatTypeInfo.RAID_WARNING.g*255,ChatTypeInfo.RAID_WARNING.b*255)..RAID_WARNING.."\124r",
					}
			);
		end
	else
		alaBaseBtn:RemoveBtn(btn[idx],true);
	end
end
toggle[5] = function(on)
	local idx = 5;
	if (shown[idx] and on) or (not shown[idx] and not on) then
		return
	end
	shown[idx] = on;
	if on then
		if btn[idx] then
			alaBaseBtn:AddBtn(btnPackIndex,nPrevShown(idx) + 1,btn[idx],true,false,true);
		else
			btn[idx] = alaBaseBtn:CreateBtn(
					btnPackIndex,
					nPrevShown(idx) + 1,
					"ChatBar_".."INSTANCE_CHAT",
					"char",
					string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.INSTANCE_CHAT.r*255,ChatTypeInfo.INSTANCE_CHAT.g*255,ChatTypeInfo.INSTANCE_CHAT.b*255)..CB_DATA.T_INSTANCE_CHAT.."\124r",
					nil,
					function(self,button)
						insertEditBox("/bg ");
					end,
					{
						string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.INSTANCE_CHAT.r*255,ChatTypeInfo.INSTANCE_CHAT.g*255,ChatTypeInfo.INSTANCE_CHAT.b*255)..INSTANCE_CHAT.."\124r",
					}
			);
		end
	else
		alaBaseBtn:RemoveBtn(btn[idx],true);
	end
end
toggle[6] = function(on)
	local idx = 6;
	if (shown[idx] and on) or (not shown[idx] and not on) then
		return
	end
	shown[idx] = on;
	if on then
		if btn[idx] then
			alaBaseBtn:AddBtn(btnPackIndex,nPrevShown(idx) + 1,btn[idx],true,false,true);
		else
			btn[idx] = alaBaseBtn:CreateBtn(
					btnPackIndex,
					nPrevShown(idx) + 1,
					"ChatBar_".."GUILD",
					"char",
					string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.GUILD.r*255,ChatTypeInfo.GUILD.g*255,ChatTypeInfo.GUILD.b*255)..CB_DATA.T_GUILD.."\124r",
					nil,
					function(self,button)
						insertEditBox("/g ");
					end,
					{
						string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.GUILD.r*255,ChatTypeInfo.GUILD.g*255,ChatTypeInfo.GUILD.b*255)..GUILD.."\124r",
					}
			);
		end
	else
		alaBaseBtn:RemoveBtn(btn[idx],true);
	end
end
toggle[7] = function(on)
	local idx = 7;
	if (shown[idx] and on) or (not shown[idx] and not on) then
		return
	end
	shown[idx] = on;
	if on then
		if btn[idx] then
			alaBaseBtn:AddBtn(btnPackIndex,nPrevShown(idx) + 1,btn[idx],true,false,true);
		else
			btn[idx] = alaBaseBtn:CreateBtn(
					btnPackIndex,
					nPrevShown(idx) + 1,
					"ChatBar_".."YELL",
					"char",
					string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.YELL.r*255,ChatTypeInfo.YELL.g*255,ChatTypeInfo.YELL.b*255)..CB_DATA.T_YELL.."\124r",
					nil,
					function(self,button)
						insertEditBox("/y ");
					end,
					{
						string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.YELL.r*255,ChatTypeInfo.YELL.g*255,ChatTypeInfo.YELL.b*255)..YELL.."\124r",
					}
			);
		end
	else
		alaBaseBtn:RemoveBtn(btn[idx],true);
	end
end
toggle[8] = function(on)
	local idx = 8;
	if (shown[idx] and on) or (not shown[idx] and not on) then
		return
	end
	shown[idx] = on;
	if on then
		if btn[idx] then
			alaBaseBtn:AddBtn(btnPackIndex,nPrevShown(idx) + 1,btn[idx],true,false,true);
		else
			btn[idx] = alaBaseBtn:CreateBtn(
					btnPackIndex,
					nPrevShown(idx) + 1,
					"ChatBar_".."WHISPER",
					"char",
					string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.WHISPER.r*255,ChatTypeInfo.WHISPER.g*255,ChatTypeInfo.WHISPER.b*255)..CB_DATA.T_WHISPER.."\124r",
					nil,
					function(self,button)
						insertEditBox("/w ");
					end,
					{
						string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.WHISPER.r*255,ChatTypeInfo.WHISPER.g*255,ChatTypeInfo.WHISPER.b*255)..WHISPER.."\124r",
					}
			);
		end
	else
		alaBaseBtn:RemoveBtn(btn[idx],true);
	end
end
toggle[9] = function(on)
	local idx = 9;
	if (shown[idx] and on) or (not shown[idx] and not on) then
		return
	end
	shown[idx] = on;
	if on then
		if btn[idx] then
			alaBaseBtn:AddBtn(btnPackIndex,nPrevShown(idx) + 1,btn[idx],true,false,true);
		else
			btn[idx] = alaBaseBtn:CreateBtn(
					btnPackIndex,
					nPrevShown(idx) + 1,
					"ChatBar_".."OFFICER",
					"char",
					string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.OFFICER.r*255,ChatTypeInfo.OFFICER.g*255,ChatTypeInfo.OFFICER.b*255)..CB_DATA.T_OFFICER.."\124r",
					nil,
					function(self,button)
						insertEditBox("/o ");
					end,
					{
						string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.OFFICER.r*255,ChatTypeInfo.OFFICER.g*255,ChatTypeInfo.OFFICER.b*255)..OFFICER.."\124r",
					}
			);
		end
	else
		alaBaseBtn:RemoveBtn(btn[idx],true);
	end
end
toggle[10] = function(on)
	local idx = 10;
	if (shown[idx] and on) or (not shown[idx] and not on) then
		return
	end
	shown[idx] = on;
	if on then
		if btn[idx] then
			alaBaseBtn:AddBtn(btnPackIndex,nPrevShown(idx) + 1,btn[idx],true,false,true);
		else
			btn[idx] = alaBaseBtn:CreateBtn(
					btnPackIndex,
					nPrevShown(idx) + 1,
					"ChatBar_".."GENERAL",
					"char",
					SC_DATA2[1][4],
					nil,
					function(self,button)
						local t = {GetChannelList()};
						for i = 1,#t/3 do
							if t[i*3-1] == SC_DATA2[1][1] then
								insertEditBox("/"..t[i*3-2].." ");
								return;
							end
						end
					end,
					{
						SC_DATA2[1][1],
					}
			);
		end
	else
		alaBaseBtn:RemoveBtn(btn[idx],true);
	end
end
toggle[11] = function(on)
	local idx = 11;
	if (shown[idx] and on) or (not shown[idx] and not on) then
		return
	end
	shown[idx] = on;
	if on then
		if btn[idx] then
			alaBaseBtn:AddBtn(btnPackIndex,nPrevShown(idx) + 1,btn[idx],true,false,true);
		else
			btn[idx] = alaBaseBtn:CreateBtn(
					btnPackIndex,
					nPrevShown(idx) + 1,
					"ChatBar_".."TRADE",
					"char",
					SC_DATA2[2][4],
					nil,
					function(self,button)
						local t = {GetChannelList()};
						for i = 1,#t/3 do
							if t[i*3-1] == SC_DATA2[2][1] then
								insertEditBox("/"..t[i*3-2].." ");
								return;
							end
						end
					end,
					{
						SC_DATA2[2][1],
					}
			);
		end
	else
		alaBaseBtn:RemoveBtn(btn[idx],true);
	end
end
toggle[12] = function(on)
	local idx = 12;
	if (shown[idx] and on) or (not shown[idx] and not on) then
		return
	end
	shown[idx] = on;
	if on then
		if btn[idx] then
			alaBaseBtn:AddBtn(btnPackIndex,nPrevShown(idx) + 1,btn[idx],true,false,true);
		else
			btn[idx] = alaBaseBtn:CreateBtn(
					btnPackIndex,
					nPrevShown(idx) + 1,
					"ChatBar_".."LOCALDEFENSE",
					"char",
					SC_DATA2[3][4],
					nil,
					function(self,button)
						local t = {GetChannelList()};
						for i = 1,#t/3 do
							if t[i*3-1] == SC_DATA2[3][1] then
								insertEditBox("/"..t[i*3-2].." ");
								return;
							end
						end
					end,
					{
						SC_DATA2[3][1],
					}
			);
		end
	else
		alaBaseBtn:RemoveBtn(btn[idx],true);
	end
end
toggle[13] = function(on)
	local idx = 13;
	if (shown[idx] and on) or (not shown[idx] and not on) then
		return
	end
	shown[idx] = on;
	if on then
		if btn[idx] then
			alaBaseBtn:AddBtn(btnPackIndex,nPrevShown(idx) + 1,btn[idx],true,false,true);
		else
			btn[idx] = alaBaseBtn:CreateBtn(
					btnPackIndex,
					nPrevShown(idx) + 1,
					"ChatBar_".."LOOKINGFORGROUP",
					"char",
					SC_DATA2[4][4],
					nil,
					function(self,button)
						local t = {GetChannelList()};
						for i = 1,#t/3 do
							if t[i*3-1] == SC_DATA2[4][1] then
								insertEditBox("/"..t[i*3-2].." ");
								return;
							end
						end
					end,
					{
						SC_DATA2[4][1],
					}
			);
		end
	else
		alaBaseBtn:RemoveBtn(btn[idx],true);
	end
end
toggle[14] = function(on)
	local idx = 14;
	if (shown[idx] and on) or (not shown[idx] and not on) then
		return
	end
	shown[idx] = on;
	if on then
		if btn[idx] then
			alaBaseBtn:AddBtn(btnPackIndex,nPrevShown(idx) + 1,btn[idx],true,false,true);
		else
			btn[idx] = alaBaseBtn:CreateBtn(
					btnPackIndex,
					nPrevShown(idx) + 1,
					"ChatBar_".."BFWORLD",
					"char",
					"\124cffffdfbf世\124r",
					nil,
					function(self,button)
						local t = {GetChannelList()};
						for i = 1,#t/3 do
							if t[i*3-1] == "大脚世界频道" then
								insertEditBox("/"..t[i*3-2].." ");
								return;
							end
						end
					end,
					{
						"\124cffffdfbf大脚世界频道\124r",
					}
			);
		end
	else
		alaBaseBtn:RemoveBtn(btn[idx],true);
	end
end
local function channelBar_ToggleOn(onStartup)
	if onStartup then 
		return;
	end
	for i = 1,13 do
		toggle[i](true);
	end
	if alaChatConfigFrame and alaChatConfigFrame.config and alaChatConfigFrame.config.channelBarChannel then
		for i = 1,13 do
			alaChatConfigFrame.config.channelBarChannel[i] = true;
		end
	end
end
local function channelBar_ToggleOff(onStartup)
	for i = 1,13 do
		toggle[i](false);
	end
	if alaChatConfigFrame and alaChatConfigFrame.config and alaChatConfigFrame.config.channelBarChannel then
		for i = 1,13 do
			alaChatConfigFrame.config.channelBarChannel[i] = false;
		end
	end
end
--FUNC.ON.channelBar = channelBar_ToggleOn;
--FUNC.OFF.channelBar = channelBar_ToggleOff;
FUNC.ON.channelBarChannel = function(idx)
	toggle[idx](true)
end
FUNC.OFF.channelBarChannel = function(idx)
	toggle[idx](false)
end

local LCONFIG = L.CONFIG;
if not LCONFIG then
	return;
end
FUNC.INIT.channelBarChannel = function()
	LCONFIG.channelBarChannel[1] = string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.SAY.r*255,ChatTypeInfo.SAY.g*255,ChatTypeInfo.SAY.b*255)..SAY.."\124r";
	LCONFIG.channelBarChannel[2] = string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.PARTY.r*255,ChatTypeInfo.PARTY.g*255,ChatTypeInfo.PARTY.b*255)..PARTY.."\124r";
	LCONFIG.channelBarChannel[3] = string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.RAID.r*255,ChatTypeInfo.RAID.g*255,ChatTypeInfo.RAID.b*255)..RAID.."\124r";
	LCONFIG.channelBarChannel[4] = string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.RAID_WARNING.r*255,ChatTypeInfo.RAID_WARNING.g*255,ChatTypeInfo.RAID_WARNING.b*255)..RAID_WARNING.."\124r";
	LCONFIG.channelBarChannel[5] = string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.INSTANCE_CHAT.r*255,ChatTypeInfo.INSTANCE_CHAT.g*255,ChatTypeInfo.INSTANCE_CHAT.b*255)..INSTANCE_CHAT.."\124r";
	LCONFIG.channelBarChannel[6] = string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.GUILD.r*255,ChatTypeInfo.GUILD.g*255,ChatTypeInfo.GUILD.b*255)..GUILD.."\124r";
	LCONFIG.channelBarChannel[7] = string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.YELL.r*255,ChatTypeInfo.YELL.g*255,ChatTypeInfo.YELL.b*255)..YELL.."\124r";
	LCONFIG.channelBarChannel[8] = string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.WHISPER.r*255,ChatTypeInfo.WHISPER.g*255,ChatTypeInfo.WHISPER.b*255)..WHISPER.."\124r";
	LCONFIG.channelBarChannel[9] = string.format("\124cff%.2x%.2x%.2x",ChatTypeInfo.OFFICER.r*255,ChatTypeInfo.OFFICER.g*255,ChatTypeInfo.OFFICER.b*255)..OFFICER.."\124r";
	if GetLocale() == "zhCN" then
		LCONFIG.channelBarChannel[14] = "世界频道";
	end
end
----------------------------------------------------------------------------------------------------

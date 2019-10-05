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
local WTG_STRING=L.WTG_STRING or {}
local FORMAT_WELCOME=WTG_STRING.FORMAT_WELCOME or ""
local FORMAT_BROADCAST=WTG_STRING.FORMAT_BROADCAST or ""
local WTG_STRING_1=WTG_STRING.WTG_STRING_1 or ""
local WTG_STRING_2=WTG_STRING.WTG_STRING_2 or ""
local WTG_STRING_3=WTG_STRING.WTG_STRING_3 or ""
local WTG_STRING_ON=WTG_STRING.WTG_STRING_ON or ""
local WTG_STRING_OFF=WTG_STRING.WTG_STRING_OFF or ""
----------------------------------------------------------------------------------------------------
local control_welcome=false;
local control_broadCast=false;
local WTG_delayMin=2;
local WTG_delayAdd=10;
----------------------------------------------------------------------------------------------------
local math,table,string,pairs,type,select,tonumber,unpack=math,table,string,pairs,type,select,tonumber,unpack;
----------------------------------------------------------------------------------------------------
local random=random;
--------------------------------------------------
if not __alaBase then
	return;
end
------------------------
local pName;
local rName;
local fName;
local gName;
--------------------------------------------------
local WelcomeMsg_Format={};
local WelcomeMsg={};
for v in string.gmatch(FORMAT_WELCOME,"%s*([^\n]+)\n") do
	table.insert(WelcomeMsg_Format,v);
end

local function updateMsg(_gName)
	WelcomeMsg={};
	for _,v in pairs(WelcomeMsg_Format) do
		v=string.gsub(v,"#GUILD#",gName);
		v=string.gsub(v,"#PLAYER#",pName);
		v=string.gsub(v,"#REALM#",rName);
		table.insert(WelcomeMsg,v);
		--print(_,v)
	end
end

local function welcometoGuildMsg_SetValue(msg)
	msg = msg .. "\n\n";
	WelcomeMsg_Format = {};
	for v in string.gmatch(msg,"%s*([^\n]+)\n") do
		v=string.gsub(v, "%%", "%%%%");
		table.insert(WelcomeMsg_Format,v);
	end
	gName=GetGuildInfo("player");
	if gName and gName ~= "" then
		updateMsg();
	end
end

FUNC.SETVALUE.welcometoGuildMsg=welcometoGuildMsg_SetValue;

local function periodicScanAfterNewMem(n,msg,delay)
	GuildRoster();
	for i=1,GetNumGuildMembers() do
		local name,rank,rankindex0,level,class,area,_,_,_,_,eClass,ach=GetGuildRosterInfo(i);
		name=string.split("-",name);
		if name==n then
			--print(i,name,rank,level,class,area);
			if control_broadCast then
				SendChatMessage(string.format(FORMAT_BROADCAST,name,class,level,area,ach),"GUILD");
			end
			if control_welcome and msg then
				msg = string.gsub(msg,"#NAME#",name);
				msg = string.gsub(msg,"#CLASS#",class);
				msg = string.gsub(msg,"#LEVEL#",level);
				msg = string.gsub(msg,"#AREA#",area);
				delayCall(SendChatMessage,delay,nil,msg,"GUILD");
			end
			return;
		end
	end
	delayCall(periodicScanAfterNewMem,0.25,nil,n,msg);
end

local gc_Cache={};
local GUILD_JOIN_STR=string.gsub(ERR_GUILD_JOIN_S,"%%s","%(%.%+%)");
local function processMsg(_,event,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14)
	local msg,sender,line=arg1,arg2,arg11;
	if not gc_Cache[line] then
	    gc_Cache[line]=1;
		local name=string.match(msg,GUILD_JOIN_STR);
		if name then
			local n,r=string.match(name,"(.+)%-(.+)");
			if r==rName then
				name=n;
			end
			if name~=pName then
				local msg=nil;
				local delay=WTG_delayMin+WTG_delayAdd*random();
				if control_welcome and #WelcomeMsg > 0 then
					local ind=random(1,#WelcomeMsg);
					msg=string.format(WelcomeMsg[ind],name);
				end
				if control_broadCast or control_welcome then
					periodicScanAfterNewMem(name,msg,delay);
				end
			end
		end
	end
end

local HE_CHAT_MSG_SYSTEM=nil;
local HE_PLAYER_GUILD_UPDATE=nil;
local HD_UPDATE=nil;

local function Update()
	local _gName=GetGuildInfo("player");
	if _gName then
		if _gName~=gName then
			gName=_gName;
			updateMsg(_gName);
		end
		if not HE_CHAT_MSG_SYSTEM  then
			HE_CHAT_MSG_SYSTEM=eventCall("CHAT_MSG_SYSTEM",processMsg,true);
		end
	else
		if HE_CHAT_MSG_SYSTEM then
			editeCall("CHAT_MSG_SYSTEM",HE_CHAT_MSG_SYSTEM);
			HE_CHAT_MSG_SYSTEM=nil;
		end
	end
end

local function WelcomeToGuild_Init()
	pName=UnitName("player") or "";
	pName=string.match(pName,"(.+)%-") or pName;
	rName=GetRealmName() or "";
	fName=pName.."-"..rName;
end

local function WelcomeToGuild_ToggleOn()
	if control_welcome then
		return;
	end
	control_welcome=true;
	if not control_broadCast then
		Update();
		HE_PLAYER_GUILD_UPDATE=eventCall("PLAYER_GUILD_UPDATE",function(_,event,...)if not HD_UPDATE then HD_UPDATE=delayCall(Update,1,false);end;end,true);
	end
	return control_welcome;
end
local function WelcomeToGuild_ToggleOff()
	if not control_welcome then
		return;
	end
	control_welcome=false;
	if not control_broadCast then
		if HD_UPDATE then
			editdCall(HD_UPDATE);
			HD_UPDATE=nil;
		end
		if HE_CHAT_MSG_SYSTEM then
			editeCall("CHAT_MSG_SYSTEM",HE_CHAT_MSG_SYSTEM);
			HE_CHAT_MSG_SYSTEM=nil;
		end
		if HE_PLAYER_GUILD_UPDATE then
			editeCall("PLAYER_GUILD_UPDATE",HE_PLAYER_GUILD_UPDATE);
			HE_PLAYER_GUILD_UPDATE=nil;
		end
	end
	return control_welcome;
end
local function WelcomeToGuild_Tooltips()
	local tips="";
	for i=1,#WelcomeMsg do
		tips=tips.."\n"..string.format(WelcomeMsg[i],pName);
	end
end
FUNC.INIT.welcomeToGuild=WelcomeToGuild_Init;
FUNC.ON.welcomeToGuild=WelcomeToGuild_ToggleOn;
FUNC.OFF.welcomeToGuild=WelcomeToGuild_ToggleOff;
FUNC.TOOLTIPS.welcomeToGuild=WelcomeToGuild_Tooltips;


local function BroadCastNewMember_ToggleOn()
	if control_broadCast then
		return;
	end
	control_broadCast=true;
	if not control_welcome then
		Update();
		HE_PLAYER_GUILD_UPDATE=eventCall("PLAYER_GUILD_UPDATE",function(_,event,...)if not HD_UPDATE then HD_UPDATE=delayCall(Update,1,false);end;end,true);
	end
	return control_broadCast;
end
local function BroadCastNewMember_ToggleOff()
	if not control_broadCast then
		return;
	end
	control_broadCast=false;
	if not control_welcome then
		if HD_UPDATE then
			editdCall(HD_UPDATE);
			HD_UPDATE=nil;
		end
		if HE_CHAT_MSG_SYSTEM then
			editeCall("CHAT_MSG_SYSTEM",HE_CHAT_MSG_SYSTEM);
			HE_CHAT_MSG_SYSTEM=nil;
		end
		if HE_PLAYER_GUILD_UPDATE then
			editeCall("PLAYER_GUILD_UPDATE",HE_PLAYER_GUILD_UPDATE);
			HE_PLAYER_GUILD_UPDATE=nil;
		end
	end
	return control_broadCast;
end
local function BroadCastNewMember_Tooltips()
	--string.format(FORMAT_BROADCAST,name,class,level,area,ach);
end
FUNC.ON.broadCastNewMember=BroadCastNewMember_ToggleOn;
FUNC.OFF.broadCastNewMember=BroadCastNewMember_ToggleOff;
FUNC.TOOLTIPS.broadCastNewMember=BroadCastNewMember_Tooltips;



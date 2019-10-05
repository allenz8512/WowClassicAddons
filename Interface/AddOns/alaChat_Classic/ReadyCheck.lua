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
local CB_DATA=L.CHATBAR;
if not CB_DATA then return;end
----------------------------------------------------------------------------------------------------
local alaBaseBtn=__alaBaseBtn;
if not alaBaseBtn then
	return;
end

local btnPackIndex = 10;
--------------------------------------------------stat report
local control_ReadyCheck=false;
local btnReadyCheck=nil;

local function ReadyCheck_On()
	if control_ReadyCheck then
		return;
	end
	control_ReadyCheck=true;
	local ICON_PATH = NS.ICON_PATH;
	if btnReadyCheck then
		alaBaseBtn:AddBtn(btnPackIndex,-1,btnReadyCheck,true,false,true);
	else
		btnReadyCheck=alaBaseBtn:CreateBtn(
				btnPackIndex,
				-1,
				"ReadyCheckBtn",
				"char",
				"C",
				nil,
				function(self,button)
					DoReadyCheck();
				end,
				{
					CB_DATA.READYCHECK,
				}
		);
	end
	return control_ReadyCheck;
end
local function ReadyCheck_Off()
	if not control_ReadyCheck then
		return;
	end
	control_ReadyCheck=false;
	alaBaseBtn:RemoveBtn(btnReadyCheck,true);
	return control_ReadyCheck;
end
FUNC.ON.ReadyCheck=ReadyCheck_On;
FUNC.OFF.ReadyCheck=ReadyCheck_Off;
----------------------------------------------------------------------------------------------------

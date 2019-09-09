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
local REPORT_DATA=L.REPORT;
if not REPORT_DATA then return;end
----------------------------------------------------------------------------------------------------
local alaBaseBtn=__alaBaseBtn;
if not alaBaseBtn then
	return;
end
--------------------------------------------------stat report
local control_statReport=false;
local btnStatReport=nil;

function genReport()
	if true then return "Function Under Construction. 功能施工中";end
	local uLevel=UnitLevel("player");
	local uClass=UnitClass("player");
	--local uSpecId=GetSpecialization();
	--local _,uSpec,_,_,uRole=GetSpecializationInfo(uSpecId);
	--uRole=_G[uRole] or uRole;
	--local maxIl,curIl=GetAverageItemLevel();
	--
	local str=UnitStat("player",1);
	local agi=UnitStat("player",2);
	local sta=UnitStat("player",3);
	local int=UnitStat("player",4);
	--
	--local mChance=GetMasteryEffect();
	--local mRating=GetCombatRating(CR_MASTERY);
	--local cChance=GetCritChance();
	--local cRating=GetCombatRating(CR_CRIT_SPELL);
	--local hChance=GetHaste();
	--local hRating=GetCombatRating(CR_HASTE_SPELL);
	--local vChance=GetCombatRatingBonus(CR_VERSATILITY_DAMAGE_DONE);
	--local vRating=GetCombatRating(CR_VERSATILITY_DAMAGE_DONE);
	--
	--local pChance=GetParryChance();
	--local dChance=GetDodgeChance();
	--local bChanceChance=GetBlockChance();
	--local shieldBlock=GetShieldBlock();
	--
	--local lefeSteal=GetLifesteal();
	--local avoidance=GetAvoidance();
	--local speed=GetSpeed();
	--
	--table azeriteLoc=C_AzeriteItem.FindActiveAzeriteItem()
	--boolean has=C_AzeriteItem.HasActiveAzeriteItem(azeriteLoc)
	--1 physical 2 holy 3 fire 4 nature 5 frost 6 shadow 7 arcane
	--int xp,int xpMax=C_AzeriteItem.GetAzeriteItemXPInfo(azeriteLoc)
	--int level=C_AzeriteItem:GetPowerLevel(azeriteLoc)
	--
	local ap = UnitAttackPower('player');
	local sd = GetSpellBonusDamage(1);
	--1 physical 2 holy 3 fire 4 nature 5 frost 6 shadow 7 arcane
	local sh = GetSpellBonusHealing();
	local armor = UnitArmor('player');
	local pCrit = GetCritChance();
	local sCrit = GetSpellCritChance();
	--
	--C_AzeriteItem:GetPowerLevel(C_AzeriteItem.FindActiveAzeriteItem());
	--for k,v in pairs(C_AzeriteItem:FindActiveAzeriteItem()) do print(k,v) end
	-- local hasAz=C_AzeriteItem.HasActiveAzeriteItem();
	-- local azLevel=nil;
	-- local neckLevel=nil;
	-- if hasAz then
	-- 	local azeriteLoc=C_AzeriteItem.FindActiveAzeriteItem();
	-- 	azLevel=C_AzeriteItem.GetPowerLevel(azeriteLoc);
	-- 	if azeriteLoc.equipmentSlotIndex then
	-- 		local neckLink=GetInventoryItemLink("player",2);
	-- 		neckLevel=neckLink and select(4,GetItemInfo(neckLink)) or -1;
	-- 	elseif azeriteLoc.bagID and azeriteLoc.slotIndex then
	-- 		local neckLink=GetContainerItemLink(azeriteLoc.bagID,azeriteLoc.slotIndex);
	-- 		neckLevel=neckLink and select(4,GetItemInfo(neckLink)) or -1;
	-- 	end
	-- else
	-- 	local neckLink=GetInventoryItemLink("player",2);
	-- 	neckLevel=neckLink and select(4,GetItemInfo(neckLink)) or 0;
	-- end
	--
	local text=string.format("%s:%s,%s:%s(%s),%s:%.1f(%.1f)%s,%s:%d(%.1f%%),%s:%d(%.1f%%),%s:%d(%.1f%%),%s:%d(%.1f%%)",
		CB_DATA.T_STAT,
		uClass,
		TALENT,uSpec,uRole,
		STAT_AVERAGE_ITEM_LEVEL,curIl,maxIl,
		hasAz and string.format(",%s:%d(%s%d)",REPORT_DATA.neckLevel,neckLevel,REPORT_DATA.azLevel,azLevel) or "",--neck
		STAT_MASTERY,mRating,mChance,
		STAT_CRITICAL_STRIKE,cRating,cChance,
		STAT_HASTE,hRating,hChance,
		STAT_VERSATILITY,vRating,vChance
		);
	return text;
end
local function statReport_On()
	if control_statReport then
		return;
	end
	control_statReport=true;
	local ICON_PATH = NS.ICON_PATH;
	if btnStatReport then
		alaBaseBtn:AddBtn(2,-1,btnStatReport,true,false,true);
	else
		btnStatReport=alaBaseBtn:CreateBtn(
				2,
				-1,
				"statReportBtn",
				"class",
				nil,
				nil,
				function(self,button)
					local editBox=ChatEdit_ChooseBoxForSend();
					editBox:Show();
					editBox:SetFocus();
					editBox:Insert(genReport());
				end,
				{
					CB_DATA.LINE_STAT1,
				}
		);
	end
	return control_statReport;
end
local function statReport_Off()
	if not control_statReport then
		return;
	end
	control_statReport=false;
	alaBaseBtn:RemoveBtn(btnStatReport,true);
	return control_statReport;
end
FUNC.ON.statReport=statReport_On;
FUNC.OFF.statReport=statReport_Off;
----------------------------------------------------------------------------------------------------

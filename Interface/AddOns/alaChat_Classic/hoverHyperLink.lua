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
if not __alaBase then
	return;
end
----------------------------------------------------------------------------------------------------
local control_hyperLinkHoverShow = false;
local LinkHoverType = {
	["achievement"] = true,
	["enchant"] = true,
	["glyph"] = true,
	["item"] = true,
	["quest"] = true,
	["spell"] = true,
	["talent"] = true,
	["unit"] = true,
}
---------------- > Show tooltips when hovering a link in chat (credits to Adys for his LinkHover)
local function _OnHyperlinkEnter(_this, linkData, link)
	if control_hyperLinkHoverShow then
		local t = linkData:match("^(.-):");
		if LinkHoverType[t] then
			ShowUIPanel(GameTooltip)
			GameTooltip:SetOwner(_this, "ANCHOR_RIGHT");
			GameTooltip:SetHyperlink(link);
			GameTooltip:Show();
		end
	end
end
local function _OnHyperlinkLeave(_this, linkData, link)
	if control_hyperLinkHoverShow then
		if GameTooltip:IsOwned(_this) then
		--local t = linkData:match("^(.-):");
		--if LinkHoverType[t] then
			HideUIPanel(GameTooltip);
		end
	end
end
local function main()
	for i = 1, NUM_CHAT_WINDOWS do
		local frame = _G["ChatFrame"..i]
		frame:SetScript("OnHyperlinkEnter", _OnHyperlinkEnter)
		frame:SetScript("OnHyperlinkLeave", _OnHyperlinkLeave)
	end
end
FUNC.INIT.hyperLinkHoverShow = main;
FUNC.ON.hyperLinkHoverShow=function()
	if not control_hyperLinkHoverShow then
		control_hyperLinkHoverShow = true;
	end
end
FUNC.OFF.hyperLinkHoverShow=function()
	if control_hyperLinkHoverShow then
		control_hyperLinkHoverShow = false;
	end
end
----------------------------------------------------------------------------------------------------

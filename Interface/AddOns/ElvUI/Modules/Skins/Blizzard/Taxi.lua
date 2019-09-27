local E, L, V, P, G = unpack(select(2, ...)) --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local S = E:GetModule('Skins')

--Cache global variables
--Lua functions
local _G = _G

local function LoadSkin()
	if not E.private.skins.blizzard.enable or not E.private.skins.blizzard.taxi then return end

	local TaxiFrame = _G.TaxiFrame
	S:HandleFrame(TaxiFrame, true, nil, 11, -12, -32, 76)
	_G.TaxiPortrait:Kill() -- Blizz didnt name this TaxiFramePortrait

	_G.TaxiMap:Point('TOPLEFT', 23, -70)
	_G.TaxiRouteMap:Point('TOPLEFT', 23, -70)

	_G.TaxiMerchant:SetTextColor(1, 1, 1)

	S:HandleCloseButton(_G.TaxiCloseButton, TaxiFrame.backdrop, 3, 3)
end

S:AddCallback('Skin_Taxi', LoadSkin)
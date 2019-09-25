local E, L, V, P, G = unpack(select(2, ...)); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local S = E:GetModule('Skins')

--Cache global variables
--Lua functions
local _G = _G
local unpack = unpack
local pairs = pairs
--WoW API / Variables
local GetInventoryItemLink = GetInventoryItemLink
local GetItemInfo = GetItemInfo
local GetItemQualityColor = GetItemQualityColor
local hooksecurefunc = hooksecurefunc

local function LoadSkin()
	if not E.private.skins.blizzard.enable or not E.private.skins.blizzard.inspect then return end

	local InspectFrame = _G.InspectFrame
	S:HandlePortraitFrame(InspectFrame, true)
	InspectFrame.backdrop:Point('TOPLEFT', 11, -12)
	InspectFrame.backdrop:Point('BOTTOMRIGHT', -32, 76)

	S:HandleCloseButton(_G.InspectFrameCloseButton, InspectFrame.backdrop)
	_G.InspectFrameCloseButton:Point('TOPRIGHT', -28, -9)

	for i = 1, #INSPECTFRAME_SUBFRAMES do
		S:HandleTab(_G['InspectFrameTab'..i])
	end

	_G.InspectPaperDollFrame:StripTextures()

	for _, slot in pairs({ _G.InspectPaperDollItemsFrame:GetChildren() }) do
		local icon = _G[slot:GetName()..'IconTexture']
		local cooldown = _G[slot:GetName()..'Cooldown']

		slot:StripTextures()
		slot:CreateBackdrop('Default')
		slot.backdrop:SetAllPoints()
		slot:SetFrameLevel(slot:GetFrameLevel() + 2)
		slot:StyleButton()

		icon:SetTexCoord(unpack(E.TexCoords))
		icon:SetInside()

		if cooldown then
			E:RegisterCooldown(cooldown)
		end
	end

	hooksecurefunc('InspectPaperDollItemSlotButton_Update', function(button)
		if button.hasItem then
			local itemID = GetInventoryItemID(InspectFrame.unit, button:GetID())
			if itemID then
				local quality = select(3, GetItemInfo(itemID))
				if not quality then
					E:Delay(0.1, function()
						if InspectFrame.unit then
							InspectPaperDollItemSlotButton_Update(button)
						end
					end)
					return
				elseif quality and quality > 1 then
					button.backdrop:SetBackdropBorderColor(GetItemQualityColor(quality))
					return
				end
			end
		end
		button.backdrop:SetBackdropBorderColor(unpack(E.media.bordercolor))
	end)

	S:HandleRotateButton(_G.InspectModelFrameRotateLeftButton)
	_G.InspectModelFrameRotateLeftButton:Point('TOPLEFT', 3, -3)

	S:HandleRotateButton(_G.InspectModelFrameRotateRightButton)
	_G.InspectModelFrameRotateRightButton:Point('TOPLEFT', _G.InspectModelFrameRotateLeftButton, 'TOPRIGHT', 3, 0)

	-- Honor Frame
	_G.InspectHonorFrame:StripTextures()

	_G.InspectHonorFrameProgressButton:CreateBackdrop()
	_G.InspectHonorFrameProgressBar:SetStatusBarTexture(E.media.normTex)
	E:RegisterStatusBar(_G.InspectHonorFrameProgressBar)
end

S:AddCallbackForAddon('Blizzard_InspectUI', 'Inspect', LoadSkin)
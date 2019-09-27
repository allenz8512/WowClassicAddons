local E, L, V, P, G = unpack(select(2, ...)) --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local S = E:GetModule('Skins')

--Lua functions
local _G = _G
--WoW API / Variables
local hooksecurefunc = hooksecurefunc

local function LoadSkin()
	if not E.private.skins.blizzard.enable or not E.private.skins.blizzard.Channels then return end

	local ChannelFrame = _G.ChannelFrame
	local CreateChannelPopup = _G.CreateChannelPopup

	S:HandleFrame(ChannelFrame, true, nil, -5)
	CreateChannelPopup:StripTextures()

	CreateChannelPopup:CreateBackdrop('Transparent')

	S:HandleButton(ChannelFrame.NewButton)
	ChannelFrame.NewButton:Point('BOTTOMLEFT', -1, 4)
	S:HandleButton(ChannelFrame.SettingsButton)

	S:HandleScrollBar(ChannelFrame.ChannelRoster.ScrollFrame.scrollBar)
	ChannelFrame.ChannelRoster.ScrollFrame.scrollBar:Point('TOPLEFT', ChannelFrame.ChannelRoster.ScrollFrame, 'TOPRIGHT', 1, -13)
	ChannelFrame.ChannelRoster.ScrollFrame.scrollBar:Point('BOTTOMLEFT', ChannelFrame.ChannelRoster.ScrollFrame, 'BOTTOMRIGHT', 1, 13)

	S:HandleScrollBar(ChannelFrame.ChannelList.ScrollBar)
	ChannelFrame.ChannelList.ScrollBar:Point('BOTTOMLEFT', ChannelFrame.ChannelList, 'BOTTOMRIGHT', 0, 15)

	S:HandleCloseButton(CreateChannelPopup.CloseButton)
	S:HandleButton(CreateChannelPopup.OKButton)
	S:HandleButton(CreateChannelPopup.CancelButton)

	S:HandleEditBox(CreateChannelPopup.Name)
	S:HandleEditBox(CreateChannelPopup.Password)

	_G.VoiceChatPromptActivateChannel:StripTextures()
	_G.VoiceChatPromptActivateChannel:CreateBackdrop('Transparent')
	S:HandleButton(_G.VoiceChatPromptActivateChannel.AcceptButton)
	S:HandleCloseButton(_G.VoiceChatPromptActivateChannel.CloseButton)

	-- Hide the Channel Header Textures
	hooksecurefunc(_G.ChannelButtonHeaderMixin, 'Update', function(self)
		self:SetTemplate('Transparent')

		self.NormalTexture:SetTexture()
	end)
end

S:AddCallbackForAddon('Blizzard_Channels', 'Skin_Blizzard_Channels', LoadSkin)

local E, L, V, P, G = unpack(select(2, ...)) --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local S = E:GetModule('Skins')

--Cache global variables
--Lua functions
local _G = _G
local unpack = unpack
--WoW API / Variables
local hooksecurefunc = hooksecurefunc
local GetGuildRosterInfo = GetGuildRosterInfo
local GUILDMEMBERS_TO_DISPLAY = GUILDMEMBERS_TO_DISPLAY
local RAID_CLASS_COLORS = RAID_CLASS_COLORS

local localizedTable = {}
for k, v in pairs(LOCALIZED_CLASS_NAMES_MALE) do
	localizedTable[v] = k
end

for k, v in pairs(LOCALIZED_CLASS_NAMES_FEMALE) do
	localizedTable[v] = k
end

local function SkinFriendRequest(frame)
	if frame.isSkinned then return end
	S:HandleButton(frame.DeclineButton, nil, true)
	S:HandleButton(frame.AcceptButton)
	frame.isSkinned = true
end

local function LoadSkin()
	if not E.private.skins.blizzard.enable or not E.private.skins.blizzard.friends then return end

	-- Friends Frame
	local FriendsFrame = _G.FriendsFrame
	S:HandleFrame(FriendsFrame, true, nil, -5, 0, -2)

	_G.FriendsFrameCloseButton:Point('TOPRIGHT', 0, 2)

	local FriendsFrameBattlenetFrame = _G.FriendsFrameBattlenetFrame
	FriendsFrameBattlenetFrame:StripTextures()
	FriendsFrameBattlenetFrame:GetRegions():Hide()

	FriendsFrameBattlenetFrame.UnavailableInfoFrame:Point('TOPLEFT', FriendsFrame, 'TOPRIGHT', 1, -18)

	FriendsFrameBattlenetFrame.Tag:SetParent(_G.FriendsListFrame)
	FriendsFrameBattlenetFrame.Tag:Point('TOP', FriendsFrame, 'TOP', 0, -8)

	_G.FriendsFrameBroadcastInput:CreateBackdrop()
	_G.FriendsFrameBroadcastInput:Width(250)
	_G.FriendsFrameBroadcastInput:Point('TOPLEFT', 22, -32)
	_G.FriendsFrameBroadcastInput:Point('TOPRIGHT', -9, -32)

	_G.FriendsFrameBroadcastInputLeft:Kill()
	_G.FriendsFrameBroadcastInputRight:Kill()
	_G.FriendsFrameBroadcastInputMiddle:Kill()

	hooksecurefunc('FriendsFrame_CheckBattlenetStatus', function()
		if BNFeaturesEnabled() then
			local frame = _G.FriendsFrameBattlenetFrame

			frame.BroadcastButton:Hide()

			if BNConnected() then
				frame:Hide()
				_G.FriendsFrameBroadcastInput:Show()
				FriendsFrameBroadcastInput_UpdateDisplay()
			end
		end
	end)
	FriendsFrame_CheckBattlenetStatus()

	hooksecurefunc('FriendsFrame_Update', function()
		if FriendsFrame.selectedTab == 1 and _G.FriendsTabHeader.selectedTab == 1 and _G.FriendsFrameBattlenetFrame.Tag:IsShown() then
			_G.FriendsFrameTitleText:Hide()
		else
			_G.FriendsFrameTitleText:Show()
		end
	end)

	S:HandleEditBox(_G.AddFriendNameEditBox)
	_G.AddFriendFrame:SetTemplate('Transparent')
	_G.ScrollOfResurrectionSelectionFrame:SetTemplate('Transparent')
	_G.ScrollOfResurrectionSelectionFrameList:SetTemplate()
	S:HandleScrollBar(_G.ScrollOfResurrectionSelectionFrameListScrollFrameScrollBar, 4)
	S:HandleEditBox(_G.ScrollOfResurrectionSelectionFrameTargetEditBox)

	--Pending invites
	S:HandleButton(_G.FriendsFrameFriendsScrollFrame.PendingInvitesHeaderButton, true)
	_G.FriendsFrameFriendsScrollFrame.PendingInvitesHeaderButton:SetScript('OnMouseUp', nil)
	_G.FriendsFrameFriendsScrollFrame.PendingInvitesHeaderButton:SetScript('OnMouseDown', nil)

	_G.FriendsFrameFriendsScrollFrame.PendingInvitesHeaderButton.RightArrow:SetTexture(E.Media.Textures.ArrowUp)
	_G.FriendsFrameFriendsScrollFrame.PendingInvitesHeaderButton.RightArrow:SetRotation(S.ArrowRotation['right'])
	_G.FriendsFrameFriendsScrollFrame.PendingInvitesHeaderButton.DownArrow:SetTexture(E.Media.Textures.ArrowUp)
	_G.FriendsFrameFriendsScrollFrame.PendingInvitesHeaderButton.DownArrow:SetRotation(S.ArrowRotation['down'])

	_G.FriendsFrameFriendsScrollFrame.PendingInvitesHeaderButton.RightArrow:SetPoint('LEFT', 11, 0)
	_G.FriendsFrameFriendsScrollFrame.PendingInvitesHeaderButton.DownArrow:SetPoint('TOPLEFT', 8, -10)
	hooksecurefunc(_G.FriendsFrameFriendsScrollFrame.invitePool, 'Acquire', function()
		for object in pairs(_G.FriendsFrameFriendsScrollFrame.invitePool.activeObjects) do
			SkinFriendRequest(object)
		end
	end)

	for i = 1, #_G.FRIENDSFRAME_SUBFRAMES do
		S:HandleTab(_G['FriendsFrameTab'..i])
	end

	-- Friends List Frame
	for i = 1, 2 do
		local tab = _G['FriendsTabHeaderTab'..i]
		tab:StripTextures()
		tab:CreateBackdrop('Default', true)
		tab.backdrop:Point('TOPLEFT', 3, -7)
		tab.backdrop:Point('BOTTOMRIGHT', -2, -1)

		tab:SetScript('OnEnter', S.SetModifiedBackdrop)
		tab:SetScript('OnLeave', S.SetOriginalBackdrop)
	end

	for i = 1, _G.FRIENDS_FRIENDS_TO_DISPLAY do
		S:HandleButtonHighlight(_G['FriendsFriendsButton'..i])
	end

	_G.FriendsFrameFriendsScrollFrame:StripTextures()
	S:HandleScrollBar(_G.FriendsFrameFriendsScrollFrameScrollBar)

	S:HandleButton(_G.FriendsFrameAddFriendButton)
	_G.FriendsFrameAddFriendButton:Point('BOTTOMLEFT', -1, 4)
	S:HandleButton(_G.FriendsFrameSendMessageButton)
	S:HandleButton(_G.FriendsFrameUnsquelchButton)
	S:HandleButton(_G.AddFriendEntryFrameAcceptButton)
	S:HandleButton(_G.AddFriendEntryFrameCancelButton)

	S:HandleDropDownBox(_G.FriendsFrameStatusDropDown)
	_G.FriendsFrameStatusDropDown:ClearAllPoints()
	_G.FriendsFrameStatusDropDown:Point('TOPRIGHT', _G.FriendsListFrame, 'TOPRIGHT', 11, -55)

	--View Friends BN Frame
	_G.FriendsFriendsFrame:CreateBackdrop('Transparent')

	StripAllTextures = {
		'FriendsFriendsFrame',
		'FriendsFriendsList',
	}

	buttons = {
		'FriendsFriendsSendRequestButton',
		'FriendsFriendsCloseButton',
	}

	for _, object in pairs(StripAllTextures) do
		_G[object]:StripTextures()
	end

	for _, button in pairs(buttons) do
		S:HandleButton(_G[button])
	end

	_G.IgnoreListFrame:StripTextures()
	_G.ScrollOfResurrectionFrame:StripTextures()
	S:HandleButton(_G.ScrollOfResurrectionFrameAcceptButton)
	S:HandleButton(_G.ScrollOfResurrectionFrameCancelButton)

	_G.ScrollOfResurrectionFrameTargetEditBoxLeft:SetTexture()
	_G.ScrollOfResurrectionFrameTargetEditBoxMiddle:SetTexture()
	_G.ScrollOfResurrectionFrameTargetEditBoxRight:SetTexture()
	_G.ScrollOfResurrectionFrameNoteFrame:StripTextures()
	_G.ScrollOfResurrectionFrameNoteFrame:SetTemplate()
	_G.ScrollOfResurrectionFrameTargetEditBox:SetTemplate()
	_G.ScrollOfResurrectionFrame:SetTemplate('Transparent')

	_G.RecruitAFriendFrame:StripTextures()
	_G.RecruitAFriendFrame:SetTemplate('Transparent')
	_G.RecruitAFriendFrame.MoreDetails.Text:FontTemplate()
	S:HandleCloseButton(_G.RecruitAFriendFrameCloseButton)
	S:HandleButton(_G.RecruitAFriendFrameSendButton)
	S:HandleEditBox(_G.RecruitAFriendNameEditBox)
	_G.RecruitAFriendNoteFrame:StripTextures()
	S:HandleEditBox(_G.RecruitAFriendNoteFrame)

	_G.RecruitAFriendSentFrame:StripTextures()
	_G.RecruitAFriendSentFrame:SetTemplate('Transparent')
	S:HandleCloseButton(_G.RecruitAFriendSentFrameCloseButton)
	S:HandleButton(_G.RecruitAFriendSentFrame.OKButton)
	hooksecurefunc('RecruitAFriend_Send', function()
		_G.RecruitAFriendSentFrame:ClearAllPoints()
		_G.RecruitAFriendSentFrame:Point('CENTER', E.UIParent, 'CENTER', 0, 100)
	end)

	S:HandleScrollBar(_G.FriendsFriendsScrollFrameScrollBar)

	S:HandleEditBox(_G.FriendsFriendsList)

	S:HandleDropDownBox(_G.FriendsFriendsFrameDropDown, 150)

	-- Ignore List
	_G.IgnoreListFrame:StripTextures()

	S:HandleButton(_G.FriendsFrameIgnorePlayerButton)

	_G.FriendsFrameIgnoreButton1:Point('TOPLEFT', 10, -89)
	_G.FriendsFrameUnsquelchButton:Point('RIGHT', -6, 0)
	_G.FriendsFrameUnsquelchButton:Width(131)
	_G.FriendsFrameUnsquelchButton.SetWidth = E.noop

	S:HandleScrollBar(_G.FriendsFrameIgnoreScrollFrameScrollBar)

	for i = 1, 19 do
		local button = _G['FriendsFrameIgnoreButton'..i]

		button:Width(298)
		S:HandleButtonHighlight(button)

		button.stripe = button:CreateTexture(nil, 'OVERLAY')
		button.stripe:SetTexture('Interface\\GuildFrame\\GuildFrame')
		if i % 2 == 1 then
			button.stripe:SetTexCoord(0.362, 0.381, 0.958, 0.998)
		else
			button.stripe:SetTexCoord(0.516, 0.536, 0.882, 0.921)
		end
		button.stripe:SetAllPoints()
	end

	-- Who Frame
	_G.WhoFrameListInset:StripTextures()
	_G.WhoFrameEditBoxInset:StripTextures()
	_G.WhoListScrollFrame:StripTextures()

	for i = 1, 4 do
		_G['WhoFrameColumnHeader'..i]:StripTextures()
		_G['WhoFrameColumnHeader'..i]:StyleButton()
		_G['WhoFrameColumnHeader'..i]:ClearAllPoints()
	end

	_G.WhoFrameColumnHeader1:Point('LEFT', _G.WhoFrameColumnHeader4, 'RIGHT', -2, 0)
	_G.WhoFrameColumn_SetWidth(_G.WhoFrameColumnHeader1, 105)
	_G.WhoFrameColumnHeader2:Point('LEFT', _G.WhoFrameColumnHeader1, 'RIGHT', -5, 0)
	_G.WhoFrameColumnHeader3:Point('TOPLEFT', _G.WhoFrame, 'TOPLEFT', 8, -57)
	_G.WhoFrameColumnHeader4:Point('LEFT', _G.WhoFrameColumnHeader3, 'RIGHT', -2, 0)
	_G.WhoFrameColumn_SetWidth(_G.WhoFrameColumnHeader4, 50)

	_G.WhoFrameButton1:Point('TOPLEFT', 10, -82)

	S:HandleEditBox(_G.WhoFrameEditBox)
	_G.WhoFrameEditBox:Point('BOTTOM', -3, 29)
	_G.WhoFrameEditBox:Size(332, 18)

	S:HandleButton(_G.WhoFrameWhoButton)
	_G.WhoFrameWhoButton:Point('RIGHT', _G.WhoFrameAddFriendButton, 'LEFT', -2, 0)
	_G.WhoFrameWhoButton:Width(90)

	S:HandleButton(_G.WhoFrameAddFriendButton)
	_G.WhoFrameAddFriendButton:Point('RIGHT', _G.WhoFrameGroupInviteButton, 'LEFT', -2, 0)

	S:HandleButton(_G.WhoFrameGroupInviteButton)
	_G.WhoFrameGroupInviteButton:Point('BOTTOMRIGHT', -6, 4)

	S:HandleDropDownBox(_G.WhoFrameDropDown)
	_G.WhoFrameDropDown:Point('TOPLEFT', -6, 4)

	S:HandleScrollBar(_G.WhoListScrollFrameScrollBar, 3)
	_G.WhoListScrollFrameScrollBar:ClearAllPoints()
	_G.WhoListScrollFrameScrollBar:Point('TOPRIGHT', WhoListScrollFrame, 'TOPRIGHT', 26, -13)
	_G.WhoListScrollFrameScrollBar:Point('BOTTOMRIGHT', WhoListScrollFrame, 'BOTTOMRIGHT', 0, 18)

	for i = 1, _G.WHOS_TO_DISPLAY do
		local button = _G['WhoFrameButton'..i]
		local level = _G['WhoFrameButton' .. i .. 'Level']
		local name = _G['WhoFrameButton' .. i .. 'Name']

		button.icon = button:CreateTexture('$parentIcon', 'ARTWORK')
		button.icon:Point('LEFT', 45, 0)
		button.icon:Size(14)
		button.icon:SetTexture([[Interface\WorldStateFrame\Icons-Classes]])

		button:CreateBackdrop('Default', true)
		button.backdrop:SetAllPoints(button.icon)
		S:HandleButtonHighlight(button)

		button.stripe = button:CreateTexture(nil, 'BACKGROUND')
		button.stripe:SetTexture('Interface\\GuildFrame\\GuildFrame')
		button.stripe:SetInside()

		level:ClearAllPoints()
		if i == 1 then
			level:Point('TOPLEFT', 11, -2)
		else
			level:Point('TOPLEFT', 12, -2)
		end

		name:Size(100, 14)
		name:ClearAllPoints()
		name:Point('LEFT', 85, 0)

		_G['WhoFrameButton'..i..'Class']:Hide()
	end

	hooksecurefunc('WhoList_Update', function()
		local whoOffset = FauxScrollFrame_GetOffset(WhoListScrollFrame)
		local button, nameText, levelText, classText, variableText
		local info, guild, level, race, zone, classFileName
		local classTextColor, levelTextColor
		local index, columnTable

		local playerZone = GetRealZoneText()
		local playerGuild = GetGuildInfo('player')
		local playerRace = UnitRace('player')

		for i = 1, _G.WHOS_TO_DISPLAY, 1 do
			index = whoOffset + i
			button = _G['WhoFrameButton'..i]
			nameText = _G['WhoFrameButton'..i..'Name']
			levelText = _G['WhoFrameButton'..i..'Level']
			classText = _G['WhoFrameButton'..i..'Class']
			variableText = _G['WhoFrameButton'..i..'Variable']

			info = C_FriendList.GetWhoInfo(index)

			if info then

				guild, level, race, zone, classFileName = info.fullGuildName, info.level, info.raceStr, info.filename

				classFileName = localizedTable[classFileName]
				classTextColor = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[info.filename] or RAID_CLASS_COLORS[info.filename]
				levelTextColor = GetQuestDifficultyColor(info.level)

				if info.filename then
					button.icon:Show()
					button.icon:SetTexCoord(unpack(CLASS_ICON_TCOORDS[info.filename]))

					nameText:SetTextColor(classTextColor.r, classTextColor.g, classTextColor.b)
					levelText:SetTextColor(levelTextColor.r, levelTextColor.g, levelTextColor.b)

					if zone == playerZone then zone = '|cff00ff00'..info.area end
					if guild == playerGuild then guild = '|cff00ff00'..info.fullGuildName end
					if race == E.myrace then race = '|cff00ff00'..info.raceStr end

					columnTable = {info.area, info.fullGuildName, info.raceStr}

					variableText:SetText(columnTable[UIDropDownMenu_GetSelectedID(WhoFrameDropDown)])
				else
					button.icon:Hide()
				end

				if (i + whoOffset) % 2 == 1 then
					button.stripe:SetTexCoord(0.362, 0.381, 0.958, 0.998)
				else
					button.stripe:SetTexCoord(0.516, 0.536, 0.882, 0.921)
				end
			end
		end
	end)

	-- Guild Frame
	_G.GuildFrame:StripTextures()

	_G.GuildFrameColumnHeader3:ClearAllPoints()
	_G.GuildFrameColumnHeader3:Point('TOPLEFT', 8, -57)

	_G.GuildFrameColumnHeader4:ClearAllPoints()
	_G.GuildFrameColumnHeader4:Point('LEFT', _G.GuildFrameColumnHeader3, 'RIGHT', -2, -0)
	_G.GuildFrameColumnHeader4:Width(50)

	_G.GuildFrameColumnHeader1:ClearAllPoints()
	_G.GuildFrameColumnHeader1:Point('LEFT', _G.GuildFrameColumnHeader4, 'RIGHT', -2, -0)
	_G.GuildFrameColumnHeader1:Width(105)

	_G.GuildFrameColumnHeader2:ClearAllPoints()
	_G.GuildFrameColumnHeader2:Point('LEFT', _G.GuildFrameColumnHeader1, 'RIGHT', -2, -0)
	_G.GuildFrameColumnHeader2:Width(127)

	for i = 1, _G.GUILDMEMBERS_TO_DISPLAY do
		local button = _G['GuildFrameButton'..i]
		local statusButton = _G['GuildFrameGuildStatusButton'..i]
		local name = _G['GuildFrameButton'..i..'Name']
		local level = _G['GuildFrameButton'..i..'Level']

		button:Width(300)
		statusButton:Width(300)

		button.icon = button:CreateTexture('$parentIcon', 'ARTWORK')
		button.icon:Point('LEFT', 45, 0)
		button.icon:Size(14)
		button.icon:SetTexture([[Interface\WorldStateFrame\Icons-Classes]])

		button:CreateBackdrop('Default', true)
		button.backdrop:SetAllPoints(button.icon)
		S:HandleButtonHighlight(button)

		level:ClearAllPoints()
		if i == 1 then
			level:Point('TOPLEFT', 11, -2)
		else
			level:Point('TOPLEFT', 12, -2)
		end

		name:Size(100, 14)
		name:ClearAllPoints()
		name:Point('LEFT', 85, 0)

		_G['GuildFrameButton'..i..'Class']:Hide()

		S:HandleButtonHighlight(_G['GuildFrameGuildStatusButton'..i])

		_G['GuildFrameGuildStatusButton'..i..'Name']:Point('TOPLEFT', 14, 0)
	end

	hooksecurefunc('GuildStatus_Update', function()
		local _, level, class, zone, online, classFileName
		local button, buttonText, classTextColor, levelTextColor
		local playerZone = GetRealZoneText()

		if FriendsFrame.playerStatusFrame then
			for i = 1, GUILDMEMBERS_TO_DISPLAY, 1 do
				button = _G['GuildFrameButton'..i]
				_, _, _, level, class, zone, _, _, online = GetGuildRosterInfo(button.guildIndex)

				classFileName = localizedTable[class]
				if classFileName then
					if online then
						classTextColor = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[classFileName] or RAID_CLASS_COLORS[classFileName]
						levelTextColor = GetQuestDifficultyColor(level)

						buttonText = _G['GuildFrameButton'..i..'Name']
						buttonText:SetTextColor(classTextColor.r, classTextColor.g, classTextColor.b)
						buttonText = _G['GuildFrameButton'..i..'Level']
						buttonText:SetTextColor(levelTextColor.r, levelTextColor.g, levelTextColor.b)
						buttonText = _G['GuildFrameButton'..i..'Zone']

						if zone == playerZone then
							buttonText:SetTextColor(0, 1, 0)
						end
					end

					button.icon:SetTexCoord(unpack(CLASS_ICON_TCOORDS[classFileName]))
				end
			end
		else
			for i = 1, _G.GUILDMEMBERS_TO_DISPLAY, 1 do
				button = _G['GuildFrameGuildStatusButton'..i]
				_, _, _, _, class, _, _, _, online = GetGuildRosterInfo(button.guildIndex)

				classFileName = localizedTable[class]
				if classFileName then
					if online then
						classTextColor = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[classFileName] or RAID_CLASS_COLORS[classFileName]
						_G['GuildFrameGuildStatusButton'..i..'Name']:SetTextColor(classTextColor.r, classTextColor.g, classTextColor.b)
						_G['GuildFrameGuildStatusButton'..i..'Online']:SetTextColor(1.0, 1.0, 1.0)
					end
				end
			end
		end
	end)

	_G.GuildFrameLFGFrame:StripTextures()
	_G.GuildFrameLFGFrame:SetTemplate('Transparent')

	S:HandleCheckBox(_G.GuildFrameLFGButton)

	for i = 1, 4 do
		_G['GuildFrameColumnHeader'..i]:StripTextures()
		_G['GuildFrameColumnHeader'..i]:StyleButton()
		_G['GuildFrameGuildStatusColumnHeader'..i]:StripTextures()
		_G['GuildFrameGuildStatusColumnHeader'..i]:StyleButton()
	end

	_G.GuildListScrollFrame:StripTextures()
	S:HandleScrollBar(_G.GuildListScrollFrameScrollBar)

	S:HandleNextPrevButton(_G.GuildFrameGuildListToggleButton, 'left')

	S:HandleButton(_G.GuildFrameGuildInformationButton)
	_G.GuildFrameGuildInformationButton:Point('BOTTOMLEFT', -1, 4)
	S:HandleButton(_G.GuildFrameAddMemberButton)
	S:HandleButton(_G.GuildFrameControlButton)

	-- Member Detail Frame
	_G.GuildMemberDetailFrame:StripTextures()
	_G.GuildMemberDetailFrame:CreateBackdrop('Transparent')
	_G.GuildMemberDetailFrame:Point('TOPLEFT', _G.GuildFrame, 'TOPRIGHT', 3, -1)

	S:HandleCloseButton(_G.GuildMemberDetailCloseButton, _G.GuildMemberDetailFrame.backdrop)

	S:HandleButton(_G.GuildMemberRemoveButton)
	_G.GuildMemberRemoveButton:Point('BOTTOMLEFT', 3, 3)

	S:HandleButton(_G.GuildMemberGroupInviteButton)
	_G.GuildMemberGroupInviteButton:Point('BOTTOMRIGHT', -3, 3)

	S:HandleNextPrevButton(_G.GuildFramePromoteButton, 'up')
	_G.GuildFramePromoteButton:SetHitRectInsets(0, 0, 0, 0)
	_G.GuildFramePromoteButton:SetPoint('TOPLEFT', _G.GuildMemberDetailFrame, 'TOPLEFT', 155, -68)

	S:HandleNextPrevButton(_G.GuildFrameDemoteButton)
	_G.GuildFrameDemoteButton:SetHitRectInsets(0, 0, 0, 0)
	_G.GuildFrameDemoteButton:Point('LEFT', GuildFramePromoteButton, 'RIGHT', 2, 0)

	_G.GuildMemberNoteBackground:Point('TOPLEFT', 3, -130)
	_G.GuildMemberNoteBackground:StripTextures()
	_G.GuildMemberNoteBackground:CreateBackdrop('Default')
	_G.GuildMemberNoteBackground.backdrop:Point('TOPLEFT', 0, -2)
	_G.GuildMemberNoteBackground.backdrop:Point('BOTTOMRIGHT', 0, 2)
	_G.GuildMemberNoteBackground:Width(205)

	_G.PersonalNoteText:Point('TOPLEFT', 4, -4)
	_G.PersonalNoteText:Width(197)

	_G.GuildMemberOfficerNoteBackground:StripTextures()
	_G.GuildMemberOfficerNoteBackground:CreateBackdrop('Default')
	_G.GuildMemberOfficerNoteBackground.backdrop:Point('TOPLEFT', 0, -2)
	_G.GuildMemberOfficerNoteBackground.backdrop:Point('BOTTOMRIGHT', 0, -1)

	_G.GuildFrameNotesLabel:Point('TOPLEFT', GuildFrame, 'TOPLEFT', 6, -328)
	_G.GuildFrameNotesText:Point('TOPLEFT', GuildFrameNotesLabel, 'BOTTOMLEFT', 0, -6)

	_G.GuildFrameBarLeft:StripTextures()

	_G.GuildMOTDEditButton:CreateBackdrop('Default')
	_G.GuildMOTDEditButton.backdrop:Point('TOPLEFT', -7, 3)
	_G.GuildMOTDEditButton.backdrop:Point('BOTTOMRIGHT', 7, -2)
	_G.GuildMOTDEditButton:SetHitRectInsets(-7, -7, -3, -2)

	_G.GuildFrameNotesText:Size(320, 49)

	-- Info Frame
	_G.GuildInfoFrame:StripTextures()
	_G.GuildInfoFrame:CreateBackdrop('Transparent')
	_G.GuildInfoFrame:Point('TOPLEFT', _G.GuildFrame, 'TOPRIGHT', -1, 6)
	_G.GuildInfoFrame.backdrop:Point('TOPLEFT', 3, -6)
	_G.GuildInfoFrame.backdrop:Point('BOTTOMRIGHT', -2, 3)

	_G.GuildInfoTextBackground:SetTemplate('Default')
	S:HandleScrollBar(_G.GuildInfoFrameScrollFrameScrollBar)

	S:HandleCloseButton(_G.GuildInfoCloseButton, _G.GuildInfoFrame.backdrop, nil, -2)

	S:HandleButton(_G.GuildInfoSaveButton)
	_G.GuildInfoSaveButton:Point('BOTTOMLEFT', 8, 8)

	S:HandleButton(_G.GuildInfoCancelButton)
	_G.GuildInfoCancelButton:Point('LEFT', _G.GuildInfoSaveButton, 'RIGHT', 4, 0)

	-- Control Frame
	_G.GuildControlPopupFrame:StripTextures()
	_G.GuildControlPopupFrame:CreateBackdrop('Transparent')
	_G.GuildControlPopupFrame.backdrop:Point('TOPLEFT', 3, 0)

	S:HandleDropDownBox(_G.GuildControlPopupFrameDropDown, 185)
	_G.GuildControlPopupFrameDropDownButton:Size(18)

	local function SkinPlusMinus(button, minus)
		local texture = E.Media.Textures.PlusButton
		if minus then
			texture = E.Media.Textures.MinusButton
		end

		button:SetNormalTexture(texture)
		button.SetNormalTexture = E.noop

		button:SetPushedTexture(texture)
		button.SetPushedTexture = E.noop

		button:SetHighlightTexture('')
		button.SetHighlightTexture = E.noop

		button:SetDisabledTexture(texture)
		button.SetDisabledTexture = E.noop
		button:GetDisabledTexture():SetDesaturated(true)
	end

	SkinPlusMinus(_G.GuildControlPopupFrameAddRankButton)
	_G.GuildControlPopupFrameAddRankButton:Point('LEFT', _G.GuildControlPopupFrameDropDown, 'RIGHT', -8, 3)

	SkinPlusMinus(_G.GuildControlPopupFrameRemoveRankButton, true)
	_G.GuildControlPopupFrameRemoveRankButton:Point('LEFT', _G.GuildControlPopupFrameAddRankButton, 'RIGHT', 4, 0)


	local left, right = select(2, _G.GuildControlPopupFrameEditBox:GetRegions())
	left:Kill() right:Kill()

	S:HandleEditBox(_G.GuildControlPopupFrameEditBox)
	_G.GuildControlPopupFrameEditBox.backdrop:Point('TOPLEFT', 0, -5)
	_G.GuildControlPopupFrameEditBox.backdrop:Point('BOTTOMRIGHT', 0, 5)

	for i = 1, 17 do
		local checkbox = _G['GuildControlPopupFrameCheckbox'..i]
		if checkbox then
			S:HandleCheckBox(checkbox)
		end
	end

	S:HandleButton(_G.GuildControlPopupAcceptButton)
	S:HandleButton(_G.GuildControlPopupFrameCancelButton)

	-- Raid Frame
	S:HandleButton(_G.RaidFrameConvertToRaidButton)
	_G.RaidFrameConvertToRaidButton:Point('BOTTOMRIGHT', -6, 4)
	S:HandleButton(_G.RaidFrameRaidInfoButton)

	S:HandleCheckBox(_G.RaidFrameAllAssistCheckButton)

	-- Raid Info Frame
	_G.RaidInfoFrame:StripTextures(true)
	_G.RaidInfoFrame:SetTemplate('Transparent')

	_G.RaidInfoFrame:HookScript('OnShow', function()
		if GetNumRaidMembers() > 0 then
			_G.RaidInfoFrame:Point('TOPLEFT', RaidFrame, 'TOPRIGHT', -14, -12)
		else
			_G.RaidInfoFrame:Point('TOPLEFT', RaidFrame, 'TOPRIGHT', -34, -12)
		end
	end)

	S:HandleCloseButton(_G.RaidInfoCloseButton, _G.RaidInfoFrame)

	_G.RaidInfoScrollFrame:StripTextures()
	S:HandleScrollBar(_G.RaidInfoScrollFrameScrollBar)
end

S:AddCallback('Skin_Friends', LoadSkin)

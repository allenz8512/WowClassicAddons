------------------------------------------------------------------
-- Name: PlayerListFrame									    --
-- Description: Shows all players that meet the fitler criteria --
-- Parent Frame: DatabaseFrame							        --
------------------------------------------------------------------

MTSLUI_PLAYER_LIST_FRAME = {
    -- Keeps the current created frame
    scroll_frame,
    -- Maximum amount of items shown at once
    MAX_ITEMS_SHOWN_CURRENTLY = 18, -- default mode
    MAX_ITEMS_SHOWN_VERTICAL = 18,
    MAX_ITEMS_SHOWN_HORIZONTAL = 29,
    ITEM_HEIGHT = 19,
    -- array holding the buttons of this frame
    LIST_BUITTONS,
    -- Offset in the list (based on slider)
    slider_offset = 1,
    -- index and id of the selected player
    selected_list_item_index,
    selected_list_item_id,
    -- index of the selected button
    selected_button_index,
    -- Flag to check if slider is active or not
    slider_active,
    -- width of the frame
    FRAME_WIDTH = 300,
    -- height of the frame
    FRAME_HEIGHT_VERTICAL = 354,
    FRAME_HEIGHT_HORIZONTAL = 570,
    -- show all by default
    current_zone = 0,

    ----------------------------------------------------------------------------------------------------------
    -- Intialises the PlayersListFrame
    --
    -- @parent_frame		Frame		The parent frame
    ----------------------------------------------------------------------------------------------------------
    Initialise = function(self, parent_frame)
        self.ui_frame = MTSLUI_TOOLS:CreateScrollFrame(self, parent_frame, self.FRAME_WIDTH, self.FRAME_HEIGHT_VERTICAL, true, self.ITEM_HEIGHT)
        -- Create the buttons
        self.LIST_BUITTONS = {}
        local left = 6
        local top = -6
        -- intialise all buttons
        for i=1,self.MAX_ITEMS_SHOWN_HORIZONTAL do
            -- Create a new list item (button) by making a copy of MTSLUI_LIST_ITEM
            local player_button = MTSL_TOOLS:CopyObject(MTSLUI_LIST_ITEM)
            player_button:Initialise(i, self, self.FRAME_WIDTH - 12, self.ITEM_HEIGHT, left, top)
            -- adjust top position for next button
            top = top - self.ITEM_HEIGHT
            -- add button to list
            table.insert(self.LIST_BUITTONS, player_button)
        end

        self.profession_name = ""
        -- default all zones
        self.current_realm = "any"
        -- default sort by name
        self.current_sort = 1
        -- save players because they cant change during addon
        self.players = MTSL_TOOLS:CopyObject(MTSL_PLAYERS)
        self.shown_players = {}
        self.amount_shown_players = 0
        self.show_skill_level = false
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Sets the frame which will show the professions of the selected player
    --
    -- @profession_list_frame		Object		The frame to show the details of the selected item
    ----------------------------------------------------------------------------------------------------------
    SetProfessionListFrame = function(self, profession_list_frame)
        self.profession_list_frame = profession_list_frame
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Updates the list of MissingPlayersListFrame
    ----------------------------------------------------------------------------------------------------------
    UpdateList = function (self)
        self.shown_players = self:FilterListOfPlayers()
        self.amount_shown_players = MTSL_TOOLS:CountItemsInNamedArray(self.shown_players)
        if self.amount_shown_players <= 0 then
            self:NoPlayersToShow()
        end

        -- sort the list
        self:SortPlayers(self.current_sort)

        self:UpdateSlider()
        self:UpdateButtons()
    end,

    -- Fitler the list of players based on realm and/or profession
    FilterListOfPlayers = function(self)
        local filtered_players = {}
        if self.current_realm == nil or self.current_realm == "any" then
            -- add players of eaach realms
            for _, v in pairs(self.players) do
                for _, p in pairs(v) do
                    -- only add if he knows the professsion if we fiulter on it
                    if MTSL_LOGIC_PLAYER_NPC:HasLearnedProfession(p.NAME, p.REALM, self.profession_name) then
                        table.insert(filtered_players, p)
                    end
                end
            end
        else
            for _, p in pairs(self.players[self.current_realm]) do
                if MTSL_LOGIC_PLAYER_NPC:HasLearnedProfession(p.NAME, p.REALM, self.profession_name) then
                    table.insert(filtered_players, p)
                end
            end
        end
        return filtered_players
    end,

    UpdateSlider = function(self)
        -- no need for slider
        if self.amount_shown_players == nil or self.amount_shown_players <= self.MAX_ITEMS_SHOWN_CURRENTLY then
            self.slider_active = 0
            self.ui_frame.slider:Hide()
        else
            self.slider_active = 1
            local max_steps = self.amount_shown_players - self.MAX_ITEMS_SHOWN_CURRENTLY + 1
            self.ui_frame.slider:Refresh(max_steps, self.MAX_ITEMS_SHOWN_CURRENTLY)
            self.ui_frame.slider:Show()
        end
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Updates the playerbuttons of MissingPlayersListFrame
    ----------------------------------------------------------------------------------------------------------
    UpdateButtons = function (self)
        local current_player = 1
        local showed_players = 0

        for k, v in pairs(self.shown_players) do
            -- player is in the current shown "area" for slider so show him
            if current_player >= self.slider_offset or current_player < self.slider_offset + self.MAX_ITEMS_SHOWN_CURRENTLY then
                showed_players = showed_players + 1
                -- create the text to be shown
                local text_for_button = ""
                -- color the skill level of the player compared to needed if enabled
                if self:IsShowSkillLevelNeededEnabled() then
                    local skill_level = MTSL_LOGIC_PLAYER_NPC:GetCurrentSkillLevelForProfession(v.NAME, v.REALM, self.profession_name)
                    if self.current_skill == nil then
                        text_for_button = MTSLUI_FONTS.COLORS.AVAILABLE.ALL .. "[" .. skill_level.. "] "
                    -- green if learned
                    elseif MTSL_LOGIC_PLAYER_NPC:HasLearnedSkillForProfession(v.NAME, v.REALM, self.profession_name, self.current_skill.id) == true then
                        text_for_button = MTSLUI_FONTS.COLORS.AVAILABLE.YES .. "[" .. skill_level.. "] "
                    -- orange if not learned but enough skill
                    elseif self.current_skill.min_skill <= skill_level then
                        text_for_button = MTSLUI_FONTS.COLORS.AVAILABLE.LEARNABLE .."[" .. skill_level .. "] "
                    -- red if not learned and not enough skill
                    else
                        text_for_button = MTSLUI_FONTS.COLORS.AVAILABLE.NO .. "[" .. skill_level.. "] "
                    end
                end
                -- show player name in faction color
                if v.FACTION == MTSLUI_LOCALES_HORDE[MTSLUI_CURRENT_LANGUAGE] then
                    text_for_button = text_for_button .. MTSLUI_FONTS.COLORS.FACTION.HORDE .. v.NAME
                else
                    text_for_button = text_for_button .. MTSLUI_FONTS.COLORS.FACTION.ALLIANCE .. v.NAME
                end
                text_for_button = text_for_button .. MTSLUI_FONTS.COLORS.TEXT.NORMAL .. " (" .. v.XP_LEVEL .. ", "..  v.REALM .. ")"
                -- update & show the button
                self.LIST_BUITTONS[showed_players]:Refresh(text_for_button, self.slider_active)
                self.LIST_BUITTONS[showed_players]:Show()
            end
            -- index next player
            current_player = current_player + 1
        end
        -- hide the remaining buttons not shown when using horizontal split
        for i=showed_players + 1,self.MAX_ITEMS_SHOWN_HORIZONTAL do
            self.LIST_BUITTONS[i]:Hide()
        end
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Handles the event when player button is pushed
    --
    -- @id		Number		The id (= index) of button that is pushed
    ----------------------------------------------------------------------------------------------------------
    HandleSelectedListItem = function(self, id)
        -- Clicked on same button so deselect it
        if self.LIST_BUITTONS[id]:IsSelected() == 1 then
            self.selected_list_item_index = nil
            self.selected_list_item_id = nil
            self.selected_button_index = nil
            self.LIST_BUITTONS[id]:Deselect()
            --self.profession_list_frame:ShowNoPlayerSelected()
        else
            -- Deselect the current button if visible
            self:DeselectCurrentPlayerButton()
            -- Subtract 1 because index starts at 1 instead of 0
            self.selected_list_item_index = self.slider_offset + id - 1
            if self.amount_shown_players >= self.selected_list_item_index then
                -- update the index of selected button
                self.selected_button_index = id
                self:SelectCurrentPlayerButton()
                -- Show the information of the selected player
                local selected_player = MTSL_TOOLS:GetItemFromNamedListByIdex(self.shown_players, self.selected_list_item_index)
                if selected_player ~= nil and self.profession_list_frame ~= nil then
                    self.selected_list_item_id = id
                    -- cant select item so deselect details
                    self.profession_list_frame:ChangePlayer(selected_player.NAME, selected_player.REALM)
                elseif self.profession_list_frame ~= nil then
                    self.profession_list_frame:ShowNoProfessions()
               end
            elseif self.profession_list_frame ~= nil then
                self.profession_list_frame:ShowNoProfessions()
            end
        end
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Handles the event when we scroll
    --
    -- @offset	Number
    ----------------------------------------------------------------------------------------------------------
    HandleScrollEvent = function (self, offset)
        -- Only handle the event if slider is visible
        if self.slider_active == 1 then
            -- Update the index of the selected player if any
            if self.selected_list_item_index ~= nil then
                -- Deselect the current button if visible
                self:DeselectCurrentPlayerButton()
                -- adjust index of the selected player in the list
                local scroll_gap = offset - self.slider_offset
                if self.selected_list_item_index ~= nil then
                   self.selected_list_item_index = self.selected_list_item_index - scroll_gap
                end
                if self.selected_button_index ~= nil then
                   self.selected_button_index = self.selected_button_index - scroll_gap
                end

                -- Select the current button if visible
                self:SelectCurrentPlayerButton()
                -- scrolled of screen so remove selected id
                if self.selected_button_index == nil or self.selected_button_index < 1 or self.selected_button_index > self.MAX_ITEMS_SHOWN_HORIZONTAL then
                    self.selected_list_item_id = nil
                end
            end
            -- Update the offset for the slider
            self.slider_offset = offset
            -- update the text on the buttons based on the new "visible" players
            self:UpdateButtons()
        end
    end,

    -- Set the selected skill (in another frame) to use here to adjust text
    SetSelectedSkill = function(self, skill)
        self.current_skill = skill
    end,

    -- Unset/remove the selected skill (in another frame) to use here to adjust text
    RemoveSelectedSkill = function(self)
        self.current_skill = nil
    end,

    ----------------------------------------------------------------------------------------------------------
    -- The list is empty
    ----------------------------------------------------------------------------------------------------------
    NoPlayersToShow = function(self)
        -- dselect current player & button
        self:DeselectCurrentPlayerButton()
        self.selected_list_item_index = nil
        self.selected_list_item_id = nil
        self.selected_button_index = nil
        -- pass it trough to the detail frame
        if self.profession_list_frame ~= nil then
            self.profession_list_frame:ShowNoPlayerSelected()
        end
    end,

    ----------------------------------------------------------------------------------------------------------
    -- reset the position of the scroll bar & deselect current player
    ----------------------------------------------------------------------------------------------------------
    Reset = function(self)
        -- dselect current player & button
        self:DeselectCurrentPlayerButton()
        self.selected_list_item_index = nil
        self.selected_list_item_id = nil
        self.selected_button_index = nil
        -- Scroll all way to top
        self:HandleScrollEvent(1)
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Selects the current selected playerbuton
    ----------------------------------------------------------------------------------------------------------
    SelectCurrentPlayerButton = function (self)
        if self.selected_button_index ~= nil and
                self.selected_button_index >= 1 and
                self.selected_button_index <= self.MAX_ITEMS_SHOWN_HORIZONTAL then
            self.LIST_BUITTONS[self.selected_button_index]:Select()
        end
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Deselects the current selected playerbuton
    ----------------------------------------------------------------------------------------------------------
    DeselectCurrentPlayerButton = function (self)
        if self.selected_button_index ~= nil and
                self.selected_button_index >= 1 and
                self.selected_button_index <= self.MAX_ITEMS_SHOWN_HORIZONTAL then
            self.LIST_BUITTONS[self.selected_button_index]:Deselect()
        end
    end,

    ----------------------------------------------------------------------------------------------------------
    -- To see if we have a player selected or not
    ----------------------------------------------------------------------------------------------------------
    HasPlayerSelected = function(self)
        return self.selected_list_item_id ~= nil
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Sort players
    ----------------------------------------------------------------------------------------------------------
    SortPlayers = function(self)
        -- Only sort if list is not empty
        if self.amount_shown_players > 0 then
            -- 1 = level, 2 = name, 3 = realm
            if self.current_sort == 1 then
                table.sort(self.shown_players, function(a, b) return a.XP_LEVEL < b.XP_LEVEL end)
            elseif self.current_sort == 2 then
                table.sort(self.shown_players, function(a, b) return a.NAME < b.NAME end)
            else
                table.sort(self.shown_players, function(a, b) return a.REALM < b.REALM end)
            end
        end
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Change the sort order of the list with shown players
    ----------------------------------------------------------------------------------------------------------
    ChangeSort = function(self, new_sort)
        -- Only change if new one
        if self.current_sort ~= new_sort then
            -- extend with zone & phase
            self.current_sort = new_sort
            self:RefreshList()
        end
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Change the phase of contents shown in the list
    ----------------------------------------------------------------------------------------------------------
    ChangeRealm = function(self, new_realm)
        -- Only change if new one
        if self.current_realm ~= new_realm then
            -- extend with zone & phase
            self.current_realm = new_realm
            self:RefreshList()
        end
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Change the profession and skill to be used in the list
    ----------------------------------------------------------------------------------------------------------
    ChangeProfessionSkill = function(self, profession_name, skill)
        -- Only change if new one
        if self.profession_name ~= profession_name and self.current_skill ~= nil and self.current_skill.min_skill ~= skill.min_skill then
            self.profession_name = profession_name
            self.current_skill = skill
            self:UpdateList()
            -- Auto select first player of the profession
            self:RefreshList()
        else
            self.current_skill = skill
        end
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Refresh the contents of the list after changing zone
    ----------------------------------------------------------------------------------------------------------
    RefreshList = function(self)
        self:DeselectCurrentPlayerButton()
        self.selected_list_item_index = nil
        self.selected_button_index = nil
        self.selected_list_item_id = nil
        self:UpdateList()
        -- auto select the first one
        self:HandleSelectedListItem(1)
    end,

    -- Switch to vertical split layout
    ResizeToVerticalMode = function(self)
        -- adjust max items shown
        self.MAX_ITEMS_SHOWN_CURRENTLY = self.MAX_ITEMS_SHOWN_VERTICAL
        self:RefreshUI()
    end,

    -- Switch to horizontal split layout
    ResizeToHorizontalMode = function(self)
        -- adjust max items shown
        self.MAX_ITEMS_SHOWN_CURRENTLY = self.MAX_ITEMS_SHOWN_HORIZONTAL
        self:RefreshUI()
    end,

    -- Refresh the UI based on the splitter (only to be called from Resize methode in this class)
    RefreshUI = function(self)
        if self.MAX_ITEMS_SHOWN_CURRENTLY == self.MAX_ITEMS_SHOWN_HORIZONTAL then
            self.ui_frame:SetHeight(self.FRAME_HEIGHT_HORIZONTAL)
        else
            self.ui_frame:SetHeight(self.FRAME_HEIGHT_VERTICAL)
        end
        -- refrehs/update ui only if window is shown
        if self.ui_frame:IsVisible() then
            self:RefreshList()
        else
            self:UpdateSlider()
        end
    end,

    -- set flag to enable showing of colored skill level compared to needed for a skill
    EnableShowSkillLevelNeeded = function(self)
        self.show_skill_level = true
    end,

    IsShowSkillLevelNeededEnabled = function(self)
        return self.show_skill_level == true
    end
}
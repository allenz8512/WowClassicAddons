----------------------------------------------------------------------------------
-- Name: ProfessionListFrame													--
-- Description: Shows available professions in the MTSL database                --
-- Parent Frame: DatabaseFrame              									--
----------------------------------------------------------------------------------

MTSLUI_PROFESSION_LIST_FRAME = {
    -- Keeps the current created frame
    ui_frame,
    -- height of an item to select in the list
    ITEM_HEIGHT = 46,
    -- width of the frame
    FRAME_WIDTH = 45,
    -- height of the frame
    FRAME_HEIGHT = 415,
    selected_index,

----------------------------------------------------------------------------------------------------------
    -- Intialises the MissingSkillsListFrame
    --
    -- @parent_frame		Frame		The parent frame
    ----------------------------------------------------------------------------------------------------------
    Initialise = function(self, parent_frame, frame_name)
        self.shown_professions = MTSL_NAME_PROFESSIONS
        -- container frame (no scroll
        self.ui_frame = MTSLUI_TOOLS:CreateBaseFrame("Frame", "", parent_frame, nil, self.FRAME_WIDTH, self.FRAME_HEIGHT, false)
        -- Create the background frames for the buttons
        self.PROF_BGS = {}
        -- Create the buttons
        self.PROF_BUTTONS = {}
        local left = 9
        local top = -2
        local i = 1
        while self.shown_professions[i] ~= nil do
            -- create background frame
            local bg_frame = MTSLUI_TOOLS:CreateBaseFrame("Frame", "", self.ui_frame, nil, self.FRAME_WIDTH + 1, self.ITEM_HEIGHT + 5, true)
            -- yellow border & transparant fill
            bg_frame:SetBackdropColor(1, 1, 0, 0.40)
            bg_frame:SetBackdropBorderColor(1, 1, 0, 1)
            bg_frame:SetPoint("TOPLEFT", self.ui_frame, "TOPLEFT", 1, top + 5)
            -- hide on create
            bg_frame:Hide()
            table.insert(self.PROF_BGS, bg_frame)
            -- Create a new list item (button) by making a copy of MTSLUI_LIST_ITEM
            local skill_button = self:CreateProfessionButton(frame_name .. "_BTN_PROF_"..i, i)
            skill_button:SetPoint("TOPLEFT", self.ui_frame, "TOPLEFT", left, top)
            -- adjust top position for next button
            top = top - self.ITEM_HEIGHT
            -- add button to list
            table.insert(self.PROF_BUTTONS, skill_button)
            -- Show label with amount of skills for this profession
            local title_text = MTSL_DATA.AMOUNT_SKILLS[self.shown_professions[i]]
            skill_button.text = MTSLUI_TOOLS:CreateLabel(skill_button, title_text, 0, -12, "NORMAL", "BOTTOM")

            i = i + 1
        end
        self.selected_index = nil
        -- Default database wide
        self.current_player = nil
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Sets the class which will execute the event methods
    ----------------------------------------------------------------------------------------------------------
    SetFilterFrame = function(self, filter_frame)
        self.filter_frame = filter_frame
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Sets the frame which will show the list items based on the filter
    ----------------------------------------------------------------------------------------------------------
    SetListFrame = function(self, list_item_frame)
        self.list_item_frame = list_item_frame
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Create a button to represent a profession
    ----------------------------------------------------------------------------------------------------------
    CreateProfessionButton = function(self, name, i)
        local event_class = self
        -- Create the button:
        local button = CreateFrame("Button", name, event_class.ui_frame, "")
        button:SetSize(30, 30)
        -- Add the icon:
        local icon = button:CreateTexture(nil, "ARTWORK")
        icon:SetAllPoints(true)
        icon:SetTexture(MTSLUI_ICONS_PROFESSION[self.shown_professions[i]])
        button.icon = icon

        button:SetScript("OnClick", function ()
            event_class:HandleSelectedListItem(i)
        end)
        return button
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Change the player of whom professions are shown
    ----------------------------------------------------------------------------------------------------------
    ChangePlayer = function(self, player_name, player_realm)
        self.current_player = MTSL_LOGIC_PLAYER_NPC:GetPlayerOnRealm(player_name, player_realm)

        local professions_to_show = MTSL_LOGIC_PLAYER_NPC:GetKnownProfessionsForPlayer(player_realm, player_name)
        self:UpdateProfessions(professions_to_show)
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Update the buttons for shown professions
    ----------------------------------------------------------------------------------------------------------
    UpdateProfessions = function(self, professions)
        self.shown_professions = professions
        local first_button_shown = 0
        if self.shown_professions ~= {} and self.shown_professions ~= nil then
            local left = 9
            local top = -2
            local i = 1
            while MTSL_NAME_PROFESSIONS[i] ~= nil do
                if self.shown_professions[i] ~= nil then
                    self.PROF_BGS[i]:SetPoint("TOPLEFT", self.ui_frame, "TOPLEFT", 1, top + 5)
                    self.PROF_BUTTONS[i].icon:SetTexture(MTSLUI_ICONS_PROFESSION[self.shown_professions[i]])
                    self.PROF_BUTTONS[i]:SetPoint("TOPLEFT", self.ui_frame, "TOPLEFT", left, top)
                    -- update date text best on player or overall
                    if self.current_player ~= nil then
                        self.PROF_BUTTONS[i].text:SetText(MTSL_LOGIC_PLAYER_NPC:GetAmountOfLearnedSkillsForProfession(self.current_player.NAME, self.current_player.REALM, self.shown_professions[i]))
                    -- show all overall
                    else
                        self.PROF_BUTTONS[i].text:SetText(MTSL_DATA.AMOUNT_SKILLS[self.shown_professions[i]])
                    end
                    self.PROF_BUTTONS[i]:Show()
                    top = top - self.ITEM_HEIGHT
                    if first_button_shown == 0 then
                        first_button_shown = i
                    end
                else
                    self.PROF_BGS[i]:Hide()
                    self.PROF_BUTTONS[i]:Hide()
                end
                i = i + 1
            end
        -- no professions to show so hide all
        else
            local i = 1
            while MTSL_NAME_PROFESSIONS[i] ~= nil do
                self.PROF_BGS[i]:Hide()
                self.PROF_BUTTONS[i]:Hide()
                i = i + 1
            end
        end
        -- Auto click/select first profession/button if possible
        if first_button_shown > 0 then
            self:HandleSelectedListItem(first_button_shown)
            -- enabke the effects of filtering
            self.filter_frame:EnableFiltering()
            --nothing to select so clear detail screen
        else
            self.selected_index = nil
            -- disable the effects of filtering
            self.filter_frame:DisableFiltering()
            -- clear the shown contents
            self.list_item_frame:NoSkillsToShow()
        end
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Handles the event when skill button is pushed
    --
    -- @id		Number		The id (= index) of button that is pushed
    ----------------------------------------------------------------------------------------------------------
    HandleSelectedListItem = function(self, index)
        -- only change if we selected a new profession
        if self.selected_index ~= index then
            -- Deselect the old BG_Frame by hiding it
            if self.selected_index ~= nil then
                self.PROF_BGS[self.selected_index]:Hide()
            end
            self.selected_index = index
            self.PROF_BGS[self.selected_index]:Show()

            local prof_skills = {}
            -- Get all available skills for the profession if no player is selected
            if self.current_player == nil then
                prof_skills = MTSL_LOGIC_PROFESSION:GetAllSkillsAndLevelsForProfession(self.shown_professions[index])
            -- get the known skills for the current player
            else
                prof_skills = MTSL_LOGIC_PLAYER_NPC:GetLearnedSkillsForPlayerForProfession(self.current_player.NAME, self.current_player.REALM, self.shown_professions[index])
            end
            self.list_item_frame:ChangeProfession(self.shown_professions[index], prof_skills)
        end
    end,

    ----------------------------------------------------------------------------------------------------------
    -- GetCurrentProfession
    ----------------------------------------------------------------------------------------------------------
    GetCurrentProfession = function(self)
        if self.selected_index ~= nil and self.shown_professions[self.selected_index] ~= nil then
            return self.shown_professions[self.selected_index]
        end
        return "Any"
    end,

    ShowNoProfessions = function(self)
        self:UpdateProfessions(nil)
    end,
}
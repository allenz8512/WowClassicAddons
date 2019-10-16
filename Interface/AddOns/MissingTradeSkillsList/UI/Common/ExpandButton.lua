--------------------------------------------------
-- Name: ExpandButton							--
-- Description: Button to show/hide a subregion --
--------------------------------------------------

MTSLUI_EXPAND_BUTTON = {    -- The "slider"
    ui_frame,
    -- Keep if it is selected or not
    is_selected = 0,
    FRAME_WIDTH = 20,
    FRAME_HEIGHT = 20,
    -- Different textures to use for the button
    TEXTURES = {
        SELECTED = "Interface/But/ons/UI-Listbox-Highlight",
        NOT_SELECTED = "Interface/Buttons/UI-MinusButton-UP",
        DISABLED = "Interface/Buttons/UI-PlusButton-Disabled"
    },

    ----------------------------------------------------------------------------------------------------------
    -- Intialises the SkillButton
    ----------------------------------------------------------------------------------------------------------
    Initialise = function (self, id, parent_frame, position_left, position_top)
        self.ui_frame = MTSLUI_TOOLS:CreateBaseFrame("Button", "", parent_frame.ui_frame, nil, self.FRAME_WIDTH, self.FRAME_HEIGHT)
        self.ui_frame:SetPoint("TOPLEFT", parent_frame.ui_frame, "TOPLEFT", position_left, position_top)

        -- set the id (= index) of the button so we later know which one is pushed
       -- self.ui_frame:SetID(id)
        -- strip textures
        self.ui_frame:SetNormalTexture(self.TEXTURES.NOT_SELECTED)
        self.ui_frame:SetPushedTexture(self.TEXTURES.NOT_SELECTED)
        self.ui_frame:SetDisabledTexture(self.TEXTURES.NOT_SELECTED)
        -- set own textures
        self.ui_frame:SetHighlightTexture(self.TEXTURES.NOT_SELECTED)

        self.ui_frame.text = self.ui_frame:CreateFontString()
        self.ui_frame.text:SetFont(MTSLUI_FONTS.FONTS.NORMAL:GetFont())
        self.ui_frame.text:SetPoint("LEFT",5,0)

        self.is_selected = 0

        self.ui_frame:SetScript("OnClick", function()
            parent_frame:HandleSelectedListItem(id)
        end)
    end,

    ---------------------------------------------------------------------------------------
    -- Refresh the list item
    --
    -- @text				String		Text to show on the list item
    ----------------------------------------------------------------------------------------
    Refresh = function(self, text)
        self.ui_frame.text:SetText(text)
    end,

    ---------------------------------------------------------------------------------------
    -- Hides the button
    ----------------------------------------------------------------------------------------
    Hide = function (self)
        self.ui_frame:Hide()
    end,

    ---------------------------------------------------------------------------------------
    -- Shows the button
    ----------------------------------------------------------------------------------------
    Show = function (self)
        self.ui_frame:Show()
    end,

    ---------------------------------------------------------------------------------------
    -- Checks if button is selected
    --
    -- returns		Number		Flag that indicates if button is selected (1 = selected)
    ----------------------------------------------------------------------------------------
    IsSelected = function (self)
        return self.ui_frame:GetNormalTexture() == self.TEXTURES.SELECTED
    end,

    ---------------------------------------------------------------------------------------
    -- Deselects the button
    ----------------------------------------------------------------------------------------
    Deselect = function (self)
        self.ui_frame:SetNormalTexture(self.TEXTURES.NOT_SELECTED)
    end,

    ---------------------------------------------------------------------------------------
    -- Selects the button
    ----------------------------------------------------------------------------------------
    Select = function (self)
        self.is_selected = 1
        self.ui_frame:SetNormalTexture(self.TEXTURES.SELECTED)
    end,
}

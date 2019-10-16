--------------------------------------------------
-- Name: OptionsMenuFrame			            --
-- Description: Shows user configurable options --
--      Font                                    --
--      Scale for each frame                    --
--      Layout MTSL frame                       --
--------------------------------------------------
MTSLUI_OPTIONS_MENU_FRAME = MTSL_TOOLS:CopyObject(MTSLUI_BASE_FRAME)

-- Add or overwrite baseframe
    -- Addon frame
MTSLUI_OPTIONS_MENU_FRAME.FRAME_WIDTH = 715
MTSLUI_OPTIONS_MENU_FRAME.FRAME_HEIGHT = 350

    ---------------------------------------------------------------------------------------
    -- Shows the frame
    ----------------------------------------------------------------------------------------
function MTSLUI_OPTIONS_MENU_FRAME:Show()
    -- Make sure any other open windows are closed
    MTSLUI_MISSING_TRADESKILLS_FRAME:Hide()
    MTSLUI_ACCOUNT_EXPLORER_FRAME:Hide()
    MTSLUI_DATABASE_EXPLORER_FRAME:Hide()
    -- show the options
    self.ui_frame:Show()
end

----------------------------------------------------------------------------------------------------------
-- Intialises the MissingTradeSkillFrame
--
-- @parent_frame		Frame		The parent frame
----------------------------------------------------------------------------------------------------------
function MTSLUI_OPTIONS_MENU_FRAME:Initialise()
    self.ui_frame = MTSLUI_TOOLS:CreateBaseFrame("Frame", "MTSLUI_Options_Menu_Frame", nil, nil, self.FRAME_WIDTH, self.FRAME_HEIGHT, true)
    -- Set Position to center of screen
    self.ui_frame:SetPoint("CENTER", nil, "CENTER", 0, 0)
    -- Dummy operation to do nothing, discarding the zooming in/out
    self.ui_frame:SetScript("OnMouseWheel", function() end)
    -- Make the screen dragable/movable
    self.ui_frame:SetMovable(true)
    self.ui_frame:RegisterForDrag("LeftButton")
    self.ui_frame:SetScript("OnDragStart", function(frame) frame:StartMoving() end)
    self.ui_frame:SetScript("OnDragStop", function(frame) frame:StopMovingOrSizing() end)
    -- close/hide window on esc
    tinsert(UISpecialFrames, "MTSLUI_Options_Menu_Frame")
    -- add the close button
    self.ui_frame.close_button = MTSLUI_TOOLS:CreateBaseFrame("Button", "", self.ui_frame, "UIPanelButtonTemplate", 24, 24)
    self.ui_frame.close_button:SetText("X")
    -- Set Position to top right of databaseframe
    self.ui_frame.close_button:SetPoint("TOPRIGHT", self.ui_frame, "TOPRIGHT", -2, -2)
    self.ui_frame.close_button:SetScript("OnClick", function() MTSLUI_OPTIONS_MENU_FRAME:Hide() end)
    self.ui_frame:Hide()

    -- initialise the content frames
    self.title_frame = MTSL_TOOLS:CopyObject(MTSLUI_TITLE_FRAME)
    self.title_frame:Initialise(self.ui_frame, MTSLUI_LOCALES_LABELS["options"][MTSLUI_CURRENT_LANGUAGE], 715, 715)
    MTSLOPTUI_CONFIG_FRAME:Initialise(self.title_frame.ui_frame)
    MTSLOPTUI_SAVE_FRAME:Initialise(MTSLOPTUI_CONFIG_FRAME.ui_frame)
    MTSLOPTUI_RESET_FRAME:Initialise(MTSLOPTUI_SAVE_FRAME.ui_frame)
end

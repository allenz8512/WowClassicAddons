------------------------------------------------------
-- Contains all functions for addon/saved variables --
------------------------------------------------------
----------------------------------
-- Creates all saved variables --
----------------------------------
MTSLUI_PLAYER = {
    UI_SCALE = {
        MTSL,
        ACCOUNT,
        DATABASE,
        OPTIONSMENU,
    },
    UI_SPLIT_MODE = {
        MTSL,
        ACCOUNT,
        DATABASE,
    },
    FONT,
    WELCOME_MSG,
    MTSL_LOCATION,
}

MTSLUI_SAVED_VARIABLES = {
    MIN_UI_SCALE = "0.5",
    MAX_UI_SCALE = "1.25",
    DEFAULT_UI_SCALE = "1.00",
    DEFAULT_UI_SPLIT_MODE = "Vertical",

    -- Try and load the values from saved files
    Initialise = function(self)
        -- reset all if not found (first time)
        if MTSLUI_PLAYER == nil then
            print(MTSLUI_FONTS.COLORS.TEXT.WARNING .. "MTSL: All saved variables have been reset to default values!")
            MTSLUI_PLAYER = {}
            self:ResetUIScales()
            self:ResetSplitModes()
            MTSLUI_PLAYER.FONT = "Default"
            MTSLUI_PLAYER.WELCOME_MSG = 1
        else
            -- reset/remove the old splitmode
            if MTSLUI_PLAYER.SPLIT_MODE ~= nil then
                MTSLUI_PLAYER.SPLIT_MODE = nil
            end
            -- only reset the scale
            if MTSLUI_PLAYER.UI_SCALE == nil then
                self:ResetUIScales()
            else
                self:ValidateUIScales()
            end
            -- only reset the split
            if MTSLUI_PLAYER.UI_SPLIT_MODE == nil then
                self:ResetSplitModes()
            else
                self:ValidateSplitModes()
            end

            self:SetShowWelcomeMessage(MTSLUI_PLAYER.WELCOME_MSG)

            -- todo: add check for font, ignored for now
            if MTSLUI_PLAYER.FONT ~= "Default" then
                MTSLUI_PLAYER.FONT = "Default"
            end

            self:SetMTSLLocation(MTSLUI_PLAYER.MTSL_LOCATION)
        end
    end,

    ------------------------------------------------------------------------------------------------
    -- Reset the content of the savedvariable to have a "clean" install
    ------------------------------------------------------------------------------------------------
    ResetSavedVariables = function(self)
        MTSLUI_PLAYER = nil
        self:Initialise()
        self:LoadSavedSplitModes()
        self:LoadSavedUIScales()
    end,

    ------------------------------------------------------------------------------------------------
    -- Reset all UI scales to the default UI scale
    ------------------------------------------------------------------------------------------------
    ResetUIScales = function(self)
        MTSLUI_PLAYER.UI_SCALE = {}
        MTSLUI_PLAYER.UI_SCALE.MTSL = self.DEFAULT_UI_SCALE
        MTSLUI_PLAYER.UI_SCALE.ACCOUNT = self.DEFAULT_UI_SCALE
        MTSLUI_PLAYER.UI_SCALE.DATABASE = self.DEFAULT_UI_SCALE
        MTSLUI_PLAYER.UI_SCALE.OPTIONSMENU = self.DEFAULT_UI_SCALE
    end,

    ------------------------------------------------------------------------------------------------
    -- Reset all split modes to the default value
    ------------------------------------------------------------------------------------------------
    ResetSplitModes = function(self)
        MTSLUI_PLAYER.UI_SPLIT_MODE = {}
        MTSLUI_PLAYER.UI_SPLIT_MODE.MTSL = self.DEFAULT_UI_SPLIT_MODE
        MTSLUI_PLAYER.UI_SPLIT_MODE.ACCOUNT = self.DEFAULT_UI_SPLIT_MODE
        MTSLUI_PLAYER.UI_SPLIT_MODE.DATABASE = self.DEFAULT_UI_SPLIT_MODE
    end,

    ------------------------------------------------------------------------------------------------
    -- Load the saved splitmode from saved variable
    ------------------------------------------------------------------------------------------------
    LoadSavedSplitModes = function(self)
        if MTSLUI_PLAYER == nil then
            self:ResetSavedVariables()
        else
            -- convert old to new also
            if MTSLUI_PLAYER.UI_SPLIT_MODE == nil or type(MTSLUI_PLAYER.UI_SPLIT_MODE) ~= "table" then
                self:ResetSplitModes()
                print(MTSLUI_FONTS.COLORS.TEXT.WARNING .. "MTSL: All UI split orientations were reset to " .. self.DEFAULT_UI_SPLIT_MODE .. "!")
            else
                self:ValidateSplitModes()
            end
            self:SetSplitModes(MTSLUI_PLAYER.UI_SPLIT_MODE)
        end
    end,

    ------------------------------------------------------------------------------------------------
    -- Validates the saved splitmode from saved variable
    ------------------------------------------------------------------------------------------------
    ValidateSplitModes = function(self)
        local keys_to_check =  { "MTSL", "ACCOUNT", "DATABASE" }
        
        for _,k in pairs(keys_to_check) do
            -- reset split mode if not valid
            if not self:IsValidSplitMode(MTSLUI_PLAYER.UI_SPLIT_MODE[k]) then
                MTSLUI_PLAYER.UI_SPLIT_MODE[k] = self.DEFAULT_UI_SPLIT_MODE
                print(MTSLUI_FONTS.COLORS.TEXT.WARNING .. "MTSL: " .. k .. " UI split oritentation was reset " .. self.DEFAULT_UI_SPLIT_MODE .. "!")
            end
        end
    end,

    ------------------------------------------------------------------------------------------------
    -- Set the splitmodes of the main windows
    --
    -- @split_modes         Array           List containing the splitmodes for all main windows
    ------------------------------------------------------------------------------------------------
    SetSplitModes = function(self, split_modes)
        local keys_to_check =  { "MTSL", "ACCOUNT", "DATABASE" }
        local frames_to_split = {
            MTSL = MTSLUI_MISSING_TRADESKILLS_FRAME,
            ACCOUNT = MTSLUI_ACCOUNT_EXPLORER_FRAME,
            DATABASE = MTSLUI_DATABASE_EXPLORER_FRAME,
        }
        for _,k in pairs(keys_to_check) do
            -- apply split mode if valide
            if self:IsValidSplitMode(split_modes[k]) then
                MTSLUI_PLAYER.UI_SPLIT_MODE[k] = split_modes[k]
                frames_to_split[k]:SetSplitOrientation(MTSLUI_PLAYER.UI_SPLIT_MODE[k])
            end
        end
    end,

    ------------------------------------------------------------------------------------------------
    -- Gets the splitmode of a frame
    --
    -- return			String          The split orientation for the frame (The number for UI scale (will be > 0.5 and < 1.25)
    ------------------------------------------------------------------------------------------------
    GetSplitMode = function(self, name)
        -- return the splitmode if not nil
        if MTSLUI_PLAYER.UI_SPLIT_MODE[name] ~= nil then
            return MTSLUI_PLAYER.UI_SPLIT_MODE[name]
        end
        -- return default if not found
        return self.DEFAULT_UI_SPLIT_MODE
    end,

    ------------------------------------------------------------------------------------------------
    -- Check if a split orientation mode for UI frame is valid
    --
    -- @ui_scale        Number      The number of the scale (only valid >= 0.5 and <= 1.25)
    ------------------------------------------------------------------------------------------------
    IsValidSplitMode = function(self, split_mode)
        return split_mode == "Vertical" or split_mode == "Horizontal"
    end,

    ------------------------------------------------------------------------------------------------
    -- Load the saved ui scales from saved variable
    ------------------------------------------------------------------------------------------------
    LoadSavedUIScales = function(self)
        if MTSLUI_PLAYER == nil then
            self:ResetSavedVariables()
        else
            -- convert old to new also
            if MTSLUI_PLAYER.UI_SCALE == nil then
                self:ResetUIScales()
                print(MTSLUI_FONTS.COLORS.TEXT.WARNING .. "MTSL: All UI scales were reset to " ..  self.DEFAULT_UI_SCALE .. "!")
            -- Scales are saved, so check if valid
            else
                self:ValidateUIScales()
            end
            -- Set the valid scales for all windows
            self:SetUIScales(MTSLUI_PLAYER.UI_SCALE)
        end
    end,

    ------------------------------------------------------------------------------------------------
    -- Validate the saved UI scales from saved variable
    ------------------------------------------------------------------------------------------------
    ValidateUIScales = function(self)
        local keys_to_check =  { "MTSL", "ACCOUNT", "DATABASE", "OPTIONSMENU" }

        for _,k in pairs(keys_to_check) do
            -- reset split mode if not valid
            if not self:IsValidUIScale(MTSLUI_PLAYER.UI_SCALE[k]) then
                MTSLUI_PLAYER.UI_SCALE[k] = self.DEFAULT_UI_SCALE
                print(MTSLUI_FONTS.COLORS.TEXT.WARNING .. "MTSL: " .. k .. " UI scale was reset to " ..  self.DEFAULT_UI_SCALE .. "!")
            end
        end
    end,
    
    ------------------------------------------------------------------------------------------------
    -- Check if a value for UI scale is valid
    --
    -- @ui_scale        Number      The number of the scale (must be => MIN_UI_SCALE and <= MAX_UI_SCALE)
    ------------------------------------------------------------------------------------------------
    IsValidUIScale = function(self, ui_scale)
        return ui_scale ~= nil and tonumber(ui_scale) ~= nil and
                tonumber(ui_scale) >= tonumber(self.MIN_UI_SCALE) and tonumber(ui_scale) <= tonumber(self.MAX_UI_SCALE)
    end,

    ------------------------------------------------------------------------------------------------
    -- Scales the UI of the addon
    --
    -- @scale			Number			The number for UI scale (must be => MIN_UI_SCALE and <= MAX_UI_SCALE)
    ------------------------------------------------------------------------------------------------
    SetUIScales = function(self, scales)
        local keys_to_check =  { "MTSL", "ACCOUNT", "DATABASE", "OPTIONSMENU" }
        local frames_to_scale = {
            MTSL = MTSLUI_MISSING_TRADESKILLS_FRAME,
            ACCOUNT = MTSLUI_ACCOUNT_EXPLORER_FRAME,
            DATABASE = MTSLUI_DATABASE_EXPLORER_FRAME,
            OPTIONSMENU = MTSLUI_OPTIONS_MENU_FRAME,
        }
        
        for _,k in pairs(keys_to_check) do
            -- apply split mode if valide
            if self:IsValidUIScale(scales[k]) then
                MTSLUI_PLAYER.UI_SCALE[k] = tostring(scales[k])
                frames_to_scale[k]:SetUIScale(tonumber(MTSLUI_PLAYER.UI_SCALE[k]))
            end
        end
    end,

    ------------------------------------------------------------------------------------------------
    -- Gets he scale of the UI of the addon
    --
    -- return			Number			The number for UI scale (will be > 0.5 and < 1.25)
    ------------------------------------------------------------------------------------------------
    GetUIScale = function(self, name)
        -- return the scale if not nil
        if MTSLUI_PLAYER.UI_SCALE[name] ~= nil then
             return MTSLUI_PLAYER.UI_SCALE[name]
        end
        -- return default if not found
        return self.DEFAULT_UI_SCALE
    end,

    ------------------------------------------------------------------------------------------------
    -- Gets he scale of the UI of the addon as text to show
    --
    -- return			String			The number for UI scale as percentage text (100 % if not found)
    ------------------------------------------------------------------------------------------------
    GetUIScaleAsText = function(self, name)
        -- return the scale if not nil
        if MTSLUI_PLAYER.UI_SCALE[name] ~= nil then
            return (100*MTSLUI_PLAYER.UI_SCALE[name]) .. " %"
        end
        -- return default if not found
        return (100 * self.DEFAULT_UI_SCALE) .. " %"
    end,

    -- TODO
    LoadSavedFont = function(self)

    end,

    ------------------------------------------------------------------------------------------------
    -- Sets the flag to say if we show welcome message or not
    --
    -- @show_welcome        Number          Flag indicating to show or not (1 = yes, 0 = no)
    ------------------------------------------------------------------------------------------------
    SetShowWelcomeMessage = function(self, show_welcome)
        MTSLUI_PLAYER.WELCOME_MSG = 1
        if show_welcome == 0 or show_welcome == false then
            MTSLUI_PLAYER.WELCOME_MSG = 0
        end
    end,

    ------------------------------------------------------------------------------------------------
    -- Gets the flag to say if we show welcome message or not
    --
    -- return			Number          Flag indicating to show or not (1 = yes, 0 = no)
    ------------------------------------------------------------------------------------------------
    GetShowWelcomeMessage = function(self)
        return MTSLUI_PLAYER.WELCOME_MSG
    end,


    ------------------------------------------------------------------------------------------------
    -- Sets  the location where MTSL is hooked (left or right)
    --
    -- @frame_location        String         The location (default = right)
    ------------------------------------------------------------------------------------------------
    SetMTSLLocation = function(self, frame_location)
        MTSLUI_PLAYER.MTSL_LOCATION = "right"
        if frame_location == "left" then
            MTSLUI_PLAYER.MTSL_LOCATION = "left"
        end
        -- reanchor the button if visible
        if MTSLUI_TOGGLE_BUTTON ~= nil and MTSLUI_TOGGLE_BUTTON:IsShown() then
            MTSLUI_TOGGLE_BUTTON:ReanchorButton()
        end
    end,

    ------------------------------------------------------------------------------------------------
    -- Gets the location where MTSL is hooked (left or right)
    --
    -- return			String         The location
    ------------------------------------------------------------------------------------------------
    GetMTSLLocation = function(self)
        return MTSLUI_PLAYER.MTSL_LOCATION
    end,
}
    --------------------------------------------------------------------------
-- Name: HorizontalSlider												--
-- Description: Contains all functionality for the horizontal slider	--
-- Parent Frame: -												    	--
--------------------------------------------------------------------------

MTSLUI_HORIZONTAL_SLIDER = {
    ui_frame,
    -- Scroll 1 scale step at a time
    SLIDER_STEP = 1,
    -- width of the slider
    FRAME_HEIGHT = 50,
    FRAME_WIDTH = 240,
    STEP_WIDTH = 20,
    STEP_VALUE = 1,
    SCALE_VALUES = {
        "0.50",
        "0.55",
        "0.60",
        "0.65",
        "0.70",
        "0.75",
        "0.80",
        "0.85",
        "0.90",
        "0.95",
        "1.00",
        "1.05",
        "1.10",
        "1.15",
        "1.20",
        "1.25",
    },
    -- first index in table
    MIN_VALUE = 1,
    -- last index in table
    MAX_VALUE = 16,
    current_scale_value,

----------------------------------------------------------------------------------------------------------
    -- Intialises the VerticalSlider
    --
    -- @handle_scroll_event		Function		The method to handle the change event
    -- @parent_frame		    frame	    The parent frame
    -- @slider_steps		    Number		The mount of steps the vertical slider has
    -- @width_step			    Number		The width of 1 step in the slider
    ----------------------------------------------------------------------------------------------------------
    Initialise = function (self, parent_frame, current_value)
        -- create a container frame for the border
        self.ui_frame = MTSLUI_TOOLS:CreateBaseFrame("Frame", "", parent_frame, "", self.FRAME_WIDTH, self.FRAME_HEIGHT, false)
        self.ui_frame:SetBackdropColor(0,0,0,1)
        -- create while line for slider
        self.ui_frame.line_frame = MTSLUI_TOOLS:CreateBaseFrame("Frame", "", self.ui_frame, "", self.FRAME_WIDTH, 3, false)
        self.ui_frame.line_frame:SetBackdropColor(1,1,1,1)
        self.ui_frame.line_frame:SetPoint("CENTER", self.ui_frame)
        -- place the slider inside the container frame
        self.ui_frame.slider = MTSLUI_TOOLS:CreateBaseFrame("Slider", "", self.ui_frame.line_frame, "", self.FRAME_WIDTH , 20, false)
        self.ui_frame.slider:SetOrientation("HORIZONTAL")
        self.ui_frame.slider:SetThumbTexture("Interface\\Buttons\\UI-SliderBar-Button-Horizontal")
        self.ui_frame.slider:SetPoint("CENTER", self.ui_frame)
        -- parent ui_frame handles the scrolling event
        local slider = self
        self.ui_frame.slider:SetScript("OnValueChanged", function(event_frame, value)
            if value ~= nil then
                -- round to an integer
                value = math.ceil(value-0.5)
                slider:SetSliderValue(value)
            end
        end)
        self.ui_frame.slider:SetMinMaxValues(self.MIN_VALUE, self.MAX_VALUE)
        -- creat text labels
        self.ui_frame.slider_min_text = MTSLUI_TOOLS:CreateLabel(self.ui_frame, MTSLUI_FONTS.COLORS.TEXT.NORMAL .. self.SCALE_VALUES[self.MIN_VALUE], -20, 0, "SMALL", "LEFT")
        self.ui_frame.slider_max_text = MTSLUI_TOOLS:CreateLabel(self.ui_frame, MTSLUI_FONTS.COLORS.TEXT.NORMAL .. self.SCALE_VALUES[self.MAX_VALUE], 20, 0, "SMALL", "RIGHT")
        self.ui_frame.slider_current_text = MTSLUI_TOOLS:CreateLabel(self.ui_frame, MTSLUI_FONTS.COLORS.TEXT.TITLE .. self.SCALE_VALUES[self.MIN_VALUE], 0, 15, "SMALL", "CENTER")
        -- set the position of the slider based on the current scale
        local i = 1
        while self.SCALE_VALUES[i] ~= nil and tonumber(self.SCALE_VALUES[i]) ~= tonumber(current_value) do
            i = i + 1
        end
        self:SetSliderValue(i)
    end,

    ---------------------------------------------------------------------------------------
    -- Returns the slider
    --
    -- returns      Slider      The cslider
    ----------------------------------------------------------------------------------------
    GetSlider = function(self)
        return self.ui_frame.slider
    end,

    ---------------------------------------------------------------------------------------
    -- Returns the actual value of the current slider based on minvalue & stepvalue
    --
    -- returns      Number      The  actual current value of the slider
    ----------------------------------------------------------------------------------------
    GetActualSliderValue = function(self)
        return self.current_scale_value
    end,

    ---------------------------------------------------------------------------------------
    -- Returns the value of the current slider
    --
    -- returns      Number      The current value of the slider
    ----------------------------------------------------------------------------------------
    GetSliderValue = function(self)
        return self.ui_frame.slider:GetValue()
    end,

    ---------------------------------------------------------------------------------------
    -- Sets the value of the current slider
    --
    -- @value      Number      The new value of the slider
    ----------------------------------------------------------------------------------------
    SetSliderValue = function(self, value)
        self.ui_frame.slider:SetValue(value)
        -- update the text for current value
        self.current_scale_value = self.SCALE_VALUES[value]
        self.ui_frame.slider_current_text:SetText(MTSLUI_FONTS.COLORS.TEXT.TITLE .. self.SCALE_VALUES[value])
    end,

    ---------------------------------------------------------------------------------------
    -- Sets the actual value of the current slider
    --
    -- @actual_value      Number      The actual value of the slider
    ----------------------------------------------------------------------------------------
    SetActualSliderValue = function(self, actual_value)
        local i = 1
        while (self.SCALE_VALUES[i] ~= nil and tonumber(self.SCALE_VALUES[i]) ~= tonumber(actual_value)) do
            i = i + 1
        end
        if self.SCALE_VALUES[i] ~= nil then
            self:SetSliderValue(i)
        end
    end,

    ---------------------------------------------------------------------------------------
    -- Hides the slider
    ----------------------------------------------------------------------------------------
    Hide = function (self)
        self.ui_frame:Hide()
    end,

    ---------------------------------------------------------------------------------------
    -- Shows the slider
    ----------------------------------------------------------------------------------------
    Show = function (self)
        self.ui_frame:Show()
    end,
}
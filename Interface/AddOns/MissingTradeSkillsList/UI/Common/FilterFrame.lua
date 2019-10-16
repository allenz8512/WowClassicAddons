----------------------------------------------------------
-- Name: FilterFrame									--
-- Description: Shows all the filters for a list        --
-- Parent Frame: -          							--
----------------------------------------------------------

MTSLUI_FILTER_FRAME = {
    -- Keeps the current created frame
    ui_frame,
    -- width of the frame
    FRAME_WIDTH_VERTICAL = 385,
    FRAME_WIDTH_HORIZONTAL = 515,
    -- height of the frame
    FRAME_HEIGHT = 49,
    -- keep track of current sort mehod (1 = name (default), 2 = level)
    current_sort = 1,
    -- keeps track of current phase used for filtering
    current_phase,
    phases= {},
    sorts = {},
    -- all contintents
    continents = {},
    -- all zones for each contintent
    zones_in_continent = {},
    -- all zones for the current continent
    current_available_zones = {},
    current_contintent_id,
    current_zone_id,
    -- widhts of the drops downs according to layout
    VERTICAL_WIDTH_DD = 152,
    HORIZONTAL_WIDTH_DD = 217,
    -- Filtering active (flag indicating if changing drop downs has effect, default on)
    filtering_active = 1,

    ----------------------------------------------------------------------------------------------------------
    -- Intialises the MissingSkillsListFrame
    --
    -- @parent_frame		Frame		The parent frame
    ----------------------------------------------------------------------------------------------------------
    Initialise = function(self, parent_frame, filter_frame_name)
        if self.phases == nil or self.phases == {} then
            self:InitialiseData()
        end
        -- create the container frame
        self.ui_frame = MTSLUI_TOOLS:CreateBaseFrame("Frame", "", parent_frame, nil, self.FRAME_WIDTH_VERTICAL, self.FRAME_HEIGHT, false)
        -- create a filter for sorting
        -- create the sort frame with text and 2 buttons
        self.ui_frame.sort_by_text = MTSLUI_TOOLS:CreateLabel(self.ui_frame, MTSLUI_LOCALES_LABELS["sort"][MTSLUI_CURRENT_LANGUAGE], 5, -4, "NORMAL", "TOPLEFT")
        self.ui_frame.sort_drop_down = CreateFrame("Frame", filter_frame_name .. "_DD_SORTS", self.ui_frame, "UIDropDownMenuTemplate")
        self.ui_frame.sort_drop_down:SetPoint("TOPLEFT", self.ui_frame.sort_by_text, "TOPRIGHT", -10, 9)
        self.ui_frame.sort_drop_down.filter_frame_name = filter_frame_name
        self.ui_frame.sort_drop_down.initialize = self.CreateDropDownSorting
        UIDropDownMenu_SetWidth(self.ui_frame.sort_drop_down, 70)
        UIDropDownMenu_SetText(self.ui_frame.sort_drop_down, self.sorts[self.current_sort]["name"])
        -- default select the "current" phase
        self.current_phase = MTSL_CURRENT_PHASE
        -- create a filter for content phase
        self.ui_frame.phase_text = MTSLUI_TOOLS:CreateLabel(self.ui_frame, MTSLUI_LOCALES_LABELS["phase"][MTSLUI_CURRENT_LANGUAGE], 215, -4, "NORMAL", "TOPLEFT")
        self.ui_frame.phase_drop_down = CreateFrame("Frame", filter_frame_name .. "_DD_PHASES", self.ui_frame, "UIDropDownMenuTemplate")
        self.ui_frame.phase_drop_down.filter_frame_name = filter_frame_name
        self.ui_frame.phase_drop_down.initialize = self.CreateDropDownPhases
        UIDropDownMenu_SetWidth(self.ui_frame.phase_drop_down, 95)
        UIDropDownMenu_SetText(self.ui_frame.phase_drop_down, self.phases[self.current_phase]["name"])
        -- Contintents & zones
        self.ui_frame.zone_text = MTSLUI_TOOLS:CreateLabel(self.ui_frame, MTSLUI_LOCALES_LABELS["zone"][MTSLUI_CURRENT_LANGUAGE], 5, -34, "NORMAL", "TOPLEFT")
        -- Continent more split up with types as well, to reduce number of items shown
        self.ui_frame.continent_drop_down = CreateFrame("Frame", filter_frame_name .. "_DD_CONTS", self.ui_frame, "UIDropDownMenuTemplate")
        self.ui_frame.continent_drop_down:SetPoint("TOPLEFT", self.ui_frame.zone_text, "TOPRIGHT", -10, 9)
        self.ui_frame.continent_drop_down.filter_frame_name = filter_frame_name
        self.ui_frame.continent_drop_down.initialize = self.CreateDropDownContinents
        UIDropDownMenu_SetWidth(self.ui_frame.continent_drop_down, self.VERTICAL_WIDTH_DD)
        UIDropDownMenu_SetText(self.ui_frame.continent_drop_down, MTSLUI_LOCALES_LABELS["any"][MTSLUI_CURRENT_LANGUAGE])

        -- default contintent "any" so no need for sub zone to show
        self.ui_frame.zone_drop_down = CreateFrame("Frame", filter_frame_name .. "_DD_ZONES", self.ui_frame, "UIDropDownMenuTemplate")
        self.ui_frame.zone_drop_down:SetPoint("TOPLEFT", self.ui_frame.continent_drop_down, "TOPRIGHT", -30, 0)
        self.ui_frame.zone_drop_down.filter_frame_name = filter_frame_name
        self.ui_frame.zone_drop_down.initialize = self.CreateDropDownZones
        UIDropDownMenu_SetWidth(self.ui_frame.zone_drop_down, self.VERTICAL_WIDTH_DD)
        UIDropDownMenu_SetText(self.ui_frame.zone_drop_down, "")
        -- reposition some elements
        self.ui_frame.phase_drop_down:SetPoint("BOTTOMRIGHT", self.ui_frame.zone_drop_down, "TOPRIGHT", 0, -2)
        -- enable filtering by default
        self:EnableFiltering()
        -- add it to global vars to access later on
        _G[filter_frame_name] = self
    end,

    -- Limit the filter for phase to current only
    UseOnlyCurrentPhase = function(self)
        self.phases = {
            {
                ["name"] = MTSLUI_LOCALES_LABELS["current"][MTSLUI_CURRENT_LANGUAGE] .. " (" .. MTSL_CURRENT_PHASE .. ")",
                ["id"] = 1,
            }
        }
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Sets the list frame to handle the changes in filter
    ----------------------------------------------------------------------------------------------------------
    SetListFrame = function(self, list_frame)
        self.list_frame = list_frame
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Build the fixed arrays with all continents & zones available
    ----------------------------------------------------------------------------------------------------------
    InitialiseData = function(self)
        self.phases = {
            {
                ["name"] = MTSLUI_LOCALES_LABELS["current"][MTSLUI_CURRENT_LANGUAGE] .. " (" .. MTSL_CURRENT_PHASE .. ")",
                ["id"] = 1,
            },
            {
                ["name"] = MTSLUI_LOCALES_LABELS["any"][MTSLUI_CURRENT_LANGUAGE],
                ["id"] = 2,
            }
        }
        self.sorts = {
            {
                ["name"] = MTSLUI_LOCALES_LABELS["level"][MTSLUI_CURRENT_LANGUAGE],
                ["id"] = 1,
            },
            {
                ["name"] = MTSLUI_LOCALES_LABELS["name"][MTSLUI_CURRENT_LANGUAGE],
                ["id"] = 2,
            },
        }
        self.current_phase = 1
        self.current_sort = 1
        self:BuildContinents()
        self:BuildZones()
    end,

    BuildContinents = function(self)
        -- build the arrays with contintents and zones
        self.continents = {
            {
                ["name"] = MTSLUI_LOCALES_LABELS["any"][MTSLUI_CURRENT_LANGUAGE],
                ["id"] = 0,
            },
        }
        -- only add current zone if possible (gives trouble while changing zones or not zone not triggering on load)
        local current_zone_name = GetRealZoneText()
        local current_zone = MTSL_LOGIC_WORLD:GetZoneByName(current_zone_name)
        if current_zone ~= nil then
            local zone_filter = {
                ["name"] = MTSLUI_LOCALES_LABELS["current"][MTSLUI_CURRENT_LANGUAGE] .. " (" .. current_zone_name .. ")",
                -- make id negative for filter later on
                ["id"] = (-1 * current_zone.id),
            }
            table.insert(self.continents, zone_filter)
        end
        -- add each type of "continent
        for k, v in pairs(MTSL_DATA["continents"]) do
            local new_continent = {
                ["name"] = v["name"][MTSLUI_CURRENT_LANGUAGE],
                ["id"] = v.id,
            }
            table.insert(self.continents, new_continent)
        end
        -- auto select "any" as continent
        if self.current_contintent_id == nil  then
            self.current_contintent_id = 0
        end
    end,

    BuildZones = function(self)
        -- build the arrays with contintents and zones
        self.zones_in_continent = {}

        -- add each zone of current "continent unless its "Any" or "Current location"
        for k, c in pairs(MTSL_DATA["continents"]) do
            self.zones_in_continent[c.id] = {}
            for l, z in pairs(MTSL_LOGIC_WORLD:GetZonesInContinentById(c.id)) do
                local new_zone = {
                    ["name"] = z["name"][MTSLUI_CURRENT_LANGUAGE],
                    ["id"] = z.id,
                }
                table.insert(self.zones_in_continent[c.id], new_zone)
            end
            -- sort alfabethical
            table.sort(self.zones_in_continent[c.id], function(a, b) return a.name < b.name end)
        end
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Intialises drop down for continents/zones
    ----------------------------------------------------------------------------------------------------------
    CreateDropDownContinents = function(self)
        MTSLUI_TOOLS:FillDropDown(_G[self.filter_frame_name].continents, _G[self.filter_frame_name].ChangeContinentHandler, self.filter_frame_name)
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Handles DropDown Change event after changing the continent
    ----------------------------------------------------------------------------------------------------------
    ChangeContinentHandler = function(self, value, text)
        -- Only trigger update if we change to a different continent
        if value ~= nil and value ~= self.current_contintent_id then
            self:ChangeContinent(value, text)
        end
    end,

    ChangeContinent = function(self, id, text)
        -- do not set continent id if id < 0 or we choose "Any"
        if id > 0 then
            self.current_contintent_id = id
            -- selected current zone so trigger changezone
        else
            self.current_contintent_id = nil
            -- revert negative id to positive
            self.current_zone_id = math.abs(id)
            self.list_frame:ChangeZone(self.current_zone_id)
        end
        UIDropDownMenu_SetText(self.ui_frame.continent_drop_down, text)

        -- Update the drop down with available zones for this continent
        self.current_available_zones = self.zones_in_continent[id]
        if self.current_available_zones == nil then
            self.current_available_zones = {}
        end
        MTSLUI_TOOLS:FillDropDown(self.current_available_zones, self.ChangeZoneHandler, self.ui_frame.zone_drop_down.filter_frame_name)
        -- auto select first zone in the continent if possible
        if id > 0 then
            local key, zone = next(self.current_available_zones)
            UIDropDownMenu_SetText(self.ui_frame.zone_drop_down, zone.name)
            -- Apply filter if we may
            if self:IsFilteringEnabled() then
                self.list_frame:ChangeZone(zone.id)
            end
        else
            UIDropDownMenu_SetText(self.ui_frame.zone_drop_down, "")
        end
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Intialises drop down for zones
    ----------------------------------------------------------------------------------------------------------
    CreateDropDownZones = function(self)
        MTSLUI_TOOLS:FillDropDown(_G[self.filter_frame_name].current_available_zones, _G[self.filter_frame_name].ChangeZoneHandler, self.filter_frame_name)
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Handles DropDown Change event after changing the zone
    ----------------------------------------------------------------------------------------------------------
    ChangeZoneHandler = function(self, value, text)
        -- Only trigger update if we change to a different zone
        if value ~= nil and value ~= self.current_zone_id then
            self:ChangeZone(value, text)
        end
    end,

    ChangeZone = function(self, id, text)
        self.current_zone_id = id
        UIDropDownMenu_SetText(self.ui_frame.zone_drop_down, text)
        -- Apply filter if we may
        if self:IsFilteringEnabled() then
            self.list_frame:ChangeZone(id)
        end
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Intialises drop down for sorting
    ----------------------------------------------------------------------------------------------------------
    CreateDropDownSorting = function(self)
        MTSLUI_TOOLS:FillDropDown( _G[self.filter_frame_name].sorts, _G[self.filter_frame_name].ChangeSortHandler, self.filter_frame_name)
    end,

    --------------------------------------------------------------------------------------
    -- Handles DropDown Change event after changing the sorting
    ----------------------------------------------------------------------------------------------------------
    ChangeSortHandler = function(self, value, text)
        -- Only trigger update if we change to a different way to sort
        if value ~= nil and self.current_sort ~= value then
            self:ChangeSorting(value, text)
        end
    end,

    ChangeSorting = function(self, value, text)
        self.current_sort = value
        UIDropDownMenu_SetText(self.ui_frame.sort_drop_down, text)
        -- Apply filter if we may
        if self:IsFilteringEnabled() then
            self.list_frame:ChangeSort(value)
        end
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Intialises drop down for phases
    ----------------------------------------------------------------------------------------------------------
    CreateDropDownPhases = function(self)
        MTSLUI_TOOLS:FillDropDown(_G[self.filter_frame_name].phases, _G[self.filter_frame_name].ChangePhaseHandler, self.filter_frame_name)
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Handles DropDown Change event after changing the phases
    ----------------------------------------------------------------------------------------------------------
    ChangePhaseHandler = function(self, value, text)
        -- Only trigger update if we change to a different phase
        if value ~= nil and value ~= self.current_phase then
            self:ChangePhase(value, text)
        end
    end,

    ChangePhase = function(self, id, text)
        self.current_phase = id
        UIDropDownMenu_SetText(self.ui_frame.phase_drop_down, text)
        -- change filter to new phase
        local phase = MTSL_CURRENT_PHASE
        if id > 1 then
            phase = MTSL_MAX_PHASE
        end
        -- Apply filter if we may
        if self:IsFilteringEnabled() then
            self.list_frame:ChangePhase(phase)
        end
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Switch to vertical split layout
    ----------------------------------------------------------------------------------------------------------
    ResizeToVerticalMode = function(self)
        self.ui_frame:SetWidth(self.FRAME_WIDTH_VERTICAL)
        UIDropDownMenu_SetWidth(self.ui_frame.continent_drop_down, self.VERTICAL_WIDTH_DD)
        UIDropDownMenu_SetWidth(self.ui_frame.zone_drop_down, self.VERTICAL_WIDTH_DD)
        self.ui_frame.phase_text:SetPoint("TOPLEFT", self.ui_frame, "TOPLEFT", 215, -4)
    end,
    ----------------------------------------------------------------------------------------------------------
    -- Switch to horizontal split layout
    ----------------------------------------------------------------------------------------------------------
    ResizeToHorizontalMode = function(self)
        self.ui_frame:SetWidth(self.FRAME_WIDTH_HORIZONTAL)
        UIDropDownMenu_SetWidth(self.ui_frame.continent_drop_down, self.HORIZONTAL_WIDTH_DD)
        UIDropDownMenu_SetWidth(self.ui_frame.zone_drop_down, self.HORIZONTAL_WIDTH_DD)
        self.ui_frame.phase_text:SetPoint("TOPLEFT", self.ui_frame, "TOPLEFT", 280, -4)
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Shows if the filtering is enabled
    ----------------------------------------------------------------------------------------------------------
    IsFilteringEnabled = function (self)
        return self.filtering_active == 1
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Enable the filtering
    ----------------------------------------------------------------------------------------------------------
    EnableFiltering = function (self)
        self.filtering_active = 1
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Disable the filtering
    ----------------------------------------------------------------------------------------------------------
    DisableFiltering = function (self)
        self.filtering_active = 0
    end,

    ----------------------------------------------------------------------------------------------------------
    -- Disable the filtering
    ----------------------------------------------------------------------------------------------------------
    GetCurrentZone = function (self)
        return self.current_zone_id
    end,

    ----------------------------------------------------------------------------------------------------------
    -- GetCurrentPhase
    ----------------------------------------------------------------------------------------------------------
    GetCurrentPhase = function(self)
        return self.current_phase
    end,
}
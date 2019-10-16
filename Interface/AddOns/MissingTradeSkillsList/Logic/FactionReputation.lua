---------------------------------------------------------
-- Contains all functions for a faction and reputation --
---------------------------------------------------------

-- array holding all reputation levels
MTSL_REPUTATION_LEVELS = {
    ["Unknown"] = 0,
    ["Hated"] = 1,
    ["Hostile"] = 2,
    ["Unfriendly"] = 3,
    ["Neutral"] = 4,
    ["Friendly"] = 5,
    ["Honored"] = 6,
    ["Revered"] = 7,
    ["Exalted"] = 8
}

MTSL_LOGIC_FACTION_REPUTATION = {
    ------------------------------------------------------------------------------------------------
    -- Returns the name (localised) of a faction by id
    --
    -- @faction_id		Number		The id of the faction
    --
    -- returns 			String		The localised name of the faction
    ------------------------------------------------------------------------------------------------
    GetFactionNameById = function(self, faction_id)
        local faction = MTSL_TOOLS:GetItemFromUnsortedListById(MTSL_DATA["factions"], faction_id)
        if faction == nil then
            print(MTSLUI_FONTS.COLORS.TEXT.ERROR .. "MTSL: No faction found for id " .. faction_id .. "! Please report this bug!")
            return ""
        else
            return faction["name"][MTSLUI_CURRENT_LANGUAGE]
        end
    end,

    ------------------------------------------------------------------------------------------------
    -- Returns the name (localised) of a reputation level by id
    --
    -- @level_id		Number		The id of the repuation level
    --
    -- returns 			String		The localised name of the reputation level
    ------------------------------------------------------------------------------------------------
    GetReputationLevelById = function(self, faction_id)
        -- Get the English name corresponding the level
        local rep_level = self:GetReputationLevelNameById(level_id)
        -- Localise  the name
        return MTSLUI_LOCALES_REP_LEVELS[MTSLUI_CURRENT_LANGUAGE][rep_level]
    end,

    ----------------------------------------------------------------------------------------
    -- Gives the level of the standing (0-8) with a certain faction
    --
    -- @faction_name	String		The name of the faction
    --
    -- return			number		The standing with the rep (0-8) for the faction
    -----------------------------------------------------------------------------------------
    GetReputationLevelWithFaction = function (self, faction_name)
        for factionIndex = 1, GetNumFactions() do
            local name, description, standingId, bottomValue, topValue, earnedValue, atWarWith,
            canToggleAtWar, isHeader = GetFactionInfo(factionIndex)
            -- check if localised
            if (isHeader == nil or isHeader == false) and name == faction_name then
                return standingId
            end
        end
        -- Not found so return 0 = "Unknown"
        return MTSL_REPUTATION_LEVELS["Unknown"]
    end,

    ----------------------------------------------------------------------------------------
    -- Gives the name of the replevel based on the standing (0-8)
    --
    -- @rep_id		number		The standing with the rep (0-8)
    --
    -- return		String		The name of the replevel
    -----------------------------------------------------------------------------------------
    GetReputationLevelNameById = function (self, rep_id)
        for k, v in pairs(MTSL_REPUTATION_LEVELS) do
            if v == rep_id then
                return k
            end
        end
        -- Not found so return "Unknown"
        return "Unknown"
    end,

    ----------------------------------------------------------------------------------------
    -- Gives the level of the standing (0-8) based on the name of the level
    --
    -- @rep_name	String		The name of the replevel
    --
    -- return		number		The standing with the rep (0-8)
    -----------------------------------------------------------------------------------------
    GetReputationLevelByLevelName = function (self, rep_name)
        if MTSL_REPUTATION_LEVELS[rep_name] ~= nil then
            return MTSL_REPUTATION_LEVELS[rep_name]
        end
        -- Not found so return 0 = "Unknown"
        return MTSL_REPUTATION_LEVELS["Unknown"]
    end,
}
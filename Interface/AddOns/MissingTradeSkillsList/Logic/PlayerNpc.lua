-----------------------------------------
-- Contains all functions for a player --
-----------------------------------------

-- Shared/saved variable
MTSL_PLAYERS = {}

-- Holds info about the current logged in player
-- Contains following info once loaded from data
--		NAME,
--		FACTION,
--		REALM,
--		XP_LEVEL,
--		TRADESKILLS = {}
MTSL_CURRENT_PLAYER = {}

MTSL_LOGIC_PLAYER_NPC = {
    ---------------------------------------------------------------------------------------
    -- Loads the saved data of the logged in player or creates a new save
    -- Triggerd by game event "PLAYER_LOGIN"
    ---------------------------------------------------------------------------------------
    LoadPlayer = function (self)
        local name = UnitName("player")
        local realm = GetRealmName()
        local faction = UnitFactionGroup("player")
        local xp_level = UnitLevel("player")

        if name == nil or realm == nil or
                faction == nil or xp_level == nil then
            print(MTSLUI_FONTS.COLORS.TEXT.ERROR .. "MTSL - Could not load player info! Try reloading this addon")
        end

        local current_player = MTSL_PLAYERS[realm]
        -- Realm not yet registered so create it
        if current_player == nil then
            MTSL_PLAYERS[realm] = {}
            -- Realm exists, so see if we have saved the char already
        else
            current_player = MTSL_PLAYERS[realm][name]
        end

        -- Player not found on realm, so save him
        if current_player == nil then
            -- Not found so create a new one
            current_player = {
                NAME = name,
                REALM = realm,
                FACTION = faction,
                XP_LEVEL = xp_level,
                TRADESKILLS = {},
            }
            -- Get additional player info to save
            print(MTSLUI_FONTS.COLORS.TEXT.WARNING .. "MTSL: Saving new player. Please open all profession windows to save skills")
            -- new player added so sort the table (first the realms, then for new realm, sort by name
            MTSL_PLAYERS[realm][name] = current_player
            table.sort(MTSL_PLAYERS, function(a, b) return a < b end)
            table.sort(MTSL_PLAYERS[realm], function(a, b) return a.name < b.name end)
        elseif MTSLUI_SAVED_VARIABLES:GetShowWelcomeMessage() == 1 then
            print(MTSLUI_FONTS.COLORS.TEXT.SUCCESS .. "MTSL: Player " .. current_player.NAME .. " (" .. current_player.XP_LEVEL .. ", " .. current_player.FACTION .. ") on " .. current_player.REALM .. " loaded")
        end
        -- set the loaded or created player as current one
        MTSL_CURRENT_PLAYER = current_player
        -- Update faction & xp_level, just in case
        MTSL_CURRENT_PLAYER.XP_LEVEL = xp_level
        MTSL_CURRENT_PLAYER.FACTION = faction
    end,

    ------------------------------------------------------------------------------------------------
    -- Returns the number of characters
    --
    -- returns 	Number		The number of chars (on that realm)
    ------------------------------------------------------------------------------------------------
    CountPlayers = function(self)
        local amount = 0
        for k, realm in pairs(MTSL_PLAYERS) do
            amount = amount + self:CountPlayersOnRealm(k)
        end

        return amount
    end,

    ------------------------------------------------------------------------------------------------
    -- Returns the number of characters
    --
    -- @realm	String 		The name of the realm
    --
    -- returns 	Number		The number of chars on that realm
    ------------------------------------------------------------------------------------------------
    CountPlayersOnRealm = function(self, realm)
        return MTSL_TOOLS:CountItemsInNamedArray(MTSL_PLAYERS[realm])
    end,

    ------------------------------------------------------------------------------------------------
    -- Returns the player on a realm
    --
    -- @name    String      The name of the player
    -- @realm	String 		The name of the realm
    --
    -- returns 	Number		The number of chars on that realm
    ------------------------------------------------------------------------------------------------
    GetPlayerOnRealm = function (self, name, realm)
        if MTSL_PLAYERS[realm] ~= nil then
            return MTSL_PLAYERS[realm][name]
        end
        return nil
    end,

    ------------------------------------------------------------------------------------------------
    -- Returns the amount of missing skills of a player for a profession
    --
    -- @player_name         String      The name of the player
    -- @player_realm	    String 		The name of the realm
    -- @profession_name     String      The name of the profession
    --
    -- returns 	            Number		The amount of missing skills
    ------------------------------------------------------------------------------------------------
    GetAmountOfMissingSkillsForProfession = function (self, player_name, player_realm, profession_name)
        local player = self:GetPlayerOnRealm(player_name, player_realm)
        -- Check if player exits
        if player ~= nil and player.TRADESKILLS[profession_name] ~= nil and player.TRADESKILLS[profession_name] ~= 0 then
            return player.TRADESKILLS[profession_name]["AMOUNT_MISSING"]
        end
        return 0
    end,

    ------------------------------------------------------------------------------------------------
    -- Returns the missing skills of a player for a profession
    --
    -- @player_name         String      The name of the player
    -- @player_realm	    String 		The name of the realm
    -- @profession_name     String      The name of the profession
    --
    -- returns 	            Array		List of missing skills for the profession ({} if not found)
    ------------------------------------------------------------------------------------------------
    GetMissingSkillsForProfessionOfPlayer = function (self, player_name, player_realm, profession_name)
        local player = self:GetPlayerOnRealm(player_name, player_realm)
        local missing_skills = {}
        -- Check if player exits
        if player ~= nil and player.TRADESKILLS[profession_name] ~= nil and player.TRADESKILLS[profession_name] ~= 0 then
            -- get the skill for each id
            for _, s in pairs(player.TRADESKILLS[profession_name]["MISSING_SKILLS"]) do
                table.insert(missing_skills, MTSL_LOGIC_SKILL:GetSkillForProfessionById(s, profession_name))
            end
        end
        return missing_skills
    end,

    ------------------------------------------------------------------------------------------------
    -- Returns the missing skills of a player for a profession
    --
    -- @player_name         String      The name of the player
    -- @player_realm	    String 		The name of the realm
    -- @profession_name     String      The name of the profession
    --
    -- returns 	            Array		List of missing skills for the profession ({} if not found)
    ------------------------------------------------------------------------------------------------
    GetMissingSkillsForProfessionCurrentPlayer = function (self, profession_name)
        return self:GetMissingSkillsForProfessionOfPlayer(MTSL_CURRENT_PLAYER.NAME, MTSL_CURRENT_PLAYER.REALM, profession_name)
    end,

    -----------------------------------------------------------------------------------------------
    -- Get All the skills learned by a player for one profession sorted by minimim skill
    --
    -- @profession_name		String		The name of the profession
    --
    -- return				Array		All the skills for one profession sorted by name or minimim skill
    ------------------------------------------------------------------------------------------------
    GetLearnedSkillsForPlayerForProfession = function(self, player_name, realm_name, profession_name)
        local learned_skills = {}
        local player = self:GetPlayerOnRealm(player_name, realm_name)

        -- Check if player exits
        if player ~= nil and player.TRADESKILLS[profession_name] ~= nil and player.TRADESKILLS[profession_name] ~= 0 then
            -- get the skill for each id
            if player.TRADESKILLS[profession_name]["LEARNED_SKILLS"] ~= nil then
                for _, s in pairs(player.TRADESKILLS[profession_name]["LEARNED_SKILLS"]) do
                    table.insert(learned_skills, MTSL_LOGIC_SKILL:GetSkillForProfessionById(s, profession_name))
                end
            end
        end

        if learned_skills ~= nil or learned_skills ~= {} then
            table.sort(learned_skills, function(a, b) return a.min_skill < b.min_skill end)
        end

        return learned_skills
    end,

    ------------------------------------------------------------------------------------------------
    -- Returns the amount of learned skills of a player for a profession
    --
    -- @player_name         String      The name of the player
    -- @player_realm	    String 		The name of the realm
    -- @profession_name     String      The name of the profession
    --
    -- returns 	            Number		The amount of missing skills
    ------------------------------------------------------------------------------------------------
    GetAmountOfLearnedSkillsForProfession = function (self, player_name, player_realm, profession_name)
        local player = self:GetPlayerOnRealm(player_name, player_realm)
        -- Check if player exits
        if player ~= nil and player.TRADESKILLS[profession_name] ~= nil and player.TRADESKILLS[profession_name] ~= 0 then
            return player.TRADESKILLS[profession_name]["AMOUNT_LEARNED"]
        end
        return 0
    end,

    -----------------------------------------------------------------------------------------------
    -- Get a flag indicating if a skill is learned in a profession
    --
    -- @player_name         String      The name of the player
    -- @player_realm	    String 		The name of the realm
    -- @profession_name     String      The name of the profession
    -- @skill_id            Number		The id of the skill
    --
    -- return				Boolean     Flag indicating if learend or not
    ------------------------------------------------------------------------------------------------
    HasLearnedSkillForProfession = function(self,  player_name, realm_name, profession_name, skill_id)
        local player = self:GetPlayerOnRealm(player_name, realm_name)

        -- Check if player exits
        if player ~= nil and player.TRADESKILLS[profession_name] ~= nil and player.TRADESKILLS[profession_name] ~= 0 then
            -- get the skill for each id
            if player.TRADESKILLS[profession_name]["LEARNED_SKILLS"] ~= nil then
                for _, s in pairs(player.TRADESKILLS[profession_name]["LEARNED_SKILLS"]) do
                    if s == skill_id then
                        return true
                    end
                end
            end
        end

        return false
    end,

    -------------------------------------------------------------------
    -- Get a flag indicating if a player has learned a profession
    --
    -- @player_name         String      The name of the player
    -- @player_realm	    String 		The name of the realm
    -- @profession_name     String      The name of the profession
    --
    -- return				Boolean     Flag indicating if learend or not
    ------------------------------------------------------------------------------------------------
    HasLearnedProfession = function(self,  player_name, realm_name, profession_name)
        local player = self:GetPlayerOnRealm(player_name, realm_name)

        -- Check if player exits
        if player ~= nil then
            if profession_name == "" or (player.TRADESKILLS[profession_name] ~= nil and player.TRADESKILLS[profession_name] ~= 0) then
                return true
            end
        end

        return false
    end,

    -----------------------------------------------------------------------------------------------
    -- Gets the current skill level for a profession of a player
    --
    -- @player_name         String      The name of the player
    -- @player_realm	    String 		The name of the realm
    -- @profession_name     String      The name of the profession
    --
    -- return				Number      The current skill level
    ------------------------------------------------------------------------------------------------
    GetCurrentSkillLevelForProfession = function(self,  player_name, realm_name, profession_name)
        local player = self:GetPlayerOnRealm(player_name, realm_name)

        -- Check if player exits
        if player ~= nil and player.TRADESKILLS[profession_name] ~= nil and player.TRADESKILLS[profession_name] ~= 0 then
            return player.TRADESKILLS[profession_name].SKILL_LEVEL
        end

        return 0
    end,

    ------------------------------------------------------------------------------------------------
    -- Returns the learned skills of the current player for a profession
    --
    -- @profession_name     String      The name of the profession
    --
    -- returns 	            Array		List of missing skills for the profession ({} if not found)
    ------------------------------------------------------------------------------------------------
    GetLearnedSkillsForProfessionCurrentPlayer = function (self, profession_name)
        return self:GetLearnedSkillsForPlayerForProfession(MTSL_CURRENT_PLAYER.NAME, MTSL_CURRENT_PLAYER.REALM, profession_name)
    end,

    ------------------------------------------------------------------------------------------------
    -- Returns the list of names for known professsions of a player
    --
    -- @player_name         String      The name of the player
    -- @player_realm	    String 		The name of the realm
    --
    -- returns 	            Array		List of known professions ({} if none)
    ------------------------------------------------------------------------------------------------
    GetKnownProfessionsForPlayer = function(self, realm_name, player_name)
        local player = self:GetPlayerOnRealm(player_name, realm_name)
        local known_professions = {}
        if player ~= nil then
            for k, v in pairs(player.TRADESKILLS) do
                -- only add if actualy initiallised
                if v ~= 0 then
                    -- add english name to list
                    table.insert(known_professions, MTSLUI_LOCALES_PROFESSIONS[MTSLUI_CURRENT_LANGUAGE][k])
                end
            end
        end
        return known_professions
    end,

    ------------------------------------------------------------------------------------------------
    -- Refresh the list of missing skills for a profession for the current player
    --
    -- @profession_name         String      The name of the profession to scan
    -- @current_skill_level     Number      The number of the current skill level of the player
    ------------------------------------------------------------------------------------------------
    UpdateMissingSkillsForProfessionCurrentPlayer = function(self, profession_name, current_skill_level)
        -- Reset any previously saved skills
        MTSL_CURRENT_PLAYER.TRADESKILLS[profession_name] = {
            ["NAME"] = profession_name,
            ["AMOUNT_MISSING"] = 0,
            ["SKILL_LEVEL"] = current_skill_level,
            ["SPELLID_HIGHEST_KNOWN_RANK"] = 0,
            ["AMOUNT_LEARNED"] = 0,
            ["MISSING_SKILLS"] = {},
            ["LEARNED_SKILLS"] = {},
        }

        -- get the list of learned skills
        local known_skill_names = {}
        -- Get the correct list (= localised!) depending on craft or tradeskill
        if profession_name == "Enchanting" then
            known_skill_names = MTSL_LOGIC_PROFESSION:GetSkillNamesCurrentCraft()
        else
            known_skill_names = MTSL_LOGIC_PROFESSION:GetSkillNamesCurrentTradeSkill()
        end
        -- get the list of available skills in the current phase for the profession (= English names)
        -- zone = 0 for all zones
        local available_skills = MTSL_LOGIC_PROFESSION:GetAllAvailableSkillsForProfessionInZone(profession_name, MTSL_CURRENT_PHASE, 0)

        -- Loop all skills of the profession
        for _, skill in pairs(available_skills) do
            -- We learned the skill
            if MTSL_TOOLS:ListContainsKey(known_skill_names, skill["name"][MTSLUI_CURRENT_LANGUAGE]) then
                table.insert(MTSL_CURRENT_PLAYER.TRADESKILLS[profession_name].LEARNED_SKILLS, skill.id)
                MTSL_CURRENT_PLAYER.TRADESKILLS[profession_name].AMOUNT_LEARNED = MTSL_CURRENT_PLAYER.TRADESKILLS[profession_name].AMOUNT_LEARNED + 1
            else
                table.insert(MTSL_CURRENT_PLAYER.TRADESKILLS[profession_name].MISSING_SKILLS, skill.id)
                MTSL_CURRENT_PLAYER.TRADESKILLS[profession_name].AMOUNT_MISSING = MTSL_CURRENT_PLAYER.TRADESKILLS[profession_name].AMOUNT_MISSING + 1
            end
        end

        self:UpdateMissingLevelsForProfessionCurrentPlayer(profession_name)
    end,

    ------------------------------------------------------------------------------------------------
    -- Refresh the list of missing skills for a profession for the current player
    --
    -- @profession_name         String      The name of the profession to scan
    -- @current_skill_level     Number      The number of the current skill level of the player
    ------------------------------------------------------------------------------------------------
    UpdateMissingLevelsForProfessionCurrentPlayer = function(self, profession_name)
        -- add all the missing levels to the array of skills as well and increase counter
        local level_ids = MTSL_LOGIC_PROFESSION:GetLevelsForProfession(profession_name)

        local found_first_learned = false

        for _, v in pairs(level_ids) do
            -- Only returns true for highest level so until we found it add lesser ranks as learned as well
            if IsSpellKnown(v.id) or found_first_learned == false then
                table.insert(MTSL_CURRENT_PLAYER.TRADESKILLS[profession_name].LEARNED_SKILLS, v.id)
                MTSL_CURRENT_PLAYER.TRADESKILLS[profession_name].AMOUNT_LEARNED = MTSL_CURRENT_PLAYER.TRADESKILLS[profession_name].AMOUNT_LEARNED + 1
                MTSL_CURRENT_PLAYER.TRADESKILLS[profession_name].SPELLID_HIGHEST_KNOWN_RANK = v.id
                -- all other "not known spells" are not learned
                if found_first_learned == false then
                    found_first_learned = true
                end
            else
                table.insert(MTSL_CURRENT_PLAYER.TRADESKILLS[profession_name].MISSING_SKILLS, v.id)
                MTSL_CURRENT_PLAYER.TRADESKILLS[profession_name].AMOUNT_MISSING = MTSL_CURRENT_PLAYER.TRADESKILLS[profession_name].AMOUNT_MISSING + 1
            end
        end
    end,

    ----------------------------------------------------------------------------------------
    -- Check if we unlearned a profession (No need for cooking or FA, can't unlearn those)
    ----------------------------------------------------------------------------------------
    CheckProfessions = function(self)
        if MTSL_CURRENT_PLAYER ~= nil and MTSL_CURRENT_PLAYER.TRADESKILLS ~= nil then
            for k, v in pairs(MTSL_CURRENT_PLAYER.TRADESKILLS) do
                -- Skip cooking and first aid, cant be unlearned
                if v.name ~= "Cooking" and v.name ~= "First Aid" and not IsSpellKnown(v.SPELLID_HIGHEST_KNOWN_RANK) then
                    -- delete the saved data
                    v = nil
                end
            end
        end
    end,

    -----------------------------------------------------------------------------------------------
    -- Gets a list of all npcs (based on their ids) available to the player's faction
    --
    -- @ids					Array		The ids of NPCs to search
    --
    -- return				Array		List of found NPCs
    ------------------------------------------------------------------------------------------------
    GetNpcsByIds = function(self, ids)
        local npcs = {}

        for k, id in pairs(ids)
        do
            local npc = self:GetNpcById(id)
            -- If we found one, check if the faction is valid (= neutral OR the same faction as player
            if npc ~= nil then
                if MTSL_CURRENT_PLAYER.FACTION == npc.reacts or npc.reacts == "Neutral" then
                    table.insert(npcs, npc)
                end
            else
                print(MTSLUI_FONTS.COLORS.TEXT.ERROR .. "MTSL - Could not find NPC with id " .. id .. ". Please report this bug!")
            end
        end

        -- Sort the mobs by name in the table
        table.sort(npcs, function(a,b) return a["name"][MTSLUI_CURRENT_LANGUAGE] < b["name"][MTSLUI_CURRENT_LANGUAGE] end)

        -- Return the found npcs
        return npcs
    end,

    -----------------------------------------------------------------------------------------------
    -- Gets an NPC (based on it's id) for the current Tradeskill
    --
    -- @id				Number		The id of the NPC to search
    --
    -- return			Object		Found NPC (nil if not found)
    ------------------------------------------------------------------------------------------------
    GetNpcById = function(self, id)
        return MTSL_TOOLS:GetItemFromArrayByKeyValue(MTSL_DATA["npcs"], "id", id)
    end,

    -----------------------------------------------------------------------------------------------
    -- Gets a list of all drop mobs (based on their ids) for the current Tradeskill
    --
    -- @ids					Array		The ids of mobs to search
    --
    -- return				Array		List of found mobs
    ------------------------------------------------------------------------------------------------
    GetMobsByIds = function(self, ids)
        local mobs = {}

        for k, id in pairs(ids)
        do
            local mob = self:GetNpcById(id)
            -- Check if we found one
            if mob ~= nil then
                -- only add mob if player can attack it
                if mob.reacts ~= MTSL_CURRENT_PLAYER.FACTION then
                    table.insert(mobs, mob)
                end
            else
                print(MTSLUI_FONTS.COLORS.TEXT.ERROR .. "MTSL - Could not find mob with id " .. id .. " for " .. MTSL_CURRENT_PROFESSION.NAME .. ". Please report this bug!")
            end
        end

        -- Sort the mobs by name in the table
        table.sort(mobs, function(a,b) return a["name"][MTSLUI_CURRENT_LANGUAGE] < b["name"][MTSLUI_CURRENT_LANGUAGE] end)

        -- Return the found npcs
        return mobs
    end,

    ----------------------------------------------------------------------------
    -- Gets the number of current learned skils in the tradeskill window that is opened
    --
    -- return				Number		Amount of learned skills
    ------------------------------------------------------------------------------------------------
    GetAmountOfSkillsLearnedCurrentTradeSkill = function(self)
        local skillName, skillType
        local amount = 0
        for i=1,GetNumTradeSkills() do
            skillName, skillType = GetTradeSkillInfo(i)
            -- Skip the headers, only count real skills
            if (skillName and skillType ~= "header") then
                amount = amount + 1
            end
        end

        return amount
    end,

    -----------------------------------------------------------------------------------------------
    -- Checks if a certain skill is learned for the current opened tradeskil
    --
    -- @search_skill_name	String		The name of the skill to search
    --
    -- return				number		Flag that indicates if skill is learned (1 = yes, 0 = no)
    ------------------------------------------------------------------------------------------------
    IsTradeSkillKnown = function (self, search_skill_name)
        local skillName, skillType
        -- Loop all known skills until we find it
        for i=1,GetNumTradeSkills() do
            skillName, skillType = GetTradeSkillInfo(i)
            -- Skip the headers, only check real skills
            if skillName ~= nil and skillType ~= "header" and
                    search_skill_name == skillName then
                return true
            end
        end
        -- Skill not found so return false
        return false
    end,

    -----------------------------------------------------------------------------------------------
    -- Checks if a certain skill is learned for the current tradeskil for a player
    -- Checks if a certain skill is learned for the current tradeskil for a player
    --
    -- @tradeskills_player	Array		List of tradeskills of the player
    -- @search_skill_name	String		The name of the skill to search
    --
    -- return				number		Flag that indicates if skill is learned (1 = yes, 0 = no)
    ------------------------------------------------------------------------------------------------
    IsTradeSkillKnownByPlayer = function (self, tradeskills_player, search_skill_name)
        for k, v in pairs(tradeskills_player) do
            if k == search_skill_name then
                return true
            end
        end
        -- Skill not found so return false
        return false
    end,

    -----------------------------------------------------------------------------------------------
    -- Get a list of realms where the player has at least 1 saved char on
    --
    -- return				Array		The list of realm names
    ------------------------------------------------------------------------------------------------
    GetRealmsWithPlayers = function(self)
        local realm_names = {}
        for k, r in pairs(MTSL_PLAYERS) do
            if self:CountPlayersOnRealm(k) > 0 then
                table.insert(realm_names, k)
            end
        end
        -- sort if we have realms
        if realm_names ~= {} then
            table.sort(realm_names, function (a, b) return a < b end)
        end

        return realm_names
    end,

    -----------------------------------------------------------------------------------------------
    -- Get a list of realms where the player has at least 1 saved char on that knows the profession
    --
    -- @profession_name 	String		The name of the profession needed by 1 char / realm
    --
    -- return				Array		The list of realm names
    ------------------------------------------------------------------------------------------------
    GetRealmsWithPlayersKnowingProfession = function(self, profession_name)
        local realm_names = {}
        -- keep last saved realm name
        local last_added_realm = ""

        for k, r in pairs(MTSL_PLAYERS) do
            -- loop all chars on realm until we find one with the profession
            for l, p in pairs(r) do
                if k ~= last_added_realm and MTSL_TOOLS:NamedListContainsKey(p.TRADESKILLS, profession_name) then
                    table.insert(realm_names, k)
                    last_added_realm = k
                end
            end
        end
        -- sort if we have realms
        if realm_names ~= {} then
            table.sort(realm_names, function (a, b) return a < b end)
        end

        return realm_names
    end,

    -----------------------------------------------------------------------------------------------
    -- Get the number of players knowing a profession
    --
    -- @profession_name 	String		The name of the profession needed by 1 char / realm
    --
    -- return				Array		The list of realm names
    ------------------------------------------------------------------------------------------------
    GetAmountOfPlayersKnowingProfession = function(self, profession_name)
        local amount = 0

        for k, r in pairs(MTSL_PLAYERS) do
            -- loop all chars on realm until we find one with the profession
            for l, p in pairs(r) do
                if MTSL_TOOLS:NamedListContainsKey(p.TRADESKILLS, profession_name) then
                    amount = amount + 1
                end
            end
        end

        return amount
    end,
}
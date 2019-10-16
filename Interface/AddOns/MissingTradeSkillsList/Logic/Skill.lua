--------------------------------------------------------
-- Contains all functions for a skill of a profession --
--------------------------------------------------------

MTSL_LOGIC_SKILL = {
    ----------------------------------------------------------------------------------------
    -- Checks if a skill is available in this content phase
    --
    -- @skill				Object			The skill
    -- @profession_name		String			The name of the profession
    -- @max_phase			Number			The number of content phase that is maximal allowed
    --
    -- return				Boolean			Flag indicating availability
    -----------------------------------------------------------------------------------------
    IsSkillAvailableInPhase = function(self, skill, profession_name, max_phase)
        local available = true
        if skill.phase ~= nil and skill.phase > max_phase then
            available = false
        -- Ignore checks if we check for MTSL_MAX_PHASE cause then all are available
        elseif max_phase < MTSL_CURRENT_PHASE then
            -- check if at least one of the sources is available in the current or previous phases
            -- With trainers, quest or object a skill is always available
            -- Check for the content phase of the item
            if skill.trainers == nil and skill.quests == nil and skill.object == nil then
                if skill.item == nil then
                    print(MTSLUI_FONTS.COLORS.TEXT.ERROR .. "MTSL: Skill  " .. skill.name["English"] .. " (id: " .. skill.id .. ") has no sources. Report this bug!")
                    return false
                else
                    local skill_item = MTSL_LOGIC_ITEM_OBJECT:GetItemFromProfessionById(skill.item, profession_name)
                    if skill_item ~= nil and skill_item.phase  > max_phase then
                        available = false
                    end
                end
            end
        end
        return available
    end,

    ----------------------------------------------------------------------------------------
    -- Checks if a skill is available in this content phase in a certain zone
    --
    -- @skill				Object			The skill
    -- @profession_name		String			The name of the profession
    -- @max_phase			Number			The number of content phase that is maximal allowed
    -- @zone_id				Number			The id of the zone (0 = all)
    --
    -- return				Boolean			Flag indicating availability
    -----------------------------------------------------------------------------------------
    IsSkillAvailableInPhaseAndZone = function(self, skill, profession_name, max_phase, zone_id)
        local available = true
        -- first check if available in Phase
        if self:IsSkillAvailableInPhase(skill, profession_name, max_phase) then
            -- check fot at least one source in the zone (skip zone if id = 0 => all are good)
            if zone_id ~= 0 then
                local at_least_one_source = false
                -- if trainers, loop em
                if skill.trainers ~= nil then
                    local npcs = MTSL_LOGIC_PLAYER_NPC:GetNpcsByIds(skill.trainers.sources)
                    at_least_one_source = self:HasAtleastOneNpcInZoneById(npcs, zone_id)
                end
                -- keep going if still no valid source found
                if not at_least_one_source and skill.quests ~= nil then
                    at_least_one_source = self:HasAtleastOneObtainableQuestInZone(skill.quests, profession_name, zone_id)
                end
                -- keep going if still no valid source found
                if not at_least_one_source and skill.object ~= nil then
                    at_least_one_source = self:HasAtleastOneObtainableObjectInZone( { skill.object }, zone_id)
                end
                -- keep going if still no valid source found
                if not at_least_one_source and skill.item ~= nill then
                    at_least_one_source = self:HasAtleastOneObtainableItemInZone( { skill.item }, profession_name, zone_id)
                end
                available = at_least_one_source
            end
        else
            available = false
        end
        return available
    end,

    ----------------------------------------------------------------------------------------
    -- Checks if a at least one npc is located in a certain zone
    --
    -- @npcs				Array			The list of NPCs
    -- @zone_id		        Number			The id of the zone
    --
    -- return				Boolean			Flag indicating if at least one is found
    -----------------------------------------------------------------------------------------
    HasAtleastOneNpcInZoneById = function(self, npcs, zone_id)
        -- Get the first npc found for the given zone
        local npc = MTSL_TOOLS:GetItemFromArrayByKeyValue(npcs, "zone_id", zone_id)
        -- return if we found one or not
        return npc ~= nil
    end,

    ----------------------------------------------------------------------------------------
    -- Checks if at least one of the quests is available in a certain zone
    --
    -- @quest_ids			Array			Contains all different quest_ids (Alliance and horde can have different ones)
    -- @zone_id				Number			The id of the zone (0 = all)
    --
    -- return				Boolean			Flag indicating obtainable
    -----------------------------------------------------------------------------------------
    HasAtleastOneObtainableQuestInZone = function(self, quest_ids, tradeskill_name, zone_id)
        local quest = MTSL_LOGIC_QUEST:GetQuestByIds(quest_ids)
        -- Quest has many sources (npcs, objects or items)
        -- check npcs
        local is_obtainable = false
        if quest ~= nil then
            if quest.npcs ~= nil then
                local npcs = MTSL_LOGIC_PLAYER_NPC:GetNpcsByIds(quest.npcs)
                is_obtainable = self:HasAtleastOneNpcInZoneById(npcs, zone_id)
            end
            -- Check objects
            if not is_obtainable and quest.objects ~= nil then
                is_obtainable = self:HasAtleastOneObtainableObjectInZone(quest.objects, zone_id)
            end
            -- check items
            if not is_obtainable and quest.items ~= nil then
                is_obtainable = self:HasAtleastOneObtainableItemInZone(quest.items, tradeskill_name, zone_id)
            end
        end

        return is_obtainable
    end,

    ----------------------------------------------------------------------------------------
    -- Checks if at least one of the objects is available in a certain zone
    --
    -- @item_ids			Array			Contains the ids of the items to check
    -- @zone_id				Number			The id of the zone (0 = all)
    --
    -- return				Boolean			Flag indicating obtainable
    -----------------------------------------------------------------------------------------
    HasAtleastOneObtainableObjectInZone = function(self, object_ids, zone_id)
        local objects = MTSL_LOGIC_ITEM_OBJECT:GetObjectsByIds(object_ids)
        local object = MTSL_TOOLS:GetItemFromArrayByKeyValue(objects, "zone_id", zone_id)
        return object ~= nil
    end,

    ----------------------------------------------------------------------------------------
    -- Checks if at least one of the items is available in a certain zone
    --
    -- @item_ids			Array			Contains the ids of the items to check
    -- @profession_name		String			The name of the profession for which the item is valid
    -- @zone_id				Number			The id of the zone (0 = all)
    --
    -- return				Boolean			Flag indicating obtainable
    -----------------------------------------------------------------------------------------
    HasAtleastOneObtainableItemInZone = function(self, item_ids, profession_name, zone_id)
        local i = 1
        local is_obtainable = false
        while item_ids[i] ~= nil and is_obtainable == false do
            local skill_item = MTSL_LOGIC_ITEM_OBJECT:GetItemForProfessionById(item_ids[i], profession_name)
            if skill_item ~= nil then
                -- item has many sources (drops, quests, vendors)
                -- check quests
                if skill_item.quests ~= nil then
                    is_obtainable = self:HasAtleastOneObtainableQuestInZone(skill_item.quests, profession_name, zone_id)
                end
                -- check vendors
                if not is_obtainable and skill_item.vendors ~= nil then
                    local vendors = MTSL_LOGIC_PLAYER_NPC:GetNpcsByIds(skill_item.vendors.sources)
                    is_obtainable = self:HasAtleastOneNpcInZoneById(vendors, zone_id)
                end
                -- check drops only if not a world drop
                if not is_obtainable and skill_item.drops ~= nil then
                    -- Exclude world drops
                    if skill_item.drops.mobs_range ~= nil then
                        is_obtainable = false
                    else
                        local mobs = MTSL_LOGIC_PLAYER_NPC:GetMobsByIds(skill_item.drops.mobs)
                        is_obtainable = self:HasAtleastOneNpcInZoneById(mobs, zone_id)
                    end
                end
            end
            i = i + 1
        end
        return is_obtainable
    end,

    ------------------------------------------------------------------------------------------------
    -- Returns a list of skills obtainable in a certain zone for a certain profession
    --
    -- @zone				String		The name of the zone (ANY for all zones)
    -- @profession_name		String		Name of the profession
    -- @order_by_name	    Boolean		Flag indicating if sorting by name or min_skill
    --
    -- returns	 		    Array		The skills
    ------------------------------------------------------------------------------------------------
    GetSkillsForZone = function(self, zone, profession_name, order_by_name)
        if zone == "ANY" then
            return {}
        else
            local skills = {}
            for k,v in pairs (MTSL_DATA[profession_name]["skills"]) do
                if self:IsLearnableInZone(v, zone) then
                    table.insert(skills, v)
                end
            end
            if order_by_name then
                table.sort(skills, function (a, b) return a["name"][MTSLUI_CURRENT_LANGUAGE] < b["name"][MTSLUI_CURRENT_LANGUAGE] end)
            else
                table.sort(skills, function (a, b) return a.min_skill < b.min_skill end)
            end
            return skills
        end
    end,

    ------------------------------------------------------------------------------------------------
    -- Returns a skill for a certain profession by id
    --
    -- @skill_id			Number		The id of the skill
    -- @prof_name		String		Name of the profession
    --
    -- returns	 		Array		The skills
    ------------------------------------------------------------------------------------------------
    GetSkillForProfessionById = function(self, skill_id, profession_name)
        local skill = MTSL_TOOLS:GetItemFromArrayByKeyValue(MTSL_DATA[profession_name]["skills"], "id", skill_id)
        -- try a level if nil
        if skill == nil then
            skill = MTSL_TOOLS:GetItemFromArrayByKeyValue(MTSL_DATA[profession_name]["levels"], "id", skill_id)
        end
        return skill
    end,
}
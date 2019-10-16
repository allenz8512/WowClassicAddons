--------------------------------------------------
-- Contains all functions for an item or object --
--------------------------------------------------

MTSL_LOGIC_ITEM_OBJECT = {
    -----------------------------------------------------------------------------------------------
    -- Gets a list of all objects (based on their ids)
    --
    -- @ids					Array		The ids of objects to search
    --
    -- return				Array		List of found items
    ------------------------------------------------------------------------------------------------
    GetObjectsByIds = function(self, ids)
        local objects = {}

        for k, id in pairs(ids)
        do
            local object = self:GetObjectById(id)
            -- If we found one add to list
            if object ~= nil then
                table.insert(objects, object)
            else
                print(MTSLUI_FONTS.COLORS.TEXT.ERROR .. "MTSL: Could not find object with id " .. id .. ". Please report this bug!")
            end
        end

        -- Sort the objects by name in the table
        table.sort(objects, function(a,b) return a["name"][MTSLUI_CURRENT_LANGUAGE] < b["name"][MTSLUI_CURRENT_LANGUAGE] end)

        -- Return the found objects
        return objects
    end,

    -----------------------------------------------------------------------------------------------
    -- Gets an object (based on it's id)
    --
    -- @id				Number		The id of the item to search
    --
    -- return			Object		Found item (nil if not found)
    ------------------------------------------------------------------------------------------------
    GetObjectById = function(self, id)
        return MTSL_TOOLS:GetItemFromArrayByKeyValue(MTSL_DATA["objects"], "id", id)
    end,

    -----------------------------------------------------------------------------------------------
    -- Gets a list of all items (based on their ids)
    --
    -- @ids					Array		The ids of items to search
    -- @profession_name     String      The name of the profession
    --
    -- return				Array		List of found items
    ------------------------------------------------------------------------------------------------
    GetItemsForProfessionByIds = function(self, ids, profession_name)
        local items = {}

        for k, id in pairs(ids)
        do
            local item = self:GetItemForProfessionById(id, profession_name)
            -- If we found one add to list
            if item ~= nil then
                table.insert(items, item)
            else
                print(MTSLUI_FONTS.COLORS.TEXT.ERROR .. "MTSL: Could not find item with id " .. id .. " for " .. profession_name .. ". Please report this bug!")
            end
        end

        -- Sort the items by name in the table
        table.sort(items, function(a,b) return a["name"][MTSLUI_CURRENT_LANGUAGE] < b["name"][MTSLUI_CURRENT_LANGUAGE] end)

        -- Return the found items
        return items
    end,

    -----------------------------------------------------------------------------------------------
    -- Gets an item (based on it's id)
    --
    -- @id				    Number		The id of the item to search
    -- @profession_name     String      The name of the profession
    --
    -- return			    Object		Found item (nil if not found)
    ------------------------------------------------------------------------------------------------
    GetItemForProfessionById = function(self, id, profession_name)
        return MTSL_TOOLS:GetItemFromArrayByKeyValue(MTSL_DATA[profession_name]["items"], "id", id)
    end,
}
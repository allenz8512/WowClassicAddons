-------------------------------------------------
-- Contains all shared functions for the logic --
-------------------------------------------------

-- Hols the curent phase of the content patches on live servers
MTSL_CURRENT_PHASE = 1
-- Hols the max phase of game to ever be released on live servers
MTSL_MAX_PHASE = 6

MTSL_TOOLS = {
	---------------------------------------------------------------------------------------
	-- Conver a number to xx g xx s xx c
	--
	-- @money_number:	number		The amount expressed in coppers (e.g.: 10000 = 1g 00 s 00c)
	--
	-- returns			String		Number converted to xx g xx s xx c
	----------------------------------------------------------------------------------------
	GetNumberAsMoneyString = function (self, money_number)
		if type(money_number) ~= "number" then
			return "-"
		end

		-- Calculate the amount of gold, silver and copper
		local gold = floor(money_number/10000)
		local silver = floor(mod((money_number/100),100))
		local copper = mod(money_number,100)

		local money_string = ""
		-- Add gold if we have
		if gold > 0 then
			money_string = money_string .. MTSLUI_FONTS.COLORS.TEXT.NORMAL .. gold .. MTSLUI_FONTS.COLORS.MONEY.GOLD .. "g "
		end
		-- Add silver if we have
		if silver > 0 then
			money_string = money_string .. MTSLUI_FONTS.COLORS.TEXT.NORMAL .. silver .. MTSLUI_FONTS.COLORS.MONEY.SILVER .. "s "
		end
		-- Always show copper even if 0
		money_string = money_string .. MTSLUI_FONTS.COLORS.TEXT.NORMAL .. copper .. MTSLUI_FONTS.COLORS.MONEY.COPPER .. "c"

		return money_string
	end,

	----------------------------------------------------------------------------------------------------------
	-- Checks if all data is present and correctly loaded in the addon
	--
	-- returns		Boolean		Flag indicating if data is valid
	----------------------------------------------------------------------------------------------------------
	CheckIfDataIsValid = function(self)
		-- check the professions
		local professions_to_check = { "Alchemy", "Blacksmithing", "Enchanting", "Engineering", "Leatherworking", "Mining", "Tailoring", "Cooking", "First Aid" }
		local subitems_per_professsion_to_check = { "skills", "levels", "items" }
		local langs_to_check = { "French", "English", "German", "Russian", "Spanish", "Portuguese" }
		for _, v in pairs(professions_to_check) do
			-- profession not present
			if MTSL_DATA[v] == nil then
				print(MTSLUI_FONTS.COLORS.TEXT.ERROR .. "MTSL: Could not load all the data needed for the addon! Missing profession " .. v .. ". Please reinstall the addon!")
				return false
			end
			for _, w in pairs(subitems_per_professsion_to_check) do
				-- subset not present
				if MTSL_DATA[v][w] == nil then
					print(MTSLUI_FONTS.COLORS.TEXT.ERROR .. "MTSL: Could not load all the data needed for the addon! Missing " .. w .. " in profession " .. v .. ". Please reinstall the addon!")
					return false
				end
				-- loop each subset
				for _, x in pairs(MTSL_DATA[v][w]) do
					-- check for each translation in the item
					for _, z in pairs(langs_to_check) do
					-- name not translated to a language not present
						if x.name == nil or x["name"][z] == nil then
							print(MTSLUI_FONTS.COLORS.TEXT.ERROR .. "MTSL: Could not load all the data needed for the addon! Missing translation for " .. w .. " with id " .. x.id .. " in profession " .. v .. ". Please reinstall the addon!")
							return false
						end
					end
				end
			end
		end
		-- check the NPCs, objets & quests
		local objects_to_check = { "npcs", "objects", "quests", "zones", "factions", "continents" }
		for _, v in pairs(professions_to_check) do
			-- object not present
			if MTSL_DATA[v] == nil then
				print(MTSLUI_FONTS.COLORS.TEXT.ERROR .. "MTSL: Could not load all the data needed for the addon! Missing " .. v .. ". Please reinstall the addon!")
				return false
			end
		end

		return true
	end,

	----------------------------------------------------------------------------------------------------------
	-- Creates a deep copy of an object
	--
	-- @orig		Object		The original object to copy
	--
	-- returns		Object		A copy of the original object
	----------------------------------------------------------------------------------------------------------
	CopyObject = function (self, orig)
		local orig_type = type(orig)
		local copy
		if orig_type == 'table' then
			copy = {}
			for orig_key, orig_value in next, orig, nil do
				copy[self:CopyObject(orig_key)] = self:CopyObject(orig_value)
			end
			setmetatable(copy, self:CopyObject(getmetatable(orig)))
		else -- number, string, boolean, etc
			copy = orig
		end
		return copy
	end,

	----------------------------------------------------------------------------------------------------------
	-- Searches for an item by id in an unsorted list
	--
	-- @list		Array		The lsit in which to search
	-- @id			Number		The id to search for
	--
	-- returns		Object		The item with the corresponding id or nil if not found
	----------------------------------------------------------------------------------------------------------
	GetItemFromUnsortedListById = function(self, list, id)
		local i = 1
		-- lists are sorted on id (low to high)
		while list[i] ~= nil and list[i].id ~= id do
			i = i + 1
		end

		return list[i]
	end,

	----------------------------------------------------------------------------------------------------------
	-- Searches for an item in a named array by index
	--
	-- @list		Array		The lsit in which to search
	-- @index		Number		The index to search for
	--
	-- returns		Object		The item with the corresponding id or nil if not found
	----------------------------------------------------------------------------------------------------------
	GetItemFromNamedListByIdex = function(self, list, index)
		local i = 1

		if list ~= nil then
			for k, v in pairs(list) do
				if index == i then
					return v
				end
				i = i + 1
			end
		end

		return nil
	end,

	----------------------------------------------------------------------------------------------------------
	-- Searches for an item by id in a sorted list
	--
	-- @list		Array		The lsit in which to search
	-- @id			Number		The id to search for
	--
	-- returns		Object		The item with the corresponding id or nil if not found
	----------------------------------------------------------------------------------------------------------
	GetItemFromSortedListById = function(self, list, id)
		local i = 1
		-- lists are sorted on id (low to high) so stop when id in array >= id we search
		while list[i] ~= nil and list[i].id < id do
			i = i + 1
		end
		-- item found in list so return it
		if list[i] ~= nil and list[i].id == id then
			return list[i]
		end
		-- item not found in the list
		return nil
	end,

	----------------------------------------------------------------------------------------------------------
	-- Counts the number of elements in the list using number as indexes
	--
	-- @list		Array		The list to count items from
	--
	-- returns		Number		The amount of items
	----------------------------------------------------------------------------------------------------------
	CountItemsInArray = function(self, list)
		local amount = 0
		if list ~= nil then
			amount = #list
		end
		return amount
	end,

	----------------------------------------------------------------------------------------------------------
	-- Counts the number of elements in the list using Strings as indexes
	--
	-- @list		Array		The list to count items from
	--
	-- returns		Number		The amount of items
	----------------------------------------------------------------------------------------------------------
	CountItemsInNamedArray = function(self, list)
		local amount = 0
		if list == nil then
			return 0
		end
		for _, v in pairs(list) do
			amount = amount + 1
		end
		return amount
	end,

	-----------------------------------------------------------------------------------------------
	-- Gets an item (based on it's keyvalue) from an array
	--
	-- @array			Array		The array to search
	-- @key_name		String		The name of the key to use to compare values
	-- @key_value		Object		The value of the key to search
	--
	-- return			Object		Found item (nil if not found)
	------------------------------------------------------------------------------------------------
	GetItemFromArrayByKeyValue = function(self, array, key_name, key_value)
		if key_value ~= nil then
			for k, v in pairs(array) do
				if v[key_name] ~= nil and v[key_name] == key_value then
					return v
				end
			end
		end
		-- item not found
		return nil
	end,

	-----------------------------------------------------------------------------------------------
	-- Gets an item (based on it's keyvalue) from an array that uses localisation
	--
	-- @array			Array		The array to search
	-- @key_name		String		The name of the key to use to compare values
	-- @key_value		Object		The value of the key to search
	--
	-- return			Object		Found item (nil if not found)
	------------------------------------------------------------------------------------------------
	GetItemFromLocalisedArrayByKeyValue = function(self, array, key_name, key_value)
		if key_value ~= nil then
			for k, v in pairs(array) do
				if v[key_name] ~= nil and v[key_name][MTSLUI_CURRENT_LANGUAGE] == key_value then
					return v
				end
			end
		end
		-- item not found
		return nil
	end,

	-----------------------------------------------------------------------------------------------
	-- Gets all items (based on it's keyvalue) from an array
	--
	-- @array			Array		The array to search
	-- @key_name		String		The name of the key to use to compare values
	-- @key_value		Object		The value of the key to search
	--
	-- return			Object		Found item (nil if not found)
	------------------------------------------------------------------------------------------------
	GetAllItemsFromArrayByKeyValue = function(self, array, key_name, key_value)
		local items = {}
		if key_value ~= nil then
			for k, v in pairs(array) do
				if v[key_name] ~= nil and v[key_name] == key_value then
					table.insert(items, v)
				end
			end
		end
		-- item not found
		return items
	end,

	------------------------------------------------------------------------------------------------
	-- Searches an array to see if it contains a number
	--
	-- @list			Array		The list to search
	-- @number			Number		The number to search
	--
	-- return			boolean		Flag indicating if number is foundFound skill (nil if not  in list)
	------------------------------------------------------------------------------------------------
	ListContainsNumber = function(self, list, number)
		if list == nil then
			return false
		end
		local i = 1
		while list[i] ~= nil and list[i] ~= number do
			i = i + 1
		end
		return list[i] == nil
	end,

	------------------------------------------------------------------------------------------------
	-- Searches an array to see if it contains a key for given value
	--
	-- @list			Array		The list to search
	-- @key				String		The key to search
	--
	-- return			boolean		Flag indicating if number is foundFound skill (nil if not  in list)
	------------------------------------------------------------------------------------------------
	ListContainsKey = function(self, list, key)
		if list == nil then
			return false
		end
		for _, k in pairs(list) do
			if k == key then
				return true
			end
		end
		-- not found
		return false
	end,

	------------------------------------------------------------------------------------------------
	-- Searches an named array to see if it contains a key for given value
	--
	-- @list			Array		The list to search
	-- @key				String		The key to search
	--
	-- return			boolean		Flag indicating if number is foundFound skill (nil if not  in list)
	------------------------------------------------------------------------------------------------
	NamedListContainsKey = function(self, list, key)
		if list == nil then
			return false
		end
		for k, v in pairs(list) do
			if k == key then
				return true
			end
		end
		-- not found
		return false
	end,
}
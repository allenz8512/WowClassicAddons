
-- RecipeRadar.lua: main event code and general utility functions
-- $Id: RecipeRadar.lua 1060 2008-11-16 04:27:27Z jnmiller $
local L = LibStub("AceLocale-3.0"):GetLocale("RecipeRadarClassic")

RecipeRadar = LibStub("AceAddon-3.0"):NewAddon("RecipeRadar", "AceHook-3.0", "AceEvent-3.0")
local RecipeRadar     = RecipeRadar
local mapZonesByContinentID = {}
local COSMIC_MAP_ID = 947

local options = {
	type = "group",
	get = function(info) return RecipeRadar.db.profile[info[#info]] end,
	set = function(info, value) RecipeRadar.db.profile[info[#info]] = value end,
	name = L["Recipe Radar Classic"] .. " " .. RECIPERADAR_VERSION,
	args = {
		RealmAvailability = {
			type = "toggle",
			name = L["Check Availability for Alts"],
			desc = L["Check Availability for Alts"],
			width = "full",
			order = 1,
		},
		ShowMinimapButton = {
			type = "toggle",
			name = L["Show Minimap Button"],
			desc = L["Show Minimap Button"],
			width = "full",
			order = 2,
		set = function(info, value)
			RecipeRadar.db.profile[info[#info]] = value
			RecipeRadar_MinimapButton_Init()
		end,
		},
		gMinimapButtonPosition = {
			type = 'group',
			order = 4,
			dialogInline = true,
			name = L["Minimap Button Position"],
			desc = L["Minimap Button Position"],
			args = {
				MinimapButtonPosition = {
					type = 'range',
					order = 1,
					width = "double",
					name = L["Minimap Button Position"],
					desc = L["Minimap Button Position"],
		set = function(info, value)
			RecipeRadar.db.profile[info[#info]] = value
			RecipeRadar_MinimapButton_UpdatePosition()
		end,
					min = 0,
					max = 360, -- set to level cap + 3
					step = 1,
					disabled = function(info) return not RecipeRadar.db.profile.ShowMinimapButton end,
				},
			},
		},
		AutoSelectRegion = {
			type = "toggle",
			name = L["Auto-select Current Region"],
			desc = L["Auto-select Current Region"],
			width = "full",
			order = 5,
		},
		gAutoSelectRegion = {
			type = 'group',
			order = 7,
			dialogInline = true,
			name = L["Auto-select Current Region"],
			desc = L["Auto-select Current Region"],
			disabled = function(info) return RecipeRadar.db.profile.AutoSelectRegion end,
			width = "full",
			args = {
				CurrentContinent = {
					type = "select",
					name = "Continent", --L["Minimal skill for 'used in' tree"],
					desc = "", --L["Minimal skill advance for an item to show up in the 'used in' tree."],
					values = RecipeRadar_Continents,
					width = "double",
					order = 1,
				},
				CurrentRegion = {
					type = "select",
					name = "Region", --L["Minimal skill for 'used in' tree (shift)"],
					desc = "", --L["Minimal skill advance for an item to show up in the 'used in' tree if Shift is held."],
					values = function(info)
   local regions = { }

   if (RecipeRadar.db.profile.CurrentContinent == 0) then

      -- create sorted list of relevant instances
      for k, v in pairs(RecipeRadar_RegionData) do
         if (v.Continent == 0) then
            table.insert(regions, v.ZoneName)
         end
      end
      table.sort(regions)

   else

      -- otherwise just populate with all the continent's regions
      regions = RecipeRadar_GetMapZones(RecipeRadar.db.profile.CurrentContinent)

   end
return regions
					end,
					width = "double",
					order = 2,
				},
			},
		},
		AutoMapVendors = {
			type = "toggle",
			name = L["Auto-map Contributive Vendors"],
			desc = L["Auto-map Contributive Vendors"],
			width = "full",
			order = 8,
		},
	},
}

function RecipeRadar:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("RecipeRadarDB", {
		profile = {
			RealmAvailability = true,
			ShowMinimapButton = true,
			MinimapButtonPosition = 256,
			AutoSelectRegion = true,
			AutoMapVendors = false,
			CurrentProfession = L["Cooking"],
			CurrentRegion = 0,
			CurrentContinent = 0,
			ActiveTab = 1,
			Version = "1.0",
			Locked = false,
			PositionDebug = false,
		}
	}, true)

	LibStub("AceConfig-3.0"):RegisterOptionsTable("RecipeRadar", options)
	RecipeRadar_OptionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("RecipeRadar", "RecipeRadar")
end

function RecipeRadar_OnLoad(self)

   tinsert(UISpecialFrames, "RecipeRadarFrame")
   UIPanelWindows["RecipeRadarFrame"] = nil

   SLASH_RecipeRadar1 = "/rrdr"
   SLASH_RecipeRadar2 = "/reciperadar"
   SlashCmdList["RecipeRadar"] = RecipeRadar_SlashHandler

   self:RegisterEvent("VARIABLES_LOADED")
   self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
   self:RegisterEvent("TRADE_SKILL_SHOW")
   self:RegisterEvent("TRADE_SKILL_UPDATE")
   self:RegisterEvent("CRAFT_SHOW")
   self:RegisterEvent("CRAFT_UPDATE")
   self:RegisterEvent("CHAT_MSG_SKILL")
   self:RegisterEvent("CHAT_MSG_SYSTEM")
   self:RegisterEvent("PLAYER_ENTERING_WORLD")

   -- RecipeRadar_Print("Recipe Radar loaded!")

   self:RegisterEvent("ADDON_LOADED")

end

function RecipeRadar_OnEvent(self, event, ...)
	local arg1 = ...

   if (event == "VARIABLES_LOADED") then

      RecipeRadar_Globals_Init()
      RecipeRadar_MinimapButton_Init(self)
      RecipeRadar_Availability_Init()
      RecipeRadar_Maps_Init()
      RecipeRadar_SkillDB_Init()
      RecipeRadar_MainFrame_Init()
      RecipeRadar_DropDowns_Init()
      RecipeRadar_SelectFirstRecipe()

   elseif (event == "ZONE_CHANGED_NEW_AREA") then

      local mapID = C_Map.GetBestMapForUnit("player")
      if (not mapID) then return end
      if (RecipeRadar_RegionHasLearnableRecipe(mapID)) then
         RecipeRadar_MinimapButton_Flash(self)
      end
      RecipeRadar_Minimap_OnNewRegion()
      if (RecipeRadar.db.profile.AutoSelectRegion) then
         RecipeRadar_NewRegion(mapID)
      end

   elseif (event == "PLAYER_ENTERING_WORLD") then

      if (RecipeRadar_Filters.Teams["Horde"] == nil) then
         -- this should be the first run of the addon, so set team filters
         RecipeRadar_Filters.Teams[UnitFactionGroup("player")] = false
         RecipeRadar_Filters.Teams
               [RecipeRadar_GetOpposingFaction("player")] = true
      end

   elseif (event == "TRADE_SKILL_UPDATE" or event == "TRADE_SKILL_SHOW") then

      RecipeRadar_SkillDB_Refresh("trade")

   elseif (event == "CRAFT_SHOW" or event == "CRAFT_UPDATE") then

      RecipeRadar_SkillDB_Refresh("craft")

   elseif (event == "CHAT_MSG_SKILL") then

      -- arg1 = eg. "Your skill in Cooking has increased to 221."
      RecipeRadar_ParseChatMessage(arg1)

   elseif (event == "CHAT_MSG_SYSTEM") then

      -- arg1 = eg. "You have learned how to create a new item: Bristle Whisker Catfish."
      RecipeRadar_ParseChatMessage(arg1)

   end

end

function RecipeRadar_OnShow()

   -- IG_CHARACTER_INFO_OPEN
   PlaySound(839)

end

function RecipeRadar_OnHide()

   -- IG_CHARACTER_INFO_CLOSE
   PlaySound(840)
   RecipeRadarFrame:StopMovingOrSizing()

end

function RRS(lstring)
   local s = L[lstring]
   return s
end

function RecipeRadar_SlashHandler(msg)

   local _, _, cmd, arg1, arg2, arg3 =
         string.find(msg, "(%w+)%s*(%w*)%s*(%w*)%s*(%w*)")

   if (cmd == "debug") then

      if (arg1 == "vendor") then
         RecipeRadar.db.profile.PositionDebug = true
      end

      if (arg1 == "skills") then
         RecipeRadar_SkillDB_Print(arg2, arg3)
      end

      if (arg1 == "clear") then
         RecipeRadar_SkillDB_Clear(arg2)
      end

      return

   end

   if (cmd == "radar") then
  
      local mapID = C_Map.GetBestMapForUnit("player") 
      if (not mapID) then return end
      local region = RecipeRadar_RegionData[mapID]
      if (not region) then return end

      for _, vendor in pairs(region.Vendors) do

         RecipeRadar_Print(RecipeRadar_GetColoredTeamString(
               vendor.Team, vendor.Name) .. " (" ..
               string.format("%d", vendor.Coordinates[1].x * 100) .. ", " ..
               string.format("%d", vendor.Coordinates[1].y * 100) .. "):")

         table.sort(vendor.Recipes, RecipeRadar_CompareSkills)
         for k, v in pairs(vendor.Recipes) do
            RecipeRadar_PrintRecipe(k, v)
         end

      end

      return

   end

   RecipeRadar_Toggle()
   
end

-- Function to be called on selecting a new region to initialize the
-- main frame and any active filters.
function RecipeRadar_NewRegion(mapID)

   if (not mapID) then return end

   RecipeRadar.db.profile.CurrentRegion = mapID
   RecipeRadar.db.profile.CurrentContinent = RecipeRadar_GetCurrentContinent()
   RecipeRadar_InitVendorFilters()
   RecipeRadar_SelectFirstRecipe()
   RecipeRadar_FrameUpdate()

end

-- Returns whether the given region contains at least one recipe that
-- is learnable by the player or (optionally) alts.
function RecipeRadar_RegionHasLearnableRecipe(mapID)

   local region_data = RecipeRadar_RegionData[mapID]
   if (not region_data) then return false end

   for _, vendor in pairs(region_data.Vendors) do
      if (not RecipeRadar_IsVendorFiltered(vendor)) then
         for _, recipe in pairs(vendor.Recipes) do
            if (RecipeRadar_Availability_IsLearnable(recipe)) then
               return not RecipeRadar_IsRecipeFiltered(recipe)
            end
         end
      end
   end

   return false

end

-- Given a table of recipes, returns the number of recipes that are
-- learnable by the player or (optionally) alts.
function RecipeRadar_CountLearnableRecipes(recipes)

   if (not recipes) then return 0 end

   local total = 0
   
   for _, recipe in pairs(recipes) do
      if (RecipeRadar_Availability_IsLearnable(recipe)) then
         total = total + 1
      end
   end

   return total

end

-- Returns the index of the current region's continent, or 0 if the
-- player is not in a known map zone (eg. she's in an instance).
function RecipeRadar_GetCurrentContinent()

   local region = RecipeRadar_RegionData[RecipeRadar.db.profile.CurrentRegion]

   -- this mess derives the current continent from the current region
   if (region) then
      return region.Continent
   else
      -- region is not in our database, so we search for it
      for cont_id, _ in pairs( { RecipeRadar_GetMapContinents() } ) do
         for _, zone in pairs( { RecipeRadar_GetMapZones(cont_id) } ) do
            if (RecipeRadar.db.profile.CurrentRegion == zone) then
               return cont_id
            end
         end
      end
      return 0
   end

end

-- Converts a format string to one that LUA can understand.  I've
-- shamelessly stolen this from Innerfire in order to (I hope) prevent
-- the combat chatlog parsing errors.
function RecipeRadar_ConvertFormat(fmt)

   -- remove non-English format params like "%1$s"
   local find = string.gsub(fmt, "%%%d%$", "%%")

   -- remove any special characters with escaped versions
   find = string.gsub(find, "([%^%$%(%)%.%[%]%*%+%-%?])", "%%%1")

   -- finally replace standard "%s" and "%d"
   find = string.gsub(find, "%%s", "(.+)")
   find = string.gsub(find, "%%d", "(%%d+)")
   return find

end

-- Parses the input for a couple of known message formats to gain information
-- about changes in the character's skills.
function RecipeRadar_ParseChatMessage(msg)
   
   -- messages of the form 'Your skill in %s has increased to %d.'
   local start, _, prof, rank =
         string.find(msg, RecipeRadar_ConvertFormat(ERR_SKILL_UP_SI))
   if (start) then
      RecipeRadar_SkillDB_SetRank(prof, rank)
   end

   -- messages of the form 'You have unlearned %s.'
   start, _, prof =
         string.find(msg, RecipeRadar_ConvertFormat(ERR_SPELL_UNLEARNED_S))
   if (prof) then
      RecipeRadar_SkillDB_GetPlayerProfessions()[prof] = nil
   end
   
end

-- Foreach function that prints a recipe link and its cost.
function RecipeRadar_PrintRecipe(index, recipe)

   RecipeRadar_Print("   " .. RecipeRadar_GetHyperlinkByID(recipe.ID) ..
         ", " .. RecipeRadar_GetGSCString(recipe.Cost))

end

-- Returns a string describing an item link from an item ID.
function RecipeRadar_GetHyperlinkByID(id)

   local name, link, color = RecipeRadar_GetSafeItemInfo(id)
   return RecipeRadar_GetHyperlinkByParts(name, link, color)

end

-- Returns a string describing an item link from link components.
function RecipeRadar_GetHyperlinkByParts(name, link, color)

   return string.format("%s|H%s|h[%s]|h|r", color, link, name)

end

-- If an item is not in your local cache, GetItemInfo() fails.  To work
-- around this, we just return 'uncached' along with the details we do know.
-- If an item is recognized by the client, we cache the name so that future
-- requests don't end up fully 'uncached'.  The final return value is a
-- boolean indicating whether it was a cached ID.
function RecipeRadar_GetSafeItemInfo(id)

   local name, link, rarity, _, _, _, _, _, _, texture = GetItemInfo(id)
   
   -- initialize our name cache if necessary
   if (not RecipeRadar_NameCache) then RecipeRadar_NameCache = { } end

   if (name == nil) then
   
      -- set returned name according to whether we've already seen the id
      if (RecipeRadar_NameCache[id]) then
         name = RecipeRadar_NameCache[id]
      else
         name = L["Uncached Recipe"]
      end

      -- create our own tooltip for uncached items
      return name, "item:" .. id .. ":0:0:0:0:0:0:0",
            RecipeRadar_ColorToCode(RecipeRadar_Colors.UncachedRecipe),
            RecipeRadar_Colors.UncachedRecipe.r,
            RecipeRadar_Colors.UncachedRecipe.g,
            RecipeRadar_Colors.UncachedRecipe.b,
            GetItemIcon(id) or ([[Interface\Icons\]]..select(3, GetCurrencyInfo(id))),
            false  -- boolean to indicate whether we got a real recipe

   else
      RecipeRadar_NameCache[id] = name  -- cache names
      local r, g, b, colorcode = GetItemQualityColor(rarity)
      local _, _, link = string.find(link, "^|%x+|H(.+)|h%[.+%]")
      return name, link, colorcode, r, g, b, texture, true
   end

end

-- Get gold, silver, copper from total copper.
function RecipeRadar_GetGSC(copper)

   if (copper == nil) then
      copper = 0
   end

   local g = math.floor(copper / 10000)
   local s = math.floor((copper - (g * 10000)) / 100)
   local c = math.floor(copper - (g * 10000) - (s * 100))

   return g, s, c

end

-- Format text by color for gold, silver and copper (from EnhTooltip).
function RecipeRadar_GetGSCString(copper)

   local TEXT_NONE = "0"
   local GSC_GOLD = "ffd100"
   local GSC_SILVER = "e6e6e6"
   local GSC_COPPER = "c8602c"
   local GSC_FMT = "|cff%s%d|r"
   local GSC_PART = ".|cff%s%02d|r"
   local GSC_NONE = "|cffa0a0a0" .. TEXT_NONE .. "|r"

   local g, s, c = RecipeRadar_GetGSC(copper)
   local gsc = ""

   if (g > 0) then
      gsc = string.format(GSC_FMT, GSC_GOLD, g)
      if (s > 0) then
         gsc = gsc .. string.format(GSC_PART, GSC_SILVER, s)
      end
      if exact then
         gsc = gsc .. string.format(GSC_PART,GSC_COPPER, c)
      end
   elseif (s > 0) then
      gsc = string.format(GSC_FMT, GSC_SILVER, s)
      if (c > 0) then
         gsc = gsc .. string.format(GSC_PART, GSC_COPPER, c)
      end
   elseif (c > 0) then
      gsc = gsc .. string.format(GSC_FMT, GSC_COPPER, c)
   else
      gsc = GSC_NONE
   end

   return gsc

end

-- Returns the name of the player's opposing faction.
-- These strings shouldn't need to be localized.
function RecipeRadar_GetOpposingFaction()

   if (UnitFactionGroup("player") == "Alliance") then
      return "Horde"
   elseif (UnitFactionGroup("player") == "Horde") then
      return "Alliance"
   end
   return "Unknown"

end

-- Formats a string in the color specified by the key 'team'.
function RecipeRadar_GetColoredTeamString(team, s)

   if (not RecipeRadar_Teams[team]) then return end
   return RecipeRadar_ColorToCode(RecipeRadar_Teams[team].Color) ..
         s .. FONT_COLOR_CODE_CLOSE

end

-- Returns whether the skill is an applicable profession.
function RecipeRadar_IsProfession(skill_name)

   for name, _ in pairs(RecipeRadar_Professions) do
      if (name == skill_name) then
         return true
      end
   end
   
   return false

end

-- Returns the profession under which a trade skill specialty belongs,
-- or false if skill_name is not a known specialty.
function RecipeRadar_IsProfessionSpecialty(skill_name)

   for spec, prof in pairs(RecipeRadar_Specialties) do
      if (spec == skill_name) then
         return prof
      end
   end

   return false

end

-- Returns whether the supplied faction is one that Recipe Radar cares about.
function RecipeRadar_IsKnownFaction(faction)

   for _, name in pairs(RecipeRadar_Factions) do
      if (name == faction) then
         return true
      end
   end

   return false

end

-- Returns whether the given vendor has at least one unfiltered recipe.
function RecipeRadar_VendorHasRecipes(vendor)

   for _, recipe in pairs(vendor.Recipes) do
      if (not RecipeRadar_IsRecipeFiltered(recipe)) then
         return true
      end
   end

   return false

end

-- Returns whether the given recipe has at least one unfiltered location.
function RecipeRadar_RecipeHasLocations(recipe)

   for _, location in pairs(recipe.Locations) do
      if (not location.IsFiltered) then
         return true
      end
   end

   return false

end

-- Returns a string describing the requirements to buy the given recipe
-- according to the recipe's Notes/Faction member, or nil.
function RecipeRadar_GetRecipeReqsString(recipe)

   if (recipe.Faction and recipe.Faction ~= "") then
      return recipe.Faction .. ", " ..
            _G["FACTION_STANDING_LABEL" .. recipe.Level]
   end
   if (recipe.Specialty and recipe.Specialty ~= "") then
      return recipe.Specialty
   end
   if (recipe.Notes and recipe.Notes ~= "") then
      return RecipeRadar_FormatRecipeNote(recipe.Notes)
   end
   return nil

end

-- If the supplied recipe has an item cost, this function returns the
-- number of items and the item's ID, respectively.
function RecipeRadar_GetSpecialRecipeCost(recipe)

   local note_type, note_value = RecipeRadar_ParseNote(recipe.Notes)
   
   if (note_type == "CostItem" or note_type == "CostCurr") then
      local cost = recipe.Cost
      local need_link = false
      if (string.len(cost) == 1) then
         cost = " " .. cost  -- right-justify single digits
      end
      if (note_type == "CostItem") then
         need_link = true
         return cost, note_value + 0, need_link
      else
         return cost, note_value + 0, need_link
      end
   end

end

-- Parses a recipe note of the form 'Type: Value' and returns both
-- the type and value, respectively.
function RecipeRadar_ParseNote(note)

   if (not note) then return nil end
   return string.match(note, "(%w+): (%w+)")

end

-- Formats the subtext that applies to a few vendors.  include_parens is
-- a boolean that specifies whether the string should be in parens.
function RecipeRadar_FormatRecipeNote(note)

   local note_type, note_value = RecipeRadar_ParseNote(note)
   
   if (note_type == "Class") then
      return format(L["%s Only"], L[note_value])
   end

end

-- Formats the subtext that applies to a few vendors.  include_parens is
-- a boolean that specifies whether the string should be in parens.
function RecipeRadar_FormatVendorNote(note, include_parens)

   local note_type = RecipeRadar_ParseNote(note)
   if (note_type) then note = note_type end
   
   if (include_parens) then
      return format(PARENS_TEMPLATE, format(L["%s Vendor"], note))
   end
   return format(L["%s Vendor"], note)

end

-- Given a recipe name of the form 'Label: Name', returns 'Name'.  It
-- does this by checking for a ':' and looking ahead to the name.
-- Thanks to an SF.Net poster for verifying this with Unicode locales.
function RecipeRadar_TrimRecipeLabel(recipe_name)

   local label_end = string.find(recipe_name, ": ")
   if (label_end) then
      return string.sub(recipe_name, label_end + 2)
   else
      label_end = string.find(recipe_name, ":")
      if (label_end) then
         return string.sub(recipe_name, label_end + 1)
      end
   end
   return recipe_name

end

-- Sorts the vendors in a given region.
function RecipeRadar_SortVendors(region_data)

   if (region_data.IsVendorTableSorted) then
      return
   end

   table.sort(region_data.Vendors, RecipeRadar_CompareNames)
   region_data.IsVendorTableSorted = true

end

-- Sorts the recipes on a given vendor.
function RecipeRadar_SortRecipes(container)

   if (container.IsRecipeTableSorted) then
      return
   end

   table.sort(container.Recipes, RecipeRadar_CompareSkills)
   container.IsRecipeTableSorted = true

end

-- Sorts the locations on a given recipe.
function RecipeRadar_SortLocations(recipe_data)

   if (recipe_data.IsLocationsTableSorted) then
      return
   end

   table.sort(recipe_data.Locations, RecipeRadar_CompareRegions)
   recipe_data.IsRecipeTableSorted = true

end

-- Sort comparison function on required skill first, then the recipe's
-- ID (to insure a deterministic order).
function RecipeRadar_CompareSkills(recipe1, recipe2)

   if (recipe1.Skill == recipe2.Skill) then
      return recipe1.ID < recipe2.ID
   end
   return recipe1.Skill < recipe2.Skill
   
end

-- Sort comparison function on vendor names.
function RecipeRadar_CompareNames(vendor1, vendor2)

   return vendor1.Name < vendor2.Name

end

-- Sort comparison function on location names.
function RecipeRadar_CompareRegions(location1, location2)

   if (location1.Region == location2.Region) then
      return location1.Vendor < location2.Vendor
   end
   return location1.Region < location2.Region

end

-- Returns the result of the "<" operator on both major and minor portions.
function RecipeRadar_IsVersionLessThan(version1, version2)

   local major1, minor1 = string.match(version1, "(%d+)\.(%d+)")
   local major2, minor2 = string.match(version2, "(%d+)\.(%d+)")

   if (major1 ~= major2) then
      return major1+0 < major2+0
   end
   return minor1+0 < minor2+0
   
end

-- Returns a color code string converted from RGB decimals.
function RecipeRadar_ColorToCode(color)

   return string.format("|cff%02x%02x%02x",
         255 * color.r, 255 * color.g, 255 * color.b)

end

-- Returns the given string surrounded by the highlighted version of
-- base_color.
function RecipeRadar_HighlightString(s, base_color)

   local highlight = {
         r = math.min(1.0, base_color.r + RecipeRadar_Colors.Highlight),
         g = math.min(1.0, base_color.g + RecipeRadar_Colors.Highlight),
         b = math.min(1.0, base_color.b + RecipeRadar_Colors.Highlight), }
   return RecipeRadar_ColorToCode(highlight) .. s .. FONT_COLOR_CODE_CLOSE

end

-- Basic chat frame printing function.
function RecipeRadar_Print(msg, r, g, b)

   DEFAULT_CHAT_FRAME:AddMessage(msg,
         (r or RecipeRadar_Colors.MainFont.r),
         (g or RecipeRadar_Colors.MainFont.g),
         (b or RecipeRadar_Colors.MainFont.b))

end

-- Borrowded from libTourist until the libTourist Classic mod is available
function RecipeRadar_GetMapContinents()
	local continents = C_Map.GetMapChildrenInfo(COSMIC_MAP_ID, Enum.UIMapType.Continent, true)
	local retValue = {}
	for i, continentInfo in ipairs(continents) do
		--trace("Continent "..tostring(i)..": "..continentInfo.mapID..": ".. continentInfo.name)
		retValue[continentInfo.mapID] = continentInfo.name
	end
	return retValue
end

function RecipeRadar_GetMapZones(continentID)
	if mapZonesByContinentID[continentID] then
		-- Get from cache
		return mapZonesByContinentID[continentID]
	else	
		local mapZones = {}
		local recursive = (continentID ~= 947)  -- 947 = Azeroth, parent for Nazjatar zone -> get Nazjatar only and not all zones of the Azeroth continents
		local mapChildrenInfo = { C_Map.GetMapChildrenInfo(continentID, Enum.UIMapType.Zone, recursive) }
		for key, zones in pairs(mapChildrenInfo) do  -- don't know what this extra table is for
			for zoneIndex, zone in pairs(zones) do
				-- Get the localized zone name
				mapZones[zone.mapID] = zone.name
			end
		end

		-- Add to cache
		mapZonesByContinentID[continentID] = mapZones		
		
		return mapZones
	end
end

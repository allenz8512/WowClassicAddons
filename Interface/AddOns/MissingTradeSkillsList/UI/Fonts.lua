----------------------------------------------------------
-- Name: Fonts											--
-- Description: Contains everything about custom fonts	--
----------------------------------------------------------

MTSLUI_FONTS = {
	-- Fontsize of text
	SIZE = {
		SMALL = 10,
		NORMAL = 11,
		LARGE = 13,
	},
	-- Colors available
	COLORS = {
		-- Colors used for text
		TEXT = {
			SUCCESS = "|cff1eff00",
			NORMAL	= "|cffffffff",
			TITLE	= "|cffffff00",
			ERROR	= "|cffff0000",
			WARNING	= "|cffffa500",
		},
		-- Colors use to display money
		MONEY = {
			GOLD	= "|cffffd700",
			SILVER	= "|cffc7c7cf",
			COPPER	= "|cffeda55f"
		},
		-- Colors used for a font based on quality of an item
		ITEM_QUALITY = {
			POOR		= "|cff9d9d9d",
			COMMON		= "|cffffffff",
			UNCOMMON	= "|cff1eff00",
			RARE		= "|cff0070dd",
			EPIC		= "|cffa335ee",
			LEGENDARY	= "|cffff8000"
		},
		-- Colors used for a font based if an item is "available"/"learnable"
		AVAILABLE = {
			YES	= "|cff1eff00",
			NO	= "|cffff0000",
			LEARNABLE = "|cffffa500",
			ALL = "|cffffffff",
		},
        -- Colors of the color of factions
        FACTION = {
            HORDE = "|cff8c1616",
            NEUTRAL = "|cffffd700",
            ALLIANCE = "|cff144587",
        }
	},
	-- our saved fonts
	FONTS = {
		SMALL,
		NORMAL,
		LARGE,
	},
    -- Simulates a "tab"
    TAB = "     ",

	-------------------------------------------------------------------------
	-- Initialise the Fonts used in addon (only call after locale is set)
	-------------------------------------------------------------------------
	Initialise = function(self)
		local SIZE_SMALL = 10
		local SIZE_NORMAL = 11
		local SIZE_LARGE = 13
		self.FONTS.SMALL = CreateFont("MTSL_SmallText")
		self.FONTS.NORMAL = CreateFont("MTSL_NormalText")
		self.FONTS.LARGE = CreateFont("MTSL_LargeText")

		local font_names = {
			["frFR"] = "FRIZQT__",
			["enGB"] = "FRIZQT__",
			["enUS"] = "FRIZQT__",
			["deDE"] = "FRIZQT__",
			["ruRU"] = "FRIZQT___CYR",
			["esES"] = "FRIZQT__",
			["esMX"] = "FRIZQT__",
			["ptBR"] = "FRIZQT__",
			["koKR"] = "2002",
			["zhCN"] = "ARKai_T",
		}
		local font_name = font_names[GetLocale()]
		-- fall back to default
		if font_name == nil then
			font_name = "FRITZQ__"
		end
		self.FONTS.SMALL:SetFont("Fonts\\" .. font_name .. ".TTF", SIZE_SMALL, "OUTLINE")
		self.FONTS.NORMAL:SetFont("Fonts\\" .. font_name .. ".TTF", SIZE_NORMAL, "OUTLINE")
		self.FONTS.LARGE:SetFont("Fonts\\" .. font_name .. ".TTF", SIZE_LARGE, "OUTLINE")
	end,

	-------------------------------------------------------------------------
	-- Returns the color for text based on the item's quality
	--
	-- @item_quality	String	The quality of the item
	--
	-- returns			String	The color for the text for the given quality
	--------------------------------------------------------------------------
	GetTextColorByItemQuality = function (self, item_quality)
		if item_quality ~= nil then
			item_quality = string.upper(item_quality)
			-- Return the found quality
			if self.COLORS.ITEM_QUALITY[item_quality] ~= nil then
				return self.COLORS.ITEM_QUALITY[item_quality]
			end
		end
		-- default return common quality
		return self.COLORS.ITEM_QUALITY.COMMON
	end,
}

if ( not MarketWatcher or not MarketWatcher.Scan ) then
	return
end

local MarketWatcher = MarketWatcher;
local scan = MarketWatcher.Scan;
local displayedStats = scan.displayedStats;
local filteredStats = scan.filteredStats;

local stackTypes = { "single", "nonSingle", "fullStack", "nonFullStack" };

local filters = {
	{
		name = "buyoutPerUnitBelow",
		widgetType = "Money Input",
		widgetDefaultValue = 0,
		func = function(stats, widget)
			local price = MoneyInputFrame_GetCopper(widget);

			if ( stats.lowestBuyoutPerUnit and stats.lowestBuyoutPerUnit < price ) then
				return true;
			end
		end,
	},
	{
		name = "buyoutPerUnitAbove",
		widgetType = "Money Input",
		widgetDefaultValue = 0,
		func = function(stats, widget)
			local price = MoneyInputFrame_GetCopper(widget);

			if ( stats.lowestBuyoutPerUnit and stats.lowestBuyoutPerUnit > price ) then
				return true;
			end
		end,
	},
	{
		name = "noBuyoutables",
		func = function(stats)
			if ( stats.lowestBuyoutPerUnit == 0 ) then
				return true;
			end
		end,
	},
	{
		name = "priceAboveThreshold",
		func = function(stats)

			if (	(stats.bidThresholdMet ~= 0 or stats.buyoutThresholdMet ~= 0)
				and (stats.bidThresholdMet > -1 and stats.buyoutThresholdMet > -1)
			) then
				return true;
			end
		end,
	},
	{
		name = "priceBelowThreshold",
		func = function(stats)

			if (	(stats.bidThresholdMet ~= 0 or stats.buyoutThresholdMet ~= 0)
				and (stats.bidThresholdMet < 1 and stats.buyoutThresholdMet < 1)
			) then
				return true;
			end
		end,
	},
	{
		name = "noThreshold",
		func = function(stats)
			local itemInfo = MarketWatcher.GetItemInfoTable(stats.itemId);

			if ( itemInfo.bidThreshold == 0 and itemInfo.buyoutThreshold == 0 ) then
				return true;
			end
		end,
	},
	{
		name = "historicalBelowThis",
		widgetType = "Edit Box",
		editBoxLetters = 4,
		--editBoxNumeric = true,
		widgetDefaultValue = 0,
		func = function(stats, widget)
			for _, type in ipairs(stackTypes) do
				if ( stats[type] ) then

					if (	(stats[type].weeklyHistorical and stats[type].weeklyHistorical < widget:GetNumber())
						and (not stats[type].monthlyHistorical or stats[type].monthlyHistorical < widget:GetNumber())
					) then
						return true;
					end
				end
			end
		end,
	},
	{
		name = "historicalAboveThis",
		widgetType = "Edit Box",
		editBoxLetters = 4,
		--editBoxNumeric = true,
		widgetDefaultValue = 0,
		func = function(stats, widget)
			for _, type in ipairs(stackTypes) do
				if ( stats[type] ) then

					if (	(stats[type].weeklyHistorical and stats[type].weeklyHistorical > widget:GetNumber())
						and (not stats[type].monthlyHistorical or stats[type].monthlyHistorical > widget:GetNumber())
					) then
						return true;
					end
				end
			end
		end,
	},
	{
		name = "noHistoricalData",
		func = function(stats, widget)
			local hasHistorical;
			for _, type in ipairs(stackTypes) do
				if ( stats[type] and (stats[type].weeklyHistorical or stats[type].monthlyHistorical) ) then
					hasHistorical = true;
				end
			end

			if ( not hasHistorical ) then
				return true;
			end
		end,
	},
	{
		name = "unitsForSaleLess",
		widgetType = "Edit Box",
		editBoxLetters = 5,
		editBoxNumeric = true,
		widgetDefaultValue = 0,
		func = function(stats, widget)
			if ( stats.totalForSale < widget:GetNumber() ) then
				return true;
			end
		end,
	},
	{
		name = "unitsForSaleMore",
		widgetType = "Edit Box",
		editBoxLetters = 5,
		editBoxNumeric = true,
		widgetDefaultValue = 0,
		func = function(stats, widget)
			if ( stats.totalForSale > widget:GetNumber() ) then
				return true;
			end
		end,
	},
	{
		name = "lowestSeller",
		func = function(stats)
			for _, type in ipairs(stackTypes) do
				if ( stats[type] and stats[type].myBuyoutPerUnit and (not stats[type].theirBuyoutPerUnit or stats[type].myBuyoutPerUnit < stats[type].theirBuyoutPerUnit) ) then
					return true;
				end
			end
		end,
	},
	{
		name = "notLowestSeller",
		func = function(stats)

			for _, type in ipairs(stackTypes) do
				if ( stats[type] and stats[type].myBuyoutPerUnit and stats[type].theirBuyoutPerUnit and stats[type].myBuyoutPerUnit >= stats[type].theirBuyoutPerUnit ) then
					return true;
				end
			end
		end,
	},
	{
		name = "iAmNotSelling",
		func = function(stats)
			if ( not stats.myBuyoutPerUnit ) then
				return true;
			end
		end,
	},
	{
		name = "iCanNotCraft",
		func = function(stats)
			if ( not MarketWatcher.CanCreate(stats.itemId) ) then
				return true;
			end
		end,
	},
	{
		name = "iCanNotCraftMats",
		func = function(stats)
			local canCraft, numAvail = MarketWatcher.CanCreate(stats.itemId);
			if ( not canCraft or numAvail == 0 ) then
				return true;
			end
		end,
	},
	{
		name = "notRecentlySold",
		func = function(stats)
			local numBatchAuctions, totalAuctions = GetNumAuctionItems("owner");

			local _, itemLink, itemId, saleStatus, found;

			for i = 1, numBatchAuctions do

				_, _, _, _, _, _, _, _, _, _, _, _, _, saleStatus = GetAuctionItemInfo("owner", i);
				if ( saleStatus == 1 ) then
					itemLink = GetAuctionItemLink("owner", i);
					itemId = MarketWatcher.DecodeItemLink(itemLink);

					if ( itemId == stats.itemId ) then
						found = true;
					end
				end
			end

			if ( not found ) then
				return true;
			end
		end,
	},
	{
		name = "notInInventory",
		func = function(stats)
			if ( not MarketWatcher.FindItemInBags(stats.itemId) ) then
				return true;
			end
		end,
	},
	{
		name = "iLevel",
		widgetType = "Edit Box",
		editBoxLetters = 3,
		editBoxNumeric = true,
		widgetDefaultValue = 0,
		func = function(stats, widget)
			if ( MarketWatcher.GetItemInfoTable(stats.itemId).iLevel and MarketWatcher.GetItemInfoTable(stats.itemId).iLevel < widget:GetNumber() ) then
				return true;
			end
		end,
	},
	{
		name = "isPoor",
		func = function(stats)
			if ( MarketWatcher.GetItemInfoTable(stats.itemId).quality == 0 ) then
				return true;
			end
		end,
	},
	{
		name = "isCommon",
		func = function(stats)
			if ( MarketWatcher.GetItemInfoTable(stats.itemId).quality == 1 ) then
				return true;
			end
		end,
	},
	{
		name = "isUncommon",
		func = function(stats)
			if ( MarketWatcher.GetItemInfoTable(stats.itemId).quality == 2 ) then
				return true;
			end
		end,
	},
	{
		name = "isRare",
		func = function(stats)
			if ( MarketWatcher.GetItemInfoTable(stats.itemId).quality == 3 ) then
				return true;
			end
		end,
	},
	{
		name = "isEpic",
		func = function(stats)
			if ( MarketWatcher.GetItemInfoTable(stats.itemId).quality == 4 ) then
				return true;
			end
		end,
	},
	{
		name = "excludeKeywords",
		widgetType = "Edit Box",
		editBoxLetters = 255,
		widgetDefaultValue = "",
		func = function(stats, widget)
			local s = widget:GetText():lower();

			for w in string.gmatch(s, "%a+") do
				if ( MarketWatcher.GetItemInfoTable(stats.itemId).name:lower():match(w) ) then
					return true;
				end
			end
		end,
	},
};

function scan.SetupFilterWidgets()
	if ( MarketWatcherFilter1CheckButton ) then
		return
	end

	local config = MarketWatcher.GetConfig();

	if ( config.filtersApplied ) then
		MarketWatcherScanFrameApplyFiltersButton:SetText(DISABLE.." "..FILTERS);
	else
		MarketWatcherScanFrameApplyFiltersButton:SetText(MARKETWATCHER_APPLY_FILTERS);
	end

	local button, buttonName, widget, widgetName;
	local parent = MarketWatcherFiltersFrameScrollBarChildFrame;

	for i, filter in ipairs(filters) do

		buttonName = "MarketWatcherFilter"..i.."CheckButton";
		button = CreateFrame("CheckButton", buttonName, parent, "UICheckButtonTemplate");
		button:SetID(i);
		button:SetWidth(20);
		button:SetHeight(21);
		button:SetScript("OnClick", scan.FilterCheckButton_OnClick);

		if ( i == 1 ) then
			button:SetPoint("TOPLEFT", parent, "TOPLEFT", 5, 0);
		else
			if ( filters[i - 1].widgetType ) then
				button:SetPoint("TOPLEFT", _G["MarketWatcherFilter"..(i - 1).."CheckButton"], "BOTTOMLEFT", 0, -30);
			else
				button:SetPoint("TOPLEFT", _G["MarketWatcherFilter"..(i - 1).."CheckButton"], "BOTTOMLEFT", 0, -5);
			end
		end
		--button.tooltip = filter.tooltip;
		_G[button:GetName().."Text"]:SetText(MARKETWATCHER_FILTER_TEXT[filter.name]);
		_G[button:GetName().."Text"]:SetJustifyH("LEFT");


		if ( not config.filters ) then
			config.filters = {};
		end
		if ( config.filters[filter.name] and config.filters[filter.name].checked ) then
			button:SetChecked(1);
		end


		if ( filter.widgetType ) then
			
			widgetName = "MarketWatcherFilter"..i.."Widget";

			if ( filter.widgetType == "Edit Box" ) then
				
				widget = CreateFrame("EditBox", widgetName, parent, "InputBoxTemplate");
				widget:SetHeight(16);
				--widget:SetScale(.8);
				if ( filter.editBoxLetters ) then
					if ( filter.editBoxLetters > 28 ) then
						widget:SetWidth(250);
					else
						widget:SetWidth(8 + (filter.editBoxLetters * 7));
					end
					widget:SetMaxLetters(filter.editBoxLetters);
				else
					widget:SetWidth(100);
				end
				widget:SetAutoFocus(nil);
				if ( filter.editBoxNumeric ) then
					widget:SetNumeric(1);
				end
				widget:SetPoint("TOPLEFT", _G[buttonName], "BOTTOMLEFT", 30, -5);

				if ( config.filters[filter.name] and config.filters[filter.name].value ) then
					widget:SetText(config.filters[filter.name].value);
				elseif ( filter.widgetDefaultValue ) then
					widget:SetText(filter.widgetDefaultValue);
				end

			elseif ( filter.widgetType == "Money Input" ) then

				widget = CreateFrame("Frame", widgetName, parent, "MoneyInputFrameTemplate");
				_G[widgetName.."Gold"]:SetMaxLetters(6);
				widget:SetScale(.8);
				widget:SetPoint("TOPLEFT", _G[buttonName], "BOTTOMLEFT", 30, -5);

				if ( config.filters[filter.name] and config.filters[filter.name].value ) then
					MoneyInputFrame_SetCopper(widget, tonumber(config.filters[filter.name].value));
				elseif ( filter.widgetDefaultValue ) then
					MoneyInputFrame_SetCopper(widget, filter.widgetDefaultValue);
				end
			end
		end
	end
end

-- save filters
function scan.FilterFrame_OnHide(self)

	local config = MarketWatcher.GetConfig();
	local button, buttonName, widget, widgetName, widgetValue;

	for i, filter in ipairs(filters) do
		widget = _G["MarketWatcherFilter"..i.."Widget"];

		if ( widget ) then

			widgetValue = nil;

			if ( filter.widgetType == "Edit Box" ) then
				if ( filter.editBoxNumeric ) then
					widgetValue = widget:GetNumber();
				else
					widgetValue = widget:GetText();
				end

			elseif ( filter.widgetType == "Money Input" ) then
				widgetValue = MoneyInputFrame_GetCopper(widget);
			end

			if ( widgetValue ~= filter.widgetDefaultValue ) then
				if ( not config.filters[filter.name] ) then
					config.filters[filter.name] = {};
				end
				config.filters[filter.name].value = widgetValue;

			elseif ( config.filters[filter.name] ) then
				config.filters[filter.name].value = nil;
			end
		end

		if ( config.filters[filter.name] and not config.filters[filter.name].checked and not config.filters[filter.name].value ) then
			config.filters[filter.name] = nil;
		end
	end
end

function scan.FilterCheckButton_OnClick(self)
	local id = self:GetID();
	local config = MarketWatcher.GetConfig();

	if ( not config.filters[filters[id].name] ) then
		config.filters[filters[id].name] = {};
	end
	config.filters[filters[id].name].checked = self:GetChecked();

	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
end

function scan.ApplyButton_OnClick(self)
	local config = MarketWatcher.GetConfig();

	if ( config.filtersApplied ) then
		self:SetText(MARKETWATCHER_APPLY_FILTERS);
		config.filtersApplied = nil;
	else
		self:SetText(DISABLE.." "..FILTERS);
		config.filtersApplied = true;
	end

	scan.ApplyFilters();
end

function scan.ApplyFilters()

	local config = MarketWatcher.GetConfig();

	local filteredIndex = 1;
	local filteredData = filteredStats[filteredIndex];

	-- iterate filtered item stats
	while ( filteredData ) do

		if ( not config.filtersApplied ) then

			-- filters turned off; move all filtered items to display
			filteredStats[filteredIndex] = nil;
			table.insert(displayedStats, filteredData);
		else
			-- iterate filters
			for filterIndex, filter in ipairs(filters) do

				-- if this filter is on
				if ( config.filters[filter.name] and config.filters[filter.name].checked ) then

					-- if this item does not meet filter criteria
					if ( not filter.func(filteredData, _G["MarketWatcherFilter"..filterIndex.."Widget"]) ) then

						-- move back to display table
						tinsert(displayedStats, filteredData);
						tremove(filteredStats, filteredIndex);
						filteredIndex = filteredIndex - 1;
						break;
					end
				end
			end
		end

		filteredIndex = filteredIndex + 1;
		filteredData = filteredStats[filteredIndex];
	end

	if ( config.filtersApplied ) then

		-- iterate displayed items
		local displayedIndex = 1;
		local displayedData = displayedStats[displayedIndex];
		while ( displayedData ) do

			-- iterate filters
			for filterIndex, filter in ipairs(filters) do

				-- if filter is on
				if ( config.filters[filter.name] and config.filters[filter.name].checked ) then

					-- if item meets filter criteria
					if ( filter.func(displayedData, _G["MarketWatcherFilter"..filterIndex.."Widget"]) ) then
						tinsert(filteredStats, displayedData);
						tremove(displayedStats, displayedIndex);
						displayedIndex = displayedIndex - 1;
						break;
					end
				end
			end

			displayedIndex = displayedIndex + 1;
			displayedData = displayedStats[displayedIndex];
		end

		if (	(config.filters["iCanNotCraft"] and config.filters["iCanNotCraft"].checked)
			or (config.filters["iCanNotCraftMats"] and config.filters["iCanNotCraftMats"].checked)
		) then
			if ( GetNumTradeSkills() == 0 or GetTradeSkillInfo(GetFirstTradeSkill()) == nil ) then
				DEFAULT_CHAT_FRAME:AddMessage(MARKETWATCHER_NO_TRADE_SELECTED, 1, .1, .1);
			end
		end
	end

	scan.UpdateFilterResultText();
	scan.SortStats();
	scan.DisplayStats();
end

function scan.IsItemFiltered(itemId)
	for index, stats in ipairs(filteredStats) do
		if ( stats.itemId == itemId ) then
			return index;
		end
	end
end

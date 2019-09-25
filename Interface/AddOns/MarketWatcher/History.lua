if ( not MarketWatcher ) then
	return
end
local MarketWatcher = MarketWatcher;
if ( not MarketWatcher.History ) then
	MarketWatcher.History = {};
end
local history = MarketWatcher.History;

history.graphMode = true;

StaticPopupDialogs["MARKETWATCHER_DELETE_ITEM"] = {
	text = MARKETWATCHER_DELETE_ITEM_POPUP,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function(self)
		history.DeleteItem();
	end,
	showAlert = 1,
	timeout = 0,
	exclusive = 1,
	hideOnEscape = 1
};

StaticPopupDialogs["MARKETWATCHER_DELETE_SCAN"] = {
	text = MARKETWATCHER_DELETE_SCAN_POPUP,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function(self)
		history.DeleteScanEntryConfirmed();
	end,
	showAlert = 1,
	timeout = 0,
	exclusive = 1,
	hideOnEscape = 1
};

local sortedItems = {};
local NUM_BROWSE_TO_DISPLAY = 8;		-- because a popular addon that shall not be named doesn't want to play nice with others
local AUCTIONS_BUTTON_HEIGHT = 37;		-- note: changing this will not update History.xml, which literals 37 in two places.  Too lazy to do this cleanly
local hooked = false;


---------------------------------------------------------------------------------
--	History Tab Functions
---------------------------------------------------------------------------------

function history.SetHistoryTab()
	local tabs = 1;
	while ( _G["AuctionFrameTab"..tabs] ) do

		if ( _G["AuctionFrameTab"..tabs]:GetName() == "AuctionFrameTabMarketWatcherHistory" ) then
			return
		end
		tabs = tabs + 1;
	end

	local button = CreateFrame("Button", "AuctionFrameTabMarketWatcherHistory", AuctionFrame, "AuctionTabTemplate");
	button:SetText(MARKETWATCHER_HISTORY);
	PanelTemplates_TabResize(button, 0);
	PanelTemplates_DeselectTab(button);

	_G["AuctionFrameTab"..tabs] = AuctionFrameTabMarketWatcherHistory;

	button = _G["AuctionFrameTab"..tabs];
	button:SetParent("AuctionFrame");
	button:SetPoint("TOPLEFT", _G["AuctionFrameTab"..(tabs - 1)]:GetName(), "TOPRIGHT", -8, 0);
	button:SetID(tabs);
	button:Show();

	PanelTemplates_SetNumTabs(AuctionFrame, tabs);

	MarketWatcherHistoryFrame:SetParent(AuctionFrame);
	MarketWatcherHistoryFrame:SetPoint("TOPLEFT", AuctionFrame, "TOPLEFT", 0, 0);

	hooksecurefunc("AuctionFrameTab_OnClick", history.Tab_OnClick);
	button:SetScript("OnClick", AuctionFrameTab_OnClick);
end

function history.Tab_OnClick(self)
	if ( self ) then
		index = self:GetID();
	else
		MarketWatcherHistoryFrame:Hide();
		return
	end

	local tab = _G["AuctionFrameTab"..index];
	if ( tab and tab:GetName() == "AuctionFrameTabMarketWatcherHistory" ) then
		PanelTemplates_SetTab(AuctionFrame, index);
		MarketWatcherScanFrame:Hide();

		AuctionFrameTopLeft:SetTexture("Interface\\AuctionFrame\\UI-AuctionFrame-Browse-TopLeft");
		AuctionFrameTop:SetTexture("Interface\\AuctionFrame\\UI-AuctionFrame-Browse-Top");
		AuctionFrameTopRight:SetTexture("Interface\\AuctionFrame\\UI-AuctionFrame-Browse-TopRight");
		AuctionFrameBotLeft:SetTexture("Interface\\AuctionFrame\\UI-AuctionFrame-Browse-BotLeft");
		AuctionFrameBot:SetTexture("Interface\\AuctionFrame\\UI-AuctionFrame-Auction-Bot");
		AuctionFrameBotRight:SetTexture("Interface\\AuctionFrame\\UI-AuctionFrame-Bid-BotRight");

		MarketWatcherHistoryFrame:Show();
	else
		MarketWatcherHistoryFrame:Hide();
	end

	if ( not hooked ) then
		hooksecurefunc("ContainerFrameItemButton_OnModifiedClick", history.AltAddItem);
		--hooksecurefunc("ContainerFrameItemButton_OnEnter", history.ContainterItemOnEnter);
		hooksecurefunc(GameTooltip, "SetBagItem", history.ContainterItemOnEnter);
		hooked = true;
	end
end


---------------------------------------------------------------------------------
--	Main History Frame Functions
---------------------------------------------------------------------------------

function history.Frame_OnLoad(self)
	history.scan = 1;
	FauxScrollFrame_SetOffset(MarketWatcherHistoryFrameListScrollFrame, 0);
end

function history.Setup()
	history.SetHistoryTab();
	history.SetupHook();

	history.CreateGraphButtons();

	for itemId in MarketWatcher.WatchedItemsIterator() do

		-- if item doesn't have GetItemInfo() values, then try to get them
		if ( not MarketWatcher.GetItemInfoTable(itemId).name ) then
			MarketWatcher.SetWatchedItemInfo(itemId);
		end
	end
end

-- hook the setup function
history.SetupHook = MarketWatcher.Setup;
MarketWatcher.Setup = history.Setup;

function history.Frame_OnShow(self)
	history.SetupItemSelect();
	history.ItemSelect_Update();
	history.SetGraphMode(true);

	if ( not MarketWatcherHistoryFrameConfigButton and MarketWatcher.Config ) then
		MarketWatcher.Config.CreateButton("MarketWatcherHistoryFrameConfigButton", self, "TOPRIGHT", 50, -12);
	end

	UpdateAddOnMemoryUsage();
	local usedMem = GetAddOnMemoryUsage("MarketWatcher");
	usedMem = usedMem / 1000;
	MarketWatcherHistoryFrameMemoryUsageText:SetFormattedText(MARKETWATCHER_MEMORY_USE, GetAddOnMetadata("MarketWatcher", "Version"), usedMem);
end

function history.Frame_OnHide(self)
	if ( AucAdvanced and AucAdvanced.Scan and AucAdvanced.Scan.CompatibilityMode ) then
		AucAdvanced.Scan.CompatibilityMode(0, "MarketWatcher");
	end
end

function history.SetGraphMode(state)

	MarketWatcherHistoryFrameListGraphButton:Disable();

	if ( not MarketWatcher.GetItemInfoTable(history.itemSelected) or MarketWatcher.GetNumScans(history.itemSelected) < 2 ) then
		state = false;
		MarketWatcherHistoryFrameListGraphButton:Disable();

	elseif ( not MarketWatcher.Graph.CanDisplayGraph(history.itemSelected) ) then
		state = false;
		MarketWatcherHistoryFrameListGraphButton:Disable();
	else
		MarketWatcherHistoryFrameListGraphButton:Enable();
	end

	if ( state ) then
		history.graphMode = true;
		MarketWatcherHistoryFrameList:Hide();
		MarketWatcherHistoryFrameGraph:Show();

		history.RenderGraph();

		MarketWatcherHistoryFrameListGraphButton:SetText(MARKETWATCHER_LIST);
		MarketWatcherHistoryFrameDeleteButton:Disable();
	else
		history.graphMode = false;
		MarketWatcherHistoryFrameGraph:Hide();
		MarketWatcherHistoryFrameListGraphButton:SetText(MARKETWATCHER_GRAPH);
		MarketWatcherHistoryFrameDeleteButton:Enable();
		MarketWatcherHistoryFrameList:Show();
		history.Browse_Update();
	end
end

function history.SetItemSelected(itemId, skipUpdate)
	history.itemSelected = itemId;
	if ( not skipUpdate ) then
		history.ItemSelect_Update();
		history.SetGraphMode(true);
	end

	if ( MarketWatcher.GetNumScans(history.itemSelected) == 0 ) then
		MarketWatcherHistoryFrameDeleteButton:Disable();
	end
end

function history.ItemSelectButton_OnClick(self, button)
	if ( self.itemId ) then
		if ( button == "LeftButton" ) then
			
			history.SetItemSelected(self.itemId);

		elseif ( button == "RightButton" ) then

			if ( IsAltKeyDown() and IsControlKeyDown() ) then

				if ( MarketWatcher.GetNumScans(self.itemId) == 0 ) then

					MarketWatcher.RemoveWatchedItem(self.itemId);
					history.SetupItemSelect();
					history.SetItemSelected(nil);
				end
				return
			end

			if ( IsShiftKeyDown() and not MarketWatcher.Scan.status.scan ) then

				AuctionFrameTabMarketWatcherScan:Click();

				if ( MarketWatcher.Scan.status.complete ) then
					MarketWatcher.Scan.Scan("update", self.itemId);
				else
				
					local itemInfo = MarketWatcher.GetItemInfoTable(self.itemId);
					
					if ( itemInfo ) then
						local exact = true;
						if ( itemInfo.classID == LE_ITEM_CLASS_WEAPON or itemInfo.classID == LE_ITEM_CLASS_ARMOR ) then
							exact = false;
						end
						
						MarketWatcher.Scan.Scan("browse", {
							["name"] = itemInfo.name,
							["filter"] = MarketWatcher.ConstructFilterFromId(self.itemId),
							["qualityIndex"] = itemInfo.quality,
							["exact"] = exact,
						});
					end
				end

			else
				history.edit = self.itemId;
				MarketWatcherHistoryEditItemFrame:Show();
			end
		end
	end
end

function history.ListGraphButton_OnClick(self)
	if ( history.graphMode ) then
		history.SetGraphMode(false);
	else
		history.SetGraphMode(true);
	end
end

function history.CenterDisplayOn(itemId)

	local index;
	for sortedIndex, id in ipairs(sortedItems) do
		if ( id == itemId ) then
			index = sortedIndex;
			break;
		end
	end

	local maxValue = AUCTIONS_BUTTON_HEIGHT * (#sortedItems - NUM_BROWSE_TO_DISPLAY);
	local currentValue = MarketWatcherHistoryFrameItemSelectScrollFrameScrollBar:GetValue();

	if ( index ) then
		local itemValue = index * AUCTIONS_BUTTON_HEIGHT;

		if ( itemValue <= currentValue or itemValue > (currentValue + AUCTIONS_BUTTON_HEIGHT * NUM_BROWSE_TO_DISPLAY) ) then
			itemValue = itemValue - 3 * AUCTIONS_BUTTON_HEIGHT;
			if ( itemValue < 0 ) then
				itemValue = 0;
			end
			if ( itemValue > maxValue ) then
				itemValue = maxValue;
			end
			FauxScrollFrame_OnVerticalScroll(MarketWatcherHistoryFrameItemSelectScrollFrame, itemValue, AUCTIONS_BUTTON_HEIGHT, history.ItemSelect_Update);
		end
	end
end

function history.SetupItemSelect()
	for i in ipairs(sortedItems) do
		sortedItems[i] = nil;
	end

	for itemId in MarketWatcher.WatchedItemsIterator() do
		table.insert(sortedItems, itemId);
	end

	local totalWatched = #sortedItems;

	table.sort(sortedItems, function(a, b)
		local tableA = MarketWatcher.GetItemInfoTable(a);
		local tableB = MarketWatcher.GetItemInfoTable(b);

		if ( tableA.quality and tableB.quality and tableA.quality ~= tableB.quality ) then
			return tableA.quality > tableB.quality;

		elseif ( tableA.name and tableB.name ) then
			return tableA.name < tableB.name;

		else
			return a < b;
		end
	end);

	FauxScrollFrame_Update(MarketWatcherHistoryFrameItemSelectScrollFrame, totalWatched, NUM_BROWSE_TO_DISPLAY, AUCTIONS_BUTTON_HEIGHT);
end

function history.ItemSelect_Update()

	local itemInfo, buttonName, button, itemName, index, color, totalScans;
	local offset = FauxScrollFrame_GetOffset(MarketWatcherHistoryFrameItemSelectScrollFrame);
	local totalWatched = 0;

	totalWatched = #sortedItems;

	if ( not history.itemSelected ) then
		history.SetItemSelected(sortedItems[1], true);
	end

	for i, itemId in ipairs(sortedItems) do

		if ( i > offset and i <= (offset + NUM_BROWSE_TO_DISPLAY) ) then

			itemInfo = MarketWatcher.GetItemInfoTable(itemId);
			buttonName = "MarketWatcherHistoryFrameItemSelectButton"..(i - offset);
			button = _G[buttonName];

			color = ITEM_QUALITY_COLORS[itemInfo.quality or 1];
			itemName = _G[buttonName.."Name"];
			itemName:SetText(itemInfo.name or itemId);
			itemName:SetVertexColor(color.r, color.g, color.b);

			_G[buttonName.."ItemIconTexture"]:SetTexture(itemInfo.texture or "Interface\\Icons\\INV_Misc_QuestionMark.blp");

			if ( itemId == history.itemSelected ) then
				button:LockHighlight();
			else
				button:UnlockHighlight();
			end

			totalScans = MarketWatcher.GetNumScans(itemId);
			if ( totalScans > 0 ) then
				_G[buttonName.."ItemIconScrollTexture"]:Show();
			else
				_G[buttonName.."ItemIconScrollTexture"]:Hide();
			end

			button:Show();
			button.itemId = itemId;
		end
	end

	-- if some buttons need to be hidden for lack of items
	if ( (offset + NUM_BROWSE_TO_DISPLAY) > totalWatched ) then
		for i = ((totalWatched - offset) + 1), NUM_BROWSE_TO_DISPLAY do
			button = _G["MarketWatcherHistoryFrameItemSelectButton"..i];
			button:Hide();
			button.itemId = nil;
		end
	end
end

function history.Browse_Update()

	MarketWatcherHistoryFrameListScanTime:SetText("");
	MarketWatcherHistoryFrameListNumScansText:SetText("");
	MarketWatcherHistoryFrameListNoResultsText:Show();
	MarketWatcherHistoryFrameListNoResultsText:SetText("");

	for i = 1, NUM_BROWSE_TO_DISPLAY do
		button = _G["MarketWatcherHistoryFrameListButton"..i]:Hide();
	end

	local itemId = history.itemSelected;
	if ( not itemId ) then
		return
	end

	local totalScans = MarketWatcher.GetNumScans(itemId);
	if ( history.scan > totalScans ) then
		history.scan = totalScans;
	end
	if ( history.scan == 0 ) then
		history.scan = 1;
	end
	local scan = history.scan;
	local numAuctions = MarketWatcher.GetNumAuctions(itemId, scan);

	if ( totalScans > 1 ) then
		MarketWatcherHistoryFrameListPrevPageButton:Show();
		MarketWatcherHistoryFrameListNextPageButton:Show();
		MarketWatcherHistoryFrameListEndPageButton:Show();
		MarketWatcherHistoryFrameListStartPageButton:Show();
		if ( scan == 1 ) then
			MarketWatcherHistoryFrameListPrevPageButton:Disable();
			MarketWatcherHistoryFrameListStartPageButton:Disable();
		else
			MarketWatcherHistoryFrameListPrevPageButton:Enable();
			MarketWatcherHistoryFrameListStartPageButton:Enable();
		end
		if ( scan == totalScans ) then
			MarketWatcherHistoryFrameListNextPageButton:Disable();
			MarketWatcherHistoryFrameListEndPageButton:Disable();
		else
			MarketWatcherHistoryFrameListNextPageButton:Enable();
			MarketWatcherHistoryFrameListEndPageButton:Enable();
		end
	else
		MarketWatcherHistoryFrameListPrevPageButton:Hide();
		MarketWatcherHistoryFrameListNextPageButton:Hide();
		MarketWatcherHistoryFrameListEndPageButton:Hide();
		MarketWatcherHistoryFrameListStartPageButton:Hide();
	end
	FauxScrollFrame_Update(MarketWatcherHistoryFrameListScrollFrame, numAuctions, NUM_BROWSE_TO_DISPLAY, AUCTIONS_BUTTON_HEIGHT);

	if ( totalScans == 0 ) then
		MarketWatcherHistoryFrameListNoResultsText:SetText(MARKETWATCHER_NOSCANS);
		return
	end

	local scanDatestamp = MarketWatcher.GetScanTimestamp(itemId, scan);
	local itemInfo = MarketWatcher.GetItemInfoTable(itemId);
	local offset = FauxScrollFrame_GetOffset(MarketWatcherHistoryFrameListScrollFrame);

	local button, buttonName, iconTexture, itemName, color, itemCount, moneyFrame, buyoutFrame, buyoutFrameText, buyoutMoney, buttonHighlight;
	local _, index, scanEntry, count, minBid, buyoutPrice, timeleft, bidAmount, owner, instances, displayedPrice;

	MarketWatcherHistoryFrameListNumScansText:SetText(format(MARKETWATCHER_NUMSCANS, scan, totalScans));
	MarketWatcherHistoryFrameListScanTime:SetText(format(MARKETWATCHER_SCANTIME, date("%A %B %d %Y %H:%M", scanDatestamp), SecondsToTime(time(date("*t")) - scanDatestamp, true)));

	if ( numAuctions > 0 ) then
		MarketWatcherHistoryFrameListNoResultsText:Hide();

	elseif ( numAuctions == 0 ) then
		MarketWatcherHistoryFrameListNoResultsText:SetText(MARKETWATCHER_NOAUCTIONS);
	end

	for i = 1, NUM_BROWSE_TO_DISPLAY do
		index = offset + i;
		button = _G["MarketWatcherHistoryFrameListButton"..i];
		-- Show or hide auction buttons
		if ( index > numAuctions ) then
			button:Hide();
		else
			button:Show();

			buttonName = "MarketWatcherHistoryFrameListButton"..i;
			scanEntry = offset + i;
			count, owner, buyoutPrice, _, displayedPrice, timeleft, instances, _, bidAmount = MarketWatcher.GetAuction(itemId, scan, scanEntry);

			-- Set name and quality color
			color = ITEM_QUALITY_COLORS[itemInfo.quality or 1];
			itemName = _G[buttonName.."Name"];
			itemName:SetText(itemInfo.name or "");
			itemName:SetVertexColor(color.r, color.g, color.b);

			-- Set closing time
			_G[buttonName.."ClosingTimeText"]:SetText(AuctionFrame_GetTimeLeftText(timeleft));
			_G[buttonName.."ClosingTime"].tooltip = AuctionFrame_GetTimeLeftTooltipText(timeleft);

			-- Set item texture, count, and usability
			iconTexture = _G[buttonName.."ItemIconTexture"];
			iconTexture:SetTexture(itemInfo.texture or "Interface\\Icons\\INV_Misc_QuestionMark.blp");
			itemCount = _G[buttonName.."ItemCount"];
			if ( count > 1 ) then
				itemCount:SetText(count);
				itemCount:Show();
			else
				itemCount:Hide();
			end

			-- set number of auctions
			if ( instances > 1 ) then
				_G[buttonName.."Level"]:SetText(instances);
			else
				_G[buttonName.."Level"]:SetText("");
			end

			-- Set high bid
			moneyFrame = _G[buttonName.."MoneyFrame"];
			MoneyFrame_Update(moneyFrame:GetName(), displayedPrice);

			buyoutFrame = _G[buttonName.."BuyoutFrame"];
			buyoutFrameText = _G[buttonName.."BuyoutFrameText"];
			if ( buyoutPrice > 0 ) then
				moneyFrame:SetPoint("RIGHT", button, "RIGHT", 10, 10);
				buyoutMoney = _G[buyoutFrame:GetName().."Money"];
				MoneyFrame_Update(buyoutMoney, buyoutPrice);

				if ( owner ~= "" and MarketWatcher.ItemBoughtOut(itemId, scan, scanEntry) ) then
					buyoutFrameText:SetText(MARKETWATCHER_SOLD);
				elseif ( bidAmount > 0 ) then
					buyoutFrameText:SetText(MARKETWATCHER_HASBID);
				else
					buyoutFrameText:SetText("");
				end

				buyoutFrame:Show();
			else
				moneyFrame:SetPoint("RIGHT", button, "RIGHT", 10, 3);
				if ( bidAmount > 0 ) then
					buyoutFrameText:SetText(MARKETWATCHER_HASBID);
				else
					buyoutFrameText:SetText("");
				end
				buyoutFrame:Hide();
			end
			_G[buttonName.."HighBidder"]:SetText(owner);

			button.bidAmount = displayedPrice;
			button.buyoutPrice = buyoutPrice;
			button.itemCount = count;
		end
	end
end

function history.DeleteScanEntryConfirmed()
	MarketWatcher.DeleteScanEntry(history.itemSelected, history.scan);
	history.Browse_Update();
end

-- auction history tooltip function (item name, buyout cost, buyout per unit cost)
function history.ButtonItem_OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	
	local offset = FauxScrollFrame_GetOffset(MarketWatcherHistoryFrameListScrollFrame);
	local itemId = history.itemSelected;
	local scanIndex = history.scan;
	local auctionIndex = offset + self:GetParent():GetID();

	if ( not itemId or not scanIndex ) then
		return
	end

	local itemMods, uId;
	local count, _, buyoutPrice, buyoutPricePerUnit, currentBid, _, _, minBid, bidAmount = MarketWatcher.GetAuction(itemId, scanIndex, auctionIndex);

	if ( count > 1 ) then

		local itemInfo = MarketWatcher.GetItemInfoTable(itemId);
		local color = ITEM_QUALITY_COLORS[ itemInfo.quality or 1 ];
		GameTooltip:AddLine( itemInfo.name or UNKNOWN, color.r, color.g, color.b );

		GameTooltip:AddLine("|n");
		SetTooltipMoney(GameTooltip, ceil(currentBid / count), "STATIC", AUCTION_TOOLTIP_BID_PREFIX);
		if ( buyoutPrice > 0 ) then
			SetTooltipMoney(GameTooltip, ceil(buyoutPricePerUnit), "STATIC", AUCTION_TOOLTIP_BUYOUT_PREFIX);
		end

		GameTooltip:Show();
		GameTooltip_ShowCompareItem();

		if ( MarketWatcher.debug ) then
			GameTooltip:AddLine("|n");
		end
	end

	if ( MarketWatcher.debug ) then
		_, _, _, _, _, _, _, _, _, itemMods, uId = MarketWatcher.GetAuction(itemId, scanIndex, auctionIndex);

		local p, pScan, pAuc = MarketWatcher.IsAPointer(itemId, scanIndex, auctionIndex);

		if ( p ) then
			GameTooltip:AddLine("Pointing to scan #"..pScan..", auction #"..pAuc);
		end

		GameTooltip:AddLine("uId: "..uId.."   item Mods: "..itemMods);
		GameTooltip:Show();
	end
end

function history.PeriodDropDown_OnLoad(self)
	UIDropDownMenu_Initialize(self, history.PeriodDropDown_Initialize);
	UIDropDownMenu_SetSelectedValue(MarketWatcherHistoryFrameGraphPeriodDropDown, 1);
end

function history.PeriodDropDown_Initialize()
	local info = UIDropDownMenu_CreateInfo();
--	info.text = ALL;
--	info.value = -1;
--	info.func = history.PeriodDropDown_OnClick;
--	UIDropDownMenu_AddButton(info);
	for i = 1, #MARKETWATCHER_PERIODS  do
		info.text = MARKETWATCHER_PERIODS[i];
		info.value = i;
		info.func = history.PeriodDropDown_OnClick;
		info.checked = nil;
		UIDropDownMenu_AddButton(info);
	end
end

function history.PeriodDropDown_OnClick(self)
	UIDropDownMenu_SetSelectedValue(MarketWatcherHistoryFrameGraphPeriodDropDown, self.value);
	if ( MarketWatcher.GetConfig().graphSettings ) then
		MarketWatcher.GetConfig().graphSettings["timePeriod"] = self.value;
	end
	history.RenderGraph();
end

function history.RenderGraph()
	if ( MarketWatcher.Graph ) then

		local timePeriod = UIDropDownMenu_GetSelectedValue(MarketWatcherHistoryFrameGraphPeriodDropDown);

		timePeriod = time() - (MarketWatcher.Graph.periods[timePeriod] or time());

		MarketWatcher.Graph.DisplayGraph(	history.itemSelected,
							timePeriod,
							history.GetGraphButtonStatus(),
							"MarketWatcherHistoryFrameGraphFrame",
							MarketWatcherHistoryFrameGraph,
							"TOPLEFT", "TOPLEFT", 195, -110, 450, 290
		);
	end
end

function history.CreateGraphButtons(parent, x, y)
	
	if ( not parent ) then
		parent = MarketWatcherHistoryFrameGraph;
	end
	local parentName = parent:GetName();

	if ( not MarketWatcher.Graph or _G[parentName.."SeriesText1"] ) then
		return
	end

	if ( not x ) then
		x = -90;
		y = -150;
	end

	if ( not MarketWatcher.GetConfig().graphSettings ) then
		MarketWatcher.GetConfig().graphSettings = MarketWatcher.Graph.defaultMethods;
	end
	local buttonSettings = MarketWatcher.GetConfig().graphSettings;

	local i, j = 0, 0;
	local label, button, labelName, buttonName, color;

	for seriesName in MarketWatcher.Graph.SeriesNameIterator() do
		
		i = i + 1;
		labelName = parentName.."SeriesText"..i;
		label = parent:CreateFontString(labelName, "OVERLAY", "GameFontHighlight");
		if ( i == 1 ) then
			label:SetPoint("TOPLEFT", parent, "TOPRIGHT", x, y);
		elseif ( i == 3 ) then
			label:SetPoint("TOPLEFT", _G[parentName.."SeriesText1"], "TOPLEFT", 80, 0);
		else
			label:SetPoint("TOPLEFT", _G[buttonName], "BOTTOMLEFT", 0, -10);
		end
		label:SetText(MARKETWATCHER_SERIES_TYPES[seriesName]);

		j = 0;
		for name, tooltip, colorTable in MarketWatcher.Graph.MethodInfoIterator() do

			j = j + 1;
			buttonName = parentName.."Series"..i.."MethodCheckBox"..j;
			button = CreateFrame("CheckButton", buttonName, parent, "UICheckButtonTemplate");
			button:SetWidth(20);
			button:SetHeight(21);
			if ( j == 1 ) then
				button:SetPoint("TOPLEFT", _G[labelName], "BOTTOMLEFT", 0, -5);
			else
				button:SetPoint("TOPLEFT", _G[parentName.."Series"..i.."MethodCheckBox"..j - 1], "BOTTOMLEFT", 0, 0);
			end
			button:SetScript("OnClick", function() PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON); MarketWatcher.History.RenderGraph(); end);
			button:SetScript("OnEnter", function(self) GameTooltip:SetOwner(self, "ANCHOR_RIGHT"); GameTooltip:SetText(self.tooltip, nil, nil, nil, nil, 1); end);
			button:SetScript("OnLeave", function() GameTooltip:Hide(); end);
			button.tooltip = tooltip;
			button.method = j;
			button.series = seriesName;
			_G[button:GetName().."Text"]:SetText(name);

			color = colorTable[seriesName] or colorTable["default"];
			_G[button:GetName().."Text"]:SetTextColor(color[1], color[2], color[3]);

			if ( buttonSettings[seriesName] and buttonSettings[seriesName][j] ) then
				button:SetChecked(1);
			end
		end
	end

	UIDropDownMenu_SetSelectedValue( MarketWatcherHistoryFrameGraphPeriodDropDown, buttonSettings["timePeriod"] or 1 );
	UIDropDownMenu_SetText( MarketWatcherHistoryFrameGraphPeriodDropDown, MARKETWATCHER_PERIODS[ buttonSettings["timePeriod"] ] or MARKETWATCHER_PERIODS[1] );
end

function history.GetGraphButtonStatus(parent)
	if ( not parent ) then
		parent = MarketWatcherHistoryFrameGraph;
	end
	local parentName = parent:GetName();

	local s, m = 1, 1;

	local methods = MarketWatcher.GetConfig().graphSettings;

	local button = _G[parentName.."Series"..s.."MethodCheckBox"..m];
	while ( button ) do

		while ( button ) do
			if ( button:GetChecked() ) then
				if ( not methods[button.series] ) then
					methods[button.series] = {};
				end

				methods[button.series][m] = true;
			else
				if ( methods[button.series] and methods[button.series][m] ) then
					methods[button.series][m] = nil;
				end
			end
			m = m + 1;
			button = _G[parentName.."Series"..s.."MethodCheckBox"..m];
		end
		m = 1;
		s = s + 1;
		button = _G[parentName.."Series"..s.."MethodCheckBox"..m];
	end

	return methods;
end

---------------------------------------------------------------------------------
--	Edit Item Functions
---------------------------------------------------------------------------------

function history.EditItemButton_OnClick()
	MarketWatcherHistoryEditItemFrame:Show();
end

function history.EditItemFrame_OnShow(self)
	local text;

	if ( not history.edit ) then
		self:Hide();
		return
	end

	local item = MarketWatcher.GetItemInfoTable(history.edit);
	if ( item ) then

		-- update item info in case icon or other info changes
		if ( GetItemInfo(history.edit) ) then
			MarketWatcher.SetWatchedItemInfo(history.edit);
		end

		MarketWatcherHistoryEditItemFrameIcon:SetTexture(item.texture or "Interface\\Icons\\INV_Misc_QuestionMark.blp");
		
		local color = ITEM_QUALITY_COLORS[item.quality or 1];
		text = MarketWatcherHistoryEditItemFrameText;
		text:SetText(item.name or UNKNOWN);
		text:SetVertexColor(color.r, color.g, color.b);
		MarketWatcherHistoryEditItemFrameIdText:SetText(ID.." #"..history.edit);

		MoneyInputFrame_SetCopper(MarketWatcherHistoryEditItemFrameBidThreshold, item.bidThreshold);
		MoneyInputFrame_SetCopper(MarketWatcherHistoryEditItemFrameBuyoutThreshold, item.buyoutThreshold);

		if ( item.summaryStackOnly ) then
			MarketWatcherHistoryEditItemFrameSummaryStackOnlyCheckBox:SetChecked(1);
		else
			MarketWatcherHistoryEditItemFrameSummaryStackOnlyCheckBox:SetChecked(nil);
		end
		if ( item.noneOnSale ) then
			MarketWatcherHistoryEditItemFrameNoneOnSaleCheckBox:SetChecked(1);
		else
			MarketWatcherHistoryEditItemFrameNoneOnSaleCheckBox:SetChecked(nil);
		end
		if ( item.summaryConditional == "below" ) then
			history.EditItemFrameRadio_OnClick(2);
		elseif ( item.summaryConditional == "above" ) then
			history.EditItemFrameRadio_OnClick(3);
		else
			item.summaryConditional = "no";
			history.EditItemFrameRadio_OnClick(1);
		end

		if ( item.recordHistory ) then
			MarketWatcherHistoryEditItemFrameRecordCheckBox:SetChecked(1);

			history.ToggleRecordOptions(true);
		else
			MarketWatcherHistoryEditItemFrameRecordCheckBox:SetChecked(nil);

			history.ToggleRecordOptions(false);
		end
		MarketWatcherHistoryEditItemFrameMaxAgeEditBox:SetText(item.maxAge or 0);
		MarketWatcherHistoryEditItemFrameMaxEntriesEditBox:SetText(item.maxEntries or 0);
		if ( item.stackOnly ) then
			MarketWatcherHistoryEditItemFrameStackOnlyCheckBox:SetChecked(1);
		else
			MarketWatcherHistoryEditItemFrameStackOnlyCheckBox:SetChecked(nil);
		end

		local scans = MarketWatcher.GetNumScans(history.edit);
		MarketWatcherHistoryEditItemFrameStatusText:SetText(format(MARKETWATCHER_EDITSTATUS, scans));
	else
		self:Hide();
	end
end

function history.ToggleRecordOptions(switch)

	if ( switch ) then
		MarketWatcherHistoryEditItemFrameStackOnlyCheckBox:Enable();
		MarketWatcherHistoryEditItemFrameStackOnlyCheckBoxText:SetVertexColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);

		--MarketWatcherHistoryEditItemFrameMaxAgeEditBox:Enable();
		MarketWatcherHistoryEditItemFrameMaxAgeEditBoxText:SetVertexColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);

		--MarketWatcherHistoryEditItemFrameMaxEntriesEditBox:Enable();
		MarketWatcherHistoryEditItemFrameMaxEntriesEditBoxText:SetVertexColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
	else
		MarketWatcherHistoryEditItemFrameStackOnlyCheckBox:Disable();
		MarketWatcherHistoryEditItemFrameStackOnlyCheckBoxText:SetVertexColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b);

		--MarketWatcherHistoryEditItemFrameMaxAgeEditBox:Disable();
		MarketWatcherHistoryEditItemFrameMaxAgeEditBoxText:SetVertexColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b);

		--MarketWatcherHistoryEditItemFrameMaxEntriesEditBox:Disable();
		MarketWatcherHistoryEditItemFrameMaxEntriesEditBoxText:SetVertexColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b);
	end
end

function history.EditItemFrameRadio_OnClick(id)
	MarketWatcherHistoryEditItemFrameNoThresholdRadio:SetChecked(nil);
	MarketWatcherHistoryEditItemFrameBelowThresholdRadio:SetChecked(nil);
	MarketWatcherHistoryEditItemFrameAboveThresholdRadio:SetChecked(nil);

	if ( id == 2 ) then
		MarketWatcherHistoryEditItemFrameBelowThresholdRadio:SetChecked(1);
	elseif ( id == 3 ) then
		MarketWatcherHistoryEditItemFrameAboveThresholdRadio:SetChecked(1);
	else
		MarketWatcherHistoryEditItemFrameNoThresholdRadio:SetChecked(1);
	end
end

function history.EditItemFrameOkayButton_OnClick()
	local name, itemId, itemLink, bidThreshold, buyoutThreshold, stackOnly, recordHistory, maxEntries, maxAge, summaryConditional, summaryStackOnly, noneOnSale;

	bidThreshold = MoneyInputFrame_GetCopper(MarketWatcherHistoryEditItemFrameBidThreshold);
	buyoutThreshold = MoneyInputFrame_GetCopper(MarketWatcherHistoryEditItemFrameBuyoutThreshold);

	if ( MarketWatcherHistoryEditItemFrameRecordCheckBox:GetChecked() ) then
		recordHistory = true;
	else
		recordHistory = false;
	end
	if ( MarketWatcherHistoryEditItemFrameStackOnlyCheckBox:GetChecked() ) then
		stackOnly = true;
	else
		stackOnly = false;
	end

	if ( MarketWatcherHistoryEditItemFrameNoneOnSaleCheckBox:GetChecked() ) then
		noneOnSale = true;
	else
		noneOnSale = false;
	end
	if ( MarketWatcherHistoryEditItemFrameNoThresholdRadio:GetChecked() ) then
		summaryConditional = "no";
	elseif ( MarketWatcherHistoryEditItemFrameBelowThresholdRadio:GetChecked() ) then
		summaryConditional = "below";
	elseif( MarketWatcherHistoryEditItemFrameAboveThresholdRadio:GetChecked() ) then
		summaryConditional = "above";
	end
	if ( MarketWatcherHistoryEditItemFrameSummaryStackOnlyCheckBox:GetChecked() ) then
		summaryStackOnly = true;
	else
		summaryStackOnly = false;
	end

	maxAge = MarketWatcherHistoryEditItemFrameMaxAgeEditBox:GetNumber();
	maxEntries = MarketWatcherHistoryEditItemFrameMaxEntriesEditBox:GetNumber();

	if ( history.edit ) then
		MarketWatcher.EditWatchedItem(history.edit, bidThreshold, buyoutThreshold, stackOnly, recordHistory, maxEntries, maxAge, summaryConditional, summaryStackOnly, noneOnSale);
	end

	MarketWatcherHistoryEditItemFrame:Hide();
	history.edit = nil;
end

function history.DeleteItem()
	if ( history.edit ) then
		MarketWatcher.RemoveWatchedItem(history.edit);
	end

	MarketWatcherHistoryEditItemFrame:Hide();
	history.edit = nil;

	history.SetupItemSelect();
	history.SetItemSelected(nil);
end

function history.AltAddItem(self, button)

	if ( MarketWatcherHistoryFrame:IsVisible() and button == "LeftButton" and IsAltKeyDown() and not CursorHasItem() ) then

		local itemLink = GetContainerItemLink(self:GetParent():GetID(), self:GetID());
		local itemId = MarketWatcher.DecodeItemLink(itemLink);

		local itemInfo, tempItem = MarketWatcher.GetItemInfoTable(itemId);

		if ( itemId and GetItemInfo(itemId) and (not itemInfo or tempItem) ) then
			MarketWatcher.AddWatchedItem(itemId);

			history.SetupItemSelect();
			history.SetItemSelected(itemId);
			history.CenterDisplayOn(itemId);
			
			DEFAULT_CHAT_FRAME:AddMessage(format(MARKETWATCHER_ADDED_TO_WATCHED, MarketWatcher.GetItemInfoTable(itemId).name), 0, 1, 1);
		end
	end
end

function history.ContainterItemOnEnter(self)

	if ( MarketWatcherHistoryFrame:IsVisible() and not CursorHasItem() ) then
		GameTooltip:AddLine(MARKETWATCHER_TOOLTIP19, 1, 1, 1);
		GameTooltip:Show();
	end
end


---------------------------------------------------------------------------------
--	Add Item Functions
---------------------------------------------------------------------------------

function history.AddItemFrame_OnShow(self)
	local text;

	-- add new item

	MarketWatcherHistoryAddItemFrameTitle:SetText(MARKETWATCHER_ADDITEM);

	text = MarketWatcherHistoryAddItemFrameText;
	text:SetText(MARKETWATCHER_ADDITEMTEXT);
	text:SetVertexColor(1, 1, 1);

	self.itemLink = nil;
	MarketWatcherHistoryAddItemFrameNameEditBox:SetText("");
	MarketWatcherHistoryAddItemFrameIdEditBox:SetText("");

	MarketWatcherHistoryAddItemFrameNameEditBox:SetFocus();
end


-- Name Box Functions ------------------------------------------------------------------

function history.AddItemFrameNameEditBox_OnTextChanged(self)
	local _, name, itemLink, texture;

	MarketWatcherHistoryAddItemFrameName.itemId = nil;

	if ( self:GetText() == "" ) then
		MarketWatcherHistoryAddItemFrameNameGetItemInfoButton:Disable();
		MarketWatcherHistoryAddItemFrameNameAddButton:Disable();
		return
	end

	name, itemLink, _, _, _, _, _, _, _, texture = GetItemInfo(self:GetText());

	if ( name ) then
		--MarketWatcherHistoryAddItemFrameText:SetText(MARKETWATCHER_ITEMFOUND);
		MarketWatcherHistoryAddItemFrameNameGetItemInfoButton:Disable();
		MarketWatcherHistoryAddItemFrameNameAddButton:Enable();
		MarketWatcherHistoryAddItemFrameNameItemIcon:SetTexture(texture);
		MarketWatcherHistoryAddItemFrameName.itemLink = itemLink;

	else
		MarketWatcherHistoryAddItemFrameText:SetText(MARKETWATCHER_ADDITEMTEXT);
		MarketWatcherHistoryAddItemFrameNameGetItemInfoButton:Enable();
		MarketWatcherHistoryAddItemFrameNameAddButton:Disable();
		MarketWatcherHistoryAddItemFrameNameItemIcon:SetTexture("");
		MarketWatcherHistoryAddItemFrameName.itemLink = nil;

		MarketWatcher.timer.StartTimer(1, history.AddItemCheckTradeskills);
	end
end

function history.AddItemCheckTradeskills()
	local name = MarketWatcherHistoryAddItemFrameNameEditBox:GetText();
	name = name:lower();
	local link, itemId, skillName, skillType, numAvailable, isExpanded, altVerb;

	if ( MarketWatcher.debug ) then
		print("checking tradeskills");
	end

	for i = GetFirstTradeSkill(), GetNumTradeSkills() do

		if ( i == 0 ) then
			return
		end

		skillName, skillType = GetTradeSkillInfo(i);

		if ( skillName and skillType ~= "header" and skillName:lower() == name ) then
			link = GetTradeSkillItemLink(i);
			itemId = MarketWatcher.DecodeItemLink(link);
			MarketWatcherHistoryAddItemFrameIdEditBox:SetText(itemId);
			return
		end
	end
end

function history.AddItemFrameNameGetItemInfoButton_OnClick(self)
	local name = MarketWatcherHistoryAddItemFrameNameEditBox:GetText();
	name = strtrim(name);

	if ( name and name ~= "" and not GetItemInfo(name) ) then
		if ( MarketWatcher.debug ) then
			print("checking ah for "..name);
		end
		-- check auction house for the item to get item info
		history.queryName = name;
		history.queryPage = -1;
		MarketWatcherHistoryAddItemFrameNameGetItemInfoButton:Disable();
		MarketWatcher.listFunction = history.ListUpdate;
		MarketWatcherHistoryAddItemFrameText:SetFormattedText(MARKETWATCHER_ITEMNOTINBAGS, 1, 0);
		history.QueryForName();
		return
	end
end

function history.AddItemFrameNameAddButton_OnClick(self)

	local _, name, itemId, itemLink;

	name = MarketWatcherHistoryAddItemFrameNameEditBox:GetText();
	if ( name ) then
		_, itemLink = GetItemInfo(name);
		if ( itemLink ) then
			itemId = MarketWatcher.DecodeItemLink(itemLink);
		end
	end
	if ( not itemId ) then
		itemId = MarketWatcherHistoryAddItemFrameName.itemId;
	end

	if ( itemId and GetItemInfo(itemId) ) then
		MarketWatcher.AddWatchedItem(itemId)

		MarketWatcherHistoryAddItemFrameName.itemId = itemId;
		MarketWatcherHistoryAddItemFrameNameItemIcon:SetTexture("");
		MarketWatcherHistoryAddItemFrameName.itemLink = itemLink;
		self:GetParent():GetParent():Hide();

		history.edit = itemId;
		MarketWatcherHistoryEditItemFrame:Show();
		history.SetupItemSelect();
		history.SetItemSelected(itemId);
		history.CenterDisplayOn(itemId);
	end
end

function history.QueryForName()
	history.queryPage = history.queryPage + 1;
	--print("querying: "..history.queryName.."  page: "..history.queryPage);
	MarketWatcher.QueryServer(history.queryName, nil, nil, nil, history.queryPage, nil, 0, true, false);
end

function history.EndNameSearch()
	MarketWatcher.timer.StopTimer();
	MarketWatcherHistoryAddItemFrameNameGetItemInfoButton:Disable();
	history.queryName = nil;
	MarketWatcher.listFunction = nil;
end

function history.ListUpdate()
	if ( not history.queryName ) then
		return
	end

	local batch, total = GetNumAuctionItems("list");
	local index;

	local name, itemLink, itemId, itemMods, uId, texture;

	for index = 1, batch do

		name, texture = GetAuctionItemInfo("list", index);

		if ( name:lower() == history.queryName:lower() ) then

			itemLink = GetAuctionItemLink("list", index);
			itemId, itemMods, uId = MarketWatcher.DecodeItemLink(itemLink);

			if ( itemId ) then
				MarketWatcherHistoryAddItemFrameName.itemId = itemId;
				MarketWatcherHistoryAddItemFrameNameItemIcon:SetTexture(texture);
				MarketWatcherHistoryAddItemFrameName.itemLink = itemLink;
				MarketWatcherHistoryAddItemFrameNameAddButton:Enable();
				MarketWatcherHistoryAddItemFrameText:SetText(MARKETWATCHER_ITEMFOUND);
			end

			history.EndNameSearch();
			return
		end
	end

	local maxPages = 0;
	if ( total > 0 ) then
		maxPages = ceil(total / NUM_AUCTION_ITEMS_PER_PAGE) - 1;
	end
	if ( maxPages <= history.queryPage ) then
		MarketWatcherHistoryAddItemFrameText:SetText(MARKETWATCHER_ITEMNOTINHOUSE);
		history.EndNameSearch();
		return
	end

	MarketWatcher.timer.StartTimer(MarketWatcher.GetConfig().queryDelay, history.QueryForName);

	MarketWatcherHistoryAddItemFrameText:SetFormattedText(MARKETWATCHER_ITEMNOTINBAGS, history.queryPage + 1, maxPages + 1);
end


-- Id Box Functions ------------------------------------------------------------------

function history.AddItemFrameIdEditBox_OnTextChanged(self)
	MarketWatcher.timer.StopTimer();
	history.SetAddItem();
end

function history.SetAddItem()
	local itemId = tonumber(MarketWatcherHistoryAddItemFrameIdEditBox:GetText());
	local frame = MarketWatcherHistoryAddItemFrameId;
	local icon = MarketWatcherHistoryAddItemFrameIdItemIcon;
	local text = MarketWatcherHistoryAddItemFrameIdItemName;
	local _, name, itemLink, texture, quality, color;

	if ( itemId and itemId > 0 ) then
		name, itemLink, quality, _, _, _, _, _, _, texture = GetItemInfo(itemId);
	end

	if ( name ) then
		icon:SetTexture(texture);
		frame.itemLink = itemLink;
		MarketWatcherHistoryAddItemFrameIdGetItemInfoButton:Disable();
		MarketWatcherHistoryAddItemFrameIdAddButton:Enable();

		color = ITEM_QUALITY_COLORS[quality];
		text:SetVertexColor(color.r, color.g, color.b);
		text:SetText(name);

		--MarketWatcherHistoryAddItemFrameText:SetText(MARKETWATCHER_ITEMFOUND);
		return true;
	else
		if ( not itemId or itemId == 0 ) then
			MarketWatcherHistoryAddItemFrameIdGetItemInfoButton:Disable();
		else
			MarketWatcherHistoryAddItemFrameIdGetItemInfoButton:Enable();
		end
		icon:SetTexture("");
		text:SetText("");
		frame.itemLink = nil;
		MarketWatcherHistoryAddItemFrameIdAddButton:Disable();
		--MarketWatcherHistoryAddItemFrameText:SetText(MARKETWATCHER_ADDITEMTEXT);
		return false;
	end
end

function history.AddItemFrameIdGetItemInfoButton_OnClick(self)
	local itemId = tonumber(MarketWatcherHistoryAddItemFrameIdEditBox:GetText());

	if ( not history.SetAddItem() ) then

		-- query server
		if ( history.waitForItemData ~= itemId ) then
			GameTooltip:SetHyperlink("item:"..itemId);
			GameTooltip:Hide();
			history.waitForItemData = itemId;		-- prevent redundant server queries
			MarketWatcher.timer.StartTimer(1, history.RecheckItemId);
			if ( MarketWatcher.debug ) then
				print("gametooltip set");
			end
		end

	end
end

function history.RecheckItemId()
	if ( MarketWatcher.debug ) then
		print("rechecking itemId "..time());
	end
	if ( not history.SetAddItem() ) then
		MarketWatcher.timer.StartTimer(1, history.RecheckItemId);
	end
end

function history.AddItemFrameIdAddButton_OnClick(self)

	local itemId;

	itemId = tonumber(MarketWatcherHistoryAddItemFrameIdEditBox:GetText());

	if ( itemId and GetItemInfo(itemId) and not MarketWatcher.GetItemInfoTable(itemId) ) then
		MarketWatcher.AddWatchedItem(itemId);
		history.ItemSelect_Update();
		history.edit = itemId;
		self:GetParent():GetParent():Hide();
		MarketWatcherHistoryEditItemFrame:Show();
		history.SetupItemSelect();
		history.SetItemSelected(itemId);
		history.CenterDisplayOn(itemId);
	end
end

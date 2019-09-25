if ( not MarketWatcher ) then
	return
end

local MarketWatcher = MarketWatcher;
local timer = MarketWatcher.timer;

if ( not MarketWatcher.Scan ) then
	MarketWatcher.Scan = {};
end
local scan = MarketWatcher.Scan;

scan.status = {};
local status = scan.status;
scan.displayedStats = {};
local displayedStats = scan.displayedStats;
scan.filteredStats = {};
local filteredStats = scan.filteredStats;
scan.hideList = {};
local hideList = scan.hideList;

StaticPopupDialogs["MW_BUYOUT_AUCTION"] = {
	text = BUYOUT_AUCTION_CONFIRMATION,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function(self)
		local _, _, _, _, _, _, _, _, _, buyoutPrice = GetAuctionItemInfo("list", GetSelectedAuctionItem("list"));
		PlaceAuctionBid("list", GetSelectedAuctionItem("list"), buyoutPrice);
	end,
	OnShow = function(self)
		local _, _, _, _, _, _, _, _, _, buyoutPrice = GetAuctionItemInfo("list", GetSelectedAuctionItem("list"));
		MoneyFrame_Update(self.moneyFrame, buyoutPrice);
	end,
	hasMoneyFrame = 1,
	showAlert = 1,
	timeout = 0,
	exclusive = 1,
	hideOnEscape = 1
};
StaticPopupDialogs["MW_SCAN_CONFIRM"] = {
	text = MARKETWATCHER_RECORD_CONFIRM_POPUP,
	button1 = YES,
	button2 = NO,
	OnAccept = function(self)
		MarketWatcher.Scan.Scan();
	end,
	showAlert = 1,
	timeout = 0,
	exclusive = 0,
	hideOnEscape = 1
};

StaticPopupDialogs["MW_CANCEL_UNDERCUT_CONFIRM"] = {
	text = MARKETWATCHER_CANCEL_UNDERCUT_CONFIRM_POPUP,
	button1 = YES,
	button2 = NO,
	OnAccept = function(self)
		scan.CancelUndercutAuctions();
	end,
	showAlert = 1,
	timeout = 0,
	exclusive = 0,
	hideOnEscape = 1
};

local SCAN_SAVE_COOLDOWN = 5 * 3600;
local SHORT_WAIT = 2;
local LONG_WAIT = 15;

local queries;
local listAuctions = {};
local sellDuration = 3;
local clickedRecord = false;		-- don't change record check box after user clicked it
local soldOne = false;			-- don't set quick sell prices if user just sold one so any price he may have entered is preserved after the list update
local soldStack = false;
local noDefaultPrice = false;
local lastEnteredPrice = 0;
local lastEnteredBuyoutPrice = 0;
local lastEnteredPriceCategory;
local lastEnteredPriceSubCategory;
local lastEnteredPriceName;
local waitForOwnedListUpdate;
local hooked = false;
local browseClassIndex, browseSubclassIndex, browseInvTypeIndex;
local filterButtonHookStatus = "unset";
local tooltipGraphMethods = {
	["Low"] = {
		[1] = true,
	},
};
local gridColor = { 0.4, 0.4, 0.4, 0.8 };
local waitIndicator = {
	"||",
	"/",
	"-",
	"\\",
	"||",
	"/",
	"-",
	"\\",
};


---------------------------------------------------------------------------------
--	Tab Functions
---------------------------------------------------------------------------------

function scan.SetScanTab()

	local tabs = 1;
	while ( _G["AuctionFrameTab"..tabs] ) do
		if ( _G["AuctionFrameTab"..tabs]:GetName() == "AuctionFrameTabMarketWatcherScan" ) then
			return
		end
		tabs = tabs + 1;
	end

	local button = CreateFrame("Button", "AuctionFrameTabMarketWatcherScan", AuctionFrame, "AuctionTabTemplate");
	button:SetText(MARKETWATCHER_SCAN);
	PanelTemplates_TabResize(button, 0);
	PanelTemplates_DeselectTab(button);

	_G["AuctionFrameTab"..tabs] = AuctionFrameTabMarketWatcherScan;

	button = _G["AuctionFrameTab"..tabs];
	button:SetParent("AuctionFrame");
	button:SetPoint("TOPLEFT", _G["AuctionFrameTab"..(tabs - 1)]:GetName(), "TOPRIGHT", -8, 0);
	button:SetID(tabs);
	button:Show();

	PanelTemplates_SetNumTabs(AuctionFrame, tabs);

	MarketWatcherScanFrame:SetParent(AuctionFrame);
	MarketWatcherScanFrame:SetPoint("TOPLEFT", AuctionFrame, "TOPLEFT", 0, 0);

	hooksecurefunc("AuctionFrameTab_OnClick", scan.Tab_OnClick);
	button:SetScript("OnClick", AuctionFrameTab_OnClick);
end

function scan.Tab_OnClick(self)
	if ( not self ) then
		MarketWatcherScanFrame:Hide();
		return
	end
	local index = self:GetID();
	local tab = _G["AuctionFrameTab"..index];
	if ( tab and tab:GetName() == "AuctionFrameTabMarketWatcherScan" ) then
		PanelTemplates_SetTab(AuctionFrame, index);

		AuctionFrameTopLeft:SetTexture("Interface\\AuctionFrame\\UI-AuctionFrame-Bid-TopLeft");
		AuctionFrameTop:SetTexture("Interface\\AuctionFrame\\UI-AuctionFrame-Auction-Top");
		AuctionFrameTopRight:SetTexture("Interface\\AuctionFrame\\UI-AuctionFrame-Auction-TopRight");
		AuctionFrameBotLeft:SetTexture("Interface\\AuctionFrame\\UI-AuctionFrame-Bid-BotLeft");
		AuctionFrameBot:SetTexture("Interface\\AuctionFrame\\UI-AuctionFrame-Auction-Bot");
		AuctionFrameBotRight:SetTexture("Interface\\AuctionFrame\\UI-AuctionFrame-Bid-BotRight");

		MarketWatcherScanFrame:Show();
	else
		MarketWatcherScanFrame:Hide();
	end

	if ( not hooked ) then
		hooksecurefunc("ContainerFrameItemButton_OnModifiedClick", scan.AltScanItem);
		--hooksecurefunc("ContainerFrameItemButton_OnEnter", scan.ContainterItemOnEnter);
		hooksecurefunc(GameTooltip, "SetBagItem", scan.ContainterItemOnEnter);
		hooked = true;
	end
end

function scan.ScanFrame_OnShow(self)
	if ( scan.status.complete and not scan.status.scan ) then

		if ( not scan.VerifyListCache() ) then
			scan.selectedItem = nil;
			scan.ClearListAuctions();
			scan.DisplayStats();
		end
	end
end

function scan.ScanFrame_OnHide(self)
	if ( scan.status.complete and not scan.status.scan ) then
		MarketWatcher.listFunction = nil;
	end
	if ( AucAdvanced and AucAdvanced.Scan and AucAdvanced.Scan.CompatibilityMode ) then
		AucAdvanced.Scan.CompatibilityMode(0, "MarketWatcher");
	end
end

---------------------------------------------------------------------------------
--	Scanning Functions
---------------------------------------------------------------------------------

function scan.Setup()
	scan.SetupHook();

	scan.SetScanTab();
	scan.SetupFilterWidgets();

	scan.SetupAuctionFrameFilterButtons();		-- auction house UI filter button right click hooks
	MarketWatcherScanFrame:RegisterEvent("TRADE_SKILL_CLOSE");
	MarketWatcherScanFrame:RegisterEvent("AUCTION_OWNED_LIST_UPDATE");
	MarketWatcherScanFrame:RegisterEvent("TRADE_SKILL_SHOW");
	MarketWatcherScanFrame:RegisterEvent("PLAYER_MONEY");

	MarketWatcherScanFrameAuctionsSellOptionsSelectedTradeskillText:SetFormattedText(MARKETWATCHER_SELECTED_TRADESKILL, NONE);

	if ( not MarketWatcherScanFrameConfigButton and MarketWatcher.Config ) then
		MarketWatcher.Config.CreateButton("MarketWatcherScanFrameConfigButton", MarketWatcherScanFrame, "TOPRIGHT", -24, -12);
	end
end

-- hook the setup function
scan.SetupHook = MarketWatcher.Setup;
MarketWatcher.Setup = scan.Setup;

function scan.Close()
	
	scan.CloseHook();

	if ( scan.status.scan ) then
		-- scan incomplete
		scan.Abort();
	end

	scan.itemSelected = nil;
	MarketWatcherScanFrame:UnregisterEvent("TRADE_SKILL_SHOW");
	MarketWatcherScanFrame:UnregisterEvent("TRADE_SKILL_CLOSE");
	MarketWatcherScanFrame:UnregisterEvent("AUCTION_OWNED_LIST_UPDATE");
	MarketWatcherScanFrame:UnregisterEvent("PLAYER_MONEY");

	if ( not MarketWatcher.GetConfig().allowTSOpen ) then
		CloseTradeSkill();
	end

	if ( MarketWatcherTradeskillSelect1 ) then
		MarketWatcherTradeskillSelect1:SetChecked(nil);
	end
	if ( MarketWatcherTradeskillSelect2 ) then
		MarketWatcherTradeskillSelect2:SetChecked(nil);
	end
end

scan.CloseHook = MarketWatcher.Close;
MarketWatcher.Close = scan.Close;

function scan.AltScanItem(self, button)

	if ( MarketWatcherScanFrame:IsVisible() and button == "LeftButton" and IsAltKeyDown() and not CursorHasItem() ) then

		local itemLink = GetContainerItemLink(self:GetParent():GetID(), self:GetID());
		local itemId = MarketWatcher.DecodeItemLink(itemLink);

		if ( not MarketWatcher.GetItemInfoTable(itemId) ) then
			MarketWatcher.AddTempItemInfo(itemId);
		end
		local itemInfo = MarketWatcher.GetItemInfoTable(itemId);

		if ( scan.status.complete ) then
			scan.Scan("update", itemId);
		else
			local exact = true;
			if ( itemInfo.classID == LE_ITEM_CLASS_WEAPON or itemInfo.classID == LE_ITEM_CLASS_ARMOR ) then
				exact = false;
			end
			
			scan.Scan("browse", {
				["name"] = itemInfo.name,
				["qualityIndex"] = itemInfo.quality,
				["filter"] = MarketWatcher.ConstructFilterFromId(itemId),
				["exact"] = exact,
			});
		end
	end
end

function scan.ContainterItemOnEnter(self)

	if ( MarketWatcherScanFrame:IsVisible() and not CursorHasItem() ) then
		GameTooltip:AddLine(MARKETWATCHER_TOOLTIP18, 1, 1, 1);
		GameTooltip:Show();
	end
end

function scan.ScanFrame_OnEvent(self, event, ...)

	if ( event == "TRADE_SKILL_SHOW" ) then

		local trade = GetTradeSkillLine();

		if ( trade ) then
			MarketWatcherScanFrameAuctionsSellOptionsSelectedTradeskillText:SetFormattedText(MARKETWATCHER_SELECTED_TRADESKILL, trade);
		else
			MarketWatcherScanFrameAuctionsSellOptionsSelectedTradeskillText:SetFormattedText(MARKETWATCHER_SELECTED_TRADESKILL, NONE);
		end
		SetTradeSkillInvSlotFilter(0, 1, 1);
		SetTradeSkillSubClassFilter(0, 1, 1);
		
		if ( scan.selectedItem and MarketWatcher.CanCreate(MarketWatcher.Scan.selectedItem) ) then
			MarketWatcherScanFrameAuctionsSellOptionsCreateButton:Enable();
		end

		if ( MarketWatcherTradeskillSelect1 ) then
			if ( MarketWatcherTradeskillSelect1.trade == trade ) then
				MarketWatcherTradeskillSelect1:SetChecked(1);
			else
				MarketWatcherTradeskillSelect1:SetChecked(nil);
			end
		end
		if ( MarketWatcherTradeskillSelect2 ) then
			if ( MarketWatcherTradeskillSelect2.trade == trade ) then
				MarketWatcherTradeskillSelect2:SetChecked(1);
			else
				MarketWatcherTradeskillSelect2:SetChecked(nil);
			end
		end

	elseif ( event == "TRADE_SKILL_CLOSE" ) then
		MarketWatcherScanFrameAuctionsSellOptionsSelectedTradeskillText:SetFormattedText(MARKETWATCHER_SELECTED_TRADESKILL, NONE);
		MarketWatcherScanFrameAuctionsSellOptionsCreateButton:Disable();

		if ( MarketWatcherTradeskillSelect1 ) then
			MarketWatcherTradeskillSelect1:SetChecked(nil);
		end
		if ( MarketWatcherTradeskillSelect2 ) then
			MarketWatcherTradeskillSelect2:SetChecked(nil);
		end

	elseif ( event == "AUCTION_OWNED_LIST_UPDATE" ) then
		waitForOwnedListUpdate = false;
		
	elseif ( event == "PLAYER_MONEY" ) then
		scan.CheckInvForItem();
	end
end

function scan.SetupAuctionFrameFilterButtons()

	if ( filterButtonHookStatus == "set" ) then
		return
	elseif ( filterButtonHookStatus == "unset" ) then
		if ( AucAdvanced ) then
			filterButtonHookStatus = "wait";
			timer.StartTimer(1, scan.SetupAuctionFrameFilterButtons);
			return
		end
	end

	local i = 1;
	local button, button2;
	
	button = _G["AuctionFilterButton"..i];
	button2 = _G["AuctioneerFilterButton"..i];

	while ( button ) do
		button:HookScript("OnClick", scan.FilterButton_OnClick);
		button:HookScript("OnEnter", scan.FilterButton_OnEnter);
		button:HookScript("OnLeave", scan.FilterButton_OnLeave);
		button:RegisterForClicks("LeftButtonUp", "RightButtonUp");

		if ( button2 ) then
			button2:HookScript("OnClick", scan.FilterButton_OnClick);
			button2:RegisterForClicks("LeftButtonUp", "RightButtonUp");
			button2:HookScript("OnEnter", scan.FilterButton_OnEnter);
			button2:HookScript("OnLeave", scan.FilterButton_OnLeave);
		end

		i = i + 1;
		button2 = _G["AuctioneerFilterButton"..i];
		button = _G["AuctionFilterButton"..i];
	end

	filterButtonHookStatus = "set";
end

function scan.FilterButton_OnEnter(self)
	GameTooltip:SetOwner(AuctionFrame, "ANCHOR_NONE");
	GameTooltip:SetPoint("BOTTOMLEFT", AuctionFrame, "BOTTOMLEFT", 190, 40);
	GameTooltip:SetText(MARKETWATCHER_TOOLTIP21, nil, nil, nil, nil, 1);

	if ( self.type == "subSubCategory" ) then
		browseClassIndex = AuctionFrameBrowse.selectedCategoryIndex;
		browseSubclassIndex = AuctionFrameBrowse.selectedSubCategoryIndex;
		browseInvTypeIndex = self.subSubCategoryIndex;
		
	elseif ( self.type == "subCategory" ) then
		browseClassIndex = AuctionFrameBrowse.selectedCategoryIndex;
		browseSubclassIndex = self.subCategoryIndex;
		browseInvTypeIndex = nil;
		
	elseif ( self.type == "category" ) then
		browseClassIndex = self.categoryIndex;
		browseSubclassIndex = nil;
		browseInvTypeIndex = nil;
	else
		if ( MarketWatcher.debug ) then
			print("Error: Filter button has no or unknown type");
		end
	end
end

function scan.FilterButton_OnLeave(self)
	GameTooltip:Hide();
end

function scan.RecordCheckBox_OnShow(self)
	if ( not clickedRecord ) then
		if ( MarketWatcher.GetConfig().lastRecordedScan and MarketWatcher.GetConfig().lastRecordedScan > (time() - 3600) ) then
			self:SetChecked(false);
		else
			self:SetChecked(1);
		end
		clickedRecord = true;
	end
end

--[[
function scan.RecordCheckBox_OnClick(self)
	if ( self:GetChecked() ) then
		if ( MarketWatcher.GetConfig().lastRecordedScan and MarketWatcher.GetConfig().lastRecordedScan > (time() - 3600) ) then
			self:SetChecked(false);
			StaticPopup_Show("MW_RECORD_CONFIRM");
		end
	end
end
]]

function MarketWatcher.Scan.ScanButton_OnClick()
	if (	not MarketWatcherScanFrameRecordCheckBox:GetChecked()
		or (
			not MarketWatcher.GetConfig().lastRecordedScan
			or (MarketWatcher.GetConfig().lastRecordedScan < (time() - 3600))
		)
	) then
		MarketWatcher.Scan.Scan();
	else
		StaticPopup_Show("MW_SCAN_CONFIRM");
	end
end

function scan.FilterButton_OnClick(self, button)

	if ( button == "RightButton" ) then

		if ( not status.scan and browseClassIndex ) then

			if ( MarketWatcher.debug ) then
				print(string.format("\"%s\"; class: %i; subclass: %i; subsubclass: %i", 
					self:GetText(), browseClassIndex, browseSubclassIndex, browseInvTypeIndex
				));
			end
			
			local minLevel = tonumber(BrowseMinLevel:GetText());
			local maxLevel = tonumber(BrowseMaxLevel:GetText());

			if ( maxLevel == "" ) then
				maxLevel = nil;
			end
			if ( minLevel == "" ) then
				minLevel = nil;
			end

			local query = {
				["name"] = BrowseName:GetText(),
				["minLevel"] = minLevel,
				["maxLevel"] = maxLevel,
				["qualityIndex"] = UIDropDownMenu_GetSelectedValue(BrowseDropDown),
				["filter"] = MarketWatcher.GetFilter(browseClassIndex, browseSubclassIndex, browseInvTypeIndex),
				["classIndex"] = browseClassIndex,
				["subclassIndex"] = browseSubclassIndex,
				["invTypeIndex"] = browseInvTypeIndex,
				--["exact"] = ExactMatchCheckButton:GetChecked(),
			};
			scan.Scan("browse", query);
			AuctionFrameTabMarketWatcherScan:Click();
		end
	end
end

-- Scan("normal" or nil)
-- Scan("browse", queryTable)
-- Scan("update", itemId)
function scan.Scan(scanType, arg2)
	if ( scanType ~= "browse" and scanType ~= "update" ) then
		scanType = "normal";
	end
	status.scanType = scanType;
	status.scan = true;
	status.query = 1;
	status.waitForNames = false;
	status.page = 0;
	status.maxPages = 0;
	status.pagesScanned = 0;
	status.queryGetTime = 0;
	status.complete = false;

	MarketWatcherScanFrameStatus:Show();
	MarketWatcherScanFrameStatsScrollFrame:Hide();
	MarketWatcherScanFrameAuctions:Hide();
	MarketWatcherScanFrameScanButton:Disable();
	MarketWatcherScanFrameApplyFiltersButton:Disable();
	MarketWatcherScanFrameCancelUndercutButton:Disable();

	local i = 1;

	while ( _G["MarketWatcherScanFrameStatsButton"..i] ) do
		_G["MarketWatcherScanFrameStatsButton"..i]:Hide();
		i = i + 1;
	end

	if ( scanType ~= "update" ) then
		status.queryTime = time();
		status.startTime = time();
		scan.processed = {};

		scan.selectedItem = nil;

		MarketWatcherScanFrameScanTimeText:SetText("");
		MarketWatcherScanFrameItemsDisplayedText:SetText("");
		MarketWatcherScanFrameUnHideButton:Hide();

		-- empty tables
		for i in ipairs(displayedStats) do
			displayedStats[i] = nil;
		end
		for i in ipairs(filteredStats) do
			filteredStats[i] = nil;
		end
		for i in ipairs(hideList) do
			hideList[i] = nil;
		end
		MarketWatcher.NewTempTable();
	end

	if ( scanType == "normal" ) then
		i = false;

		-- create empty tables for itemIds so we can track items with zero auctions
		for itemId, itemData in MarketWatcher.WatchedItemsIterator() do
			if ( itemData.name ) then
				MarketWatcher.AddTempItem(itemId, status.queryTime);
			end
			i = true;
		end

		-- any watched items?
		if ( not i ) then
			scan.Abort();
			MarketWatcherScanFrameStatus:Show();
			MarketWatcherScanFrameStatusQueryCount:SetText(MARKETWATCHER_NOWATCHEDITEMS);
			return
		end

		queries = MarketWatcher.GenerateQueryList();

	elseif ( scanType == "browse" ) then
		local query = arg2;

		queries = {query};

		-- track items with zero auctions if they are in watched list
		for itemId, itemData in MarketWatcher.WatchedItemsIterator() do
			if ( MarketWatcher.IsItemInQuery(query, itemId) ) then
				MarketWatcher.AddTempItem(itemId, status.queryTime);
			end
		end

		local craftedItemId, link, skillName, skillType, numAvail, itemId;

		for i = GetFirstTradeSkill(), GetNumTradeSkills() do

			skillName, skillType, numAvail = GetTradeSkillInfo(i);

			if ( skillName and skillType ~= "header" ) then
				link = GetTradeSkillItemLink(i);

				if ( link ) then
					itemId = MarketWatcher.DecodeItemLink(link);

					if ( itemId ) then
						if ( MarketWatcher.IsItemInQuery(query, itemId) ) then
							MarketWatcher.AddTempItem(itemId, status.queryTime);
							--print(MarketWatcher.GetItemInfoTable(itemId).name, itemId);
						end
					end
				end
			end
		end
	
	elseif ( scanType == "update" ) then

		local itemId = arg2;
		status.updateItemId = itemId;

		scan.processed[itemId] = nil;
		MarketWatcher.DeleteTempItem(itemId);
		MarketWatcher.AddTempItem(itemId, time());
		
		local itemInfo = MarketWatcher.GetItemInfoTable(itemId);
		
		if ( itemInfo ) then
			local exact = true;
			if ( itemInfo.classID == LE_ITEM_CLASS_WEAPON or itemInfo.classID == LE_ITEM_CLASS_ARMOR ) then
				exact = false;
			end
			
			queries = {{
					["name"] = itemInfo.name,
				--	["minLevel"] = nil,
				--	["maxLevel"] = nil,
					["filter"] = MarketWatcher.ConstructFilterFromId(itemId),
					["exact"] = exact,
			}};
		end
	end

	if ( queries and #queries > 0 ) then
		MarketWatcher.listFunction = scan.ListUpdate;
		scan.QueryServer();
	end
end

function scan.Abort()
	MarketWatcher.listFunction = nil;
	timer.StopTimer();

	MarketWatcherScanFrameScanButton:Enable();

	status.scan = false;
	MarketWatcherScanFrameStatus:Hide();
end

function scan.QueryServer()

	if ( CanSendAuctionQuery() ) then

		local query = queries[status.query];
		local class, subclass = "", "";
		local name, invType, quality = "", "", "";

		MarketWatcherScanFrameStatusQueryCount:SetFormattedText( MARKETWATCHER_QUERYSTATUS, status.query, #queries );

		status.waitForNames = false;
		status.queryTime = time();

		if ( query.name and query.name ~= "" ) then
			name = "\""..query.name.."\" ";
		end
		if ( query.qualityIndex and query.qualityIndex > 0 ) then
			quality = _G["ITEM_QUALITY"..query.qualityIndex.."_DESC"];
		end

		if ( query.classIndex and AuctionCategories and AuctionCategories[query.classIndex] ) then

			class = AuctionCategories[query.classIndex].name or "";

			if ( query.subclassIndex and AuctionCategories[query.classIndex].subCategories ) then
				subclass = AuctionCategories[query.classIndex].subCategories[query.subclassIndex].name or "";
				
				if ( query.invTypeIndex and AuctionCategories[query.classIndex].subCategories[query.subclassIndex].subCategories ) then
					invType = AuctionCategories[query.classIndex].subCategories[query.subclassIndex].subCategories[query.invTypeIndex].name or "";
				end
			end
		end

		MarketWatcher.QueryServer(query.name, query.minLevel, query.maxLevel, query.filter, status.page, nil, query.qualityIndex, query.exact, false);
		status.queryGetTime = GetTime();

		if ( status.page == 0 ) then
			s = format(MARKETWATCHER_PAGESTATUS, status.page + 1);
		else
			s = format(MARKETWATCHER_PAGESTATUS2, status.page + 1, status.maxPages + 1);
		end

		MarketWatcherScanFrameStatusQuery:SetText( format(MARKETWATCHER_QUERYSTATUS2, name, class, subclass, invType, quality).."\n"..s );
		MarketWatcherScanFrameStatusQueryStatus:SetText(MARKETWATCHER_QUERYSTATUS3);

		if ( MarketWatcher.debug ) then
			print( format(MARKETWATCHER_QUERYSTATUS2, name, invType, class, subclass, quality).."; "..s );
		end
	else
		timer.StartTimer(.1, scan.QueryServer);
	end
end

function scan.ListUpdate()
	if ( not status.scan ) then
		return
	end

	local batch, totalAuctions = GetNumAuctionItems("list");
	if ( totalAuctions > 0 ) then
		status.maxPages = ceil(totalAuctions / NUM_AUCTION_ITEMS_PER_PAGE) - 1;
	else
		status.maxPages = 0;
	end

	local gotAllNames, longWait, waitTime;

	-- are we waiting for seller names?
	if ( status.waitForNames ) then

		-- get names, and complete page if all names are in
		gotAllNames, longWait = scan.GetSellerNames();

		if ( not gotAllNames ) then

			-- refresh timer
			if ( longWait ) then
				waitTime = LONG_WAIT;
			else
				waitTime = SHORT_WAIT;
			end
			timer.StartTimer(waitTime, scan.NextPage);

			MarketWatcherScanFrameStatusQueryStatus:SetText(MARKETWATCHER_LISTUPDATE3);

			return
		end
	else

		longWait = scan.GetAuctions();

		-- complete page if auctions all had seller names
		if ( status.waitForNames ) then

			-- start timer in case we never get seller names
			if ( longWait ) then
				waitTime = LONG_WAIT;
			else
				waitTime = SHORT_WAIT;
			end
			timer.StartTimer(waitTime, scan.NextPage);

			MarketWatcherScanFrameStatusQueryStatus:SetText(MARKETWATCHER_LISTUPDATE2);

			return
		end
	end

	-- if we are here, then ready for next page/query

	status.pagesScanned = status.pagesScanned + 1;
	MarketWatcherScanFrameStatusQueryStatus:SetText(MARKETWATCHER_LISTUPDATE1);

	scan.NextPage();
end

function scan.NextPage()
	scan.OnPageComplete();

	if ( status.page < status.maxPages ) then
		status.page = status.page + 1;
	else
		scan.OnQueryComplete();

		status.query = status.query + 1;
		if ( not queries[status.query] ) then

			-- scan completed
			scan.OnScanComplete();

			return
		end

		status.page = 0;
	end


	timer.StartTimer( MarketWatcher.GetConfig().queryDelay - (GetTime() - status.queryGetTime), scan.QueryServer );
end

function scan.GetAuctions()

	local batch, total = GetNumAuctionItems("list");
	local index, longWait;

	local name, texture, count, quality, canUse, level, minBid, minIncrement, buyoutPrice, bidAmount, highBidder, owner;
	local _, timeleft, itemLink, itemId, itemMods, uId;
	--local itemLevel, itemType, itemSubType, itemEquipLoc;

	for index = 1, batch do

		name, texture, count, quality, canUse, level, _, minBid, minIncrement, buyoutPrice, bidAmount, highBidder, _, owner, _, _, itemId = GetAuctionItemInfo("list", index);
		--name, texture, count, quality, canUse, level, levelColHeader, minBid, minIncrement, buyoutPrice, bidAmount, highBidder, owner, saleStatus, itemId, hasAllInfo =  GetAuctionItemInfo("list", offset + i);
		--name, texture, count, quality, canUse, level, levelColHeader, minBid, minIncrement, buyoutPrice, bidAmount, highBidder, bidderFullName, owner, ownerFullName, saleStatus, itemId, hasAllInfo =  GetAuctionItemInfo("list", offset + i);
	  
		--if ( name and itemId ~= 82800 ) then
		if ( name ) then
			-- Returns a number between 1 and 4
			-- 1 = short time (less then 30 min.)
			-- 2 = medium time (30 min. till 2 hours)
			-- 3 = long time (2 till 12 hours)
			-- 4 = very long time (more then 12 hours)
			timeleft = GetAuctionItemTimeLeft("list", index);
			if ( not timeleft or timeleft == 0 ) then
				timeleft = 4;
			end

			itemLink = GetAuctionItemLink("list", index);
			--_, _, _, itemLevel, _, itemType, itemSubType, _, itemEquipLoc = GetItemInfo(itemLink);

			itemId, itemMods, uId = MarketWatcher.DecodeItemLink(itemLink);

			if ( owner == "" ) then
				owner = nil;
			end

			if ( status.scanType == "browse" ) then
				if ( not MarketWatcher.IsItemInTable(itemId) ) then
					MarketWatcher.AddTempItem(itemId, status.queryTime);
					MarketWatcher.AddTempItemInfo(itemId);
				end

				MarketWatcher.SetTempTimestamp(itemId, status.queryTime);

				-- add auction to temp table; if seller name is blank, fill it with auction index so we can replace it with the correct name in future updates
				MarketWatcher.AddTempAuction(itemId, itemMods, uId, count, (owner or index), buyoutPrice, minBid, bidAmount, timeleft);
			else
				-- scanType "normal" or "update"

				if ( MarketWatcher.IsItemInTable(itemId) and not scan.processed[itemId] ) then
					MarketWatcher.SetTempTimestamp(itemId, status.queryTime);

					-- add auction to temp table; if seller name is blank, fill it with auction index so we can replace it with the correct name in future updates
					MarketWatcher.AddTempAuction(itemId, itemMods, uId, count, (owner or index), buyoutPrice, minBid, bidAmount, timeleft);
				end
			end

			if ( not owner ) then
				status.waitForNames = true;

				-- if item without seller name is set to record, return true (indicating we want to wait longer for the name)
				if ( MarketWatcher.IsItemInTable(itemId) and MarketWatcher.GetItemInfoTable(itemId).recordHistory ) then
					longWait = true;
				end
			end
		end
	end

	return longWait;
end

function scan.GetSellerNames()

	local batch, total = GetNumAuctionItems("list");

	local _, seller, owner;
	local itemLink, itemId;
	local noNilNames = true;
	local longWait;
	
	for index = 1, batch do

		_, _, _, _, _, _, _, _, _, _, _, _, _, owner = GetAuctionItemInfo("list", index);

		itemLink = GetAuctionItemLink("list", index);
		itemId = MarketWatcher.DecodeItemLink(itemLink);

		if ( MarketWatcher.IsItemInTable(itemId) ) then

			for auctionIndex = 1, MarketWatcher.GetNumAuctions(itemId, 0) do

				_, seller = MarketWatcher.GetAuction(itemId, 0, auctionIndex);

				-- if auction index matches index in temp auction, replace with seller name
				if ( type(seller) == "number" and seller == index and owner and owner ~= "" ) then
					MarketWatcher.EditAuction(itemId, 0, auctionIndex, nil, nil, nil, owner or "");
				end
			end

			-- if item is set to record and no seller name, wait longer
			if ( MarketWatcher.GetItemInfoTable(itemId).recordHistory and owner == nil ) then
				longWait = true;
			end
		end

		if ( owner == nil ) then
			noNilNames = false;
		end
	end

	return noNilNames, longWait;
end

function scan.OnPageComplete()
	local _, entries;

	for itemId in MarketWatcher.TempItemIterator() do

		entries = MarketWatcher.GetNumAuctions(itemId, 0);

		if ( entries > 0 and not scan.processed[itemId] ) then

			-- blank out auctions without owners, otherwise getting the next page will fill in the wrong seller name
			for auctionIndex = 1, entries do

				_, seller = MarketWatcher.GetAuction(itemId, 0, auctionIndex);

				if ( type(seller) == "number" ) then
					MarketWatcher.EditAuction(itemId, 0, auctionIndex, nil, nil, nil, "");
				end
			end
		end
	end
end

function scan.OnQueryComplete()

	local _, i, j, t, entries, seller, instances;

	for itemId in MarketWatcher.TempItemIterator() do

		entries = MarketWatcher.GetNumAuctions(itemId, 0);

		if ( not scan.processed[itemId] ) then

			-- update item info with ilevel and minlevel if item added pre-2.0
			t = MarketWatcher.GetItemInfoTable(itemId);
			if ( t and not t.iLevel ) then
				MarketWatcher.SetWatchedItemInfo(itemId);
			end

			if ( entries > 0 ) then

				-- compress duplicate auctions
				i = 1;
				while i < entries do

					j = i + 1;
					while j <= entries do

						if ( MarketWatcher.IsAuctionEqual(itemId, 0, i, 0, j) ) then

							_, _, _, _, _, _, instances = MarketWatcher.GetAuction(itemId, 0, i);

							if ( instances ) then
								instances = instances + 1;
							else
								instances = 2;
							end
							
							MarketWatcher.EditAuction(itemId, 0, i, nil, nil, nil, nil, nil, nil, nil, nil, instances);
							MarketWatcher.DeleteTempAuction(itemId, j);

							entries = entries - 1;
							j = j - 1;

						end
						j = j + 1;

					end
					i = i + 1;

				end

				-- sort auctions
				MarketWatcher.SortTempAuctions(itemId);

				scan.processed[itemId] = true;
			end
		end
	end
end

function scan.OnScanComplete()

	status.complete = true;
	scan.Abort();

	MarketWatcherScanFrameApplyFiltersButton:Enable();
	MarketWatcherScanFrameCancelUndercutButton:Enable();
	MarketWatcherScanFrameStatusQueryStatus:SetText(MARKETWATCHER_SCANCOMPLETE);
	MarketWatcherScanFrameAuctions:Show();

	if ( status.scanType == "update" ) then
		scan.UnHideItem(status.updateItemId);
		if ( scan.IsItemFiltered(status.updateItemId) ) then
			MarketWatcherScanFrameApplyFiltersButton:Click();
		end

		local index = scan.GetStatsIndex(status.updateItemId);
		scan.ComputeItemStats(status.updateItemId, index);
		scan.selectedItem = status.updateItemId;

		if ( MarketWatcher.GetConfig().saveOnBrowse ) then
			scan.WriteHistory(status.scanType, status.updateItemId);
		end

		if ( MarketWatcher.GetConfig().filtersApplied and MarketWatcher.GetConfig().reapplyFilters ) then
			scan.ApplyFilters();
		else
			scan.UpdateFilterResultText();
			scan.SortStats();
			scan.DisplayStats();
		end
		scan.CenterDisplayOn(status.updateItemId);
		soldOne = false;
		soldStack = false;
		scan.UpdateQuickSell();

		MarketWatcher.listFunction = scan.AuctionsListUpdate;
		scan.page = status.page;
		scan.AuctionsListUpdate();
		return
	end
	
	status.endTime = time();

	MarketWatcherScanFrameStatsScrollFrameScrollBar:SetValue(0);

	local elapsed = status.endTime - status.startTime;
	local elapsedMinutes = floor(elapsed / 60);
	local elapsedSeconds = floor(elapsed % 60);
	MarketWatcherScanFrameScanTimeText:SetFormattedText(MARKETWATCHER_SCANTIME2, date("%H:%M"), elapsedMinutes, elapsedSeconds, status.pagesScanned);

	for itemId in MarketWatcher.TempItemIterator() do
		scan.ComputeItemStats(itemId);
	end

	if ( status.scanType == "normal" ) then
		scan.WriteHistory(status.scanType);
		MarketWatcherScanFrameRecordCheckBox:SetChecked(false);

	elseif ( status.scanType == "browse" and MarketWatcher.GetConfig().saveOnBrowse ) then
		scan.WriteHistory(status.scanType);
	end

	scan.ApplyFilters();
	scan.ClearListAuctions();

	UpdateAddOnMemoryUsage();
	local usedMem = GetAddOnMemoryUsage("MarketWatcher");

	if ( usedMem > 30000 ) then
		DEFAULT_CHAT_FRAME:AddMessage(MARKETWATCHER_MEMORY_LIMIT, 1, 0.3, 0.3, 1);
	end
end

function scan.AddQuery(name, minLevel, maxLevel, filter, qualityIndex, exact, classIndex, subclassIndex, invTypeIndex)

	table.insert(queries, {
		["name"] = name,
		["minLevel"] = minLevel,
		["maxLevel"] = maxLevel,
		["qualityIndex"] = qualityIndex,
		["filter"] = filter,
		["invTypeIndex"] = invTypeIndex,
		["classIndex"] = classIndex,
		["subclassIndex"] = subclassIndex,
		["exact"] = exact,
	});
end

function scan.WriteHistory(scanType, updateItemId)

	local saved, t;

	if ( MarketWatcherScanFrameRecordCheckBox:GetChecked() ) then

		for itemId in MarketWatcher.TempItemIterator() do

			t = MarketWatcher.GetItemInfoTable(itemId);

			if ( t and t.recordHistory ) then

				if ( scanType == "normal" ) then

					if (	not MarketWatcher.GetConfig().saveOnBrowse
						or ( MarketWatcher.GetNumScans(itemId) == 0 or ( time() - MarketWatcher.GetScanTimestamp(itemId, MarketWatcher.GetNumScans(itemId)) ) > SCAN_SAVE_COOLDOWN )
					) then
						MarketWatcher.SaveTempItemData(itemId);
						saved = true;
					else
						if ( MarketWatcher.debug ) then
							print( "Item "..itemId.." not recorded; saveOnBrowse on and last scan too young" );
						end
					end
				end

				if ( scanType == "update" and itemId == updateItemId ) then
				
					if ( MarketWatcher.GetNumScans(itemId) == 0 or ( time() - MarketWatcher.GetScanTimestamp(itemId, MarketWatcher.GetNumScans(itemId)) ) > SCAN_SAVE_COOLDOWN ) then

						MarketWatcher.SaveTempItemData(itemId);
						saved = true;
					else
						if ( MarketWatcher.debug ) then
							print( "Item "..itemId.." not recorded; last scan too young" );
						end
					end
				end

				if ( scanType == "browse" ) then

					if ( MarketWatcher.GetNumScans(itemId) == 0 or ( time() - MarketWatcher.GetScanTimestamp(itemId, MarketWatcher.GetNumScans(itemId)) ) > SCAN_SAVE_COOLDOWN ) then

						MarketWatcher.SaveTempItemData(itemId);
						saved = true;
					else
						if ( MarketWatcher.debug ) then
							print( "Item "..itemId.." not recorded; last scan too young" );
						end
					end
				end
			end

			MarketWatcher.PruneHistory(itemId);	-- delete entries exceeding max age or max entries
		end
	end

	if ( saved ) then
		if ( scanType == "normal" ) then
			MarketWatcher.GetConfig().lastRecordedScan = time();
		end
		DEFAULT_CHAT_FRAME:AddMessage(format(MARKETWATCHER_SCAN_RECORDED, date("%X")), 0, 1, 1, 1);
	end
end


---------------------------------------------------------------------------------
--	Summary Functions
---------------------------------------------------------------------------------

function scan.GetStatsIndex(itemId)

	for index, table in ipairs(displayedStats) do
		if ( table.itemId == itemId ) then
			return index;
		end
	end
end

local function StackType(table, type, bid, buyout, instances, bidPerUnit, buyoutPerUnit, count, mine)
	if ( not table[type] ) then
		table[type] = {};
		table[type].auctions = 0;
	end

	local t = table[type];

	t.auctions = t.auctions + instances;

	if ( not t.lowestBid or t.lowestBid > bid ) then
		t.lowestBid = bid;
	end

	if ( (not t.lowestBidPerUnit or t.lowestBidPerUnit > bidPerUnit) ) then
		t.lowestBidPerUnit = bidPerUnit;
		t.lowestBidPerUnitCount = count;
	end

	if ( buyout > 0 ) then
		if ( not t.lowestBuyout or t.lowestBuyout > buyout ) then
			t.lowestBuyout = buyout;
		end

		if ( not t.lowestBuyoutPerUnit or t.lowestBuyoutPerUnit > buyoutPerUnit ) then
			t.lowestBuyoutPerUnit = buyoutPerUnit;
			t.lowestBuyoutPerUnitCount = count;
		end

		if ( mine ) then
			if ( not t.myBuyoutPerUnit or t.myBuyoutPerUnit > buyoutPerUnit ) then
				t.myBuyoutPerUnit = buyoutPerUnit;
			end
		else
			if ( not t.theirBuyoutPerUnit or t.theirBuyoutPerUnit > buyoutPerUnit ) then
				t.theirBuyoutPerUnit = buyoutPerUnit;
			end
		end
	end
end

-- ComputeItemStats(itemId, displayedStatsIndex)
-- displayedStatsIndex == nil to add new item instead of update
-- reads data in temp table (scan 0) and saves results in MarketWatcher.Scan.displayedStats

-- displayedStats[index].itemId
-- displayedStats[index].totalAuctions
-- displayedStats[index].totalForSale
-- displayedStats[index].myBidPerUnit				nil if not selling this item
-- displayedStats[index].myBuyoutPerUnit			nil if not selling this item
-- displayedStats[index].lowestBuyoutPerUnit			nil if no buyouts
-- displayedStats[index].lowestBidPerUnit			nil if no auctions
-- displayedStats[index].bidThresholdMet			0 if no threshold, -1 if below threshold, 1 if above threshold
-- displayedStats[index].buyoutThresholdMet			0 if no threshold, -1 if below threshold, 1 if above threshold

-- type == single/nonSingle or fullStack/nonFullStack
-- displayedStats[index][type].lowestBid
-- displayedStats[index][type].lowestBidPerUnit
-- displayedStats[index][type].lowestBidPerUnitCount
-- displayedStats[index][type].lowestBuyout			nil if no buyouts
-- displayedStats[index][type].lowestBuyoutPerUnit		nil if no buyouts
-- displayedStats[index][type].lowestBuyoutPerUnitCount		nil if no buyouts
-- displayedStats[index][type].myBuyoutPerUnit			nil if not selling this item
-- displayedStats[index][type].theirBuyoutPerUnit		nil if no others selling this item
-- displayedStats[index][type].bidThresholdMet			0 if no threshold, -1 if below threshold, 1 if above threshold
-- displayedStats[index][type].buyoutThresholdMet		0 if no threshold, -1 if below threshold, 1 if above threshold
-- displayedStats[index][type].weeklyHistorical			nil if no scans for item or too few scans with data
-- displayedStats[index][type].monthlyHistorical		nil if no scans for item or too few scans with data

function scan.ComputeItemStats(itemId, displayedStatsIndex)

	local fullStacks, bidPerUnit, lowestBidPerUnit, lowestBuyoutPerUnit, mine, typeStr;
	local playerName = UnitName("player");
	local t = {};
	local itemInfo = MarketWatcher.GetItemInfoTable(itemId);

	t.itemId = itemId;
	t.totalAuctions = 0;
	t.totalForSale = 0;

	for count, seller, buyout, buyoutPerUnit, currentBid, timeleft, instances, minBid, bidAmount in MarketWatcher.AuctionsIterator(itemId, 0) do

		t.totalAuctions = t.totalAuctions + instances;
		t.totalForSale = t.totalForSale + count * instances;

		bidPerUnit = currentBid / count;

		if ( seller == playerName ) then
			if ( not t.myBidPerUnit or t.myBidPerUnit > bidPerUnit ) then
				t.myBidPerUnit = bidPerUnit;
			end
			if ( not t.myBuyoutPerUnit or t.myBuyoutPerUnit > buyoutPerUnit ) then
				t.myBuyoutPerUnit = buyoutPerUnit;
			end

			mine = true;
		else
			mine = false;
		end

		if ( not itemInfo.summaryStackOnly or (itemInfo.summaryStackOnly and itemInfo.stackCount == count) ) then

			if ( not lowestBidPerUnit or bidPerUnit < lowestBidPerUnit ) then
				lowestBidPerUnit = bidPerUnit;
			end
			
			if ( buyout > 0 and (not lowestBuyoutPerUnit or buyoutPerUnit < lowestBuyoutPerUnit) ) then
				lowestBuyoutPerUnit = buyoutPerUnit;
			end
		end

		if ( count == 1 ) then
			typeStr = "single";
		else
			typeStr = "nonSingle";
		end
		StackType(t, typeStr, currentBid, buyout, instances, bidPerUnit, buyoutPerUnit, count, mine);

		if ( itemInfo.stackCount == count ) then
			typeStr = "fullStack";
		else
			typeStr = "nonFullStack";
		end
		StackType(t, typeStr, currentBid, buyout, instances, bidPerUnit, buyoutPerUnit, count, mine);
	end

	t.lowestBuyoutPerUnit = lowestBuyoutPerUnit;
	t.lowestBidPerUnit = lowestBidPerUnit;

	-- if more than 2 full stack auctions, or fullstack auctions > single auctions, then just display fullStack and nonFullStack auction types and vice versa
	if ( t["fullStack"] and t["single"] and (t["fullStack"].auctions > 2 or t["fullStack"].auctions > t["single"].auctions) ) then
		t["single"] = nil;
		t["nonSingle"] = nil;
	end

	if ( t["single"] and not itemInfo.summaryStackOnly ) then
		t["fullStack"] = nil;
		t["nonFullStack"] = nil;
	end
	if ( t["fullStack"] ) then
		t["single"] = nil;
		t["nonSingle"] = nil;
	end

	if ( itemInfo.summaryStackOnly ) then
		t["single"] = nil;
		t["nonSingle"] = nil;
		t["nonFullStack"] = nil;
	end



	if ( lowestBidPerUnit and itemInfo.bidThreshold > 0 ) then
		if ( t.lowestBidPerUnit <= itemInfo.bidThreshold ) then
			t.bidThresholdMet = -1;
		else
			t.bidThresholdMet = 1;
		end
	else
		t.bidThresholdMet = 0;
	end

	if ( lowestBuyoutPerUnit and itemInfo.buyoutThreshold > 0 ) then
		if ( t.lowestBuyoutPerUnit <= itemInfo.buyoutThreshold ) then
			t.buyoutThresholdMet = -1;
		else
			t.buyoutThresholdMet = 1;
		end
	else
		t.buyoutThresholdMet = 0;
	end




	local types = { "single", "nonSingle", "fullStack", "nonFullStack" };

	for _, type in pairs(types) do
		if ( t[type] ) then
			if ( itemInfo.bidThreshold > 0 ) then
				if ( t[type].lowestBidPerUnit <= itemInfo.bidThreshold ) then
					t[type].bidThresholdMet = -1;
				else
					t[type].bidThresholdMet = 1;
				end
			else
				t[type].bidThresholdMet = 0;
			end
		
			if ( itemInfo.buyoutThreshold > 0 and t[type].lowestBuyoutPerUnit ) then
				if ( t[type].lowestBuyoutPerUnit <= itemInfo.buyoutThreshold ) then
					t[type].buyoutThresholdMet = -1;
				else
					t[type].buyoutThresholdMet = 1;
				end
			else
				t[type].buyoutThresholdMet = 0;
			end

			t[type].weeklyHistorical, t[type].monthlyHistorical = MarketWatcher.HistoricalComparison(itemId, t[type].lowestBuyoutPerUnit);
		end
	end

	local display = true;

	if ( not itemInfo.noneOnSale and t.totalAuctions == 0 ) then
		display = false;

		if ( MarketWatcher.debug ) then
			print(itemInfo.name.." not on sale and nonOnSale set; not displaying");
		end
	end

	if ( display and (t.bidThresholdMet ~= 0 or t.buyoutThresholdMet ~= 0) ) then

		if ( itemInfo.summaryConditional == "below" ) then
			
			if ( t.bidThresholdMet > -1 and t.buyoutThresholdMet > -1 ) then
				display = false;
			end

			if ( not display and MarketWatcher.debug ) then
				print("threshold not met for "..itemInfo.name);
			end

		elseif ( display and itemInfo.summaryConditional == "above" ) then
			
			if ( t.bidThresholdMet < 1 and t.buyoutThresholdMet < 1 ) then
				display = false;
			end

			if ( not display and MarketWatcher.debug ) then
				print("threshold not met for "..itemInfo.name);
			end
		end
	end

	if ( displayedStatsIndex ) then
		displayedStats[displayedStatsIndex] = t;
	else
		if ( display ) then
			table.insert(displayedStats, t);
		else
			local hiddenIndex = scan.IsItemHidden(itemId);
			if ( hiddenIndex ) then
				hideList[hiddenIndex] = t;
			else
				table.insert(hideList, t);
			end
		end
	end
end

function scan.SortStats()
	table.sort(displayedStats, function(a, b)
		local aQuality, bQuality, aName, bName;
		local table = MarketWatcher.GetItemInfoTable(a.itemId);
		if ( not table ) then
			aQuality = 0;
			aName = MARKETWATCHER_ITEM_REMOVED;
		else
			aQuality = table.quality;
			aName = table.name;
		end
		
		table = MarketWatcher.GetItemInfoTable(b.itemId);
		if ( not table ) then
			bQuality = 0;
			bName = MARKETWATCHER_ITEM_REMOVED;
		else
			bQuality = table.quality;
			bName = table.name;
		end

		if ( aQuality == bQuality ) then
			if ( not aQuality ) then
				return a.itemId < b.itemId;
			else
				return aName < bName;
			end
		else
			return aQuality > bQuality;
		end
	end);
end

local function ThresholdColor(threshold)

	if ( not threshold or threshold == 0 ) then
		return "";
	elseif ( threshold > 0 ) then
		return "|cff9e5252";
	else
		return "|cff4a9c4a";
	end
end

function scan.CenterDisplayOn(itemId)

	local index = scan.GetStatsIndex(itemId);
	local buttonHeight = 85;
	local numToDisplay = 4;
	local maxValue = buttonHeight * (ceil(#displayedStats / 2) - numToDisplay);
	local currentValue = MarketWatcherScanFrameStatsScrollFrameScrollBar:GetValue();

	if ( index ) then
		local itemValue = ceil(index / 2) * buttonHeight;

		if ( itemValue <= currentValue or itemValue > (currentValue + buttonHeight * numToDisplay) ) then
			itemValue = itemValue - 2 * buttonHeight;
			if ( itemValue < 0 ) then
				itemValue = 0;
			end
			if ( itemValue > maxValue ) then
				itemValue = maxValue;
			end
			FauxScrollFrame_OnVerticalScroll(MarketWatcherScanFrameStatsScrollFrame, itemValue, buttonHeight, scan.DisplayStats);
		end
	end
end

-- returns "n%" in a shade of green (-50) to yellow (0) to red (100+)
local function ColorizePct(n)
	local red, green, blue = 255, 255, "00";

	if ( n > 0 ) then
		green = n * 2.5;
		if ( green > 255 ) then
			green = 255;
		end
		green = 255 - green;
		return "|cff"..format("%.2x", red)..format("%.2x", green)..blue.."+"..n.."%|r";
	else
		red = math.abs(n) * 5;
		if ( red > 255 ) then
			red = 255;
		end
		red = 255 - red;
		return "|cff"..format("%.2x", red)..format("%.2x", green)..blue..n.."%|r";
	end
end

local function LowestBuyoutText(stats, localizationText, includeBuyoutCount)

	local text = "";

	if ( stats.lowestBuyout ) then

		text = text..ThresholdColor(stats.buyoutThresholdMet);

		if ( not includeBuyoutCount ) then
			text = text..format(localizationText, MarketWatcher.MoneyText(stats.lowestBuyoutPerUnit));
		else
			text = text..format(localizationText, MarketWatcher.MoneyText(stats.lowestBuyoutPerUnit)).." (x"..stats.lowestBuyoutPerUnitCount..")";
		end

		if ( stats.myBuyoutPerUnit) then
			if ( not stats.theirBuyoutPerUnit or stats.myBuyoutPerUnit < stats.theirBuyoutPerUnit ) then
				text = text.." ("..MARKETWATCHER_YOURS..")";
			else
				text = text.." ("..MARKETWATCHER_NOT_YOURS..")";
			end
		end

		if ( stats.weeklyHistorical ) then
			text = text.." "..ColorizePct(stats.weeklyHistorical);
		end
		if ( stats.monthlyHistorical ) then
			if ( stats.weeklyHistorical ) then
				text = text.."/";
			else
				text = text.." ";
			end
			text = text..ColorizePct(stats.monthlyHistorical);
		end
		text = text.."\n";
	end

	return text;
end

function scan.UpdateStatsButton(id)

	local n, button, icon, textFontString, name, itemInfo, color, stats, text;

	local offset = FauxScrollFrame_GetOffset(MarketWatcherScanFrameStatsScrollFrame);
	n = id + (offset * 2);

	button = _G["MarketWatcherScanFrameStatsButton"..id];
	icon = _G["MarketWatcherScanFrameStatsButton"..id.."ItemIconTexture"];
	name = _G["MarketWatcherScanFrameStatsButton"..id.."ItemName"];
	textFontString = _G["MarketWatcherScanFrameStatsButton"..id.."StatsText"];
	
	text = "";
	textFontString:Hide();

	if ( displayedStats[n] ) then
		stats = displayedStats[n];
		itemInfo = MarketWatcher.GetItemInfoTable(stats.itemId);
		if ( not itemInfo or not itemInfo.name ) then
			itemInfo = { texture = "Interface\\Icons\\INV_Misc_QuestionMark.blp", name = MARKETWATCHER_ITEM_REMOVED, quality = 1 };
			stats.single = nil;
			stats.nonSingle = nil;
			stats.fullStack = nil;
			stats.nonFullStack = nil;
		end

		icon:SetTexture(itemInfo.texture);

		name:SetText(itemInfo.name);

		color = ITEM_QUALITY_COLORS[itemInfo.quality];
		name:SetVertexColor(color.r, color.g, color.b);

		text = format(MARKETWATCHER_TOTALS, stats.totalAuctions, stats.totalForSale);
		
		if ( stats.single ) then
			text = text..format(MARKETWATCHER_SINGLEAUCTIONS, stats.single.auctions);
			text = text..ThresholdColor(stats.single.bidThresholdMet);
			text = text..format(MARKETWATCHER_LOWESTBID, MarketWatcher.MoneyText(stats.single.lowestBid)).."\n";

			text = text..LowestBuyoutText(stats.single, MARKETWATCHER_LOWESTBUYOUT);

			if ( stats.nonSingle ) then
				text = text..format(MARKETWATCHER_NONSINGLEAUCTIONS, stats.nonSingle.auctions);
				text = text..LowestBuyoutText(stats.nonSingle, MARKETWATCHER_LOWESTBUYOUTPERUNIT, true);
			end

		elseif ( stats.fullStack ) then
			text = text..format(MARKETWATCHER_FULLSTACKAUCTIONS, stats.fullStack.auctions);
			text = text..LowestBuyoutText(stats.fullStack, MARKETWATCHER_LOWESTBUYOUTPERUNIT);
		end
		if ( not stats.single and stats.nonFullStack ) then
			text = text..format(MARKETWATCHER_NONFULLSTACKAUCTIONS, stats.nonFullStack.auctions);
			text = text..LowestBuyoutText(stats.nonFullStack, MARKETWATCHER_LOWESTBUYOUTPERUNIT, true);
		end
	
		textFontString:SetText(text);
		textFontString:Show();
		button.n = n;
		button.itemId = stats.itemId;

		if ( scan.selectedItem and scan.selectedItem == button.itemId ) then
			button:LockHighlight();
		else
			button:UnlockHighlight();
		end

		button:Show();
	else
		button:Hide();
	end
end

function scan.DisplayStats()

	for i = 1, 8 do
		scan.UpdateStatsButton(i);
	end
	FauxScrollFrame_Update(MarketWatcherScanFrameStatsScrollFrame, ceil(#displayedStats / 2), 4, 85);
end

function scan.ScanStatsButton_OnEnter(self)
	if ( not self.itemId ) then
		return
	end
	
	MarketWatcherScanMouseoverFrame:ClearAllPoints();
	MarketWatcherScanMouseoverFrame:SetPoint("TOPLEFT", self, "TOPRIGHT");
	MarketWatcherScanMouseoverFrame:Show();
	scan.SetMouseoverFrame(self);

	local _, link = GetItemInfo(self.itemId);
	if ( link ) then
		GameTooltip:SetOwner(self, "ANCHOR_BOTTOM");
		--GameTooltip:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 0, 0);
		GameTooltip:SetHyperlink(link);
		GameTooltip:Show();
	end

	if ( MarketWatcher.Graph and MarketWatcher.Graph.CanDisplayGraph(self.itemId) ) then
		local new;
		if ( not MarketWatcherScanStatsTooltipGraph ) then
			new = true;
		end

		local timePeriod = MarketWatcher.GetConfig().graphSettings["timePeriod"] or 0;
		if ( timePeriod == 0 ) then
			timePeriod = MarketWatcher.Graph.periods[1] or (86400 * 31);
		else
			timePeriod = MarketWatcher.Graph.periods[timePeriod];
		end
		MarketWatcher.Graph.DisplayGraph(	self.itemId,
							(time() - timePeriod),
							MarketWatcher.GetConfig().graphSettings or MarketWatcher.Graph.defaultMethods,
							"MarketWatcherScanStatsTooltipGraph",
							UIParent, "BOTTOM", "TOP", 0, 0, 240, 175, gridColor
		);

		if ( new ) then
			local bg = CreateFrame("Frame", "MarketWatcherScanStatsTooltipGraphBg", MarketWatcherScanStatsTooltipGraph);
			bg:SetPoint("TOPLEFT", MarketWatcherScanStatsTooltipGraph, "TOPLEFT", -5, 5);
			bg:SetPoint("BOTTOMRIGHT", MarketWatcherScanStatsTooltipGraph, "BOTTOMRIGHT", 5, -6);

			bg:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
				         edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
				         tile = true, tileSize = 16, edgeSize = 16,
				         insets = { left = 4, right = 4, top = 4, bottom = 4 }
			});
			bg:SetBackdropColor(0, 0, 0, 1);
			bg:SetFrameStrata("TOOLTIP");
			MarketWatcherScanStatsTooltipGraph:SetFrameStrata("TOOLTIP");
			bg:SetFrameLevel( bg:GetParent():GetFrameLevel() - 1 );
		end

		MarketWatcherScanStatsTooltipGraph:SetPoint("BOTTOM", self, "TOP", 0, 4);
	end
end

function scan.SetMouseoverFrame(button)
	if ( not displayedStats or #displayedStats == 0 ) then
		return
	end

	local frame = MarketWatcherScanMouseoverFrame;

	if ( button.n and displayedStats[button.n] ) then

		local headerFontString = _G[frame:GetName().."HeaderText"];
		local numAuctionsFontString = _G[frame:GetName().."NumAuctionsText"];
		local stackSizeFontString = _G[frame:GetName().."StackSizeText"];
		local priceFontString = _G[frame:GetName().."PriceText"];

		local stats = displayedStats[button.n];
		local itemId = stats.itemId;
		frame.itemId = itemId;
		frame.button = button;
		local itemInfo = MarketWatcher.GetItemInfoTable(itemId);
		if ( not itemInfo or not itemInfo.name ) then
			frame:Hide();
			return
		end
		local _, _, _, qualityHex = GetItemQualityColor(itemInfo.quality);
		local found, mine;
		local playerName = UnitName("player");
		local timeAgo = SecondsToTime(time() - MarketWatcher.GetScanTimestamp(itemId, 0) + 1);
		local list = {};

		local headerText = "|T"..itemInfo.texture..":16:16:0:0|t|c"..qualityHex.." "..itemInfo.name.."|r\n";
		headerText = headerText..format(MARKETWATCHER_AS_OF_AGO, timeAgo).."\n";
		headerText = headerText..AUCTION_TOOLTIP_BUYOUT_PREFIX:sub(1, -2);
		headerFontString:SetText(headerText);

		local numAuctionsText, stackSizeText, priceText = "", "", "";

		for count, seller, buyout, perUnitBuyout, bid, timeleft, instances in MarketWatcher.AuctionsIterator(itemId, 0) do

			found = false;
			if ( seller == playerName ) then
				mine = true;
			else
				mine = nil;
			end
			for _, v in ipairs(list) do
				if ( v[2] == count and v[3] == perUnitBuyout ) then
					v[1] = v[1] + instances;
					found = true;
					if ( mine ) then
						v[4] = mine;
					end
					break;
				end
			end
			
			if ( not found ) then
				tinsert(list, { instances, count, perUnitBuyout, mine, });
			end
		end

		table.sort(list, function(a, b)
			if ( a[3] == 0 ) then
				return false;
			end
			if ( b[3] == 0 ) then
				return true;
			end

			if ( a[3] == b[3] ) then
				return a[2] < b[2];
			else
				return a[3] < b[3];
			end
		end);

		for i, v in ipairs(list) do

			-- a lot (mid 40s or so) of textures in a fontstring causes a client crash
			if ( i < 40 ) then
				if ( v[1] > 1 ) then
					numAuctionsText = numAuctionsText.."|cff00ffff"..v[1].."|rx\n";
				else
					numAuctionsText = numAuctionsText.."\n";
				end

				stackSizeText = stackSizeText.."[|cffffffff"..v[2].."|r]\n";

				if ( v[3] > 0 ) then
					priceText = priceText..MarketWatcher.MoneyText(v[3]);
				else
					priceText = priceText.."--";
				end
				if ( v[4] ) then
					priceText = priceText.." "..MARKETWATCHER_YOURS;
				end
				priceText = priceText.."\n";

			elseif ( i == 40 ) then
				priceText = priceText..MARKETWATCHER_MORE.."...\n";
			end

			list[i][1] = nil;
			list[i][2] = nil;
			list[i][3] = nil;
			list[i] = nil;
		end

		numAuctionsFontString:SetText(numAuctionsText);
		stackSizeFontString:SetText(stackSizeText);
		priceFontString:SetText(priceText);

		frame:SetHeight( headerFontString:GetStringHeight() + numAuctionsFontString:GetStringHeight() + 20 );
		frame:SetWidth( headerFontString:GetStringWidth() + 12 );
	else
		frame:Hide();
	end
end

function scan.StatsButton_OnClick(self, button)
	if ( button == "LeftButton" ) then
		
		if ( not CanSendAuctionQuery() ) then
			return
		end

		local itemInfo = MarketWatcher.GetItemInfoTable(self.itemId);
		if ( not itemInfo or not itemInfo.name ) then
			return
		end

		scan.selectedItem = self.itemId;
		soldOne = false;
		soldStack = false;
		noDefaultPrice = true;
		scan.DisplayStats();
		scan.UpdateQuickSell();

		MarketWatcher.listFunction = scan.AuctionsListUpdate;
		scan.page = 0;
		scan.ClearListAuctions();
		
		local exact = true;
		if ( itemInfo.classID == LE_ITEM_CLASS_WEAPON or itemInfo.classID == LE_ITEM_CLASS_ARMOR ) then
			exact = false;
		end
		MarketWatcher.QueryItem(scan.selectedItem, scan.page, exact);
		scan.AuctionWaitingIndicator();

	elseif ( button == "RightButton" ) then

		if ( IsShiftKeyDown() ) then

			-- add to watched

			local itemInfo, tempItem = MarketWatcher.GetItemInfoTable(self.itemId);

			if ( self.itemId and GetItemInfo(self.itemId) and (not itemInfo or tempItem) ) then
				MarketWatcher.AddWatchedItem(self.itemId);
				
				DEFAULT_CHAT_FRAME:AddMessage(format(MARKETWATCHER_ADDED_TO_WATCHED, MarketWatcher.GetItemInfoTable(self.itemId).name), 0, 1, 1);
			end
			return
		end

		-- hide item

		local index = self.n;

		if ( not index ) then
			return
		end
		if ( scan.selectedItem and scan.selectedItem == displayedStats[index].itemId ) then
			scan.selectedItem = nil;
			scan.ClearListAuctions();
		end

		scan.HideItem(index);

		scan.UpdateFilterResultText();
		scan.SortStats();
		scan.DisplayStats();

		if ( MarketWatcherScanMouseoverFrame:IsVisible() and MarketWatcherScanMouseoverFrame.itemId == scan.selectedItem ) then
			scan.SetMouseoverFrame(MarketWatcherScanMouseoverFrame.button);
		end
	end
end

function scan.IsItemHidden(itemId)
	for index, stats in ipairs(hideList) do
		if ( stats.itemId == itemId ) then
			return index;
		end
	end
end

function scan.HideItem(index)
	table.insert(hideList, displayedStats[index]);
	table.remove(displayedStats, index);
end

function scan.UnHideItem(itemId)
	local index;

	for hideIndex, stats in ipairs(hideList) do
		if ( stats.itemId == itemId ) then
			index = hideIndex;
			break;
		end
	end

	if ( index ) then
		table.insert(displayedStats, hideList[index]);
		table.remove(hideList, index);
	end
end

function scan.UnHideButton_OnClick(self)

	local index = 1;
	local stats;

	stats = hideList[index];
	while ( stats ) do
		table.insert(displayedStats, hideList[index]);
		table.remove(hideList, index);
		stats = hideList[index];
	end

	scan.UpdateFilterResultText();
	scan.SortStats();
	scan.DisplayStats();
end

function scan.UpdateFilterResultText()

	local numDisplayed = #displayedStats;
	local numHidden = #hideList;
	local numFiltered = #filteredStats;
	local numTotal = numFiltered + numDisplayed + numHidden;

	MarketWatcherScanFrameItemsDisplayedText:SetFormattedText(MARKETWATCHER_ITEMS_DISPLAYED, numDisplayed, numTotal);

	if ( numDisplayed < numTotal ) then
		MarketWatcherScanFrameItemsDisplayedText:SetText( MarketWatcherScanFrameItemsDisplayedText:GetText()..format(MARKETWATCHER_NUM_HIDDEN, numFiltered, numHidden) );
	end
	if ( numHidden > 0 ) then
		MarketWatcherScanFrameUnHideButton:Show();
	else
		MarketWatcherScanFrameUnHideButton:Hide();
	end
end


---------------------------------------------------------------------------------
--	Auction List Panel Functions
---------------------------------------------------------------------------------

function scan.ClearListAuctions()
	MarketWatcherScanFrameAuctionsScrollFrameScrollBar:SetValue(0);

	for i = 1, 20 do
		_G["MarketWatcherScanFrameAuctionsButton"..i]:Hide();
	end

	MarketWatcherScanFrameAuctionsText:Hide();

	MarketWatcherScanFrameAuctionsPrevPageButton:Hide();
	MarketWatcherScanFrameAuctionsNextPageButton:Hide();

	MarketWatcherScanFrameAuctionsSearchCountText:Hide();
	MarketWatcherScanFrameAuctionsScrollFrame:Hide();
	MarketWatcherScanFrameAuctionsSellOptions:Hide();
	MarketWatcherScanFrameBuyoutButton:Disable();

	for i in ipairs(listAuctions) do
		listAuctions[i] = nil;
	end
end

function scan.AuctionWaitingIndicator()
	local frame = MarketWatcherScanFrameAuctionsText;
	frame:Show();

	if ( not frame.wait or frame.wait > #waitIndicator ) then
		frame.wait = 1;
	end
	MarketWatcherScanFrameAuctionsText:SetText(waitIndicator[frame.wait]);

	frame.wait = frame.wait + 1;
	timer.StartTimer(.1, scan.AuctionWaitingIndicator);
end

function scan.AuctionsListUpdate()
	local numBatchAuctions, totalAuctions = GetNumAuctionItems("list");

	timer.StopTimer();			-- stop waiting indicator, or impending UpdateStats() call due to an auction with no seller name

	local itemInfo = MarketWatcher.GetItemInfoTable(scan.selectedItem);
	local _, itemId, itemLink, auctions, button, buttonName, name, texture, unknownSeller, myBuyoutPrice, lowestBuyout;
	local count, seller, buyoutPrice, buyoutPricePerUnit, minBid, minIncrement, bidAmount, highBidder, timeleft, instances;
	local playerName = UnitName("player");

	scan.ClearListAuctions();

	if ( not itemInfo or not itemInfo.name ) then
		MarketWatcher.listFunction = nil;
		return
	end

	MarketWatcherScanFrameAuctionsSellOptions:Show();
	MarketWatcherScanFrameAuctionsSellOptionsCreateButton:Disable();
	MarketWatcherScanFrameAuctionsSellOptionsCancelAuctionsButton:Disable();

	for i = 1, numBatchAuctions do
		name, texture, count, _, _, _, _, minBid, minIncrement, buyoutPrice, bidAmount, highBidder, _, seller = GetAuctionItemInfo("list", i);
		itemLink = GetAuctionItemLink("list", i);
		itemId = MarketWatcher.DecodeItemLink(itemLink);

		if ( not seller ) then
			unknownSeller = true;
		end

		if ( itemId == scan.selectedItem ) then

			timeleft = GetAuctionItemTimeLeft("list", i);

			if ( bidAmount ~= 0 ) then
				minBid = bidAmount + minIncrement;
			end

			if ( buyoutPrice == 0 ) then

				buyoutPricePerUnit = 0;
			else

				buyoutPricePerUnit = floor(buyoutPrice / count);
				if ( buyoutPricePerUnit == 0 ) then
					buyoutPricePerUnit = 1;
				end

				if ( buyoutPrice > 0 ) then
					if ( not lowestBuyout ) then
						lowestBuyout = buyoutPricePerUnit;
					elseif ( lowestBuyout > buyoutPricePerUnit ) then
						lowestBuyout = buyoutPricePerUnit;
					end
				end
			end

			if ( seller == playerName ) then
				MarketWatcherScanFrameAuctionsSellOptionsCancelAuctionsButton:Enable();
				if ( not myBuyoutPrice ) then
					myBuyoutPrice = buyoutPricePerUnit;
				elseif ( myBuyoutPrice > buyoutPricePerUnit ) then
					myBuyoutPrice = buyoutPricePerUnit;
				end
			end

			table.insert( listAuctions, { count, seller or "", timeleft, bidAmount, buyoutPrice, buyoutPricePerUnit, highBidder, texture, i, minBid } );
		end
	end

	auctions = #listAuctions;

	table.sort(listAuctions, function(a, b)
		-- if buyout price == 0, push it below all auctions with buyouts
		if ( a[5] == 0 ) then
			return false;
		end
		if ( b[5] == 0 ) then
			return true;
		end

		if ( a[6] == b[6] ) then
			return a[1] < b[1];
		else
			return a[6] < b[6];
		end
	end);

	if ( numBatchAuctions == 0 ) then
		MarketWatcherScanFrameAuctionsText:Show();
		MarketWatcherScanFrameAuctionsText:SetText(BROWSE_NO_RESULTS);
	else
		if ( auctions == 0 ) then
			MarketWatcherScanFrameAuctionsText:Show();
			MarketWatcherScanFrameAuctionsText:SetFormattedText(MARKETWATCHER_ITEM_NOT_IN_PAGE, itemInfo.name);
		else
			MarketWatcherScanFrameAuctionsText:Hide();
		end
	end

	--[[
	if ( auctions > 0 ) then
		buyoutPrice = MoneyInputFrame_GetCopper(MarketWatcherScanFrameAuctionsSellOptionsSellOneBuyoutMoney);

		if ( buyoutPrice > 0 and lowestBuyout and buyoutPrice > lowestBuyout ) then
			if ( myBuyoutPrice and lowestBuyoutPrice == myBuyoutPrice ) then
				buyoutPrice = myBuyoutPrice;
			else
				buyoutPrice = lowestBuyout - 1;
			end
			MoneyInputFrame_SetCopper(MarketWatcherScanFrameAuctionsSellOptionsSellOneBidMoney, buyoutPrice);
			MoneyInputFrame_SetCopper(MarketWatcherScanFrameAuctionsSellOptionsSellOneBuyoutMoney, buyoutPrice);
		end
	end
	]]
	scan.CheckInvForItem();
	if ( MarketWatcher.CanCreate(scan.selectedItem) ) then
		MarketWatcherScanFrameAuctionsSellOptionsCreateButton:Enable();
	end

	local lastPage = ceil(totalAuctions / NUM_AUCTION_ITEMS_PER_PAGE) - 1;
	MarketWatcherScanFrameAuctionsSearchCountText:SetFormattedText(MERCHANT_PAGE_NUMBER, scan.page + 1, lastPage + 1);
	MarketWatcherScanFrameAuctionsSearchCountText:Show();

	if ( totalAuctions > NUM_AUCTION_ITEMS_PER_PAGE ) then
		MarketWatcherScanFrameAuctionsPrevPageButton:Show();
		MarketWatcherScanFrameAuctionsNextPageButton:Show();
		--local itemsMin = AuctionFrameBrowse.page * NUM_AUCTION_ITEMS_PER_PAGE + 1;
		--local itemsMax = itemsMin + numBatchAuctions - 1;
		--MarketWatcherScanFrameAuctionsSearchCountText:SetFormattedText(NUMBER_OF_RESULTS_TEMPLATE, itemsMin, itemsMax, totalAuctions);
		if ( scan.page == 0 ) then
			MarketWatcherScanFrameAuctionsPrevPageButton:Disable();
		else
			MarketWatcherScanFrameAuctionsPrevPageButton:Enable();
		end
		if ( scan.page == lastPage ) then
			MarketWatcherScanFrameAuctionsNextPageButton:Disable();
		else
			MarketWatcherScanFrameAuctionsNextPageButton:Enable();
		end
		
	else
		MarketWatcherScanFrameAuctionsPrevPageButton:Hide();
		MarketWatcherScanFrameAuctionsNextPageButton:Hide();

		if ( totalAuctions == 0 ) then
			MarketWatcherScanFrameAuctionsSearchCountText:Hide();
		end
	end

	-- update stats for this item
	if ( not unknownSeller ) then
		scan.UpdateStats();
	else
		timer.StartTimer(10, scan.UpdateStats);
		scan.UpdateQuickSell();
	end

	FauxScrollFrame_Update(MarketWatcherScanFrameAuctionsScrollFrame, auctions, 20, 16);
	scan.ListAuctions_Update();
end

function scan.ListAuctions_Update()
	local offset = FauxScrollFrame_GetOffset(MarketWatcherScanFrameAuctionsScrollFrame);

	MarketWatcherScanFrameBuyoutButton:Disable();

	local auctions, button, buttonName, name, texture, bidStatus;
	local NUM_BUTTONS = 20;

	auctions = #listAuctions;
	if ( offset > (auctions - NUM_BUTTONS) ) then
		MarketWatcherScanFrameAuctionsScrollFrameScrollBar:SetValue(0);
		offset = 0;
	end

	local playerName = UnitName("player");

	for i, auction in ipairs(listAuctions) do

		if ( i > offset and i <= (offset + NUM_BUTTONS) ) then

			buttonName = "MarketWatcherScanFrameAuctionsButton"..(i - offset);
			button = _G[buttonName];

			_G[buttonName.."Seller"]:SetText(auction[2]);
			
			if ( auction[7] ) then			-- if I'm the high bidder
				bidStatus = "+";
			elseif ( auction[4] > 0 ) then		-- if there is a bid placed
				bidStatus = "*";
			else
				bidStatus = "";
			end
			_G[buttonName.."TimeLeft"]:SetText(AuctionFrame_GetTimeLeftText(auction[3])..bidStatus);

			if ( auction[5] == 0 ) then
				_G[buttonName.."CostPerUnit"]:SetText(MARKETWATCHER_NOBUYOUT);
				_G[buttonName.."Cost"]:SetText(MarketWatcher.MoneyText(auction[10]));
			else
				_G[buttonName.."Cost"]:SetText(MarketWatcher.MoneyText(auction[5]));
				_G[buttonName.."CostPerUnit"]:SetText(MarketWatcher.MoneyText(auction[6]));
			end
			_G[buttonName.."ItemIconTexture"]:SetTexture(auction[8]);
			if ( auction[1] > 1 ) then
				_G[buttonName.."ItemCount"]:SetText(auction[1]);
				_G[buttonName.."ItemCount"]:Show();
			else
				_G[buttonName.."ItemCount"]:Hide();
			end

			if ( GetSelectedAuctionItem("list") and GetSelectedAuctionItem("list") == auction[9] ) then
				button:LockHighlight();

				if ( not auction[7] and auction[5] > 0 and auction[2] ~= playerName ) then
					MarketWatcherScanFrameBuyoutButton:Enable();
				end
			else
				button:UnlockHighlight();
			end

			button.index = auction[9];
			button:Show();
		end
	end

	-- if some buttons need to be hidden
	if ( (offset + NUM_BUTTONS) > auctions ) then
		for i = ((auctions - offset) + 1), NUM_BUTTONS do
			button = _G["MarketWatcherScanFrameAuctionsButton"..i];
			if ( button ) then
				button:Hide();
			end
		end
	end
end

function scan.UpdateStats()

	local numBatchAuctions, totalAuctions = GetNumAuctionItems("list");

	if ( numBatchAuctions == totalAuctions and scan.selectedItem ) then

		local index = scan.GetStatsIndex(scan.selectedItem);

		if ( index ) then
			MarketWatcher.DeleteTempItem(scan.selectedItem);
			MarketWatcher.AddTempItem(scan.selectedItem, time());
			status.queryTime = time();
			scan.processed[scan.selectedItem] = nil;
			scan.GetAuctions();
			scan.OnPageComplete();
			scan.OnQueryComplete();
			scan.processed[scan.selectedItem] = true;
			scan.ComputeItemStats(scan.selectedItem, index);

			if ( MarketWatcher.GetConfig().filtersApplied and MarketWatcher.GetConfig().reapplyFilters ) then
				scan.ApplyFilters();
			else
				scan.DisplayStats();
			end

			if ( MarketWatcherScanMouseoverFrame:IsVisible() and MarketWatcherScanMouseoverFrame.itemId == scan.selectedItem ) then
				scan.SetMouseoverFrame(MarketWatcherScanMouseoverFrame.button);
			end

			if ( MarketWatcher.GetConfig().saveOnBrowse ) then
				scan.WriteHistory("update", scan.selectedItem);
			end

			scan.UpdateQuickSell();
		end
	end
end

local function Undercut(undercut, price)
	if ( not undercut or undercut < 1 ) then
		return floor(price - 1);
	else
		return floor( price - (price * (undercut / 100)) );
	end
end

function scan.UpdateQuickSell()
	if ( not scan.selectedItem ) then
		return
	end
	if ( not soldOne ) then
		scan.UpdateSinglePrice();
	end
	if ( not soldStack ) then
		scan.UpdateStackPrice();
	end
end

function scan.UpdateSinglePrice()
	local index = scan.GetStatsIndex(scan.selectedItem);
	local stats = displayedStats[index];
	local itemInfo = MarketWatcher.GetItemInfoTable(scan.selectedItem);
	local price = 0;
	local bidPrice = 0;
	local undercut = MarketWatcher.GetConfig().defaultUndercut or 0;

	if ( stats and itemInfo and stats.totalAuctions > 0 and stats.lowestBuyoutPerUnit ) then

		local type;

		if ( stats.single and stats.single.lowestBuyoutPerUnit ) then
			type = "single";
		elseif ( stats.nonSingle and stats.nonSingle.lowestBuyoutPerUnit ) then
			type = "nonSingle";
		elseif ( stats.nonFullStack and stats.nonFullStack.lowestBuyoutPerUnit ) then
			type = "nonFullStack";
		end

		if ( type ) then
			if (	stats[type].myBuyoutPerUnit 
				and ( not stats[type].theirBuyoutPerUnit or stats[type].myBuyoutPerUnit < stats[type].theirBuyoutPerUnit )
			) then
				price = floor(stats[type].myBuyoutPerUnit);
			else
				price = Undercut(undercut, stats[type].lowestBuyoutPerUnit);
			end
		else
			price = Undercut(undercut, stats.lowestBuyoutPerUnit);
		end

		bidPrice = floor( price - (price * ((MarketWatcher.GetConfig().bidPriceMarkdown or 0) / 100)) );
		MoneyInputFrame_SetCopper( MarketWatcherScanFrameAuctionsSellOptionsSellOneBidMoney,    bidPrice );
		MoneyInputFrame_SetCopper( MarketWatcherScanFrameAuctionsSellOptionsSellOneBuyoutMoney, price );

		noDefaultPrice = false;
	else
		if (	lastEnteredPriceCategory == LE_ITEM_CLASS_GLYPH or
			( lastEnteredPriceCategory == itemInfo.classID and lastEnteredPriceSubCategory == itemInfo.subClassID and lastEnteredPriceName == itemInfo.name )
		) then
			bidPrice = floor(lastEnteredPrice);
			price = floor(lastEnteredBuyoutPrice);
		end
		MoneyInputFrame_SetCopper( MarketWatcherScanFrameAuctionsSellOptionsSellOneBidMoney,    bidPrice);
		MoneyInputFrame_SetCopper( MarketWatcherScanFrameAuctionsSellOptionsSellOneBuyoutMoney, price);
	end
end

function scan.UpdateStackPrice()
	local index = scan.GetStatsIndex(scan.selectedItem);
	local stats = displayedStats[index];
	local itemInfo = MarketWatcher.GetItemInfoTable(scan.selectedItem);
	local price = 0;
	local bidPrice = 0;
	local undercut = MarketWatcher.GetConfig().defaultUndercut or 0;
	local stackSize = MarketWatcherScanFrameAuctionsSellOptionsStackSizeEditBox:GetNumber();

	if ( stats and itemInfo and stats.totalAuctions > 0 and stats.lowestBuyoutPerUnit ) then

		local type;

		if ( stackSize == itemInfo.stackCount and stats.fullStack and stats.fullStack.lowestBuyoutPerUnit ) then
			type = "fullStack";
		elseif ( stats.nonSingle and stats.nonSingle.lowestBuyoutPerUnit ) then
			type = "nonSingle";
		elseif ( stats.nonFullStack and stats.nonFullStack.lowestBuyoutPerUnit ) then
			type = "nonFullStack";
		end

		if ( type ) then
			if (	stats[type].myBuyoutPerUnit
				and ( not stats[type].theirBuyoutPerUnit or stats[type].myBuyoutPerUnit < stats[type].theirBuyoutPerUnit )
			) then
				price = floor(stats[type].myBuyoutPerUnit * stackSize);
			else
				price = Undercut(undercut, stats[type].lowestBuyoutPerUnit * stackSize);
			end
		else
			price = Undercut(undercut, stackSize * stats.lowestBuyoutPerUnit);
		end

		bidPrice = floor( price - (price * ((MarketWatcher.GetConfig().bidPriceMarkdown or 0) / 100)) );
		MoneyInputFrame_SetCopper( MarketWatcherScanFrameAuctionsSellOptionsSellStackBidMoney,    bidPrice );
		MoneyInputFrame_SetCopper( MarketWatcherScanFrameAuctionsSellOptionsSellStackBuyoutMoney, price );
	else
		if (	lastEnteredPriceCategory == LE_ITEM_CLASS_GLYPH or
			( lastEnteredPriceCategory == itemInfo.classID and lastEnteredPriceSubCategory == itemInfo.subClassID and lastEnteredPriceName == itemInfo.name )
		) then
			bidPrice = floor(lastEnteredPrice * stackSize);
			price = floor(lastEnteredBuyoutPrice * stackSize);
		end
		MoneyInputFrame_SetCopper( MarketWatcherScanFrameAuctionsSellOptionsSellStackBidMoney,    bidPrice);
		MoneyInputFrame_SetCopper( MarketWatcherScanFrameAuctionsSellOptionsSellStackBuyoutMoney, price);
	end
end

function scan.AuctionButton_OnClick(self, button)
	if ( button == "LeftButton" ) then
		SetSelectedAuctionItem("list", self.index);
		scan.ListAuctions_Update();

	elseif ( button == "RightButton" and IsShiftKeyDown() ) then
		local name, _, _, _, _, _, _, _, _, buyoutPrice = GetAuctionItemInfo("list", self.index);
		PlaceAuctionBid("list", self.index, buyoutPrice);
		self:Hide();
		GameTooltip:Hide();
	end
end

function scan.ListQuery()

	local filter = MarketWatcher.ConstructFilterFromId(scan.selectedItem);
	local itemInfo = MarketWatcher.GetItemInfoTable(scan.selectedItem);

	if ( itemInfo ) then
		MarketWatcher.QueryServer(itemInfo.name, nil, nil, filter, scan.page, nil, itemInfo.quality, true, false);
	end
end

function scan.AuctionButton_OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	local name, texture, count, quality, canUse, level, _, minBid, minIncrement, buyoutPrice, bidAmount, highBidder, _, owner = GetAuctionItemInfo("list", self.index);

	if ( bidAmount > 0 ) then
		minBid = bidAmount + minIncrement;
	end

	local color = { GetItemQualityColor(quality) };
	GameTooltip:AddLine( name, color[1], color[2], color[3] );

	if ( highBidder ) then
		GameTooltip:AddLine( MARKETWATCHER_YOU_ARE_HIGH_BIDDER, 1, 1, 1 );
	elseif ( bidAmount > 0 ) then
		GameTooltip:AddLine( MARKETWATCHER_HASBID2.." ("..MarketWatcher.MoneyText(bidAmount)..")", 1, 1, 1 );
	end

	GameTooltip:AddLine("|n");
	if ( buyoutPrice > 0 ) then
		SetTooltipMoney(GameTooltip, buyoutPrice, "STATIC", BUYOUT_AUCTION_CONFIRMATION);
		SetTooltipMoney(GameTooltip, ceil(buyoutPrice / count), "STATIC", AUCTION_TOOLTIP_BUYOUT_PREFIX);
	else
		SetTooltipMoney(GameTooltip, minBid, "STATIC", BID);
		SetTooltipMoney(GameTooltip, ceil(minBid / count), "STATIC", AUCTION_TOOLTIP_BID_PREFIX);
	end

	GameTooltip:Show();
	--GameTooltip_ShowCompareItem();
end

function scan.SellButton_OnClick(self, sellCount)

	local buyoutPrice, bidPrice;

	if ( not sellCount or sellCount == 1 ) then
		buyoutPrice = MoneyInputFrame_GetCopper(MarketWatcherScanFrameAuctionsSellOptionsSellOneBuyoutMoney);
		bidPrice = MoneyInputFrame_GetCopper(MarketWatcherScanFrameAuctionsSellOptionsSellOneBidMoney);
		sellCount = 1;
	elseif ( sellCount == "stack" ) then
		buyoutPrice = MoneyInputFrame_GetCopper(MarketWatcherScanFrameAuctionsSellOptionsSellStackBuyoutMoney);
		bidPrice = MoneyInputFrame_GetCopper(MarketWatcherScanFrameAuctionsSellOptionsSellStackBidMoney);
		sellCount = MarketWatcherScanFrameAuctionsSellOptionsStackSizeEditBox:GetNumber();
	end

	local bag, slot, count, sumItems = MarketWatcher.FindItemInBags(scan.selectedItem, sellCount);

	if ( not bag or buyoutPrice == 0 or CursorHasItem() or SpellIsTargeting() ) then
		return
	end
	if ( GetAuctionSellItemInfo() ) then
		--PlaySoundFile("sound\\interface\\Error.wav");
		UIErrorsFrame:AddMessage( MARKETWATCHER_REMOVE_ITEM_AUCTIONS_TAB, 1.0, 0.1, 0.1, 1.0 );
		return
	end

	if ( bidPrice == 0 ) then
		bidPrice = 1;
	end
	if ( bidPrice > buyoutPrice ) then
		--PlaySoundFile("sound\\interface\\Error.wav");
		UIErrorsFrame:AddMessage( MARKETWATCHER_BUYOUT_LESS_THAN_BID, 1.0, 0.1, 0.1, 1.0 );
		return
	end

	local index = scan.GetStatsIndex(scan.selectedItem);
	local stats = displayedStats[index];

	if ( sellCount == 1 ) then
		soldOne = true;
	else
		soldStack = true;
	end

	if ( noDefaultPrice ) then
		local itemInfo = MarketWatcher.GetItemInfoTable(scan.selectedItem);
		lastEnteredPrice = bidPrice / sellCount;
		lastEnteredBuyoutPrice = buyoutPrice / sellCount;
		lastEnteredPriceCategory = itemInfo.classID;
		lastEnteredPriceSubCategory = itemInfo.subClassID;
		lastEnteredPriceName = itemInfo.name;
	end

	if ( sumItems < sellCount ) then
		--PlaySoundFile("sound\\interface\\Error.wav");
		UIErrorsFrame:AddMessage( MARKETWATCHER_DO_NOT_HAVE_THAT_MANY, 1.0, 0.1, 0.1, 1.0 );
		return
	end

	self:Disable();

	--AuctionsItemButton:UnregisterEvent("AUCTION_OWNED_LIST_UPDATE");

	PickupContainerItem(bag, slot);
	ClickAuctionSellItemButton();
	local deposit = GetAuctionDeposit(sellDuration, bidPrice, buyoutPrice, sellCount);
	UIErrorsFrame:AddMessage( format(MARKETWATCHER_DEPOSIT_PAID, MarketWatcher.MoneyText(deposit)), 1.0, 1.0, 1.0, 1.0 );

	--AuctionFrameAuctions.duration = sellDuration or 3;

	PostAuction(bidPrice, buyoutPrice, sellDuration or 3, sellCount, 1);
	
	if ( deposit == 0 ) then
		timer.StartTimer(2, scan.CheckInvForItem);
	end

	--scan.ListQuery();

	--AuctionsItemButton:RegisterEvent("AUCTION_OWNED_LIST_UPDATE");
end

function scan.CreateButton_OnClick(self)

	local index = MarketWatcher.CanCreate(scan.selectedItem);

	if ( not index ) then
		return
	end

	DoTradeSkill(index);

	self:GetParent():RegisterEvent("ITEM_PUSH");
	self:GetParent():SetScript("OnEvent", scan.AuctionsCreated_OnEvent);
end

function scan.AuctionsCreated_OnEvent(self, event, arg1, ...)
	if ( event ~= "ITEM_PUSH" ) then
		return
	end
	if ( not scan.CheckInvForItem() ) then
		timer.StartTimer(1, scan.CheckInvForItem);
	end
	self:UnregisterEvent("ITEM_PUSH");
end

function scan.CheckInvForItem()
	if ( not scan.selectedItem ) then
		return
	end
	local stackCount = MarketWatcher.GetItemInfoTable(scan.selectedItem).stackCount;
	local bag, slot, count, total = MarketWatcher.FindItemInBags(scan.selectedItem, stackCount);

	if ( bag and total > 1 ) then
		MarketWatcherScanFrameAuctionsSellOptionsSellStackBidMoney:Show();
		MarketWatcherScanFrameAuctionsSellOptionsSellStackBuyoutMoney:Show();
		MarketWatcherScanFrameAuctionsSellOptionsSellStackButton:Enable();
		MarketWatcherScanFrameAuctionsSellOptionsStackSizeEditBox:Show();

		if ( not soldStack ) then
			if ( total >= stackCount ) then
				MarketWatcherScanFrameAuctionsSellOptionsStackSizeEditBox:SetText(stackCount);
			else
				MarketWatcherScanFrameAuctionsSellOptionsStackSizeEditBox:SetText(total);
			end
		end
	else
		MarketWatcherScanFrameAuctionsSellOptionsSellStackBidMoney:Hide();
		MarketWatcherScanFrameAuctionsSellOptionsSellStackBuyoutMoney:Hide();
		MarketWatcherScanFrameAuctionsSellOptionsSellStackButton:Disable();
		MarketWatcherScanFrameAuctionsSellOptionsStackSizeEditBox:Hide();
	end
	if ( bag ) then
		MarketWatcherScanFrameAuctionsSellOptionsSellOneBidMoney:Show();
		MarketWatcherScanFrameAuctionsSellOptionsSellOneBuyoutMoney:Show();
		MarketWatcherScanFrameAuctionsSellOptionsSellOneButton:Enable();

		MarketWatcherScanFrameAuctionsSellOptionsRadio1:Show();
		MarketWatcherScanFrameAuctionsSellOptionsRadio2:Show();
		MarketWatcherScanFrameAuctionsSellOptionsRadio3:Show();

		return true;
	else
		MarketWatcherScanFrameAuctionsSellOptionsSellOneBidMoney:Hide();
		MarketWatcherScanFrameAuctionsSellOptionsSellOneBuyoutMoney:Hide();
		MarketWatcherScanFrameAuctionsSellOptionsSellOneButton:Disable();

		MarketWatcherScanFrameAuctionsSellOptionsRadio1:Hide();
		MarketWatcherScanFrameAuctionsSellOptionsRadio2:Hide();
		MarketWatcherScanFrameAuctionsSellOptionsRadio3:Hide();
	end
end

function scan.CancelAuctionsButton_OnClick(self)
	if ( waitForOwnedListUpdate ) then
		return;
	end

	local numBatchAuctions, totalAuctions = GetNumAuctionItems("owner");

	local itemLink, itemId;

	for i = 1, numBatchAuctions do
		itemLink = GetAuctionItemLink("owner", i);
		itemId = MarketWatcher.DecodeItemLink(itemLink);
			
		if ( itemId == scan.selectedItem ) then
			CancelAuction(i);

			-- can only cancel one per button press now
			waitForOwnedListUpdate = true;
			return;
		end
	end
end

function scan.CancelUndercutAuctions()
	if ( waitForOwnedListUpdate ) then
		return;
	end

	local numBatchAuctions, totalAuctions = GetNumAuctionItems("owner");

	local _, itemLink, itemId, itemInfo, stackCount, index, stats, name, texture, count, buyoutPerUnit, type, saleStatus;
	local n = 0;

	for i = 1, numBatchAuctions do

		name, _, count, _, _, _, _, _, _, buyoutPrice, bidAmount, _, _, _, _, saleStatus = GetAuctionItemInfo("owner", i);

		itemLink = GetAuctionItemLink("owner", i);
		itemId = MarketWatcher.DecodeItemLink(itemLink);
		itemInfo = MarketWatcher.GetItemInfoTable(itemId);

		index = scan.GetStatsIndex(itemId);

		if ( saleStatus == 0 and bidAmount == 0 and itemInfo and itemInfo.name and index ) then

			stackCount = itemInfo.stackCount;
			stats = displayedStats[index];
			buyoutPerUnit = buyoutPrice / count;

			if ( stats ) then
			
				type = nil;
				if ( count == 1 and stats.single ) then
					type = "single";

				elseif ( count == stackCount and stats.fullStack ) then
					type = "fullStack";

				elseif ( stats.nonSingle ) then
					type = "nonSingle";
					
				elseif ( stats.nonFullStack ) then
					type = "nonFullStack";
				end
				
				if ( type and stats[type].theirBuyoutPerUnit and buyoutPerUnit >= stats[type].theirBuyoutPerUnit ) then

					CancelAuction(i);
					n = n + 1;

					-- can only cancel one per button press now
					waitForOwnedListUpdate = true;
					return;
				end
			end
		end
	end

	--DEFAULT_CHAT_FRAME:AddMessage(format(MARKETWATCHER_AUCTIONS_CANCELED, n), 1, 1, 0, 1);
	UIErrorsFrame:AddMessage( MARKETWATCHER_NO_AUCTIONS_TO_CANCEL, 1.0, 1.0, 1.0, 1.0 );
end

function scan.CreateButton_OnEnter(self)
	if ( not scan.selectedItem ) then
		return;
	end

	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");

	if ( GetNumTradeSkills() == 0 ) then
		GameTooltip:SetText(MARKETWATCHER_TOOLTIP5, nil, nil, nil, nil, 1);
		return;
	end
	
	local index, numAvail = MarketWatcher.CanCreate(scan.selectedItem);

	if ( not index ) then
		return
	end

	GameTooltip:AddLine( (MarketWatcher.GetItemInfoTable(scan.selectedItem).name or "").." ["..numAvail.."]", .5, .5, .5 );
	GameTooltip:AddLine("");

	local reagentName, reagentTexture, reagentCount, playerReagentCount;

	for i = 1, GetTradeSkillNumReagents(index) do
		reagentName, reagentTexture, reagentCount, playerReagentCount = GetTradeSkillReagentInfo(index, i);
		-- GetTradeSkillReagentInfo() returns nil for the first two values sometimes for whatever stupid reason
		GameTooltip:AddLine((reagentName or "???").." "..playerReagentCount.."/"..reagentCount, 1, 1, 1);
	end

	self:RegisterEvent("TRADE_SKILL_UPDATE");
	
	GameTooltip:Show();
end

function scan.RescanItemButton_OnClick(self)
	if ( not scan.selectedItem ) then
		return
	end

	scan.Scan("update", scan.selectedItem);
end

function scan.DurationRadio_OnClick(self)
	local id = self:GetID();

	MarketWatcherScanFrameAuctionsSellOptionsRadio1:SetChecked(nil);
	MarketWatcherScanFrameAuctionsSellOptionsRadio2:SetChecked(nil);
	MarketWatcherScanFrameAuctionsSellOptionsRadio3:SetChecked(nil);

	self:SetChecked(1);

	sellDuration = id;
end

function scan.DurationRadio_OnShow(self)
	local id = self:GetID();

	if ( id == sellDuration ) then
		self:SetChecked(1);
	else
		self:SetChecked(nil);
	end
end

function scan.StackSizeEditBox_OnTextChanged(self)
	local stackSize = self:GetNumber();
	local maxStackSize = MarketWatcher.GetItemInfoTable(scan.selectedItem).stackCount;

	if ( not maxStackSize or stackSize < 1 ) then
		self:SetText(1);
	elseif ( stackSize > maxStackSize ) then
		self:SetText(maxStackSize);
	end

	scan.UpdateStackPrice();
end

local function FindAuctionInList(count, seller, timeleft, bidAmount, buyoutPrice, highBidder, texture, index)
	for i, v in ipairs(listAuctions) do
		if (	count == v[1] 
			and seller == v[2]
			and timeleft == v[3]
			and bidAmount == v[4]
			and buyoutPrice == v[5]
			and highBidder == v[7]
			and texture == v[8]
			and index == v[9]
		) then
			return true;
		end
	end
end

function scan.VerifyListCache()
	local numBatchAuctions, totalAuctions = GetNumAuctionItems("list");

	local cacheAuctions = #listAuctions;
	local auctions = 0;

	if ( not scan.selectedItem ) then
		return false;
	end

	local _, itemId, itemLink, name, texture;
	local count, seller, buyoutPrice, minBid, minIncrement, bidAmount, highBidder, timeleft, instances;
	local playerName = UnitName("player");

	for i = 1, numBatchAuctions do
		name, texture, count, _, _, _, _, minBid, minIncrement, buyoutPrice, bidAmount, highBidder, _, seller = GetAuctionItemInfo("list", i);
		itemLink = GetAuctionItemLink("list", i);
		itemId = MarketWatcher.DecodeItemLink(itemLink);

		if ( not seller ) then
			seller = "";
		end

		if ( itemId == scan.selectedItem ) then

			auctions = auctions + 1;

			timeleft = GetAuctionItemTimeLeft("list", i);

			if ( buyoutPrice == 0 ) then

				if ( bidAmount == 0 ) then
					bidAmount = minBid;
				else
					bidAmount = bidAmount + minIncrement;
				end
			else
				bidAmount = buyoutPrice;
			end

			if ( not FindAuctionInList(count, seller, timeleft, bidAmount, buyoutPrice, highBidder, texture, i) ) then
				return false;
			end
		end
	end

	if ( auctions ~= cacheAuctions ) then
		return false;
	end
	return true;
end

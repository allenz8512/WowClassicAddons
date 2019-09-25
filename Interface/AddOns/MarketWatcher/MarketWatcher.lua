--[[
					Market Watcher
				written by Torrid of Black Dragonflight

To Do:

query/filter sets
more accurate graph methods
detailed view, list view
view hidden, filtered
clear filters button
disable have materials

]]

MarketWatcher = {};
local MarketWatcher = MarketWatcher;

local tempItemTable = {};

MarketWatcher.debug = false;

MarketWatcher.AUCTION_TIMELEFT = {
	[0] = 0,
	[1] = 1800, -- short; 30m
	[2] = 7200, -- medium; 2hr
	[3] = 28800, -- long; 8hr
	[4] = 86400, -- very long; 24hr
};
local AUCTION_TIMELEFT = MarketWatcher.AUCTION_TIMELEFT;
local maxAuctionTime = AUCTION_TIMELEFT[#AUCTION_TIMELEFT];

MarketWatcher.AUCTION_DURATIONS = {
	[1] = 120,
	[2] = 480,
	[3] = 1440,
};

-- how many auctions in each subclass before we scan the entire subclass rather than individual items
local SUBCLASS_THRESHOLD = {
	[LE_ITEM_CLASS_GLYPH] = {
		["all"] = 6,
	},
	[LE_ITEM_CLASS_GEM] = {
		["all"] = 4,
	},
};

--MarketWatcher.CLASSES = { GetAuctionItemClasses() };
MarketWatcher.CLASSES = { };
local CLASSES = MarketWatcher.CLASSES;

MarketWatcher.SUBCLASSES = { };
local SUBCLASSES = MarketWatcher.SUBCLASSES;

MarketWatcher.INVTYPES = {
	INVTYPE_HEAD,
	INVTYPE_NECK,
	INVTYPE_SHOULDER,
	INVTYPE_BODY,
	INVTYPE_CHEST,
	INVTYPE_WAIST,
	INVTYPE_LEGS,
	INVTYPE_FEET,
	INVTYPE_WRIST,
	INVTYPE_HAND,
	INVTYPE_FINGER,
	INVTYPE_TRINKET,
	INVTYPE_WEAPON,
	INVTYPE_SHIELD,
	INVTYPE_RANGEDRIGHT,
	INVTYPE_CLOAK,
	INVTYPE_2HWEAPON,
	INVTYPE_BAG,
	INVTYPE_TABARD,
	INVTYPE_ROBE,
	INVTYPE_WEAPONMAINHAND,
	INVTYPE_WEAPONOFFHAND,
	INVTYPE_HOLDABLE,
	INVTYPE_AMMO,
	INVTYPE_THROWN,
	INVTYPE_RANGED,
};
MarketWatcher.INVTYPE_NUM_LOOKUP = {
	INVTYPE_HEAD = LE_INVENTORY_TYPE_HEAD_TYPE,
	INVTYPE_NECK = LE_INVENTORY_TYPE_NECK_TYPE,
	INVTYPE_SHOULDER = LE_INVENTORY_TYPE_SHOULDER_TYPE,
	INVTYPE_BODY = LE_INVENTORY_TYPE_BODY_TYPE,
	INVTYPE_CHEST = LE_INVENTORY_TYPE_CHEST_TYPE,
	INVTYPE_WAIST = LE_INVENTORY_TYPE_WAIST_TYPE,
	INVTYPE_LEGS = LE_INVENTORY_TYPE_LEGS_TYPE,
	INVTYPE_FEET = LE_INVENTORY_TYPE_FEET_TYPE,
	INVTYPE_WRIST = LE_INVENTORY_TYPE_WRIST_TYPE,
	INVTYPE_HAND = LE_INVENTORY_TYPE_HAND_TYPE,
	INVTYPE_FINGER = LE_INVENTORY_TYPE_FINGER_TYPE,
	INVTYPE_TRINKET = LE_INVENTORY_TYPE_TRINKET_TYPE,
	INVTYPE_CLOAK = LE_INVENTORY_TYPE_CLOAK_TYPE,
	INVTYPE_HOLDABLE = LE_INVENTORY_TYPE_HOLDABLE_TYPE,
};
MarketWatcher.CLASS_IDS = {
	LE_ITEM_CLASS_WEAPON,
	LE_ITEM_CLASS_ARMOR,
	LE_ITEM_CLASS_CONTAINER,
	LE_ITEM_CLASS_GEM,
	LE_ITEM_CLASS_ITEM_ENHANCEMENT,
	LE_ITEM_CLASS_CONSUMABLE,
	LE_ITEM_CLASS_GLYPH,
	LE_ITEM_CLASS_TRADEGOODS,
	LE_ITEM_CLASS_RECIPE,
	LE_ITEM_CLASS_BATTLEPET,
	LE_ITEM_CLASS_QUESTITEM,
	LE_ITEM_CLASS_MISCELLANEOUS,
};
	
MarketWatcherHistory = {};
--[[
{
	[server] = {
		[faction] = {
			[itemId] = {
				[scanIndex] = {
					[timestamp]
					[auctionIndex] = {
						[1] = itemMods,
						[2] = uId,
						[3] = count,
						[4] = seller,
						[5] = buyoutPrice,
						[6] = minBid,
						[7] = bidAmount,
						[8] = timeleft,
						[9] = instances,
					},
					[auctionIndex] = {
						[1] = dupeScanIndex,
						[2] = dupeAuctionIndex,
						[3] = bidAmount,
						[4] = timeleft,
						[5] = instances,
					},
				},
			},
		},
	},
}
]]

MarketWatcherWatched = {};
MarketWatcherTempItemInfo = {};

MarketWatcherConfig = {};

local configDefaults = {
	["queryDelay"] = .5,
	["defaultUndercut"] = 0,
	["bidPriceMarkdown"] = 0,
	["ignoreSensitivity"] = 3,
	["saveOnBrowse"] = false,
	["reapplyFilters"] = false,
	["allowTSOpen"] = false,
	["ignoreOutliers"] = false,
}

local itemHistory, itemInfo, config, unregisteredTSWindow;

---------------------------------------------------------------------------------
--	Main Frame
---------------------------------------------------------------------------------

MarketWatcher.frame = CreateFrame("Frame");
local frame = MarketWatcher.frame;

frame:RegisterEvent("AUCTION_HOUSE_SHOW");
frame:RegisterEvent("AUCTION_HOUSE_CLOSED");
frame:RegisterEvent("AUCTION_ITEM_LIST_UPDATE");
frame:RegisterEvent("VARIABLES_LOADED");

function frame.OnEvent(self, event)
	if ( event == "AUCTION_ITEM_LIST_UPDATE" ) then
		if ( MarketWatcher.listFunction ) then
			MarketWatcher.listFunction();
		end

	elseif ( event == "AUCTION_HOUSE_SHOW" ) then
		MarketWatcher.Setup();

	elseif ( event == "AUCTION_HOUSE_CLOSED" ) then
		MarketWatcher.Close();
	end
end

frame:SetScript("OnEvent", frame.OnEvent);


---------------------------------------------------------------------------------
--	Timer
---------------------------------------------------------------------------------

MarketWatcher.timer = CreateFrame("Frame", "MarketWatcherTimer", frame);
local timer = MarketWatcher.timer;
timer:Hide();

function timer:OnUpdate(elapsed)
	if ( self.endTime < GetTime() ) then
		--print("timer expired");
		self.endTime = GetTime() + 999999999;		-- just in case
		self:Hide();
		timer.func();
	end

end

timer:SetScript("OnUpdate", timer.OnUpdate);

function timer.StartTimer(time, func)
	timer.func = func;
	MarketWatcherTimer.endTime = GetTime() + time;
	MarketWatcherTimer:Show();
end

function timer.StopTimer()
	MarketWatcherTimer.endTime = 0;
	MarketWatcherTimer:Hide();
end


---------------------------------------------------------------------------------
--	Setup Functions
---------------------------------------------------------------------------------

function MarketWatcher.GetServerFaction()

	local _;

	MarketWatcher.server = GetRealmName();
	_, MarketWatcher.faction = UnitFactionGroup("player");

	--SetMapToCurrentZone();
	--local map = GetMapInfo();
	local map = GetZoneText();		-- not sure this'll work
	if ( (map == "Tanaris") or (map == "Stranglethorn") or (map == "Winterspring") ) then
		MarketWatcher.faction = "Neutral";
	end

	return MarketWatcher.server, MarketWatcher.faction;
end

function MarketWatcher.Setup()

	if ( #CLASSES == 0 ) then
	
		for i, cat in ipairs(AuctionCategories) do
		
			tinsert(CLASSES, cat.name);
			
			if ( cat.subCategories ) then
				
				SUBCLASSES[i] = { };

				for j, subCat in ipairs(cat.subCategories) do
					tinsert(SUBCLASSES[i], subCat.name);
				end
			end
		end
	end

	local server, faction = MarketWatcher.GetServerFaction();

	if ( not server or not faction ) then
		return;
	end

	if ( not MarketWatcherConfig[server] ) then
		MarketWatcherConfig[server] = {};
	end
	if ( not MarketWatcherConfig[server][faction] ) then
		MarketWatcherConfig[server][faction] = {};
	end
	for k, v in pairs(configDefaults) do
		if ( type(MarketWatcherConfig[server][faction][k]) == "nil" ) then
			MarketWatcherConfig[server][faction][k] = v;
		end
	end

	if ( not MarketWatcherHistory[server] ) then
		MarketWatcherHistory[server] = {};
	end
	if ( not MarketWatcherHistory[server][faction] ) then
		MarketWatcherHistory[server][faction] = {};
	end

	if ( not MarketWatcherWatched[server] ) then
		MarketWatcherWatched[server] = {};
	end
	if ( not MarketWatcherWatched[server][faction] ) then
		MarketWatcherWatched[server][faction] = {};
	end

	config = MarketWatcherConfig[server][faction];
	itemHistory = MarketWatcherHistory[server][faction];
	itemInfo = MarketWatcherWatched[server][faction];

	if ( not MarketWatcher.GetConfig().allowTSOpen ) then
		UIParent:UnregisterEvent("TRADE_SKILL_SHOW");
		unregisteredTSWindow = true;
	end

	MarketWatcher.CreateTradeskillSelectorFrame();
end

function MarketWatcher.Close()
	MarketWatcher.timer.StopTimer();
	if ( unregisteredTSWindow ) then
		UIParent:RegisterEvent("TRADE_SKILL_SHOW");
		unregisteredTSWindow = false;
	end
end

function MarketWatcher.GetConfig()
	return config;
end


---------------------------------------------------------------------------------
--	Scan Functions
---------------------------------------------------------------------------------

function MarketWatcher.GetNumScans(itemId)
	if ( not itemHistory[itemId] ) then
		return 0;
	else
		return #itemHistory[itemId];
	end
end

function MarketWatcher.GetScanTimestamp(itemId, scanIndex)
	if ( scanIndex == 0 ) then
		return tempItemTable[itemId][1];
	else
		return itemHistory[itemId][scanIndex][1];
	end
end

function MarketWatcher.DeleteScanEntry(itemId, scan)
	if ( not itemId or not scan ) then
		return
	end

	local totalScans = MarketWatcher.GetNumScans(itemId, scan);

	if ( totalScans == scan ) then
		table.remove(itemHistory[itemId], scan);
		return
	end

	local _, pScan, pAuc, p, count, seller, buyoutPrice, timeleft, instances, minBid, bidAmount, itemMods, uId;

	-- iterate all scans after scan to be deleted
	for nextScanIndex = scan + 1, totalScans do

		-- iterate auctions in scan
		for auctionIndex = 1, MarketWatcher.GetNumAuctions(itemId, nextScanIndex) do

			-- find pointers
			p, pScan, pAuc = MarketWatcher.IsAPointer(itemId, nextScanIndex, auctionIndex);
			if ( p ) then
				
				-- is this auction pointing to an auction in the scan to be deleted?
				if ( pScan == scan ) then

					count, seller, buyoutPrice, _, _, _, _, minBid, bidAmount, itemMods, uId = MarketWatcher.GetAuction(itemId, pScan, pAuc);
					_, _, _, _, _, timeleft, instances, _, bidAmount = MarketWatcher.GetAuction(itemId, nextScanIndex, auctionIndex);

					MarketWatcher.EditAuction(itemId, nextScanIndex, auctionIndex, itemMods, uId, count, seller, buyoutPrice, minBid, bidAmount, timeleft, instances);

					p, pScan, pAuc = MarketWatcher.IsAPointer(itemId, pScan, pAuc);
					if ( p ) then
						MarketWatcher.ConvertAuctionToPointer(itemId, nextScanIndex, auctionIndex, pScan, pAuc);
					end

				-- is this auction pointing to an auction in a scan after the scan to be deleted?
				elseif ( pScan > scan ) then

					-- decrement pointer's scan number because we are deleting one
					itemHistory[itemId][nextScanIndex][auctionIndex + 1][1] = itemHistory[itemId][nextScanIndex][auctionIndex + 1][1] - 1;
				end

			end

		end
	end

	table.remove(itemHistory[itemId], scan);
end

function MarketWatcher.PruneHistory(itemId)
	local itemInfo = MarketWatcher.GetItemInfoTable(itemId);
	local scan, scanTime, age;
	
	if ( MarketWatcher.GetNumScans(itemId) > 0 and itemInfo.maxAge and itemInfo.maxAge > 0 ) then
		
		age = time() - itemInfo.maxAge * 86400;

		scanTime = MarketWatcher.GetScanTimestamp(itemId, 1);

		while ( scanTime < age ) do

			if ( MarketWatcher.debug ) then
				print("deleting old scan for item "..itemInfo.name);
			end

			MarketWatcher.DeleteScanEntry(itemId, 1);

			if ( MarketWatcher.GetNumScans(itemId) == 0 ) then
				break;
			end
			scanTime = MarketWatcher.GetScanTimestamp(itemId, 1);
		end
	end

	if ( MarketWatcher.GetNumScans(itemId) > 0 and itemInfo.maxEntries and itemInfo.maxEntries > 0 ) then

		while ( MarketWatcher.GetNumScans(itemId) > itemInfo.maxEntries ) do

			if ( MarketWatcher.debug ) then
				print("deleting excess scan for item "..itemInfo.name);
			end

			MarketWatcher.DeleteScanEntry(itemId, 1);
		end

	end
end

function MarketWatcher.ScanAnalysis(itemId, scanIndex, ignoreMinLow, ignoreMaxLow, ignoreMinAvg, ignoreMaxAvg, ignoreMinHigh, ignoreMaxHigh)
	local scanTime = MarketWatcher.GetScanTimestamp(itemId, scanIndex);
	local _, count, buyout, buyoutPerUnit, instances, minBid, bidAmount, bid, avg;
	local highestBuyoutPerUnit, lowestBuyoutPerUnit, averageBuyoutPerUnit, lowestBid, lowestBuyout, highestBid, highestBuyout;
	local auctions, unitsForSale, buyoutUnits = 0, 0, 0;

	for auctionIndex = 1, MarketWatcher.GetNumAuctions(itemId, scanIndex) do

		count, _, buyout, buyoutPerUnit, bid, _, instances = MarketWatcher.GetAuction(itemId, scanIndex, auctionIndex);

		if ( not lowestBid or lowestBid > bid ) then
			lowestBid = bid;
		end

		if ( not highestBid or highestBid < bid ) then
			highestBid = bid;
		end

		if ( not lowestBuyout or lowestBuyout > buyout ) then
			lowestBuyout = buyout;
		end

		if ( not highestBuyout or highestBuyout < buyout ) then
			highestBuyout = buyout;
		end

		if ( buyout > 0 ) then

			if ( not highestBuyoutPerUnit or highestBuyoutPerUnit < buyoutPerUnit ) then

				if ( not ignoreMaxHigh or (buyoutPerUnit > ignoreMinHigh and buyoutPerUnit < ignoreMaxHigh) ) then
					highestBuyoutPerUnit = buyoutPerUnit;
				end
			end

			if ( not lowestBuyoutPerUnit or lowestBuyoutPerUnit > buyoutPerUnit ) then

				if ( not ignoreMinLow or (buyoutPerUnit > ignoreMinLow and buyoutPerUnit < ignoreMaxLow) ) then
					lowestBuyoutPerUnit = buyoutPerUnit;
				end
			end

			avg = buyoutPerUnit * count * instances;
			if ( not ignoreMinAvg or ((avg / (count * instances)) > ignoreMinAvg and (avg / (count * instances)) < ignoreMaxAvg) ) then

				if ( not averageBuyoutPerUnit ) then
					averageBuyoutPerUnit = avg;
				else
					averageBuyoutPerUnit = averageBuyoutPerUnit + avg;
				end
				buyoutUnits = buyoutUnits + count * instances;
			end
		end
		unitsForSale = unitsForSale + count * instances;
		auctions = auctions + instances;
	end

	if ( averageBuyoutPerUnit ) then
		averageBuyoutPerUnit = averageBuyoutPerUnit / buyoutUnits;
	end

	return lowestBuyoutPerUnit, highestBuyoutPerUnit, averageBuyoutPerUnit, lowestBid, highestBid, lowestBuyout, highestBuyout, auctions, unitsForSale, scanTime;
end

function MarketWatcher.HistoricalComparison(itemId, pricePerUnit)

	local numScans = MarketWatcher.GetNumScans(itemId);
	if ( numScans < 2 or not pricePerUnit ) then
		return
	end

	local _, timestamp, buyout, count, instances, units, timeStamp;
	local high, low, weeklyAverage, weeklyHighestLow, weeklyLowestLow, monthlyAverage, monthlyHighestLow, monthlyLowestLow;
	local monthlyAverageLow, weeklyAverageLow, weeklyScans, monthlyScans = 0, 0, 0, 0;
	local weekAgo = time() - 604800;
	local monthAgo = time() - 2419200;

	for scanIndex = numScans, 1, -1 do
		timestamp = MarketWatcher.GetScanTimestamp(itemId, scanIndex);
		units = 0;
		average = 0;
		low = 0;
		high = 0;

		low, high, average, _, _, _, _, _, units, timeStamp = MarketWatcher.ScanAnalysis(itemId, scanIndex);

		if ( low ) then
			if ( timeStamp < monthAgo ) then
				break;
			end

			if ( timeStamp > weekAgo ) then
				if ( not weeklyHighestLow or weeklyHighestLow < low ) then
					weeklyHighestLow = low;
				end
				if ( not weeklyLowestLow or weeklyLowestLow > low ) then
					weeklyLowestLow = low;
				end
				weeklyAverageLow = weeklyAverageLow + low;
				weeklyScans = weeklyScans + 1;
			end

			if ( not monthlyHighestLow or monthlyHighestLow < low ) then
				monthlyHighestLow = low;
			end
			if ( not monthlyLowestLow or monthlyLowestLow > low ) then
				monthlyLowestLow = low;
			end

			monthlyAverageLow = monthlyAverageLow + low;
			monthlyScans = monthlyScans + 1;
		end
	end

	weeklyAverageLow = weeklyAverageLow / weeklyScans;
	monthlyAverageLow = monthlyAverageLow / monthlyScans;

	local weekly, monthly;

	if ( weeklyScans > 0 ) then
		low = pricePerUnit - weeklyAverageLow;
		weekly = math.floor(100 / weeklyAverageLow * low);
	end
	if ( monthlyScans > 0 and monthlyScans > weeklyScans ) then
		low = pricePerUnit - monthlyAverageLow;
		monthly = math.floor(100 / monthlyAverageLow * low);
	end

	return weekly, monthly;
end


---------------------------------------------------------------------------------
--	Temp Data Functions
---------------------------------------------------------------------------------

function MarketWatcher.NewTempTable()
	tempItemTable = {};
end

function MarketWatcher.AddTempItem(itemId, timestamp)

	if ( not tempItemTable[itemId] ) then
		tempItemTable[itemId] = {};
		MarketWatcher.SetTempTimestamp(itemId, timestamp);
	end
end

function MarketWatcher.SetTempTimestamp(itemId, timestamp)
	if ( tempItemTable[itemId] ) then
		tempItemTable[itemId][1] = timestamp or time(date("*t"));
	end
end

function MarketWatcher.AddTempAuction(itemId, itemMods, uId, count, seller, buyoutPrice, minBid, bidAmount, timeleft, instances)

	if ( not tempItemTable[itemId] ) then
		MarketWatcher.AddTempItem(itemId);
	end

	tinsert(tempItemTable[itemId], {
		itemMods,
		uId,
		count,
		seller,
		buyoutPrice,
		minBid,
		bidAmount,
		timeleft,
		instances,
	});
end


function MarketWatcher.TempItemIterator()
	return pairs(tempItemTable);
end

function MarketWatcher.IsItemInTable(itemId)
	if ( tempItemTable[itemId] ) then
		return true;
	end
end

function MarketWatcher.DeleteTempItem(itemId)
	tempItemTable[itemId] = nil;
end

function MarketWatcher.DeleteTempAuction(itemId, auctionIndex)
	table.remove(tempItemTable[itemId], auctionIndex + 1);
end

-- sortIndex and secondaryIndex inputs: 1 = sort by count; 2 seller name; 3 buyoutPrice (default); 4 currentBid (secondary default); 5 timeleft; 6 instances
function MarketWatcher.SortTempAuctions(itemId, sortIndex, secondaryIndex)

	if ( not sortIndex ) then
		sortIndex = 3;
	end
	if ( not secondaryIndex ) then
		secondaryIndex = 4;
	end

	local a1 = {};
	local a2 = {};
	local tmp;

	table.sort(tempItemTable[itemId], function(a, b)
		if ( type(a) ~= "table" ) then
			return true;
		end
		if ( type(b) ~= "table" ) then
			return false;
		end

		tmp, a1[4], a1[5], a1[6] = MarketWatcher.DereferenceAuction(a, itemId);
		if ( a1[4] == 0 ) then
			a1[4] = tmp[6];
		end
		a1[1] = tmp[3];
		a1[2] = tmp[4];
		a1[3] = tmp[5];

		tmp, a2[4], a2[5], a2[6] = MarketWatcher.DereferenceAuction(b, itemId);
		if ( a2[4] == 0 ) then
			a2[4] = tmp[6];
		end
		a2[1] = tmp[3];
		a2[2] = tmp[4];
		a2[3] = tmp[5];

		if ( a1[sortIndex] == a2[sortIndex] ) then
			return a1[secondaryIndex] < a2[secondaryIndex];
		else
			return a1[sortIndex] < a2[sortIndex];
		end
	end);
end

function MarketWatcher.SaveTempItemData(itemId)
	local scanTime, lastScanTime, numScans, entries, record, found, count;
	local itemInfo = MarketWatcher.GetItemInfoTable(itemId);

	if ( not itemHistory[itemId] ) then
		itemHistory[itemId] = {};
	end

	numScans = MarketWatcher.GetNumScans(itemId);

	if ( numScans > 0 ) then
		lastScanTime = MarketWatcher.GetScanTimestamp(itemId, numScans);
	end
	entries = MarketWatcher.GetNumAuctions(itemId, 0);
	scanTime = MarketWatcher.GetScanTimestamp(itemId, 0);


	-- Make pointers

	-- if this is not the first scan and the last scan was within the last 48 hours
	if ( numScans > 0 and lastScanTime > (scanTime - AUCTION_TIMELEFT[#AUCTION_TIMELEFT]) ) then

		-- iterate auctions in temp data
		for scanAuctionIndex = 1, MarketWatcher.GetNumAuctions(itemId, 0) do

			-- compare with every history entry in last scan for matches
			for historicalAuctionIndex = 1, MarketWatcher.GetNumAuctions(itemId, numScans) do

				if ( MarketWatcher.IsAuctionEqual(itemId, numScans, historicalAuctionIndex, 0, scanAuctionIndex) ) then

					-- convert to pointer
					MarketWatcher.ConvertAuctionToPointer(itemId, 0, scanAuctionIndex, numScans, historicalAuctionIndex);

					break;
				end

			end
		end
	end

	-- create duplicate of table and copy that table to history
	local t = {};
	tinsert(t, tempItemTable[itemId][1]);

	for scanAuctionIndex = 1, MarketWatcher.GetNumAuctions(itemId, 0) do

		if ( not itemInfo.stackOnly or MarketWatcher.GetAuction(itemId, 0, scanAuctionIndex) == itemInfo.stackCount ) then
			tinsert(t, tempItemTable[itemId][scanAuctionIndex + 1]);
		end
	end

	tinsert(itemHistory[itemId], t);

	if ( MarketWatcher.debug ) then
		print("scan entry recorded for item "..itemInfo.name);
	end
end


---------------------------------------------------------------------------------
--	Watched Items Functions
---------------------------------------------------------------------------------

function MarketWatcher.WatchedItemsIterator()
	return pairs(itemInfo);
end

function MarketWatcher.GetItemInfoTable(itemId)
	if ( itemInfo[itemId] ) then
	
		-- update item info for 7.x
		if ( not itemInfo[itemId].classID and GetItemInfo(itemId) ) then
			MarketWatcher.SetWatchedItemInfo(itemId, itemInfo[itemId]);
		end	

		return itemInfo[itemId];
	elseif ( MarketWatcherTempItemInfo[itemId] ) then
		return MarketWatcherTempItemInfo[itemId], true;
	end
end

function MarketWatcher.SetWatchedItemInfo(itemId, itemTable)

	if ( not itemTable ) then
		itemTable = MarketWatcher.GetItemInfoTable(itemId);
	end

	local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,
	itemEquipLoc, iconFileDataID, itemSellPrice, itemClassID, itemSubClassID = GetItemInfo(itemId);

	if ( not itemName ) then
		if ( MarketWatcher.debug ) then
			print("Error: item "..itemId.." not found in cache; wait a moment and retry query");
		end
		return nil;
	end

	itemTable.name		= itemName;
	itemTable.quality	= itemRarity;
	itemTable.iLevel		= itemLevel;
	itemTable.minLevel	= itemMinLevel;
	itemTable.type		= itemType;
	itemTable.subType	= itemSubType;
	itemTable.stackCount = itemStackCount;
	itemTable.equipLoc	= itemEquipLoc;
	itemTable.texture	= iconFileDataID;
	itemTable.classID	= itemClassID;
	itemTable.subClassID	= itemSubClassID;

	return itemTable;
end

function MarketWatcher.AddWatchedItem(itemId, bidThreshold, buyoutThreshold, stackOnly, recordHistory, maxEntries, maxAge, summaryConditional, summaryStackOnly, noneOnSale)

	local itemName = GetItemInfo(itemId);
	local itemTable, isTemp = MarketWatcher.GetItemInfoTable(itemId);

	if ( itemName and (not itemTable or isTemp) ) then
		itemInfo[itemId] = {};
		MarketWatcherTempItemInfo[itemId] = nil;	-- remove from temp items if needed
		MarketWatcher.EditWatchedItem(itemId, bidThreshold or 0, buyoutThreshold or 0, stackOnly or false, recordHistory or false, maxEntries or 100, maxAge or 30, summaryConditional or "no", summaryStackOnly or false, noneOnSale or "true");
		MarketWatcher.SetWatchedItemInfo(itemId);
	end
end

function MarketWatcher.AddTempItemInfo(itemId)

	MarketWatcherTempItemInfo[itemId] = {};
	local item = MarketWatcherTempItemInfo[itemId];

	MarketWatcher.SetWatchedItemInfo(itemId);

	item.bidThreshold	= 0;
	item.buyoutThreshold	= 0;
	item.stackOnly		= false;
	item.recordHistory	= false;
	item.maxEntries		= 0;
	item.maxAge		= 0;
	item.summaryConditional = "no";
	item.summaryStackOnly	= false;
	item.noneOnSale		= true;
end

function MarketWatcher.EditWatchedItem(itemId, bidThreshold, buyoutThreshold, stackOnly, recordHistory, maxEntries, maxAge, summaryConditional, summaryStackOnly, noneOnSale)

	local item = MarketWatcher.GetItemInfoTable(itemId);

	item.bidThreshold	= bidThreshold;
	item.buyoutThreshold	= buyoutThreshold;
	item.stackOnly		= stackOnly;
	item.recordHistory	= recordHistory;
	item.maxEntries		= maxEntries;
	item.maxAge		= maxAge;
	item.summaryConditional = summaryConditional;
	item.summaryStackOnly	= summaryStackOnly;
	item.noneOnSale		= noneOnSale;
end

function MarketWatcher.RemoveWatchedItem(itemId)
	itemInfo[itemId] = nil;
	itemHistory[itemId] = nil;
end


---------------------------------------------------------------------------------
--	Auction Data Functions
---------------------------------------------------------------------------------

function MarketWatcher.GetNumAuctions(itemId, scanIndex)
	local scanTable;

	if ( scanIndex == 0 ) then
		scanTable = tempItemTable[itemId];
	else
		if ( not itemHistory[itemId] ) then
			return 0;
		end
		scanTable = itemHistory[itemId][scanIndex];
	end

	if ( scanTable ) then
		return #scanTable - 1;
	else
		return 0;
	end
end

function MarketWatcher.AuctionsIterator(itemId, scanIndex)

	local i = 0;
	local n;
	
	if ( scanIndex == 0 ) then
		n = #tempItemTable[itemId];
	else
		n = #itemHistory[itemId][scanIndex];
	end

	return function ()
		i = i + 1;
		if ( i < n ) then
			return MarketWatcher.GetAuction(itemId, scanIndex, i);
		end
	end
end

function MarketWatcher.IsAPointer(itemId, scanIndex, auctionIndex)

	local auction;

	if ( type(itemId) == "table" ) then
		auction = itemId;
	else
		if ( scanIndex == 0 ) then
			auction = tempItemTable[itemId][auctionIndex + 1];
		else
			auction = itemHistory[itemId][scanIndex][auctionIndex + 1];
		end
	end

	if ( type(auction[1]) == "number" ) then
		return true, auction[1], auction[2] - 1;
	end
end

-- targetScanIndex cannot be zero (temp data)
function MarketWatcher.ConvertAuctionToPointer(itemId, convertScanIndex, convertAuctionIndex, targetScanIndex, targetAuctionIndex)
	local convert, target;

	if ( convertScanIndex == 0 ) then
		convert = tempItemTable[itemId][convertAuctionIndex + 1];
	else
		convert = itemHistory[itemId][convertScanIndex][convertAuctionIndex + 1];
	end

	target = itemHistory[itemId][targetScanIndex][targetAuctionIndex + 1];

	convert[5] = convert[9];
	convert[4] = convert[8];
	convert[3] = convert[7];
	convert[1] = targetScanIndex;
	convert[2] = targetAuctionIndex + 1;
end

function MarketWatcher.DereferenceAuction(auction, itemId)

	local bid, timeleft, instances = auction[3], auction[4], auction[5];

	-- if auction is not a pointer, return input
	if ( not MarketWatcher.IsAPointer(auction) ) then
		return auction, auction[7], auction[8], auction[9];
	end

	local i = 0;
	while ( MarketWatcher.IsAPointer(auction) and i < 1000 ) do
		if (	
			not itemId or
			not itemHistory[itemId][ auction[1] ] or
			not itemHistory[itemId][ auction[1] ][ auction[2] ]
		) then
			return
		end

		auction = itemHistory[itemId][ auction[1] ][ auction[2] ];
		i = i + 1;
	end

	if ( MarketWatcher.debug and i == 1000 ) then
		print("Error: Infinite dereference loop; itemId: "..itemId.."; scan: "..auction[1].."; auction: "..auction[2]);
	end
	return auction, bid, timeleft, instances;
end

-- Get auction data from the history or temp table; a scanIndex of 0 == get from temp table
-- returns: count, seller, buyoutPrice, buyoutPricePerUnit, currentBid, timeleft, instances, minBid, bidAmount, itemMods, uId
function MarketWatcher.GetAuction(itemId, scanIndex, auctionIndex)

	local auction, currentBid;

	if ( scanIndex == 0 ) then
		auction = tempItemTable[itemId][auctionIndex + 1];	-- first entry is scan timestamp

	else
		auction = itemHistory[itemId][scanIndex][auctionIndex + 1];	-- first entry is scan timestamp
	end

	local bid, timeleft, instances;

	auction, bid, timeleft, instances = MarketWatcher.DereferenceAuction(auction, itemId);

	if ( not auction ) then
		return
	end

	if ( bid == 0 ) then
		currentBid = auction[6];
	else
		currentBid = bid;
	end

	return auction[3], auction[4], auction[5], auction[5] / auction[3], currentBid, timeleft, instances or 1, auction[6], bid, auction[1], auction[2];
end

-- do not use this on pointer auctions
function MarketWatcher.EditAuction(itemId, scanIndex, auctionIndex, itemMods, uId, count, seller, buyoutPrice, minBid, bidAmount, timeleft, instances)

	local auction;

	if ( scanIndex == 0 ) then
		auction = tempItemTable[itemId][auctionIndex + 1];
	else
		auction = itemHistory[itemId][scanIndex][auctionIndex + 1];
	end

	auction[1] = itemMods or auction[1];
	auction[2] = uId or auction[2];
	auction[3] = count or auction[3];
	auction[4] = seller or auction[4];
	auction[5] = buyoutPrice or auction[5];
	auction[6] = minBid or auction[6];
	auction[7] = bidAmount or auction[7];
	auction[8] = timeleft or auction[8];
	auction[9] = instances or auction[9];
end

function MarketWatcher.IsAuctionEqual(itemId, scanIndex1, auctionIndex1, scanIndex2, auctionIndex2)

	local count1, seller1, buyoutPrice1, _, _, timeleft1, _, minBid1, bidAmount1, itemMods1, uId1 = MarketWatcher.GetAuction(itemId, scanIndex1, auctionIndex1);
	local timeStamp1 = MarketWatcher.GetScanTimestamp(itemId, scanIndex1);

	local count2, seller2, buyoutPrice2, _, _, timeleft2, _, minBid2, bidAmount2, itemMods2, uId2 = MarketWatcher.GetAuction(itemId, scanIndex2, auctionIndex2);
	local timeStamp2 = MarketWatcher.GetScanTimestamp(itemId, scanIndex2);

	if ( scanIndex1 == scanIndex2 and auctionIndex1 == auctionIndex2 ) then
		return true;
	end

	if (
		uId1 == uId2 and
		count1 == count2 and
		seller1 == seller2 and
		minBid1 == minBid2 and
		itemMods1 == itemMods2 and
		buyoutPrice1 == buyoutPrice2
	) then

		-- make sure the first auction is the earlier one
		if ( timeStamp2 < timeStamp1 ) then
			local temp = timeleft1;
			timeleft1 = timeleft2;
			timeleft2 = temp;

			temp = bidAmount1;
			bidAmount1 = bidAmount2;
			bidAmount2 = temp;

			temp = timeStamp1;
			timeStamp1 = timeStamp2;
			timeStamp2 = temp;
		end

		-- check bids
		if ( bidAmount1 > bidAmount2 ) then
			return false;
		end

		-- check auction time lefts

		-- if auctions were scanned at the same time
		if ( timeStamp1 == timeStamp2 ) then
			if ( timeleft1 == timeleft2 ) then
				return true;
			else
				return false;
			end
		end

		-- if scans were more than 48 hours apart
		if ( (timeStamp2 - timeStamp1) > maxAuctionTime ) then
			return false;
		end

		-- check if auction 1's maximum possible time left > the minimum time left of auction 2
		if ( (timeStamp1 + AUCTION_TIMELEFT[timeleft1]) > (timeStamp2 + AUCTION_TIMELEFT[timeleft2 - 1]) ) then
			return true;
		else
			return false;
		end
	else
		return false;
	end
end

function MarketWatcher.ItemBoughtOut(itemId, scan, n)
	local numScans = MarketWatcher.GetNumScans(itemId);

	if ( scan == numScans ) then
		return false;
	end

	local scanTime = MarketWatcher.GetScanTimestamp(itemId, scan);
	local _, nextScanTime, found, timeleft;

	for nextScan = scan + 1, numScans do
		nextScanTime = MarketWatcher.GetScanTimestamp(itemId, nextScan);
		_, _, _, _, _, timeleft = MarketWatcher.GetAuction(itemId, scan, n);

		-- if next scan was taken longer than minimum possible time remaining
		if ( (nextScanTime - scanTime) > AUCTION_TIMELEFT[timeleft - 1] ) then
			-- break, because auction may have expired
			break;
		else
			-- this scan is within the time remaining

			found = false;
			for i = 1, MarketWatcher.GetNumAuctions(itemId, nextScan) do

				if ( MarketWatcher.IsAuctionEqual(itemId, scan, n, nextScan, i) ) then
					found = true;
				end
			end

			if ( not found ) then
				return true;
			end
		end

	end

	return false;
end


---------------------------------------------------------------------------------
--	Query Functions
---------------------------------------------------------------------------------

function MarketWatcher.ConstructFilterFromId(itemId)
	
	if ( not itemId ) then return nil; end

	local itemInfo = MarketWatcher.GetItemInfoTable(itemId);
	
	local inventoryType;
	
	if ( not itemInfo or itemInfo.classID ) then
		return nil;
	end
	if ( itemInfo.equipLoc and itemInfo.equipLoc ~= "" ) then
		inventoryType = MarketWatcher.INVTYPE_NUM_LOOKUP[itemInfo.equipLoc]
	end
	
	return {{ classID = itemInfo.classID, subClassID = itemInfo.subClassID, inventoryType = inventoryType, }};
end

function MarketWatcher.ConstructFilterFromClasses(classID, subClassID, inventoryType)
	return {{ classID = classID, subClassID = subClassID, inventoryType = inventoryType }};
end

-- do not alter the table this function returns
function MarketWatcher.GetFilter(categoryIndex, subCategoryIndex, subsubCategoryIndex)
	
	local filter;
	
	if ( not subsubCategoryIndex or subsubCategoryIndex == 0 ) then
		if ( not subCategoryIndex or subCategoryIndex == 0 ) then
			filter = AuctionCategories[categoryIndex].filters;
		else
			filter = AuctionCategories[categoryIndex].subCategories[subCategoryIndex].filters;
		end
	else
		filter = AuctionCategories[categoryIndex].subCategories[subCategoryIndex].subCategories[subsubCategoryIndex].filters;
	end
	
	return filter;
end

function MarketWatcher.QueryServer(name, minLevel, maxLevel, filters, page, isUsable, qualityIndex, exact, getAll)

	if ( AucAdvanced and AucAdvanced.Scan and AucAdvanced.Scan.CompatibilityMode ) then
		AucAdvanced.Scan.CompatibilityMode(1, "MarketWatcher");
	end
		
	if ( isUsable == 0 ) then
		isUsable = nil;				-- 0 value bugs out the query in 7.0.3
	end
	
	-- 7.x
	--QueryAuctionItems(text,     minLevel, maxLevel, page,      usable,   rarity,            getAll, exactMatch, filterData);
	QueryAuctionItems(name or "", minLevel, maxLevel, page or 0, isUsable, qualityIndex or 0, getAll, exact, filters);
end

function MarketWatcher.QueryItem(itemId, page, exact)

	if ( not CanSendAuctionQuery() ) then
		return false;
	end

	local itemInfo = MarketWatcher.GetItemInfoTable(itemId);
	
	if ( not itemInfo ) then return nil; end
	
	local invTypeIndex, classIndex, subclassIndex;
	
	local filter = MarketWatcher.ConstructFilterFromId(itemId);

	if ( MarketWatcher.debug ) then
		local exs = "yes";
		if ( not exact ) then exs = "no"; end
		print(string.format("Querying item ID# %i;  page: %i;  quality: %i;  exact: %s", itemId, page or 0, itemInfo.quality, exs));
	end
	MarketWatcher.QueryServer(itemInfo.name, nil, nil, filter, page or 0, nil, itemInfo.quality, exact, false);

	return true;
end

function MarketWatcher.GetItemClassIDs(itemId)

	local itemInfo = MarketWatcher.GetItemInfoTable(itemId);
	
	if ( not itemInfo or not itemInfo.classID ) then
		return nil;
	end
	
	return itemInfo.classID, itemInfo.subClassID, MarketWatcher.INVTYPE_NUM_LOOKUP[itemInfo.equipLoc];
end

function MarketWatcher.GetSubSubCatFromEquipLocString(equipLocStr, classIndex, subclassIndex)

	if ( not equipLocStr or equipLocStr == "" ) then return; end
	
	local localizedStr = _G[equipLocStr];
	
	for i, cat in ipairs(AuctionCategories) do
		if ( cat.subCategories ) then

			for j, subCat in ipairs(cat.subCategories) do
				if ( cat.subCategories ) then
				
					for l, subSubCat in ipairs(subCat.subCategories) do
						if ( subSubCat.name and subSubCat.name == localizedStr ) then
							return l;						
						end
					end
				end
			end
		end
	end

end

function MarketWatcher.GenerateQueryList()
	local subclassed = {};
	local subTallies = {};
	local item, classID, subClassID, inventoryType;

	local function GetWords(s)
		local t = {};

		for word in string.gmatch(s, "(%S+)") do
			if ( #word > 3 ) then
				tinsert(t, word);
			end
		end

		-- put longest words first
		table.sort(t, function (a, b)
			return #a > #b;
		end);

		return t;
	end

	local function MatchWords(t, s)
		local removed;

		while ( true ) do
			for i, word in ipairs(t) do

				if ( not string.find(s, word) ) then
					tremove(t, i);
					removed = true;
					break;
				end

			end

			if ( not removed ) then
				break;
			end
			removed = false;
		end
	end

	-- count up the number of items, determine the lowest quality, and find any words common to all in each subclass
	for itemId in MarketWatcher.WatchedItemsIterator() do

		item = MarketWatcher.GetItemInfoTable(itemId);
		if ( item.name ) then

			classID, subClassID = MarketWatcher.GetItemClassIDs(itemId);

			if ( classID and SUBCLASSES[classID] and SUBCLASSES[classID][subClassID] ) then
				if ( not subTallies[classID] ) then
					subTallies[classID] = {};
				end
				if ( not subTallies[classID][subClassID] ) then
					subTallies[classID][subClassID] = {};
					subTallies[classID][subClassID]["count"] = 1;
					subTallies[classID][subClassID]["quality"] = item.quality;
					subTallies[classID][subClassID]["words"] = GetWords(item.name);	-- create a table containing the words of the first item in this subclass
				else
					subTallies[classID][subClassID]["count"] = subTallies[classID][subClassID]["count"] + 1;

					if ( subTallies[classID][subClassID]["quality"] > item.quality ) then
						subTallies[classID][subClassID]["quality"] = item.quality;
					end

					-- remove words not common to previous items in this subclass
					if ( subTallies[classID][subClassID]["words"] ) then
						MatchWords(subTallies[classID][subClassID]["words"], item.name);
						if ( #subTallies[classID][subClassID]["words"] == 0 ) then
							subTallies[classID][subClassID]["words"] = nil;
						end
					end
				end

			end
		end
	end

	local queries = {};
	local threshold, invTypeIndex, count, commonWord;

	-- figure out which subclasses have more items than the threshold needed before we scan the entire subclass rather than individual items
	for tallyClassID, tallyClassTable in pairs(subTallies) do
		for tallySubClassID, subclassInfo in pairs(tallyClassTable) do

			count = subclassInfo["count"];
			if ( subclassInfo["words"] ) then
				commonWord = subclassInfo["words"][1];
			else
				commonWord = "";
			end

			threshold = SUBCLASS_THRESHOLD[tallyClassID];
			if ( threshold ) then
				threshold = SUBCLASS_THRESHOLD[tallyClassID][ SUBCLASSES[tallySubClassID] ]
					    or SUBCLASS_THRESHOLD[tallyClassID]["all"];
			end

			if ( threshold and subclassInfo["count"] >= threshold ) then

				table.insert(queries, {
					["name"] = commonWord,
				--	["minLevel"] = nil,
				--	["maxLevel"] = nil,
					["qualityIndex"] = subclassInfo["quality"],
					["filter"] = MarketWatcher.ConstructFilterFromClasses(tallyClassID, tallySubClassID, nil),
					["exact"] = false,
				});
			end
		end
	end

	-- add individual items to scan
	for itemId in MarketWatcher.WatchedItemsIterator() do
		if ( not subclassed[itemId] ) then
	
			item = MarketWatcher.GetItemInfoTable(itemId);
			if ( item.name and item.classID ) then
			
				classID, subClassID, inventoryType = MarketWatcher.GetItemClassIDs(itemId);

				threshold = SUBCLASS_THRESHOLD[classID];
				if ( threshold ) then
					threshold = SUBCLASS_THRESHOLD[classID][subClassID]
						    or SUBCLASS_THRESHOLD[classID]["all"];
				end

				if ( not threshold or not subTallies[classID] or subTallies[classID][subClassID]["count"] < threshold ) then

					table.insert(queries, {
						["name"] = item.name,
					--	["minLevel"] = nil,
					--	["maxLevel"] = nil,
						["invTypeIndex"] = invTypeIndex,
						["classIndex"] = classIndex,
						["subclassIndex"] = subclassIndex,
						["qualityIndex"] = item.quality,
						["filter"] = MarketWatcher.ConstructFilterFromClasses(classID, subClassID, inventoryType),
						["exact"] = true,
					});
				end
			end
		end
	end

	return queries;
end

function MarketWatcher.IsItemInQuery(query, itemId)
	
	local itemInfo = MarketWatcher.GetItemInfoTable(itemId);
	if ( not itemInfo ) then
		if ( GetItemInfo(itemId) ) then
			MarketWatcher.AddTempItemInfo(itemId);
			itemInfo = MarketWatcher.GetItemInfoTable(itemId);
			if ( not itemInfo ) then
				return
			end
		else
			return
		end
	end

	local itemInFilter = false;

	if ( query.filter ) then
		for i, filter in ipairs(query.filter) do

			if ( filter.classID and filter.classID == itemInfo.classID ) then

				if ( not filter.subClassID or filter.subClassID == 0 ) then
					itemInFilter = true;
					
				elseif ( filter.subClassID == itemInfo.subClassID ) then
				
					if ( not filter.inventoryType
						or (itemInfo.equipLoc ~= "" and filter.inventoryType == MarketWatcher.INVTYPE_NUM_LOOKUP[itemInfo.equipLoc])
					) then
						itemInFilter = true;
					end
				
				end
				
			end
		end
	else
		itemInFilter = true;
	end

	if (itemInFilter
		and (not query.name or (strfind(itemInfo.name:lower(), query.name:lower(), 1, true)))
		and (not query.qualityIndex or (itemInfo.quality >= query.qualityIndex))
		and (not query.minLevel or (itemInfo.minLevel >= query.minLevel))
		and (not query.maxLevel or (itemInfo.minLevel <= query.maxLevel))
--		and (not query.isUsable or ())
	) then
		return true;
	end

	return false;
end


---------------------------------------------------------------------------------
--	Container Functions
---------------------------------------------------------------------------------

function MarketWatcher.FindItemInBags(itemId, qty)
	local _, bagName, slot, link, itemCount, locked;
	local tmpBag, tmpSlot, tmpItemCount;
	local sumItems = 0;

	for bag = 0, 4 do
		bagName = GetBagName(bag);
		if ( bagName ) then

			for slot = 1, GetContainerNumSlots(bag) do
				link = GetContainerItemLink(bag, slot);
				if ( link ) then

					_, itemCount, locked = GetContainerItemInfo(bag, slot);

					if ( itemId == MarketWatcher.DecodeItemLink(link) and not locked ) then

						sumItems = sumItems + itemCount;

						if (	not qty
							or not tmpBag
							or (tmpItemCount ~= qty and itemCount >= qty)
						) then
							tmpBag, tmpSlot, tmpItemCount = bag, slot, itemCount;
						end
					end
				end
			end
		end
	end

	return tmpBag, tmpSlot, tmpItemCount, sumItems;
end

function MarketWatcher.SplitStack(splitBag, splitSlot, splitCount)

	local numberOfFreeSlots, bag, bagType;

	for bag = 0, 4 do
		numberOfFreeSlots, bagType = GetContainerNumFreeSlots(bag);

		if ( numberOfFreeSlots > 0 and bagType == 0 ) then

			for slot = 1, GetContainerNumSlots(bag) do

				if ( not GetContainerItemInfo(bag, slot) ) then
			
					SplitContainerItem(splitBag, splitSlot, splitCount);
					PickupContainerItem(bag, slot);

					return bag, slot, splitCount;
				end
			end
		end
	end
end


---------------------------------------------------------------------------------
--	Misc Functions
---------------------------------------------------------------------------------

function MarketWatcher.MoneyText(money)
	-- tostring()ing and tonumber()ing to stip off .0s
	if ( money < COPPER_PER_SILVER ) then
		return "|cFFC8A080"..tonumber(format("%.1f", tostring(money))).."|r|TInterface\\MoneyFrame\\UI-CopperIcon:0:0:0:-1|t";

	elseif ( money < COPPER_PER_GOLD ) then
		return "|cFFC8C8C8"..tonumber(format("%.1f", tostring(money / COPPER_PER_SILVER))).."|r|TInterface\\MoneyFrame\\UI-SilverIcon:0:0:0:-1|t";

	elseif ( money > (COPPER_PER_GOLD * 1000) ) then
		return "|cFFD8CC60"..format("%i", (money / COPPER_PER_GOLD)).."|r|TInterface\\MoneyFrame\\UI-GoldIcon:0:0:0:-1|t";
	else
		return "|cFFD8CC60"..tonumber(format("%.1f", tostring(money / COPPER_PER_GOLD))).."|r|TInterface\\MoneyFrame\\UI-GoldIcon:0:0:0:-1|t";
	end
end

function MarketWatcher.DecodeItemLink(link)
	-- |cff9d9d9d|Hitem:7073:0:0:0:0:0:0:0:80:0|h[Broken Fang]|h|r
	-- |cffxxxxxx|Hbattlepet:speciesID:level:quality:health:power:speed:battlepetID|h[Name]|h|r
	local _, _, itemStr = strsplit("|", link);
	local type, id, enchant, gem1, gem2, gem3, gemBonus, suffix, uId, _, reforge = strsplit(":", itemStr);
	id = tonumber(id) or 0;
	
	if ( type == "Hbattlepet" ) then
		return 82800, enchant..":"..gem1..":"..gem2..":"..gem3..":"..gemBonus, id;
	end
	
	uId = tonumber(uId) or 0;
	local modifiers;
	if ( not enchant or not gem1 ) then
		return
	end
	local modifiers = enchant..":"..gem1..":"..gem2..":"..gem3..":"..gemBonus..":"..suffix..":"..(reforge or 0);
	return id, modifiers, uId;
end

function MarketWatcher.CanCreate(itemId)
	local craftedItemId, link, skillName, skillType, numAvail;

	for i = GetFirstTradeSkill(), GetNumTradeSkills() do

		skillName, skillType, numAvail = GetTradeSkillInfo(i);

		if ( skillName and skillType ~= "header" ) then
			link = GetTradeSkillItemLink(i);
			if ( link ) then
				craftedItemId = MarketWatcher.DecodeItemLink(link);
				if ( itemId == craftedItemId ) then
					return i, numAvail;
				end
			end
		end
	end
	
	return nil;
end

function MarketWatcher.CreateTradeskillSelectorFrame()
	if ( MarketWatcherTradeskillSelectorFrame ) then
		return
	end

	local frame = CreateFrame("Frame", "MarketWatcherTradeskillSelectorFrame", AuctionFrame);

	frame:SetHeight(51);
	frame:SetWidth(95);
	frame:SetPoint("BOTTOMLEFT", AuctionFrame, "BOTTOMRIGHT", 5, 8);
	frame:SetBackdrop({ bgFile = "Interface/Tooltips/UI-Tooltip-Background", 
			    edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
			    tile = true, tileSize = 16, edgeSize = 16,
			    insets = { left = 4, right = 4, top = 4, bottom = 4 }
	});
	frame:SetBackdropColor(0, 0, 0, 1);
	
	local numSkills = GetNumSkillLines();
	local skillName, header, isExpanded, skillRank, numTempPoints, skillModifier, skillMaxRank, isAbandonable, stepCost, rankCost, minLevel, skillCostType, skillDescription;
	local prof1, prof2, icon, id;

	for i = 1, numSkills do
		skillName = GetSkillLineInfo(i);

		if ( skillName == TRADE_SKILLS ) then
			prof1, header = GetSkillLineInfo(i + 1);
			if ( header or not GetSpellInfo(prof1) or MARKETWATCHER_TRADESKILL_EXCLUDE[prof1] ) then
				prof1 = nil;
			end

			prof2, header = GetSkillLineInfo(i + 2);
			if ( header or not GetSpellInfo(prof2) or MARKETWATCHER_TRADESKILL_EXCLUDE[prof2] ) then
				prof2 = nil;
			end
			break;
		end
	end
	
	if ( not prof1 and not prof2 ) then
		frame:Hide();
		return
	elseif ( not prof1 or not prof2 ) then
		frame:SetWidth(51);
	end

	if ( prof1 ) then
		_, _, icon = GetSpellInfo(prof1);
		
		if ( icon ) then
			button1 = CreateFrame("CheckButton", "MarketWatcherTradeskillSelect1", MarketWatcherTradeskillSelectorFrame, "ActionButtonTemplate, SecureActionButtonTemplate");
			button1:SetHeight(36);
			button1:SetWidth(36);
			button1:SetPoint("TOPLEFT", MarketWatcherTradeskillSelectorFrame, "TOPLEFT", 8, -7);
			button1:SetAttribute("type*", "spell");
			button1:SetAttribute("spell1", prof1);

			_G[button1:GetName().."Icon"]:SetTexture(icon);
			button1:SetScript("OnEnter", function(self) 
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
				GameTooltip:AddLine(prof1, 1, 1, 1);
				GameTooltip:AddLine(MARKETWATCHER_TOOLTIP17, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1);
				GameTooltip:Show();
			end);
			button1:SetScript("OnLeave", function(self) GameTooltip:Hide(); end);
			button1.trade = prof1;
		end
	end
	
	if ( prof2 ) then
		_, _, icon = GetSpellInfo(prof2);
		
		if ( icon ) then
			button2 = CreateFrame("CheckButton", "MarketWatcherTradeskillSelect2", MarketWatcherTradeskillSelectorFrame, "ActionButtonTemplate, SecureActionButtonTemplate");
			button2:SetHeight(36);
			button2:SetWidth(36);
			button2:SetPoint("TOPRIGHT", MarketWatcherTradeskillSelectorFrame, "TOPRIGHT", -7, -7);
			button2:SetAttribute("type*", "spell");
			button2:SetAttribute("spell1", prof2);

			_G[button2:GetName().."Icon"]:SetTexture(icon);
			button2:SetScript("OnEnter", function(self) 
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
				GameTooltip:AddLine(prof2, 1, 1, 1);
				GameTooltip:AddLine(MARKETWATCHER_TOOLTIP17, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1);
				GameTooltip:Show();
			end);
			button2:SetScript("OnLeave", function(self) GameTooltip:Hide(); end);
			button2.trade = prof2;
		end
	end
end
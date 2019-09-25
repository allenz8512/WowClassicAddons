MARKETWATCHER_HISTORY = "History";
MARKETWATCHER_SCAN = "Scan";
MARKETWATCHER_ABORT = "Abort";
MARKETWATCHER_GETITEMINFO = "Get Item Info";
MARKETWATCHER_LIST = "List";
MARKETWATCHER_GRAPH = "Graph";
MARKETWATCHER_PERIODS = {
	"Last Week",
	"Last 2 Weeks",
	"Last Month",
	"Last 2 Months",
	"Last 3 Months",
	"Last 6 Months",
	"Last Year",
	"Entire History",
};
MARKETWATCHER_TRADESKILL_EXCLUDE = {
	["Mining"] = true,
	["Skinning"] = true,
	["Herbalism"] = true,
};

MARKETWATCHER_SCANTIME = "Scan Time: %s (%s ago)";
MARKETWATCHER_SCANTIME2 = "Scan completed at %s in %i minutes, %i seconds (%i pages)";
MARKETWATCHER_NUMSCANS = "Scan #%i of %i";
MARKETWATCHER_NOSCANS = "No scans recorded for this item";
MARKETWATCHER_NOWATCHEDITEMS = "Your watched items list is empty.  This AddOn only scans for items you specify.\nPlease add the items you wish to scan on the history tab.";
MARKETWATCHER_NOAUCTIONS = "No auctions were found for this item during this scan";
MARKETWATCHER_ADDITEM = "Add Item";
MARKETWATCHER_EDITITEM = "Edit Item";
MARKETWATCHER_ADDITEMTEXT = "Enter the name of the item to be tracked OR its item ID, then click \"Get Item Info\" to get the information this addon needs for the specified item from the WoW server (if necessary), then click \"Add.\"\n\nThe item ID can be found in the URL of WoW database websites, i.e. \"http://www.wowhead.com/?item=42225\" or \"http://thottbot.com/i42225\"";
MARKETWATCHER_ITEMNOTINCACHE = "Item not found in your item cache.  Do an auction search for it or click a link to it somewhere.";
MARKETWATCHER_ITEMNOTINBAGS = "Please wait while checking auction house to get item info... (page %i of %i)";
MARKETWATCHER_ITEMNOTINHOUSE = "Item not found in auction house.  You will need to obtain the item ID from a WoW database website";
MARKETWATCHER_ITEMFOUND = "Item found";
MARKETWATCHER_MEMORY_USE = "Market Watcher v|cffffff00%s|r memory used: |cff00ffff%.2f|r MBytes";
MARKETWATCHER_MEMORY_LIMIT = "Market Watcher: Warning!  AddOn memory usage exceeding 30 megabytes.  Set saved scan limits to reduce memory usage or risk scan data loss.";

MARKETWATCHER_SUMMARY_OPTIONS = "Scan Summary Options";
MARKETWATCHER_HISTORY_OPTIONS = "History Options";
MARKETWATCHER_RECORDHISTORY = "Record Scans";
MARKETWATCHER_STACKSONLY = "Stacks Only";
MARKETWATCHER_BIDTHRESHOLD = "Bid Threshold";
MARKETWATCHER_BUYOUTTHRESHOLD = "Buyout Threshold";
MARKETWATCHER_NONE_ON_SALE = "None for Sale";
MARKETWATCHER_NO_THRESHOLD = "No Threshold";
MARKETWATCHER_BELOW_THRESHOLD = "Below Threshold";
MARKETWATCHER_ABOVE_THRESHOLD = "Above Threshold";
MARKETWATCHER_MAX_AGE = "Max Age";
MARKETWATCHER_MAX_ENTRIES = "Max Entries";

MARKETWATCHER_EDITSTATUS = "%i scans recorded for this item";
MARKETWATCHER_QUERYSTATUS = "Submitting query |cff00ffff%i|r of |cff00ffff%i|r";
MARKETWATCHER_PAGESTATUS = "Getting page |cff00ffff%i|r";
MARKETWATCHER_PAGESTATUS2 = "Getting page |cff00ffff%i|r of |cff00ffff%i|r";
MARKETWATCHER_QUERYSTATUS2 = "Query: |cff00ffff%s %s %s %s %s|r";
MARKETWATCHER_QUERYSTATUS3 = "Query sent;  Waiting for response";
MARKETWATCHER_LISTUPDATE1 = "Got auction info and all seller names; waiting to send next query";
MARKETWATCHER_LISTUPDATE2 = "Waiting for seller names";
MARKETWATCHER_LISTUPDATE3 = "Got seller name(s), waiting for more";
MARKETWATCHER_SCANCOMPLETE = "Scan complete";
MARKETWATCHER_SOLD = "Sold or\nRemoved";
MARKETWATCHER_HASBID = "Has a Bid";
MARKETWATCHER_HASBID2 = "This auction has a bid";
MARKETWATCHER_YOU_ARE_HIGH_BIDDER = "You are the high bidder of this auction";
MARKETWATCHER_NOBUYOUT = "|cff808080No BO|r";
MARKETWATCHER_SCAN_RECORDED = "Scan(s) recorded at %s";

MARKETWATCHER_TOTALS = "Total Auctions:|cff00ffff %i|r    Units For Sale:|cff00ffff %i|r\n";
MARKETWATCHER_SINGLEAUCTIONS = "Single Unit Auctions: |cff00ffff%i|r\n";
MARKETWATCHER_NONSINGLEAUCTIONS = "Non-Single Unit Auctions: |cff00ffff%i|r\n";
MARKETWATCHER_FULLSTACKAUCTIONS = "Full Stack Auctions: |cff00ffff%i|r\n";
MARKETWATCHER_NONFULLSTACKAUCTIONS = "Non-Full Stack Auctions: |cff00ffff%i|r\n";
MARKETWATCHER_LOWESTBID = "lowest bid: %s";
MARKETWATCHER_LOWESTBUYOUT = "lowest buyout: %s";
MARKETWATCHER_LOWESTBUYOUTPERUNIT = "lowest bo/unit: %s";
MARKETWATCHER_ITEM_NOT_IN_PAGE = "%s not found on this page";
MARKETWATCHER_YOURS = "Yours";
MARKETWATCHER_MORE = "More";
MARKETWATCHER_NOT_YOURS = "Not "..MARKETWATCHER_YOURS;
MARKETWATCHER_ITEM_REMOVED = "Item Removed";
MARKETWATCHER_AS_OF_AGO = "As of %s ago";
MARKETWATCHER_ADDED_TO_WATCHED = "%s added to watched items list";

MARKETWATCHER_SELL_ONE = "Sell One";
MARKETWATCHER_SELL_STACK = "Sell Stack";
MARKETWATCHER_CREATE = "Create";
MARKETWATCHER_CANCEL_AUCTIONS = "Cancel Auctions";
MARKETWATCHER_RESCAN_ITEM = "Rescan Item";
MARKETWATCHER_CANCEL_UNDERCUT = "Cancel Undercut";
MARKETWATCHER_AUCTIONS_CANCELED = "%i Auctions Canceled";
MARKETWATCHER_APPLY_FILTERS = APPLY.." "..FILTERS;
MARKETWATCHER_EDIT_FILTERS = "Edit "..FILTERS;
MARKETWATCHER_UNHIDE = "Unhide";
MARKETWATCHER_NO_FREE_BAG_SLOT = "No free bag slot";
MARKETWATCHER_DEPOSIT_PAID = "Deposit paid: %s";
MARKETWATCHER_STACK_SIZE_NOT_FOUND = "Stack of that size not found";
MARKETWATCHER_BUYOUT_LESS_THAN_BID = "Buyout price must be greater than or equal to bid price";
MARKETWATCHER_DO_NOT_HAVE_THAT_MANY = "You do not have that many";
MARKETWATCHER_REMOVE_ITEM_AUCTIONS_TAB = "Remove item from Auctions Tab";
MARKETWATCHER_NO_AUCTIONS_TO_CANCEL = "No undercut auctions to cancel";

MARKETWATCHER_FILTERS_FRAME_TEXT = "Hide items that match one or more of these criteria";
MARKETWATCHER_ITEMS_DISPLAYED = "Displaying |cff00ffff%i|r of |cff00ffff%i|r items";
MARKETWATCHER_NUM_HIDDEN = " (|cff00cccc%i|r Filtered, |cff00cccc%i|r Hidden)";
MARKETWATCHER_SELECTED_TRADESKILL = "Selected Tradeskill: %s";
MARKETWATCHER_NO_TRADE_SELECTED = "You have not selected a tradeskill.  A tradeskill must be selected for the 'cannot craft' filters to fuction.";

MARKETWATCHER_DELETE_ITEM_POPUP = "Stop tracking and delete all recorded history for this item?";
MARKETWATCHER_DELETE_SCAN_POPUP = "Delete the currently viewed scan entry?";
MARKETWATCHER_RECORD_CONFIRM_POPUP = "Are you certain you wish to record another scan so soon?  Recording too often can waste memory.  Uncheck 'Record Scans' to scan without recording";
MARKETWATCHER_CANCEL_UNDERCUT_CONFIRM_POPUP = "Are you sure you want to cancel all currently undercut auctions?  You will lose your desposit for those auctions";

MARKETWATCHER_GLYPH = "Glyph";
MARKETWATCHER_GEM = "Gem";

MARKETWATCHER_CONFIG = "Configure";
MARKETWATCHER_CONFIG_HEADER = "Market Watcher Options";
MARKETWATCHER_QUERYDELAY = "Query Delay";
MARKETWATCHER_DEFAULT_UNDERCUT = "Default Undercut";
MARKETWATCHER_BID_PRICE_MARKDOWN = "Bid Price Markdown";
MARKETWATCHER_IGNORE_SENSITIVITY = "Ignore Sensitivity";
MARKETWATCHER_AUDIT = "Memory Audit";
MARKETWATCHER_AUDIT_TEXT = "Server: |cff00ffff%s|r  Faction: |cff00ffff%s|r  Item Scans: |cff00ffff%i|r";

MARKETWATCHER_CONFIG_CHECKBOXES = {
	["saveOnBrowse"] = "Save scans of items even when scan was not from clicking the scan button.  This will limit saving scans to one per five hours",
	["reapplyFilters"] = "Automatically re-apply filters when an item summary is updated",
	["allowTSOpen"] = "Allow the tradeskill window to open when the auction house window is open",
	["ignoreOutliers"] = "Ignore auctions with extreme buyouts when graphing",
};

MARKETWATCHER_SERIES_TYPES = {
	["Low"] = "Low",
	["Average"] = "Average",
	["High"] = "High",
};

MARKETWATCHER_METHODS = {
	{
		name = "Actual",
		tooltip = "",
	},
	{
		name = "SMA",
		tooltip = "Simple Moving Average",
	},
	{
		name = "EMA",
		tooltip = "Exponential Moving Average",
	},
	{
		name = "Trend",
		tooltip = "Trend Line",
	},
};

MARKETWATCHER_TOOLTIP1 = "The ID number of the item to be tracked.  This number can be obtained from WoW database websites.";
MARKETWATCHER_TOOLTIP2 = "Check this to record scans of this item.  This will record the state of the auction house for this item when scanned.  Be warned that saving many scans of many items will use a great deal of memory";
MARKETWATCHER_TOOLTIP3 = "Record only full stack auctions of this item";
MARKETWATCHER_TOOLTIP4 = "You may scan the auction house without recording the scans of items that are otherwise set to record by unchecking this";
MARKETWATCHER_TOOLTIP5 = "Click a tradeskill in the lower right corner to enable this button";
MARKETWATCHER_TOOLTIP6 = "Cancel all of your auctions that are not currently the lowest buyout price per unit. (that were undercut)  You will lose your desposit for those auctions.\n\nNote that only one auction can be canceled per button press due to restrictions placed on addons by Blizzard.";
MARKETWATCHER_TOOLTIP7 = "Right click to edit item scan options\n\nShift + Right Click to scan this item\n\nCtrl + Alt + Right Click will remove item if item has zero saved scans";
MARKETWATCHER_TOOLTIP8 = "Display this item if none are currently for sale";
MARKETWATCHER_TOOLTIP9 = "Display this item only if the lowest cost is above or below the threshold price, or never hide this item when some are on sale (no threshold)";
MARKETWATCHER_TOOLTIP10 = "Only display summaries for full stacks of this item";
MARKETWATCHER_TOOLTIP11 = "The maximum number of days to preserve recorded scans before deletion.  Input 0 to not automatically delete records by a set age";
MARKETWATCHER_TOOLTIP12 = "The maximum number of recorded scans to preserve for this item.  0 for no limit";
MARKETWATCHER_TOOLTIP13 = "The time in seconds to wait between pages/queries.  Setting this too low may cause disconnects in busy cities";
MARKETWATCHER_TOOLTIP14 = "List the number of scans recorded for every server and faction on this account";
MARKETWATCHER_TOOLTIP15 = "The default markdown in price from the current lowest price when determining default buyout prices on the quick sell panel";
MARKETWATCHER_TOOLTIP16 = "How much cheaper from the buyout price to set the default starting bid price on the quick sell panel";
MARKETWATCHER_TOOLTIP17 = "Select your tradeskill by clicking here.  Selecting a tradeskill allows Market Watcher to include craftable items in search results when right clicking a category, enables tradeskill related filters, and enables the Create button.";
MARKETWATCHER_TOOLTIP18 = "Alt + Left click to scan";
MARKETWATCHER_TOOLTIP19 = "Alt + Left click to add to watched items";
MARKETWATCHER_TOOLTIP20 = "Standard deviation multiplier to determine outlier auctions when ignoring extreme buyout prices. (lower = more sensitive)";
MARKETWATCHER_TOOLTIP21 = "Right click to scan catagory.  Enter a name, a level range, or set item rarity to narrow the results";

MARKETWATCHER_FILTER_TEXT = {
	["buyoutPerUnitBelow"] = "Buyout price per unit below this price",
	["buyoutPerUnitAbove"] = "Buyout price per unit above this price",
	["noBuyoutables"] = "Items without buyoutable auctions",
	["priceAboveThreshold"] = "Price above threshold",
	["priceBelowThreshold"] = "Price below threshold",
	["noThreshold"] = "Items without a threshold set",
	["historicalBelowThis"] = "Items selling this percent below historical average",
	["historicalAboveThis"] = "Items selling this percent above historical average",
	["noHistoricalData"] = "Items with no saved scans or too few scans to determine\na historical price average",
	["unitsForSaleLess"] = "Items with less than this many units for sale",
	["unitsForSaleMore"] = "Items with more than this many units for sale",
	["lowestSeller"] = "Items I am the lowest seller",
	["notLowestSeller"] = "Items I have been undercut",
	["iAmNotSelling"] = "Items I am not selling",
	["iCanNotCraft"] = "Items that I cannot craft with my selected tradeskill",
	["iCanNotCraftMats"] = "Items I cannot craft from a lack of components",
	["notRecentlySold"] = "Items that have not recently sold",
	["notInInventory"] = "Items not currently in my inventory",
	["iLevel"] = "Items below this item level",
	["isPoor"] = "|cff9d9d9d"..ITEM_QUALITY0_DESC.."|r quality items",
	["isCommon"] = "|cffffffff"..ITEM_QUALITY1_DESC.."|r quality items",
	["isUncommon"] = "|cff1eff00"..ITEM_QUALITY2_DESC.."|r quality items",
	["isRare"] = "|cff0070dd"..ITEM_QUALITY3_DESC.."|r quality items",
	["isEpic"] = "|cffa335ee"..ITEM_QUALITY4_DESC.."|r quality items",
	["excludeKeywords"] = "Items with one of these keywords in the item name",
};

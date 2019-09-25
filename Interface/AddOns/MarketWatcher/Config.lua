if ( not MarketWatcher ) then
	return
end
local MarketWatcher = MarketWatcher;
if ( not MarketWatcher.Config ) then
	MarketWatcher.Config = {};
end
local config = MarketWatcher.Config;

local checkBoxOptions = {
	"saveOnBrowse",
	"reapplyFilters",
	"allowTSOpen",
	"ignoreOutliers",
};

function config.CreateButton(name, parent, point, x, y)
	if ( _G[name] ) then
		return
	end
	local button = CreateFrame("Button", name, parent, "UIPanelButtonTemplate");
	button:ClearAllPoints();
	button:SetPoint(point, x, y);
	button:SetText(MARKETWATCHER_CONFIG);
	button:SetHeight(22);
	button:SetWidth(100);
	button:SetScript("OnClick", function() MarketWatcherConfigFrame:Show() end)
	button:Show();
end

function config.SetupCheckButtons()
	if ( MarketWatcherConfigFrameCheckButton1 ) then
		return
	end

	local button, buttonName, widget, widgetName, text;
	local parent = MarketWatcherConfigFrame;

	for i, value in ipairs(checkBoxOptions) do

		buttonName = "MarketWatcherConfigFrameCheckButton"..i;
		button = CreateFrame("CheckButton", buttonName, parent, "UICheckButtonTemplate");
		button:SetID(i);
		button.value = value;
		button:SetWidth(25);
		button:SetHeight(26);

		if ( i == 1 ) then
			button:SetPoint("TOPLEFT", parent, "TOPLEFT", 210, -40);
		else
			button:SetPoint("TOPLEFT", _G["MarketWatcherConfigFrameCheckButton"..(i - 1)], "BOTTOMLEFT", 0, -10);
		end
		--button.tooltip = filter.tooltip;

		text = _G[button:GetName().."Text"];
		text:SetText(MARKETWATCHER_CONFIG_CHECKBOXES[value]);
		text:SetJustifyH("LEFT");
		text:SetWidth(225);
		text:SetHeight(40);
	end
end

function MarketWatcher.Config.Frame_OnShow()

	MarketWatcher.Config.SetupCheckButtons();

	local cfg = MarketWatcher.GetConfig();

	for i, value in ipairs(checkBoxOptions) do

		if ( cfg[value] ) then
			_G["MarketWatcherConfigFrameCheckButton"..i]:SetChecked(1);
		else
			_G["MarketWatcherConfigFrameCheckButton"..i]:SetChecked(nil);
		end
	end
end

function config.OkayButton_OnClick(self)

	local cfg = MarketWatcher.GetConfig();

	cfg.queryDelay = MarketWatcherConfigFrameQueryDelaySlider:GetValue();
	cfg.defaultUndercut = MarketWatcherConfigFrameDefaultUndercutSlider:GetValue();
	cfg.bidPriceMarkdown = MarketWatcherConfigFrameBidPriceMarkdownSlider:GetValue();
	cfg.ignoreSensitivity = MarketWatcherConfigFrameIgnoreSensitivitySlider:GetValue();

	for i, value in ipairs(checkBoxOptions) do
		if ( _G["MarketWatcherConfigFrameCheckButton"..i]:GetChecked() ) then
			cfg[value] = true;
		else
			cfg[value] = false;
		end
	end

	self:GetParent():Hide();
end

function config.Audit()

	local scans;

	for server in pairs(MarketWatcherHistory) do
		for faction in pairs(MarketWatcherHistory[server]) do

			scans = 0;
			for itemId, table in pairs(MarketWatcherHistory[server][faction]) do
				scans = scans + #table;
			end

			if ( scans > 0 ) then
				DEFAULT_CHAT_FRAME:AddMessage(format(MARKETWATCHER_AUDIT_TEXT, server, faction, scans), 1, 1, 0);
			end
		end
	end

end

if ( not MarketWatcher ) then
	return
end
local MarketWatcher = MarketWatcher;
if ( not MarketWatcher.Graph ) then
	MarketWatcher.Graph = {};
end
local graph = MarketWatcher.Graph;

graph.defaultMethods = { ["Low"] = { [1] = true } };
graph.periods = {
	[1] = 86400 * 7,
	[2] = 86400 * 14,
	[3] = 86400 * 30,
	[4] = 86400 * 30 * 2,
	[5] = 86400 * 30 * 3,
	[6] = 86400 * 30 * 6,
	[7] = 86400 * 365,
	[8] = 999999999,
};

local TIMEUNIT_ABR = {
	MONTH = {
		MONTH_JANUARY:sub(1, 3),
		MONTH_FEBRUARY:sub(1, 3),
		MONTH_MARCH:sub(1, 3),
		MONTH_APRIL:sub(1, 3),
		MONTH_MAY:sub(1, 3),
		MONTH_JUNE:sub(1, 3),
		MONTH_JULY:sub(1, 3),
		MONTH_AUGUST:sub(1, 3),
		MONTH_SEPTEMBER:sub(1, 3),
		MONTH_OCTOBER:sub(1, 3),
		MONTH_NOVEMBER:sub(1, 3),
		MONTH_DECEMBER:sub(1, 3),
	},
	WEEKDAY = {
		WEEKDAY_SUNDAY:sub(1, 3),
		WEEKDAY_MONDAY:sub(1, 3),
		WEEKDAY_TUESDAY:sub(1, 3),
		WEEKDAY_WEDNESDAY:sub(1, 3),
		WEEKDAY_THURSDAY:sub(1, 3),
		WEEKDAY_FRIDAY:sub(1, 3),
		WEEKDAY_SATURDAY:sub(1, 3),
	},
};

local seriesData = {
	["Low"] = {},
	["Average"] = {},
	["High"] = {},
};
local graphItemId = 0;
local graphStartTime = 0;
local methodData = {};
local analysisMethods = {
	{
		["name"] = MARKETWATCHER_METHODS[1].name,
		["tooltip"] = MARKETWATCHER_METHODS[1].tooltip,
		["color"] = {
			["default"] = {1.0, 1.0, 1.0, 0.8},
			["Low"] = {0, 1.0, 0, 0.8},
			["Average"] = {1.0, 1.0, 0, 0.8},
			["High"] = {1.0, 0, 0, 0.8},
		},
		["func"] = function (n, seriesData, i, resultData)
			return seriesData[n][1], seriesData[n][2];
		end,
	},
	{
		["name"] = MARKETWATCHER_METHODS[2].name,
		["tooltip"] = MARKETWATCHER_METHODS[2].tooltip,
		["color"] = {
			["default"] = {0.5, 0, 1.0, 0.8},
			["Low"] = {0.5, 0.5, 1.0, 0.8},
			["Average"] = {0.75, 0.5, 1.0, 0.8},
			["High"] = {0.75, 0, 1.0, 0.8},
		},
		["func"] = function (n, seriesData, i, resultData)

			local x = 0;
			local N = 10;

			if ( i <= N ) then
				local m = 1;
				x = seriesData[n][2];

				while ( seriesData[n - m] and m < N ) do
					x = x + seriesData[n - m][2];
					m = m + 1;
				end

				if ( n > N ) then
					x = x / N;
				else
					x = x / n;
				end
			else
				x = resultData[i - 1][2] - seriesData[n - N][2] / N + seriesData[n][2] / N;
			end

			return seriesData[n][1], x;
		end,
	},
	{
		["name"] = MARKETWATCHER_METHODS[3].name,
		["tooltip"] = MARKETWATCHER_METHODS[3].tooltip,
		["color"] = {
			["default"] = {0, 0, 1.0, 0.8},
			["Low"] = {0, 0.5, 1.0, 0.8},
			["Average"] = {0.5, 0.5, 1.0, 0.8},
			["High"] = {0.5, 0, 1.0, 0.8},
		},
		["func"] = function (n, seriesData, i, resultData)

			local m = 1;
			local N = 10;
			local a;
			local numerator = seriesData[n][2];
			local denominator = 1;

			while ( seriesData[n - m] and m < N ) do
				a = 2 / (m + 2);
				numerator = numerator + math.pow(1 - a, m) * seriesData[n - m][2];
				denominator = denominator + math.pow(1 - a, m);
				m = m + 1;
			end

			return seriesData[n][1], numerator / denominator;
		end,
	},
	{
		["name"] = MARKETWATCHER_METHODS[4].name,
		["tooltip"] = MARKETWATCHER_METHODS[4].tooltip,
		["color"] = {
			["default"] = {0.5, 0.5, 0.5, 0.8},
			["Low"] = {0, 0.5, 0, 0.8},
			["Average"] = {0.5, 0.5, 0, 0.8},
			["High"] = {0.5, 0, 0, 0.8},
		},
		["func"] = function (n, seriesData, i, resultData)

			if ( i > 2 ) then
				local timestamp, price = resultData[2][1], resultData[2][2];
				resultData[2] = nil;
				return timestamp, price;
			else
				-- much of this copied from LibGraph
				local alpha, beta;
				local N, SX, SY, SXX, SXY = 0, 0, 0, 0, 0;
				local MaxX = seriesData[n][1];
				local firstTimestamp = MaxX;
				local MinX = time();

				for k, v in pairs(seriesData) do
					N = N + 1;

					SX = SX + v[1];
					SXX = SXX + v[1] * v[1];
					SY = SY + v[2];
					SXY = SXY + v[1] * v[2];

					if ( v[1] >= firstTimestamp ) then
						MinX = math.min(v[1], MinX);
					end
					MaxX = math.max(v[1], MaxX);
				end
				
				beta = (N * SXY - SX * SY) / (N * SXX - SX * SX);
				alpha = (SY - beta * SX) / N;

				local sx, sy, ex, ey;
				
				sx = MinX;
				sy = beta * sx + alpha;
				ex = MaxX;
				ey = beta * ex + alpha;

				if ( i == 1 ) then
					return sx, sy;
				else
					return ex, ey;
				end
			end
		end,
	},
};

function graph.CanDisplayGraph(itemId)
	local scansWithAuctions = 0;
	for i = 1, MarketWatcher.GetNumScans(itemId) do
		if ( MarketWatcher.GetNumAuctions(itemId, i) > 0 ) then
			scansWithAuctions = scansWithAuctions + 1;
		end
		if ( scansWithAuctions >= 2 ) then
			return true;
		end
	end
end

function graph.GetYSpacing(yMax)
	local yLog = math.log10(yMax);
	yLog = math.pow(10, math.floor(yLog));

	local ySpacing = yLog / 4;
	if ( yMax / ySpacing > 7 ) then
		ySpacing = yLog / 2;
	   
		if ( yMax / ySpacing > 7 ) then
			ySpacing = yLog;

			if ( yMax / ySpacing > 7 ) then
				ySpacing = yLog * 2.5;
			end
		end
	end

	return ySpacing;
end

function graph.DisplayGraph(itemId, startTime, methods, frameName, parent, point, relativePoint, offsetX, offsetY, width, height, gridColor)

	if ( not LibStub ) then
		return
	end
	
	local libGraph = LibStub("LibGraph-2.0");

	if ( not libGraph ) then
		return
	end

	local g = _G[frameName] or libGraph:CreateGraphLine(frameName, parent, point, relativePoint, offsetX, offsetY, width, height);
	g.CreateGridlines = graph.CreateGridlines;	-- use custom grid line function

	local highestValue;
	startTime, highestValue = graph.Compute(itemId, startTime, methods);
	if ( not highestValue ) then
		g:Hide();
		return
	end
	highestValue = highestValue * 1.1;

	g:ResetData();
	g:SetXAxis(startTime, time());
	g:SetYAxis(0, highestValue);
	g:SetGridSpacing( 1, graph.GetYSpacing(highestValue) );	-- x axis spacing determiend by custom grid function
	g:SetGridColor(gridColor or {0.5, 0.5, 0.5, 0.5});
	g:SetAxisDrawing(true, true);
	g:SetAxisColor({0.8, 0.8, 0.8, 0.8});
	g:SetYLabels(true, false);

	for _, dataSeries in ipairs(methodData) do
		g:AddDataSeries(dataSeries.data, dataSeries.color);
	end
	g:Show();

	if ( MarketWatcher.debug ) then
		print("graph shown");
	end
end

-- altered version of LibGraph's function
function graph.CreateGridlines(self)
	local math_max = math.max
	local math_min = math.min
	local math_ceil = math.ceil
	local math_floor = math.floor
	local math_fmod = math.fmod

	local Width=self:GetWidth()
	local Height=self:GetHeight()
	local NoSecondary=(self.GridSecondaryY==nil) or (self.GridSecondaryX==nil) or (type(self.GridColorSecondary)~="table")
	self:HideLines(self)
	self:HideFontStrings()

	local YPos, T, F;

	if self.YGridInterval then
		local LowerYGridLine,UpperYGridLine,TopSpace
		LowerYGridLine=self.YMin/self.YGridInterval
		LowerYGridLine=math_max(math_floor(LowerYGridLine),math_ceil(LowerYGridLine))
		UpperYGridLine=self.YMax/self.YGridInterval
		UpperYGridLine=math_min(math_floor(UpperYGridLine),math_ceil(UpperYGridLine))
		TopSpace=Height*(1-(UpperYGridLine*self.YGridInterval-self.YMin)/(self.YMax-self.YMin))
		for i=LowerYGridLine,UpperYGridLine do
			if i~=0 or not self.YAxisDrawn then

				YPos=Height*(i*self.YGridInterval-self.YMin)/(self.YMax-self.YMin)
				if NoSecondary or math_fmod(i,self.GridSecondaryY)==0 then
					T=self:DrawLine(self,0,YPos,Width,YPos,24,self.GridColor,"BORDER")
				else
					T=self:DrawLine(self,0,YPos,Width,YPos,24,self.GridColorSecondary,"BORDER")
				end

				if ((i~=UpperYGridLine) or (TopSpace>12)) and (NoSecondary or math_fmod(i,self.GridSecondaryY)==0) then
					if self.YLabelsLeft then
						F=self:FindFontString()
						F:SetFontObject("GameFontHighlightSmall")
						F:SetTextColor(1,1,1)
						F:ClearAllPoints()
						F:SetPoint("BOTTOMLEFT",T,"LEFT",2,2)
						F:SetText(MarketWatcher.MoneyText(i*self.YGridInterval))	-- display as money
						F:Show()
					end

					if self.YLabelsRight then
						F=self:FindFontString()
						F:SetFontObject("GameFontHighlightSmall")
						F:SetTextColor(1,1,1)
						F:ClearAllPoints()
						F:SetPoint("BOTTOMRIGHT",T,"RIGHT",-2,2)
						F:SetText(MarketWatcher.MoneyText(i*self.YGridInterval))
						F:Show()
					end
				end
			end
		end
	end


	-- customized X axis grid lines and labels added

	local range = self.XMax - self.XMin;
	local timeUnits, nextTime, XPos, label;

	-- use years after 1.5 years
	if ( range > (86400 * 365 * 1.5) ) then
		timeUnits = "year";

	-- use month grid lines after 60 days
	elseif ( range > (86400 * 60) ) then
		timeUnits = "month";

	-- else if graph time is greater than 14 days, use week grid lines instead of days
	elseif ( range > (86400 * 14) ) then
		timeUnits = "week";

	end

	nextTime, label = graph.GetNextTimeDemarcation(self.XMin, timeUnits);

	local insurance = 0;
	while ( insurance < 20 and nextTime < self.XMax ) do
		--print(date("%A %B %d %Y %H:%M", nextTime));
		XPos = (nextTime - self.XMin) / (range / Width);
		T = self:DrawLine(self, XPos, 0, XPos, Height, 24, self.GridColor, "BORDER");

		F = self:FindFontString();
		F:SetFontObject("GameFontHighlightSmall");
		F:SetTextColor(1, 1, 1);
		F:ClearAllPoints();
		F:SetPoint("BOTTOMLEFT", T, "BOTTOM", 0, 0);
		F:SetText(label);
		F:Show();

		nextTime, label = graph.GetNextTimeDemarcation(nextTime, timeUnits);
		insurance = insurance + 1;
	end


	if self.YAxisDrawn and self.YMax>=0 and self.YMin<=0 then

		YPos=Height*(-self.YMin)/(self.YMax-self.YMin)
		T=self:DrawLine(self,0,YPos,Width,YPos,24,self.AxisColor,"BORDER")

		if self.YLabelsLeft  then
			F=self:FindFontString()
			F:SetFontObject("GameFontHighlightSmall")
			F:SetTextColor(1,1,1)
			F:ClearAllPoints()
			F:SetPoint("BOTTOMLEFT",T,"LEFT",2,2)
			F:SetText(MarketWatcher.MoneyText(0))
			F:Show()
		end
		if self.YLabelsRight  then
			F=self:FindFontString()
			F:SetFontObject("GameFontHighlightSmall")
			F:SetTextColor(1,1,1)
			F:ClearAllPoints()
			F:SetPoint("BOTTOMRIGHT",T,"RIGHT",-2,2)
			F:SetText(MarketWatcher.MoneyText(0))
			F:Show()
		end
	end

	if self.XAxisDrawn and self.XMax>=0 and self.XMin<=0 then
		local XPos;

		XPos=Width*(-self.XMin)/(self.XMax-self.XMin)
		self:DrawLine(self,XPos,0,XPos,Height,24,self.AxisColor,"BORDER")
	end
end

function graph.GetNextTimeDemarcation(t, unit)
	local table = date("*t", t);
	local label = "";
	local newTime;
	table.yday = nil;
	table.hour = 0;
	table.min = 0;
	table.sec = 0;

	if ( not unit or unit == "day" ) then
		table.wday = nil;
		table.day = table.day + 1;
		newTime = time(table);
		table = date("*t", newTime);
		label = TIMEUNIT_ABR.WEEKDAY[table.wday];

	elseif ( unit == "week" ) then
		table.day = table.day + (8 - table.wday);
		newTime = time(table);
		table = date("*t", newTime);
		label = TIMEUNIT_ABR.MONTH[table.month].." "..table.day;

	elseif ( unit == "year" ) then
		table.wday = nil;
		table.day = 1;
		table.month = 1;
		table.year = table.year + 1;
		newTime = time(table);
		table = date("*t", newTime);
		label = table.year;

	else
		local dst = table.isdst;
		table.wday = nil;
		table.day = 1;
		table.month = table.month + 1;
		newTime = time(table);
		table = date("*t", newTime);
		if ( dst and not table.isdst) then
			table.hour = table.hour + 1;
			newTime = time(table);
			table = date("*t", newTime, table.isdst);
		elseif ( not dst and table.isdst ) then
			table.hour = table.hour - 1;
			newTime = time(table);
			table = date("*t", newTime, table.isdst);
		end
		label = TIMEUNIT_ABR.MONTH[table.month];
	end

	return time(table), label;
end

function graph.SeriesNameIterator()
	local i, x = 0, 0;

	return function()
		i = i + 1;
		x = 0;
		for name in pairs(seriesData) do
			x = x + 1;
			if ( i == x ) then
				return name;
			end
		end
	end;
end

function graph.MethodInfoIterator()
	local i = 0;
	local n = #analysisMethods;

	return function()
		i = i + 1;

		if ( i <= n ) then
			return analysisMethods[i].name, analysisMethods[i].tooltip, analysisMethods[i].color;
		end
	end;
end

function graph.GetSeriesData(itemId, startTime)
	local numScans = MarketWatcher.GetNumScans(itemId);
	local _, low, high, average, highestPrice, timeStamp;
	local lowAvg, averageAvg, highAvg = 0, 0, 0;

	for type in pairs(seriesData) do
		for i in ipairs(seriesData[type]) do
			seriesData[type][i] = nil;
		end
	end

	local startIndex;
	for scanIndex = numScans, 1, -1 do
		timeStamp = MarketWatcher.GetScanTimestamp(itemId, scanIndex);
		if ( timeStamp < startTime ) then
			startIndex = scanIndex - 10;		-- include 10 scans before starttime so methods don't start at 0 scans
			break;
		end
	end
	if ( not startIndex or startIndex < 1 ) then
		startIndex = 1;
	end

	for scanIndex = startIndex, numScans do

		low, high, average, _, _, _, _, _, _, timeStamp = MarketWatcher.ScanAnalysis(itemId, scanIndex);

		if ( low ) then
			tinsert(seriesData["Low"], {timeStamp, low, scanIndex});
			lowAvg = lowAvg + low;
		end
		if ( average ) then
			tinsert(seriesData["Average"], {timeStamp, average, scanIndex});
			averageAvg = averageAvg + average;
		end
		if ( high ) then
			tinsert(seriesData["High"], {timeStamp, high, scanIndex});
			highAvg = highAvg + high;
		end
	end

	if ( MarketWatcher.GetConfig().ignoreOutliers ) then

		lowAvg = lowAvg / #seriesData["Low"];
		averageAvg = averageAvg / #seriesData["Average"];
		highAvg = highAvg / #seriesData["High"];

		--[[
		local ignoreMinLow = lowAvg * 0.2;
		local ignoreMaxLow = lowAvg * 5;
		local ignoreMinAverage = averageAvg * 0.2;
		local ignoreMaxAverage = averageAvg * 5;
		local ignoreMinHigh = highAvg * 0.2;
		local ignoreMaxHigh = highAvg * 5;
		print("ignoreMinLow:", floor(ignoreMinLow / 10000), " ignoreMaxLow:", floor(ignoreMaxLow / 10000),
		" ignoreMinAverage:", floor(ignoreMinAverage / 10000), " ignoreMaxAverage:", floor(ignoreMaxAverage / 10000),
		" ignoreMinHigh:", floor(ignoreMinHigh / 10000), " ignoreMaxHigh:", floor(ignoreMaxHigh / 10000));
		]]

		local sets = {
			{
				"Low",
				lowAvg,
--				ignoreMinLow,
--				ignoreMaxLow,
			},
			{
				"Average",
				averageAvg,
--				ignoreMinAverage,
--				ignoreMaxAverage,
			},
			{
				"High",
				highAvg,
--				ignoreMinHigh,
--				ignoreMaxHigh,
			}
		};

		local variance = 0;
		local series, i, n, s, avg, ignoreMin, ignoreMax;
		local analysis = {};
		local multiplier = MarketWatcher.GetConfig().ignoreSensitivity or 3;

		-- calculate std deviation
		for _, set in ipairs(sets) do
			s = set[1];
			avg = set[2];

			if ( avg > 0 ) then
				series = seriesData[s];
				n = #series;

				for i = 1, n do
					variance = variance + (series[i][2] - avg) * (series[i][2] - avg);
				end
				variance = variance / n;
				set[5] = math.sqrt(variance);			-- standard deviation
				set[3] = set[2] - set[5] * multiplier;		-- ignoreMin = avg - std dev * multiplier;
				set[4] = set[2] + set[5] * multiplier;		-- ignoreMax = avg + std dev * multiplier;

				--print(s.." avg: "..floor(avg / 10000)..";  std deviation: "..floor(set[5] / 10000)..";  ignoreMin: "..floor(set[3] / 10000)..";  ignoreMax: "..floor(set[4] / 10000));
			end
		end

		-- replace outlier data
		for _, set in ipairs(sets) do
			s = set[1];
			avg = set[2];
			ignoreMin = set[3];
			ignoreMax = set[4];

			if ( avg > 0 ) then
				series = seriesData[s];
				i = 1;

				while ( i <= #series ) do
					if (	series[i][2] < ignoreMin
						or series[i][2] > ignoreMax
					) then
						--print(s.." extreme: ", floor(series[i][2] / 10000));
						analysis["Low"], analysis["High"], analysis["Average"] = MarketWatcher.ScanAnalysis(itemId, series[i][3], 
																    sets[1][3], sets[1][4], 
																    sets[2][3], sets[2][4], 
																    sets[3][3], sets[3][4]);
						--print("new value: ", analysis[s]);

						if ( not analysis[s] ) then
							table.remove(series, i);
							i = i - 1;
						else
							series[i][2] = analysis[s];
						end
					end
					i = i + 1;
				end
			end
		end
	end
end

function graph.Compute(itemId, startTime, methods)
	if ( graphItemId ~= itemId or graphStartTime ~= startTime ) then
		graph.GetSeriesData(itemId, startTime);
		graphItemId = itemId;
		graphStartTime = startTime;
	end

	methodData = {};
	local t, j, timestamp, price, highestValue;
	local priceDiff, pointDiff, startDiff, diffPct;

	-- check if startTime is lower than earliest scan
	for _, v in pairs(seriesData) do
		if ( v[1] and v[1][1] > startTime ) then
			startTime = v[1][1];
		end
		break;
	end

	for seriesType in pairs(methods) do
		if ( seriesData[seriesType] ) then

			for method in pairs(methods[seriesType]) do
				if ( analysisMethods[method] ) then

					t = { ["data"] = {}, ["color"] = analysisMethods[method].color[seriesType] or analysisMethods[method].color["default"] };
					tinsert(methodData, t);
					j = 1;

					for i, v in ipairs(seriesData[seriesType]) do
						if ( v[1] >= startTime ) then

							-- get data point just before graph starts so we don't have a space before the line starts
							if ( j == 1 and i > 1 ) then
								timestamp, price = analysisMethods[method].func(i - 1, seriesData[seriesType], j, t.data);
								tinsert(t.data, { timestamp, price } );
								j = j + 1;
							end


							timestamp, price = analysisMethods[method].func(i, seriesData[seriesType], j, t.data);
							tinsert(t.data, { timestamp, price } );

							if ( not highestValue or highestValue < price ) then
								highestValue = price;
							end


							-- if first point is before startTime, trim it and adjust the price appropriately
							if ( j == 2 and t.data[1][1] < startTime ) then

								priceDiff = t.data[2][2] - t.data[1][2];

								pointDiff = t.data[2][1] - t.data[1][1];
								startDiff = startTime - t.data[1][1];
								diffPct = startDiff / pointDiff;

								t.data[1][2] = t.data[1][2] + priceDiff * diffPct;
								t.data[1][1] = startTime;

								if ( highestValue < t.data[1][2] ) then
									highestValue = t.data[1][2];
								end
							end

							j = j + 1;
						end
					end
					

				end
			end
		end
	end

	return startTime, highestValue;
end

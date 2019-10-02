local _addonName, _addon = ...;
local L = _addon:GetLocalization();

local frame = CreateFrame("Frame");
local handlers = {};
local playerName = UnitName("player");

---- { For searching efficiency 
local searchcache = {}
searchcache.blocker = {}

local function addToCache(search)
    local t = {}
    t["block"] = {}
    t["match"] = {}
    t.blocker = false
    for k in string.gmatch(search, "-([^&%-]+)") do
        table.insert(t.block, k)
    end
    for k in string.gmatch(search, "&([^&%-]+)") do
        table.insert(t.match, k)
    end

    if string.sub(search, 1, 1) ~= "-" then     
        local head = string.match(search, "^(.-)[&%-]")
        if head then 
            table.insert(t.match, head) 
        end
    end
    if next(t.match)==nil then t.isBlocker = true end
    searchcache[search] = t
end

---- hk }

---- { keep spam from entering the notifier channel
local anti_spam = CreateFrame("Frame")
local lasttenseconds = {}
local function lasttenseconds_updater()
    if not lasttenseconds then return end
    if not anti_spam.lastcheck then anti_spam.lastcheck = GetTime() end
    if GetTime() - anti_spam.lastcheck < CChatNotifier_settings.antiSpamWindow*2 then return end
    for s, t in pairs(lasttenseconds) do
        if GetTime()-t > CChatNotifier_settings.antiSpamWindow then
            lasttenseconds[s] = nil
        end
    end
    anti_spam.lastcheck = GetTime()
end
anti_spam:SetScript("OnUpdate", lasttenseconds_updater)
---- hk }


--- Add new entry to the list
-- @param search The string to search for
function _addon:AddToList(search)
    local ntable = {
        active = true,
        words = {}
    };
    
    for found in string.gmatch(search, "([^,]+)") do
        table.insert(ntable.words, strtrim(found):lower());
    end

    CChatNotifier_data[search] = ntable;
    _addon:MainUI_UpdateList();
end

--- Remove entry from list
-- @param search The string to remove
function _addon:RemoveFromList(search)
    CChatNotifier_data[search] = nil;
    _addon:MainUI_UpdateList();
end

--- Toggle entry active state
-- @param search The search string to toggle
-- @return the new state
function _addon:ToggleEntry(search)
    if CChatNotifier_data[search] ~= nil then
        CChatNotifier_data[search].active = not CChatNotifier_data[search].active;
        return CChatNotifier_data[search].active;
    end
    return false;
end

--- Clear the whole list
function _addon:ClearList()
    wipe(CChatNotifier_data);
    _addon:MainUI_UpdateList();
end

--- Form notification msg from msg format template
-- @param search The found keyword
-- @param source The source of the message
-- @param from The player it is from
-- @param msg The message from chat
-- @param searchstart Start position of found keyword in message
-- @param searchend End position of found keyword in message
-- @return The finished message string
function _addon:FormNotifyMsg(search, source, from, msg, searchstart, searchend, guid)
    local formed = CChatNotifier_settings.outputFormat;
    
    -- Default color
    local fstart, fend = string.find(formed, "<<%x%x%x%x%x%x>>");
    local defaultColor = "|r";
    if fstart ~= nil then
        defaultColor = "|cFF" .. string.sub(formed, fstart+2, fend-2);
        formed = string.gsub(formed, "<<%x%x%x%x%x%x>>", defaultColor);
    end
    formed = string.gsub(formed, "<>", defaultColor);

    -- Colors
    fstart, fend = string.find(formed, "<%x%x%x%x%x%x>");
    while fstart ~= nil do
        formed = string.gsub(formed, string.sub(formed, fstart, fend), "|cFF"..string.sub(formed, fstart+1, fend-1));
        fstart, fend = string.find(formed, "<%x%x%x%x%x%x>");
    end

    -- remove server dash
    local dashLoc = string.find(from, "-");
    if dashLoc ~= nil then
        from = string.sub(from, 1, dashLoc-1);
    end

    -- Placeholders
    formed = string.gsub(formed, "{K}", search);
    formed = string.gsub(formed, "{S}", source);
    local playerStr = string.format("|Hplayer:%s|h%s|h", from, from)
    if CChatNotifier_settings.classColor and guid then
        local pclass = select(2,GetPlayerInfoByGUID(guid));
        if pclass == "SHAMAN" then
            playerStr = "|cff0270dd"..playerStr..CChatNotifier_settings.sendercolor;
        else
            local ccolor = RAID_CLASS_COLORS[pclass].colorStr;
            playerStr = "|c"..ccolor..playerStr..CChatNotifier_settings.sendercolor;
        end
    end
    formed = string.gsub(formed, "{P}", playerStr);

    ---- { highlight multiple keywords
    
    if search ~= "mankrik" then
        msg = string.gsub(msg, "|h|r", "|h"..CChatNotifier_settings.mecolor)
    end
    if string.find(search, "&") then

        local messagestart = string.find(formed, "{MS}") or string.len(formed)
        for _, v in pairs(searchcache[search].match) do
            msg = string.gsub(string.upper(msg), string.upper(v), CChatNotifier_settings.mfcolor .. string.upper(v) .. CChatNotifier_settings.mecolor)
        end
        formed = string.sub(formed, 1, messagestart-1) .. msg
    ---- hk }

    else
        if searchstart > 1 then
            formed = string.gsub(formed, "{MS}", string.sub(msg, 1, searchstart-1));
        else
            formed = string.gsub(formed, "{MS}", "");
        end

        formed = string.gsub(formed, "{MF}", string.sub(msg, searchstart, searchend));

        if searchend < msg:len() then
            formed = string.gsub(formed, "{ME}", string.sub(msg, searchend+1, msg:len()));
        else
            formed = string.gsub(formed, "{ME}", "");
        end
    end


    local hours, minutes = GetGameTime();
    if hours < 10 then hours = "0" .. hours; end
    if minutes < 10 then minutes = "0" .. minutes; end
    formed = string.gsub(formed, "{T}", hours..":"..minutes);

    return formed;
end

--- Output message to set chatframe
-- @param notiMsg The message to post to chat
-- @param frameNum The chat tab to output to
function _addon:PostNotification(notiMsg, frameNum)
    if strtrim(notiMsg):len() == 0 then
        _addon:PrintError(L["ERR_NOTIFY_FORMAT_MISSING"]);
    else
        _G["ChatFrame"..frameNum]:AddMessage(notiMsg);
    end

    if CChatNotifier_settings.soundId ~= "" then
        PlaySoundFile(CChatNotifier_settings.soundId, "Master");
    end
    
    FCF_StartAlertFlash(_G["ChatFrame"..frameNum]);
end

--- Remove server names from names given as "Character-Servername"
-- @param name The name to remove the dash server part from
local function RemoveServerDash(name)
	local dash = name:find("-");
    if dash then 
        return name:sub(1, dash-1); 
    end
	return name;
end

---- { Support for multiple-inclusive search and simple blocker(by hkhuang)



local function _hfind(msglow, search)
    local fstart, fend
    if string.find(search,"[&%-]") then
        if not searchcache[search] then addToCache(search) end
        local t = searchcache[search]
        if t.isBlocker then return nil, nil end
        for _, k in pairs(t.block) do
            fstart = string.find(msglow, k)
            if fstart then return nil, nil end
        end
        for _, k in pairs(t.match) do
            fstart, fend = string.find(msglow, k)
            if not fstart then return nil, nil end
        end
        return fstart, fend
    end
    return string.find(msglow, search)    
end

local function ShouldBlock(msg)
    for _, data in pairs(CChatNotifier_data) do
        if data.active then
            for word, search in pairs(data.words) do
                if string.sub(search, 1, 1) == "-" and not string.find(search,"&") then
                    for k in string.gmatch(search, "-([^%-]+)") do
                        if string.find(msg, k) then 
                            return true 
                        end
                    end                    
                end
            end
        end
    end
    return false;
end
---- hk }

--- Search message for searched terms
-- If one is found then trigger notification.
-- @param msg The message to search in
-- @param from The player it is from
-- @param source The source of the message (SAY, CHANNEL)
-- @param channelName If source is CHANNEL this is the channel name
local function SearchMessage(msg, from, source, guid)
    local msglow = string.lower(msg);
    if ShouldBlock(msglow) then return end
    local fstart, fend;
    for _, data in pairs(CChatNotifier_data) do
        if data.active then
            for word, search in pairs(data.words) do
                fstart, fend = _hfind(msglow, search);
                if fstart ~= nil then
                    local nameNoDash = RemoveServerDash(from);
                    if nameNoDash == playerName then
                        return;
                    end
---- { anti spam
                    t = GetTime()
                    if lasttenseconds and lasttenseconds[nameNoDash] and t-lasttenseconds[nameNoDash]<CChatNotifier_settings.antiSpamWindow then 
                        return;
                    end
                    lasttenseconds[nameNoDash] = t
---- hk }
                                        
                    _addon:PostNotification(_addon:FormNotifyMsg(search, source, from, msg, fstart, fend, guid), CChatNotifier_settings.chatFrame);
                    return;
                end
            end
        end
    end
end

--- Set addon state to current SV value
local function UpdateAddonState()
    if CChatNotifier_settings.isActive then
        frame:RegisterEvent("CHAT_MSG_SAY");
        frame:RegisterEvent("CHAT_MSG_YELL");
        frame:RegisterEvent("CHAT_MSG_CHANNEL");
    else
        frame:UnregisterEvent("CHAT_MSG_SAY");
        frame:UnregisterEvent("CHAT_MSG_YELL");
        frame:UnregisterEvent("CHAT_MSG_CHANNEL");
    end
    _addon:MinimapButtonUpdate();
end

--- Toggle search on/off
function _addon:ToggleAddon()
    CChatNotifier_settings.isActive = not CChatNotifier_settings.isActive;
    UpdateAddonState();
end


------------------------------------------------
-- Events
------------------------------------------------

function handlers.ADDON_LOADED(addonName)
    if addonName ~= _addonName then 
        return; 
    end
	frame:UnregisterEvent("ADDON_LOADED");
    _addon:SetupSettings();
    _addon:MainUI_UpdateList();
    UpdateAddonState();

    if CChatNotifier_settings.firstStart then
        _addon:MainUI_OpenList();
        print(L["FIRST_START_MSG"]);
        CChatNotifier_settings.firstStart = false;
        CChatNotifier_settings.outputFormat = L["CHAT_NOTIFY_FORMAT"];
    end
end

function handlers.CHAT_MSG_CHANNEL(text, playerName, _, channelName, _, _, _, _, _, _, _, guid)
	SearchMessage(text, playerName, channelName, guid);
end

function handlers.CHAT_MSG_SAY(text, playerName,  _, _, _, _, _, _, _, _, _, guid)
	SearchMessage(text, playerName, L["VICINITY"]);
end

function handlers.CHAT_MSG_YELL(text, playerName,  _, _, _, _, _, _, _, _, _, guid)
	SearchMessage(text, playerName, L["VICINITY"]);
end

frame:SetScript( "OnEvent",function(self, event, ...) 
	handlers[event](...);
end)

frame:RegisterEvent("ADDON_LOADED");


------------------------------------------------
-- Slash command
------------------------------------------------

SLASH_CCHATNOTIFIER1 = "/ccn";
SlashCmdList["CCHATNOTIFIER"] = function(arg)
    _addon:MainUI_OpenList();
end;


------------------------------------------------
-- Helper
------------------------------------------------

--- Print error message (red)
-- @param msg The message to print
function _addon:PrintError(msg)
    print("|cFFFF3333" .. _addonName .. ": " .. msg:gsub("|r", "|cFFFF3333"));
end



local _addonName, _addon = ...;
local L = _addon:GetLocalization();

local LIST_ITEM_HEIGHT = 27;
local MAX_ITEMS = 14;
local MIN_ITEMS = 9;
local HEIGHT_NO_CONTENT = 71;

-- Main frame
local frame = CreateFrame("Frame", "CCNUI_MainUI", UIParent, "ButtonFrameTemplate");
frame:SetPoint("CENTER", 0, 0);
frame:SetWidth(275);
frame:SetHeight(MIN_ITEMS*LIST_ITEM_HEIGHT + HEIGHT_NO_CONTENT);
frame:SetResizable(true);
frame:SetClampedToScreen(true);
frame:SetMaxResize(400, MAX_ITEMS*LIST_ITEM_HEIGHT + HEIGHT_NO_CONTENT);
frame:SetMinResize(250, MIN_ITEMS*LIST_ITEM_HEIGHT + HEIGHT_NO_CONTENT);
frame:SetMovable(true);
frame:EnableMouse(true);
frame.TitleText:SetText(_addonName);
frame.portrait:SetTexture([[Interface\AddOns\CChatNotifier\img\logo]]);
frame:Hide();

ButtonFrameTemplate_HideButtonBar(frame);

-- Add drag area
frame.dragBar = CreateFrame("Frame", nil, frame);
frame.dragBar:SetPoint("TOPLEFT");
frame.dragBar:SetPoint("BOTTOMRIGHT", frame.CloseButton, "TOPLEFT", 0, -40);
frame.dragBar:SetScript("OnMouseDown", function(self)
    self:GetParent():StartMoving();
end);
frame.dragBar:SetScript("OnMouseUp", function(self)
    self:GetParent():StopMovingOrSizing();
end);

-- Delete button for delete all function
frame.deleteBtn = CreateFrame("Button", nil, frame);
frame.deleteBtn:SetSize(18, 18);
frame.deleteBtn:SetPoint("TOPRIGHT", -15, -35);
frame.deleteBtn:SetNormalTexture([[Interface\AddOns\CChatNotifier\img\trash]]);
frame.deleteBtn:SetHighlightTexture([[Interface\AddOns\CChatNotifier\img\trash]]);

-- Add button for switching to add content
frame.addBtn = CreateFrame("Button", nil, frame);
frame.addBtn:SetSize(15, 15);
frame.addBtn:SetPoint("RIGHT", frame.deleteBtn, "LEFT", -15, 0);
frame.addBtn:SetNormalTexture([[Interface\AddOns\CChatNotifier\img\iplus]]);
frame.addBtn:SetHighlightTexture([[Interface\AddOns\CChatNotifier\img\iplus]]);

-- Add button for toggling addon on/off
frame.toggleBtn = CreateFrame("Button", nil, frame);
frame.toggleBtn:SetSize(15, 15);
frame.toggleBtn:SetPoint("RIGHT", frame.addBtn, "LEFT", -15, 0);
frame.toggleBtn:SetNormalTexture([[Interface\AddOns\CChatNotifier\img\on]]);
frame.toggleBtn:SetHighlightTexture([[Interface\AddOns\CChatNotifier\img\on]]);

-- Settings button
frame.settingsBtn = CreateFrame("Button", nil, frame);
frame.settingsBtn:SetSize(18, 18);
frame.settingsBtn:SetPoint("TOPLEFT", 70, -35);
frame.settingsBtn:SetNormalTexture([[interface/scenarios/scenarioicon-interact.blp]]);
frame.settingsBtn:SetHighlightTexture([[interface/scenarios/scenarioicon-interact.blp]]);

-- Resize knob
frame.resizeBtn = CreateFrame("Button", nil, frame);
frame.resizeBtn:SetSize(64, 18);
frame.resizeBtn:SetPoint("TOPRIGHT", frame, "BOTTOMRIGHT", -3, 1);
frame.resizeBtn:SetNormalTexture([[Interface\AddOns\CChatNotifier\img\grabber_s]]);
frame.resizeBtn:SetHighlightTexture([[Interface\AddOns\CChatNotifier\img\grabber]]);


----------------------------------------------------------------------------------------------------------------
-- Content frames
----------------------------------------------------------------------------------------------------------------

-- Scrollframe for the list
frame.scrollFrame = CreateFrame("ScrollFrame", nil, frame.Inset, "FauxScrollFrameTemplate");
frame.scrollFrame:SetPoint("TOPLEFT", 3, -3);
frame.scrollFrame:SetPoint("BOTTOMRIGHT", -3, 3);
frame.scrollFrame.ScrollBar:ClearAllPoints();
frame.scrollFrame.ScrollBar:SetPoint("TOPRIGHT", -1, -18);
frame.scrollFrame.ScrollBar:SetPoint("BOTTOMRIGHT", -1, 16);

frame.scrollFrame.ScrollBarTop = frame.scrollFrame:CreateTexture(nil, "BACKGROUND");
frame.scrollFrame.ScrollBarTop:SetPoint("TOPRIGHT", 6, 2);
frame.scrollFrame.ScrollBarTop:SetTexture ([[Interface\PaperDollInfoFrame\UI-Character-ScrollBar]]);
frame.scrollFrame.ScrollBarTop:SetSize(31, 256);
frame.scrollFrame.ScrollBarTop:SetTexCoord(0, 0.484375, 0, 1);

frame.scrollFrame.ScrollBarBottom = frame.scrollFrame:CreateTexture(nil, "BACKGROUND");
frame.scrollFrame.ScrollBarBottom:SetPoint("BOTTOMRIGHT", 6, -2);
frame.scrollFrame.ScrollBarBottom:SetTexture ([[Interface\PaperDollInfoFrame\UI-Character-ScrollBar]]);
frame.scrollFrame.ScrollBarBottom:SetSize(31, 106);
frame.scrollFrame.ScrollBarBottom:SetTexCoord(0.515625, 1, 0, 0.4140625);

frame.scrollFrame.ScrollBarMiddle = frame.scrollFrame:CreateTexture(nil, "BACKGROUND");
frame.scrollFrame.ScrollBarMiddle:SetPoint("BOTTOM", frame.scrollFrame.ScrollBarBottom, "TOP", 0, 0);
frame.scrollFrame.ScrollBarMiddle:SetPoint("TOP", frame.scrollFrame.ScrollBarTop, "BOTTOM", 0, 0);
frame.scrollFrame.ScrollBarMiddle:SetTexture ([[Interface\PaperDollInfoFrame\UI-Character-ScrollBar]]);
frame.scrollFrame.ScrollBarMiddle:SetSize(31, 60);
frame.scrollFrame.ScrollBarMiddle:SetTexCoord(0, 0.484375, 0.75, 1);

frame.scrollFrame:SetClipsChildren(true);

--- Make a basic content frame
-- @param name The object name
-- @param title The title to show
local function MakeSubFrame(title)
    local sframe = CreateFrame("Frame", nil, frame.Inset);
    sframe:SetPoint("TOPLEFT", 0, 0);
    sframe:SetPoint("BOTTOMRIGHT", 0, 0);
    sframe:Hide();
    sframe.title = sframe:CreateFontString(nil, "OVERLAY", "GameFontNormalMed2");
    sframe.title:SetPoint("TOPLEFT", 20, -15);
    sframe.title:SetPoint("TOPRIGHT", -20, -15);
    sframe.title:SetText(title);
    return sframe;
end

--- Make an editbox
-- @param parent The parent frame
-- @param maxLen Maxmimum input length
-- @param height (optional)
-- @param isMultiline (optional)
local function MakeEditBox(parent, maxLen, height, isMultiline)
    local edit = CreateFrame("EditBox", nil, parent);
    edit:SetMaxLetters(maxLen);
    edit:SetAutoFocus(false);
    if height then
        edit:SetHeight(height);
    end
    edit:SetFontObject("GameFontWhite");
    edit:SetJustifyH("LEFT");
    edit:SetJustifyV("CENTER");
    edit:SetTextInsets(7,7,7,7);
    edit:SetBackdrop({
        bgFile = [[Interface\Buttons\WHITE8x8]],
        edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]],
        edgeSize = 14,
        insets = {left = 3, right = 3, top = 3, bottom = 3},
    });
    edit:SetBackdropColor(0, 0, 0);
    edit:SetBackdropBorderColor(0.3, 0.3, 0.3);
    if isMultiline then
        edit:SetSpacing(3);
        edit:SetMultiLine(true);
    end
    edit:SetScript("OnEnterPressed", function(self) self:ClearFocus(); end);
    edit:SetScript("OnEscapePressed", function(self) self:ClearFocus(); end);
    edit:SetScript("OnEditFocusLost", function(self) EditBox_ClearHighlight(self); end);

    return edit;
end

-- Subframe with add form
do
    local addFrame = MakeSubFrame(L["UI_ADDFORM_TITLE"]);
    addFrame.searchLabel = addFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal");
    addFrame.searchLabel:SetPoint("TOPLEFT", addFrame.title, "BOTTOMLEFT", 0, -16);
    addFrame.searchLabel:SetPoint("TOPRIGHT", addFrame.title, "BOTTOMRIGHT", 0, -16);
    addFrame.searchLabel:SetText(L["UI_ADDFORM_NAME"]);
    addFrame.searchLabel:SetJustifyH("LEFT");
    addFrame.searchEdit = MakeEditBox(addFrame, 40, 27, false);
    addFrame.searchEdit:SetPoint("TOPLEFT", addFrame.searchLabel, "BOTTOMLEFT", 0, -4);
    addFrame.searchEdit:SetPoint("TOPRIGHT", addFrame.searchLabel, "BOTTOMRIGHT", 0, -4);
    addFrame.okbutton = CreateFrame("Button", nil, addFrame, "OptionsButtonTemplate");
    addFrame.okbutton:SetText(L["UI_ADDFORM_ADD_BUTTON"]);
    addFrame.okbutton:SetPoint("TOPLEFT", addFrame.searchEdit, "BOTTOMLEFT", 0, -10);
    addFrame.okbutton:SetWidth(125);
    addFrame.backbutton = CreateFrame("Button", nil, addFrame, "OptionsButtonTemplate");
    addFrame.backbutton:SetText(L["UI_BACK"]);
    addFrame.backbutton:SetPoint("TOPRIGHT", addFrame.searchEdit, "BOTTOMRIGHT", 0, -10);
    addFrame.backbutton:SetWidth(75);
    frame.addFrame = addFrame;
end

-- Subframe with edit form
do
    local editFrame = MakeSubFrame(L["UI_EDITFORM_TITLE"]);
    editFrame.searchLabel = editFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal");
    editFrame.searchLabel:SetPoint("TOPLEFT", editFrame.title, "BOTTOMLEFT", 0, -16);
    editFrame.searchLabel:SetPoint("TOPRIGHT", editFrame.title, "BOTTOMRIGHT", 0, -16);
    editFrame.searchLabel:SetText(L["UI_ADDFORM_NAME"]);
    editFrame.searchLabel:SetJustifyH("LEFT");
    editFrame.searchEdit = MakeEditBox(editFrame, 40, 27, false);
    editFrame.searchEdit:SetPoint("TOPLEFT", editFrame.searchLabel, "BOTTOMLEFT", 0, -4);
    editFrame.searchEdit:SetPoint("TOPRIGHT", editFrame.searchLabel, "BOTTOMRIGHT", 0, -4);
    editFrame.okbutton = CreateFrame("Button", nil, editFrame, "OptionsButtonTemplate");
    editFrame.okbutton:SetText(L["UI_EDITFORM_CONFIRM_BUTTON"]);
    editFrame.okbutton:SetPoint("TOPLEFT", editFrame.searchEdit, "BOTTOMLEFT", 0, -10);
    editFrame.okbutton:SetWidth(125);
    editFrame.backbutton = CreateFrame("Button", nil, editFrame, "OptionsButtonTemplate");
    editFrame.backbutton:SetText(L["UI_BACK"]);
    editFrame.backbutton:SetPoint("TOPRIGHT", editFrame.searchEdit, "BOTTOMRIGHT", 0, -10);
    editFrame.backbutton:SetWidth(75);
    frame.editFrame = editFrame;
end

-- Subframe with delete all form
do
    local deleteAllFrame = MakeSubFrame(L["UI_RMALL_TITLE"]);
    deleteAllFrame.desc = deleteAllFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal");
    deleteAllFrame.desc:SetPoint("TOPLEFT", deleteAllFrame.title, "BOTTOMLEFT", 0, -16);
    deleteAllFrame.desc:SetPoint("TOPRIGHT", deleteAllFrame.title, "BOTTOMRIGHT", 0, -16);
    deleteAllFrame.desc:SetText(L["UI_RMALL_DESC"]);
    deleteAllFrame.desc:SetJustifyH("LEFT");
    deleteAllFrame.desc:SetJustifyV("CENTER");
    deleteAllFrame.okbutton = CreateFrame("Button", nil, deleteAllFrame, "OptionsButtonTemplate");
    deleteAllFrame.okbutton:SetText(L["UI_RMALL_REMOVE"]);
    deleteAllFrame.okbutton:SetPoint("TOPLEFT", deleteAllFrame.desc, "BOTTOMLEFT", 0, -10);
    deleteAllFrame.okbutton:SetWidth(125);
    deleteAllFrame.backbutton = CreateFrame("Button", nil, deleteAllFrame, "OptionsButtonTemplate");
    deleteAllFrame.backbutton:SetText(L["UI_CANCEL"]);
    deleteAllFrame.backbutton:SetPoint("TOPRIGHT", deleteAllFrame.desc, "BOTTOMRIGHT", 0, -10);
    deleteAllFrame.backbutton:SetWidth(75);
    frame.deleteAllFrame = deleteAllFrame;
end

----------------------------------------------------------------------------------------------------------------
-- List items for scroll frame
----------------------------------------------------------------------------------------------------------------

frame.scrollFrame.items = {};

--- Toggle the list item on/off
local function ToggleItem(self)
    if _addon:ToggleEntry(self:GetParent().searchString:GetText()) then
        self:SetNormalTexture([[Interface\AddOns\CChatNotifier\img\on]]);
        self:SetHighlightTexture([[Interface\AddOns\CChatNotifier\img\on]]);
        self:GetParent():SetBackdropColor(0.2,0.2,0.2,0.8);
        self:GetParent().searchString:SetTextColor(1, 1, 1, 1);
    else
        self:SetNormalTexture([[Interface\AddOns\CChatNotifier\img\off]]);
        self:SetHighlightTexture([[Interface\AddOns\CChatNotifier\img\off]]);
        self:GetParent():SetBackdropColor(0.2,0.2,0.2,0.4);
        self:GetParent().searchString:SetTextColor(0.5, 0.5, 0.5, 1);
    end
end

--- Remove the list item
local function RemoveItem(self)
    _addon:RemoveFromList(self:GetParent().searchString:GetText());
end

for i = 1, MAX_ITEMS, 1 do	
    local item = CreateFrame("Button", nil, frame.scrollFrame);
    
	item:SetHeight(LIST_ITEM_HEIGHT);
    item:SetPoint("TOPLEFT", 0, -LIST_ITEM_HEIGHT * (i-1));
    item:SetPoint("TOPRIGHT", -23, -LIST_ITEM_HEIGHT * (i-1));
    item:SetBackdrop({bgFile = [[Interface\AddOns\CChatNotifier\img\bar]]});
    item:SetBackdropColor(0.2,0.2,0.2,0.8);
	
	item.searchString = item:CreateFontString(nil, "OVERLAY", "GameFontHighlight");
    item.searchString:SetPoint("LEFT", 10, 0);
    item.searchString:SetPoint("RIGHT", -70, 0);
    item.searchString:SetHeight(10);
    item.searchString:SetJustifyH("LEFT");
    
	item.delb = CreateFrame("Button", nil, item);
	item.delb:SetWidth(12);
	item.delb:SetHeight(12);
	item.delb:SetPoint("RIGHT", item, "RIGHT", -10, 0);
	item.delb:SetNormalTexture([[Interface\AddOns\CChatNotifier\img\iclose]]);
	item.delb:SetHighlightTexture([[Interface\AddOns\CChatNotifier\img\iclose]]);
    item.delb:SetScript("OnClick", RemoveItem);

    item.disb = CreateFrame("Button", nil, item);
	item.disb:SetWidth(12);
	item.disb:SetHeight(12);
	item.disb:SetPoint("RIGHT", item.delb, "LEFT", -10, 0);
	item.disb:SetNormalTexture([[Interface\AddOns\CChatNotifier\img\on]]);
	item.disb:SetHighlightTexture([[Interface\AddOns\CChatNotifier\img\on]]);
    item.disb:SetScript("OnClick", ToggleItem);

---- { Add search item edit button
    item.edit = CreateFrame("Button", nil, item)
    item.edit:SetWidth(15);
    item.edit:SetHeight(15);
    item.edit:SetPoint("RIGHT", item.disb, "LEFT", -10, 0)
    item.edit:SetNormalTexture([[Interface\AddOns\CChatNotifier\img\pencil.tga]])
    item.edit:SetHighlightTexture([[Interface\AddOns\CChatNotifier\img\pencil.tga]])
    item.edit:SetScript("OnClick", function(self)
        frame.editFrame.searchEdit:SetText(item.searchString:GetText())
        frame:ShowContent("EDIT")
    end)
---- hk }
    
	frame.scrollFrame.items[i] = item;
end


----------------------------------------------------------------------------------------------------------------
-- Frame functions
----------------------------------------------------------------------------------------------------------------

--- Switch displayed content
-- @param name Which frame to show, "LIST", "ADD", "RM" , "RMALL", "RMOTHER", defaults to "LIST"
function frame:ShowContent(name)
    if name == "ADD" then
        self.deleteAllFrame:Hide();
        self.scrollFrame:Hide();
        self.addFrame:Show();
        self.editFrame:Hide();
        return;
    end

    if name == "RM" then
        self.addFrame:Hide();
        self.scrollFrame:Hide();
        self.deleteAllFrame:Show();
        self.editFrame:Hide();
        return;
    end
    
    if name == "EDIT" then
        self.addFrame:Hide();
        self.scrollFrame:Hide();
        self.deleteAllFrame:Hide();
        self.editFrame:Show();
        return;
    end


    self.deleteAllFrame:Hide();
    self.addFrame:Hide();
    self.scrollFrame:Show();
    self.editFrame:Hide();
end

--- Update to current addon state
function frame:UpdateAddonState()
    if CChatNotifier_settings.isActive then
        self.toggleBtn:SetNormalTexture([[Interface\AddOns\CChatNotifier\img\on]]);
        self.toggleBtn:SetHighlightTexture([[Interface\AddOns\CChatNotifier\img\on]]);
        self.portrait:SetTexture([[Interface\AddOns\CChatNotifier\img\logo]]);
        self.TitleText:SetTextColor(1, 0.82, 0, 1);
    else
        self.toggleBtn:SetNormalTexture([[Interface\AddOns\CChatNotifier\img\off]]);
        self.toggleBtn:SetHighlightTexture([[Interface\AddOns\CChatNotifier\img\off]]);
        self.portrait:SetTexture([[Interface\AddOns\CChatNotifier\img\logoo]]);
        self.TitleText:SetTextColor(1, 0, 0, 1);
    end
end
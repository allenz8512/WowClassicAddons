-- 覆盖UIParent参数
UIPanelWindows["TradeSkillFrame"] =	{ area = "left", pushable = 3, xoffset = -16, yoffset = 12,	bottomClampOverride = 140+12, width = 722, height = 424, whileDead = 1 };

-- 扩大TradeSkillFrame窗口
TradeSkillFrame:SetWidth(722);
-- 重新设置TradeSkillListScrollFrame
TradeSkillListScrollFrame:SetHeight(306);
TradeSkillListScrollFrame:ClearAllPoints();
TradeSkillListScrollFrame:SetPoint("TOPLEFT", TradeSkillFrame, "TOPLEFT", 21, -96);
-- 重新设置TradeSkillDetailScrollFrame
TradeSkillDetailScrollFrame:SetHeight(306);
TradeSkillDetailScrollFrame:ClearAllPoints();
TradeSkillDetailScrollFrame:SetPoint("TOPRIGHT", TradeSkillFrame, "TOPRIGHT", -67, -96);
-- 重新设置TradeSkillCancelButton
TradeSkillCancelButton:ClearAllPoints();
TradeSkillCancelButton:SetPoint("TOPLEFT", TradeSkillFrame, "TOPLEFT", 600, -411);

-- 创建更多的TradeSkillSkillButtonTemplate
local oldTradeSkillsDisplayed = TRADE_SKILLS_DISPLAYED;
TRADE_SKILLS_DISPLAYED = TRADE_SKILLS_DISPLAYED + 11;

for i = oldTradeSkillsDisplayed + 1, TRADE_SKILLS_DISPLAYED do
    local button = CreateFrame("Button", "TradeSkillSkill" .. i, TradeSkillFrame, "TradeSkillSkillButtonTemplate");
    button:SetID(i);
    button:Hide();
    button:ClearAllPoints();
    button:SetPoint("TOPLEFT", getglobal("TradeSkillSkill" .. (i-1)), "BOTTOMLEFT", 0, 0);
end

-- 修改贴图
local regions = { TradeSkillFrame:GetRegions() }

for _, region in ipairs(regions) do
    if (region:IsObjectType("Texture")) then
        local texturefile = region:GetTexture();
        if texturefile == [[Interface\ClassTrainerFrame\UI-ClassTrainer-HorizontalBar]] then
            region:SetTexture(nil);
        end
    end
end
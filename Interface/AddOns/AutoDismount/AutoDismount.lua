AUTO_DISMOUNT_FORM_CANCEL = true;

SLASH_AUTODISMOUNTFORM1 = "/autodismountform";
SlashCmdList["AUTODISMOUNTFORM"] = function(msg)
    if (AUTO_DISMOUNT_FORM_CANCEL) then
        AUTO_DISMOUNT_FORM_CANCEL = false;
        print("auto dismount form disabled");
    else
        AUTO_DISMOUNT_FORM_CANCEL = true;
        print("auto dismount form enabled");
    end
end

local ErrorsToCheckFor = {
    SPELL_FAILED_NOT_SHAPESHIFT,
    SPELL_FAILED_NO_ITEMS_WHILE_SHAPESHIFTED,
    SPELL_NOT_SHAPESHIFTED,
    SPELL_NOT_SHAPESHIFTED_NOSPACE,
    ERR_CANT_INTERACT_SHAPESHIFTED,
    ERR_NOT_WHILE_SHAPESHIFTED,
    ERR_NO_ITEMS_WHILE_SHAPESHIFTED,
    ERR_TAXIPLAYERSHAPESHIFTED,
    ERR_MOUNT_SHAPESHIFTED,
    ERR_EMBLEMERROR_NOTABARDGEOSET,
    SPELL_FAILED_NOT_MOUNTED,
    ERR_ATTACK_MOUNTED,
    ERR_NOT_WHILE_MOUNTED
};

local BuffsToCheckFor = {
    132276, -- bear form
    132115, -- cat form
    132144, -- travel form
    132112, -- aquatic form
    136095, -- spirit wolf
};

local TOTAL_BUFFS = 40;

function TryAndDismount(msg, self)
    if (msg and tContains(ErrorsToCheckFor, msg)) then
        Dismount();
        for i = 1, TOTAL_BUFFS do
            local _, currBuffTex = UnitBuff("player", i);
            if (currBuffTex) then
                if (tContains(BuffsToCheckFor, currBuffTex)) then
                    if (not InCombatLockdown() and AUTO_DISMOUNT_FORM_CANCEL) then
                        local uiScale, x, y = UIParent:GetEffectiveScale(), GetCursorPosition()
                        AutoDismountFormCancel:SetPoint("BOTTOMLEFT", x / uiScale - 64, y / uiScale - 64);
                        AutoDismountFormCancel:Show();
                    end
                    return;
                end
            end
        end
    end
end


---------------------
-- Start the addon --
---------------------

-- Intialise our fonts
MTSLUI_FONTS:Initialise()

-- Initialise our event handler
MTSLUI_EVENT_HANDLER:Initialise()

-- Add slash command for addon & use eventhandler to handle it
SLASH_MTSL1 = "/mtsl"
function SlashCmdList.MTSL (msg, editbox)
    -- Only execute if addon is fully loaded
    if MTSLUI_EVENT_HANDLER:IsAddonLoaded() then
        MTSLUI_EVENT_HANDLER:SLASH_COMMAND(msg)
    else
        print(MTSLUI_FONTS.COLORS.TEXT.ERROR .. "MTSL: Addon dit not load correclty!")
    end
end

------------------------------------------------------------------
-- Name: EventHandler								  			--
-- Description: handles all the UI events needed for the addon 	--
------------------------------------------------------------------

MTSLUI_EVENT_HANDLER = {
	-- flags keeping track if window is open or not
	ui_trade_open = 0,
	ui_craft_open = 0,
    addon_loaded = 0,

	---------------------------------------------------------------------------------------
	-- Event started when our addon is fully loaded
	---------------------------------------------------------------------------------------
	PLAYER_LOGIN = function (self)
		if MTSL_TOOLS:CheckIfDataIsValid() then
			if MTSLUI_TOOLS:SetAddonLocale() then
				-- print loaded message if possible
				if MTSLUI_SAVED_VARIABLES:GetShowWelcomeMessage() == 1 then
					print(MTSLUI_FONTS.COLORS.TEXT.TITLE .. MTSLUI_ADDON.NAME .. MTSLUI_FONTS.COLORS.TEXT.NORMAL .. " (by " .. MTSLUI_ADDON.AUTHOR .. ")" .. MTSLUI_FONTS.COLORS.TEXT.TITLE .. " v" .. MTSLUI_ADDON.VERSION .. " loaded!")
				end
				-- load the data for the player
				MTSL_LOGIC_PLAYER_NPC:LoadPlayer()
				-- update the counters for amount of skills in current phase
				-- MTSL_TOOLS_DEVELOPER:CountData()
				-- Try to load the saved variables
				MTSLUI_SAVED_VARIABLES:Initialise()
				-- make the data for dropdowns in sort frames
				MTSLUI_FILTER_FRAME:InitialiseData()
				-- Initialise all the frames now we know we can use the addon
				-- Create the toggle button (shown on tradeskill/craft window)
				MTSLUI_TOGGLE_BUTTON:Initialise()
				-- Create the MTSL window expanding tradeskill/craft window)
				MTSLUI_MISSING_TRADESKILLS_FRAME:Initialise()
				-- Create char window acountwide (Disabled for now)
				MTSLUI_ACCOUNT_EXPLORER_FRAME:Initialise()
				-- Create database explorer window
				MTSLUI_DATABASE_EXPLORER_FRAME:Initialise()
				-- Create the options menu
				MTSLUI_OPTIONS_MENU_FRAME:Initialise()
				-- Load the saved variables for UI
                MTSLUI_SAVED_VARIABLES:LoadSavedUIScales()
				MTSLUI_SAVED_VARIABLES:LoadSavedSplitModes()
				self.addon_loaded = 1
			else
				print(MTSLUI_FONTS.COLORS.TEXT.ERROR .. "MTSL: Your locale " .. GetLocale() .. " is not supported!")
				self.addon_loaded = 0
			end
		else
			print(MTSLUI_FONTS.COLORS.TEXT.ERROR .. "MTSL: Data for addon coult not load. Please reinstall addon!")
			self.addon_loaded = 0
		end
	end,
	
	---------------------------------------------------------------------------------------
	-- Event started when a crafting window is closed
	---------------------------------------------------------------------------------------
	CRAFT_CLOSE = function (self)
		self.ui_craft_open = 0
		-- if we have a tradeskill window open, reanchor togglebutton and refresh frame
		if self.ui_trade_open > 0 then
			self:TRADE_SKILL_SHOW()
			self:TRADE_SKILL_UPDATE()
		-- no other window was open so close the addon
		else
			MTSLUI_TOGGLE_BUTTON:Hide()
			MTSLUI_MISSING_TRADESKILLS_FRAME:Hide()
		end
	end,
	
	---------------------------------------------------------------------------------------
	-- Event started when a crafting window is opened
	---------------------------------------------------------------------------------------
	CRAFT_SHOW = function (self)
        -- Check if we effectively opened a CraftFrame
		if CraftFrame then
			-- make it drageable
			MTSLUI_TOOLS:AddDragToFrame(CraftFrame)
			local localised_profession_name, current_skill_level = GetCraftDisplaySkillLine()
			--Get the English name of the profession
			local profession_name = MTSLUI_LOCALES_PROFESSIONS[MTSLUI_CURRENT_LANGUAGE][localised_profession_name]
			-- There are other craftframes like (Beast Training) so we only want enchanting
			if profession_name ~= nil and profession_name == "Enchanting" then
				self:SwapToProfession(profession_name, current_skill_level)
				MTSLUI_MISSING_TRADESKILLS_FRAME:RefreshUI()
			end
		end
	end,
	
	---------------------------------------------------------------------------------------
	-- Event started when a crafting window is updated
	---------------------------------------------------------------------------------------
	CRAFT_UPDATE = function (self)
		-- only trigger update event if we have the window opened
		local localised_name, current_skill_level = GetCraftDisplaySkillLine()
		local profession_name = MTSLUI_LOCALES_PROFESSIONS[MTSLUI_CURRENT_LANGUAGE][localised_name]
		-- only trigger event if its a different but supported tradeskill in addon
		if CraftFrame and profession_name == "Enchanting" then
			self:RefreshSkills(profession_name, current_skill_level)
		end
	end,
		
	---------------------------------------------------------------------------------------
	-- Event started when a skill point is gained or unlearned a profession
	---------------------------------------------------------------------------------------
	SKILL_LINES_CHANGED = function (self)
		-- Check if we unlearned a profession (only possbile if SkillFrame is shown and active
		if SkillFrame and SkillFrame:IsVisible() then
			MTSL_TOOLS:CheckProfessions()
		end
	end,
	
	---------------------------------------------------------------------------------------
	-- Event started when a trade skill windows is closed
	---------------------------------------------------------------------------------------
	TRADE_SKILL_CLOSE = function (self)
		self.ui_trade_open = 0
		-- if we have a tradeskill window open, reanchor togglebutton and refresh frame
		if self.ui_craft_open > 0 then
			self:CRAFT_SHOW()
			self:CRAFT_UPDATE()
		-- no other window was open so close the addon
		else
			MTSLUI_TOGGLE_BUTTON:Hide()
			MTSLUI_MISSING_TRADESKILLS_FRAME:Hide()
		end
	end,
	
	---------------------------------------------------------------------------------------
	-- Event started when a trade skill windows is opened
	---------------------------------------------------------------------------------------
	TRADE_SKILL_SHOW = function (self)
		-- check if we are allowed to swap (this skips poisons)
		if TradeSkillFrame then
			-- make it drageable
			MTSLUI_TOOLS:AddDragToFrame(TradeSkillFrame)
			local localised_name, current_skill_level = GetTradeSkillLine()
			local profession_name = MTSLUI_LOCALES_PROFESSIONS[MTSLUI_CURRENT_LANGUAGE][localised_name]
			-- only trigger event if its a trade_skill supported by the addon
			if profession_name ~= nil and profession_name ~= "Poisons" then
				self:SwapToProfession(profession_name, current_skill_level)
				MTSLUI_MISSING_TRADESKILLS_FRAME:RefreshUI()
			end
		end
	end,

	---------------------------------------------------------------------------------------
	-- Event started when a trade skill windows is updated
	---------------------------------------------------------------------------------------
	TRADE_SKILL_UPDATE = function (self)
		-- only trigger update event if we have the window opened
		local localised_name, current_skill_level = GetTradeSkillLine()
		local profession_name = MTSLUI_LOCALES_PROFESSIONS[MTSLUI_CURRENT_LANGUAGE][localised_name]
		-- only trigger event if its a different but supported tradeskill in addon
		if TradeSkillFrame and profession_name ~= nil and profession_name ~= "Poisons" then
			self:RefreshSkills(profession_name, current_skill_level)
		end
	end,

	---------------------------------------------------------------------------------------
	-- Refresh the list of missing skills for the current player an de UI f needed
	--
	-- @profession_name			String			The name of the profession
	-- @current_skill_level		Number			The number of the current level of skill of the current player for the profession
	---------------------------------------------------------------------------------------
	RefreshSkills = function(self, profession_name, current_skill_level)
		-- save the current amount of missing skills
		local amount_missing_skills = MTSL_CURRENT_PLAYER.TRADESKILLS[profession_name].AMOUNT_MISSING
		-- trigger the show event to refresh the missing list
		MTSL_LOGIC_PLAYER_NPC:UpdateMissingSkillsForProfessionCurrentPlayer(profession_name, current_skill_level)
		-- only refresh the ui if we the amount missing is lower
		if amount_missing_skills > MTSL_CURRENT_PLAYER.TRADESKILLS[profession_name].AMOUNT_MISSING then
			-- Only refresh the UI if we succesfully updated the skillinfo (this ignores the update with any unsupported profession)
			MTSLUI_MISSING_TRADESKILLS_FRAME:RefreshUI()
		end
	end,
	
	---------------------------------------------------------------------------------------
	-- Event started when a skill is learned from trainer
	---------------------------------------------------------------------------------------
	TRAINER_UPDATE = function (self)
		-- only possible react if we have a craft or tradeskill open
		if self.ui_craft_open > 0 or self.ui_trade_open > 0 then
			-- Check if we have a trainer window open
			if ClassTrainerFrame and ClassTrainerFrame:IsVisible() and ClassTrainerFrame.selectedService ~= nil then
				-- get the name of the profession for the current opened trainer
				local opened_trainer = GetTrainerServiceSkillLine(ClassTrainerFrame.selectedService)
				local localised_profession_name = MTSLUI_LOCALES_PROFESSIONS[MTSLUI_CURRENT_LANGUAGE][opened_trainer]
				-- only update if current profession is the opened MTSL one
				-- both can be open at same time, but only refresh if its the active one as well
				if self.ui_craft_open > 0 and MTSLUI_MISSING_TRADESKILLS_FRAME:GetCurrentProfessionName() == localised_profession_name then
					self:CRAFT_UPDATE()
				elseif self.ui_trade_open > 0 and MTSLUI_MISSING_TRADESKILLS_FRAME:GetCurrentProfessionName() == localised_profession_name then
					self:TRADE_SKILL_UPDATE()
				end
			end
		end
	end,

	---------------------------------------------------------------------------------------
	-- Handles a slash command for this addon
	--
	-- @msg:			string		The argument for the slash command
	---------------------------------------------------------------------------------------
    SLASH_COMMAND = function (self, msg)
		if msg == "acc" or msg == "account" then
			-- only execute if not yet shown
			if not MTSLUI_ACCOUNT_EXPLORER_FRAME:IsShown() then
				MTSLUI_ACCOUNT_EXPLORER_FRAME:Show()
				MTSLUI_ACCOUNT_EXPLORER_FRAME:RefreshUI()
			end
		elseif msg == "db" or msg == "database" then
			MTSLUI_DATABASE_EXPLORER_FRAME:Show()
		elseif msg == "about" then
            MTSLUI_TOOLS:PrintAboutMessage()
		elseif msg == nil or msg == "" or msg == "options" or msg == "config" then
			MTSLUI_OPTIONS_MENU_FRAME:Show()
		-- Not a known parameter or "help"
		else
            MTSLUI_TOOLS:PrintHelpMessage()
		end
    end,

	---------------------------------------------------------------------------------------
	-- Initialise the handler and hook all events
	---------------------------------------------------------------------------------------
	Initialise = function (self)
		-- Create an "empty" frame to hook onto
		local event_frame = CreateFrame("FRAME")
		-- Set function how to react on event
		event_frame:SetScript("OnEvent", function(eventframe, event, arg1)
            -- only execute the event if the addon is loaded OR the event = player_login
            if self.addon_loaded == 1 or event == "PLAYER_LOGIN" then
                self[event](self)
            end
		end)
		-- Event thrown when player has logged in
		event_frame:RegisterEvent("PLAYER_LOGIN")
		-- Events for crafts (= Enchanting)
		event_frame:RegisterEvent("CRAFT_CLOSE")
		event_frame:RegisterEvent("CRAFT_SHOW")
		event_frame:RegisterEvent("CRAFT_UPDATE")
		-- Gained a skill point
		event_frame:RegisterEvent("SKILL_LINES_CHANGED")
		-- Events for trade skills (= all but enchanting)
		event_frame:RegisterEvent("TRADE_SKILL_CLOSE")
		event_frame:RegisterEvent("TRADE_SKILL_SHOW")
		event_frame:RegisterEvent("TRADE_SKILL_UPDATE")
		-- Learned Skill from trainer
		event_frame:RegisterEvent("TRAINER_UPDATE")
	end,

	---------------------------------------------------------------------------------------
	-- Get loadstatus of addon
	--
	-- returns		Boolean		Flag indicating if addon is loaded
	---------------------------------------------------------------------------------------
	IsAddonLoaded = function (self)
		return self.addon_loaded == 1
	end,

	---------------------------------------------------------------------------------------
	-- Swap to Craft or Tradeskill mode
	--
	-- @profession_name         String      The name of the profession to scan
	-- @current_skill_level     Number      The number of the current skill level of the player
	---------------------------------------------------------------------------------------
	SwapToProfession = function(self, profession_name, current_skill_level)
		if profession_name == "Enchanting" then
			self.ui_craft_open = 1
			MTSLUI_TOGGLE_BUTTON:SwapToCraftMode()
		else
			self.ui_trade_open = 1
			MTSLUI_TOGGLE_BUTTON:SwapToTradeSkillMode()
		end
		MTSLUI_TOGGLE_BUTTON:Show()
		-- Update the missing skills for the current player
		MTSL_LOGIC_PLAYER_NPC:UpdateMissingSkillsForProfessionCurrentPlayer(profession_name, current_skill_level)
		MTSLUI_MISSING_TRADESKILLS_FRAME:SetCurrentProfessionDetails(profession_name, current_skill_level, MTSL_CURRENT_PLAYER.XP_LEVEL)
		MTSLUI_MISSING_TRADESKILLS_FRAME:NoSkillSelected()
	end,
}
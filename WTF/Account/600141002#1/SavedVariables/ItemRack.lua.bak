
ItemRackSettings = {
	["HideOOC"] = "OFF",
	["Cooldown90"] = "OFF",
	["ShowMinimap"] = "ON",
	["Notify"] = "ON",
	["HideTradables"] = "OFF",
	["AllowHidden"] = "ON",
	["AllowEmpty"] = "ON",
	["NotifyChatAlso"] = "OFF",
	["MinimapTooltip"] = "ON",
	["MenuOnShift"] = "OFF",
	["TrinketMenuMode"] = "OFF",
	["EventsVersion"] = 15,
	["HidePetBattle"] = "ON",
	["CharacterSheetMenus"] = "ON",
	["DisableAltClick"] = "OFF",
	["IconPos"] = -2.97466013819977,
	["MenuOnRight"] = "OFF",
	["TooltipFollow"] = "OFF",
	["NotifyThirty"] = "OFF",
	["ShowHotKeys"] = "OFF",
	["ShowTooltips"] = "ON",
	["EquipToggle"] = "OFF",
	["AnotherOther"] = "OFF",
	["CooldownCount"] = "OFF",
	["EquipOnSetPick"] = "OFF",
	["LargeNumbers"] = "OFF",
	["SquareMinimap"] = "OFF",
	["TinyTooltips"] = "OFF",
}
ItemRackItems = {
	["12846"] = {
		["keep"] = 1,
	},
	["13209"] = {
		["keep"] = 1,
	},
	["25653"] = {
		["keep"] = 1,
	},
	["11122"] = {
		["keep"] = 1,
	},
	["19812"] = {
		["keep"] = 1,
	},
}
ItemRackEvents = {
	["Mounted"] = {
		["Unequip"] = 1,
		["Type"] = "Buff",
		["Anymount"] = 1,
	},
	["Warrior Berserker"] = {
		["Type"] = "Stance",
		["Stance"] = 3,
	},
	["Shaman Ghostwolf"] = {
		["Unequip"] = 1,
		["Type"] = "Stance",
		["Stance"] = 1,
	},
	["After Cast"] = {
		["Trigger"] = "UNIT_SPELLCAST_SUCCEEDED",
		["Type"] = "Script",
		["Script"] = "local spell = \"Name of spell\"\nlocal set = \"Name of set\"\nif arg1==\"player\" and arg2==spell then\n  EquipSet(set)\nend\n\n--[[This event will equip \"Name of set\" when \"Name of spell\" has finished casting.  Change the names for your own use.]]",
	},
	["City"] = {
		["Unequip"] = 1,
		["Type"] = "Zone",
		["Zones"] = {
			["Undercity"] = 1,
			["The Exodar"] = 1,
			["Stormwind City"] = 1,
			["Darnassus"] = 1,
			["Silvermoon City"] = 1,
			["Shattrath City"] = 1,
			["Ironforge"] = 1,
			["Dalaran"] = 1,
			["Thunder Bluff"] = 1,
			["Orgrimmar"] = 1,
		},
	},
	["Rogue Stealth"] = {
		["Unequip"] = 1,
		["Type"] = "Stance",
		["Stance"] = 1,
	},
	["Druid Bear"] = {
		["Type"] = "Stance",
		["Stance"] = 1,
	},
	["Drinking"] = {
		["Unequip"] = 1,
		["Type"] = "Buff",
		["Buff"] = "Drink",
	},
	["Druid Tree of Life"] = {
		["Type"] = "Stance",
		["Stance"] = "Tree of Life",
	},
	["Warrior Battle"] = {
		["Type"] = "Stance",
		["Stance"] = 1,
	},
	["Druid Humanoid"] = {
		["Type"] = "Stance",
		["Stance"] = 0,
	},
	["Druid Aquatic"] = {
		["Type"] = "Stance",
		["Stance"] = 2,
	},
	["Druid Cat"] = {
		["Type"] = "Stance",
		["Stance"] = 3,
	},
	["PVP"] = {
		["Unequip"] = 1,
		["Type"] = "Zone",
		["Zones"] = {
			["Eye of the Storm"] = 1,
			["Arathi Basin"] = 1,
			["Alterac Valley"] = 1,
			["Warsong Gulch"] = 1,
			["Blade's Edge Arena"] = 1,
			["Ruins of Lordaeron"] = 1,
			["Nagrand Arena"] = 1,
		},
	},
	["Warrior Defensive"] = {
		["Type"] = "Stance",
		["Stance"] = 2,
	},
	["Swimming"] = {
		["Trigger"] = "MIRROR_TIMER_START",
		["Type"] = "Script",
		["Script"] = "local set = \"Name of set\"\nif IsSwimming() and not IsSetEquipped(set) then\n  EquipSet(set)\n  if not SwimmingEvent then\n    function SwimmingEvent()\n      if not IsSwimming() then\n        ItemRack.StopTimer(\"SwimmingEvent\")\n        UnequipSet(set)\n      end\n    end\n    ItemRack.CreateTimer(\"SwimmingEvent\",SwimmingEvent,.5,1)\n  end\n  ItemRack.StartTimer(\"SwimmingEvent\")\nend\n--[[Equips a set when swimming and breath gauge appears and unequips soon after you stop swimming.]]",
	},
	["Dual Spec"] = {
		["Trigger"] = "ACTIVE_TALENT_GROUP_CHANGED",
		["Type"] = "Script",
		["Script"] = "local set1 = \"Name of Set1\"\nlocal set2 = \"Name of Set2\"\nif ItemRack.HasTitansGrip and GetInventoryItemLink(\"player\",17) then\n  local b,s = ItemRack.FindSpace()\n  if b then\n    ItemRack.MoveItem(17,nil,b,s)\n  end\nend\nlocal at = GetActiveSpecGroup()\nif at == 1 then\n  ItemRack.EquipSet(set1)\nelseif at == 2 then\n  ItemRack.EquipSet(set2)\nend\n\n--[[This event will equip \"Name of Set1\" when you switch to primary talents and \"Name of Set2\" when switching to secondary talents. Edit the names for your own use.]]",
	},
	["Druid Travel"] = {
		["Type"] = "Stance",
		["Stance"] = 4,
	},
	["Priest Shadowform"] = {
		["Unequip"] = 1,
		["Type"] = "Stance",
		["Stance"] = 1,
	},
	["Druid Flight Form"] = {
		["Unequip"] = 1,
		["Type"] = "Stance",
		["Stance"] = "Flight Form",
	},
	["Druid Swift Flight Form"] = {
		["Unequip"] = 1,
		["Type"] = "Stance",
		["Stance"] = "Swift Flight Form",
	},
	["Evocation"] = {
		["Unequip"] = 1,
		["Type"] = "Buff",
		["Buff"] = "Evocation",
	},
	["Buffs Gained"] = {
		["Trigger"] = "UNIT_AURA",
		["Type"] = "Script",
		["Script"] = "if arg1==\"player\" then\n  IRScriptBuffs = IRScriptBuffs or {}\n  local buffs = IRScriptBuffs\n  for i in pairs(buffs) do\n    if not AuraUtil.FindAuraByName(i,\"player\") then\n      buffs[i] = nil\n    end\n  end\n  local i,b = 1,1\n  while b do\n    b = AuraUtil.FindAuraByName(i,\"player\")\n    if b and not buffs[b] then\n      ItemRack.Print(\"Gained buff: \"..b)\n      buffs[b] = 1\n    end\n    i = i+1\n  end\nend\n--[[For script demonstration purposes. Doesn't equip anything just informs when a buff is gained.]]",
	},
	["Druid Moonkin"] = {
		["Type"] = "Stance",
		["Stance"] = "Moonkin Form",
	},
}

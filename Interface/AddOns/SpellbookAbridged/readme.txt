Title: SpellBook Abridged for WoW Classic
Author: LBXZero (lightning_bug_x@yahoo.com)
Version: 2.3
Supports WoW Classic Version 1.13.2

Info and Description:
With the return of Vanilla World of Warcraft comes the return of learning spells by rank.
For warriors and rogues, this is not much of a problem as the newer rank of the ability/spell
replaces the old one, because everything is the same except the effect power.  But for all 
classes that use mana, the spellbook gets filled with pages of the multitude of ranks for 
each spell.

After some time of playing a mage, I made an addon during Burning Crusade to condense the
spellbook and display the ranks in a different way.

This version is more minimal than my original version.  I made the filter and modified a few
functions in SpellBookFrame.lua to adapt the base Spellbook to accept a custom spell list.
For this addon, it filters the spellbook to the last rank of each unique spell.  To view the
lower ranks, I added a check button "Rank Filter" that you can toggle to switch between the
filtered list and the full list.

Installation:
To install this addon, just copy the folder "SpellBookAbridged" from this zip file into the
Interface\Addons folder for WoW Classic.

Configuration:
There are no special options to configure.  You just have the "Rank Filter" check button in the 
Spellbook to toggle.

The Rank Filter Button can be dragged to a different location by press and holding "Control + Right Mouse Button".

To reset the Rank Filter Button to its home location, use slash command "/sba".


Other Notes:
This does not filter the Pet Spell List for Hunters.  I haven't played with Hunters enough to determine necessity.

The current reason I kept this minimal is to reduce conflicts and complexities of adapting to 
other addons that affect SpellBookFrame.


Version 2.3:

	-	Added the ability to relocate the Rank Filter Button
	-	Fixed compatibility issue with the addon "Clique"

Version 2.2:
	
	-	Fixed the issue where spells cannot be cast directly from the Spellbook
	-	Fixed another design oversight where Addons can call spell tab information before the addon completes loading

Version 2.1:

	-	Changed when the Spell List is generated to ensure it is made before the Spellbook 
		updates.
	-	Fixed a design oversight that prevented Addons that used the unused spell tabs from
		properly working.
		
Version 2.0:

	-	Addon made
	-	Functions in default WoW UI that are modified:
		SpellBookFrame.lua
			SpellBookFrame_Update (Hooked and appended)
			SpellButton_UpdateButton	(Replaced)
			SpellBook_GetCurrentPage	(Replaced)
			SpellBook_GetSpellBookSlot	(Replaced)
			SpellBookFrame_UpdateSkillLineTabs	(Replaced)
			SpellBook_UpdatePlayerTab	(Replaced)
			SpellBookFrame_OpenToPageForSlot	(Replaced)
		v2.2	SpellButton_OnClick		(Blocked)

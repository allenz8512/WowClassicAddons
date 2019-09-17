local L = LibStub("AceLocale-3.0"):NewLocale("RecipeRadarClassic", "deDE", false)
if not L then return end

   -- the name of the addon!
L["Recipe Radar Classic"] = "Recipe Radar Classic"

L["Left-click to open RecipeRadar."] = "Linksklick öffnet RecipeRadar"
L["Right-click and drag to move this button."] = "Den Button mit Rechtsklick verschieben"

   -- these show up in the game's Key Bindings screen
L["Recipe Radar Bindings"] = "Recipe Radar Tastenbelegung"
L["Toggle Recipe Radar"] = "Recipe Radar umschalten"

   -- options button and corresponding options frame
L["Options"] = "Optionen"
L["Auto-map Contributive Vendors"] = "Erlernbare Rezepte Automatisch Markieren"
L["Auto-select Current Region"] = "Automatisch aktuelle Zone wählen"
L["Check Availability for Alts"] = "Verwendbarkeit für Alts prüfen"
L["Minimap Button Position"] = "Position des Minimap-Button"
L["Show Minimap Button"] = "Minimap-Button anzeigen"

   -- format strings used in the map tooltips
L["1 recipe"] = "1 Rezept"
L["%d learnable"] = "%d lernbar"
L["%d recipes"] = "%d Rezepte"

   -- this appears when the recipe is not in your local database
L["Uncached Recipe"] = "Rezept nicht im Cache"

   -- uncached recipe tooltip - see RecipeRadar_Availability_CreateTooltip()
L["You may mouse over the"] = "Bewege die Maus über das Symbol"
L["icon to lookup this recipe."] = "um dieses Rezept nachzuschlagen."
L["Warning: if your server has"] = "Warnung: wenn der Server dieses"
L["not yet seen this item, you"] = "Rezept noch nicht gesehen hat"
L["will be disconnected!"] = "wird die Verbindung getrennt!"

   -- some regions don't have any recipes for sale
L["No recipes for sale in this region."] = "Keine Rezepte zum Verkauf in dieser Region."

   -- radio button (and tooltip) that indicates a mapped vendor
L["Locate Vendor on Map"] = "Händler auf Karte zeigen"
L["Shift-click a vendor to add or remove her location on the world map."] = "Shift-Klicke einen Händler, um seine Position auf der Weltkarte und Minikarte hinzuzufügen oder zu entfernen."

   -- strings in the faction filtering dropdown; we don't need 'Horde' or 'Alliance' because Blizzard provides them for us
L["Factions"] = "Parteien"
L["Neutral"] = "Neutral"

   -- profession filtering dropdown - these strings must match those returned by GetTradeSkillLine() and GetCraftDisplaySkillLine()
L["Professions"] = "Berufe"
L["Alchemy"] = "Alchimie"
L["Blacksmithing"] = "Schmiedekunst"
L["Cooking"] = "Kochkunst"
L["Enchanting"] = "Verzauberkunst"
L["Engineering"] = "Ingenieurskunst"
L["First Aid"] = "Erste Hilfe"
L["Fishing"] = "Angeln"
L["Herbalism"] = "Kräuterkunde"
L["Leatherworking"] = "Lederverarbeitung"
L["Mining"] = "Bergbau"
L["Poisons"] = "Gifte"
L["Skinning"] = "Kürschnerei"
L["Tailoring"] = "Schneiderei"

   -- strings in the availability filtering dropdown
L["Availability"] = "Verwendbarkeit"
L["Already Known (Alts)"] = "Bereits bekannt (Alts)"
L["Already Known (Player)"] = "Bereits bekannt (Spieler)"
L["Available Now (Alts)"] = "Vorhanden jetzt (Alts)"
L["Available Now (Player)"] = "Vorhanden jetzt (Spieler)"
L["Future Prospect (Alts)"] = "Zukünftige Aussicht (Alts)"
L["Future Prospect (Player)"] = "Zukünftige Aussicht (Spieler)"
L["Inapplicable"] = "Nicht anwendbar"

   -- headings for the availability tooltip
L["Available For:"] = "Vorhanden für:"
L["Already Known By:"] = "Bereits bekannt für:"
L["Future Prospect For:"] = "Zukünftige Aussicht für:"

   -- format string for rank indicator for future prospects; that is, it tells you how soon you can learn the recipe - eg. "163 of 175"
L["%d of %d"] = "%d von %d"

   -- special notes for vendor requirements follow vendor names (eg. "Seasonal Vendor")
L["%s Vendor"] = "%s Händler"
L["Intermittent"] = "Zeitweiliger"
L["Quest"] = "Quest"
L["Roving"] = "Wandernder"
L["Seasonal"] = "Saisonaler"

   -- other recipe requirements
L["Rogue Only"] = "Nur Schurke"
L["%s Only"] = "Nur %s"
L["Rogue"] = "Schurke"
L["Special"] = "Speziell"

   -- menu item in the right-click context menu for mapped vendor buttons
L["Unmap Vendor"] = "Händler von Karte entfernen"
L["Collapse"] = "Einklappen"
L["Collapse All"] = "Alle einklappen"
L["Expand"] = "Ausklappen"
L["Expand All"] = "Alle ausklappen"
L["Map Vendor"] = "Händler auf Karte anzeigen"

   -- trade skill specialties
L["Gnomish Engineer"] = "Gnomen-Ingenieur"
L["Armorsmith"] = "Rüstungsschmied"
L["Dragonscale Leatherworking"] = "Drachenschuppenlederverarbeitung"
L["Elemental Leatherworking"] = "Elementarlederverarbeitung"
L["Goblin Engineer"] = "Goblin-Ingenieur"
L["Master Axesmith"] = "Axtschmiedemeister"
L["Master Hammersmith"] = "Hammerschmiedemeister"
L["Master Swordsmith"] = "Schwertschmiedemeister"
L["Tribal Leatherworking"] = "Stammeslederverarbeitung"
L["Weaponsmith"] = "Waffenschmied"

   -- continent names for alternate region selection
L["Kalimdor"] = true
L["Eastern Kingdoms"] = "Östliche Königreiche"
L["Instances"] = "Instanzen"

   -- instance names for selection
L["Gnomeregan"] = true
L["Wailing Caverns"] = "Höhlen des Wehklagens"
L["Blackrock Depths"] = "Blackrocktiefen"
L["Dire Maul"] = "Düsterbruch"
L["Naxxramas"] = true

   -- some vendor names may need translating
L["Abigail Shiel"] = true
L["Aendel Windspear"] = true
L["Alchemist Pestlezugg"] = "Alchimist Pestlezugg"
L["Alexandra Bolero"] = true
L["Algernon"] = true
L["Amy Davenport"] = true
L["Andrew Hilbert"] = true
L["Androd Fadran"] = true
L["Argent Quartermaster Hasana"] = "Argentumrüstmeister Hasana"
L["Argent Quartermaster Lightspark"] = "Argentumrüstmeister Funkellicht"
L["Balai Lok'Wein"] = true
L["Bale"] = true
L["Banalash"] = true
L["Blimo Gadgetspring"] = true
L["Blixrez Goodstitch"] = true
L["Blizrik Buckshot"] = true
L["Bliztik"] = true
L["Bombus Finespindle"] = true
L["Borya"] = true
L["Brienna Starglow"] = true
L["Bro'kin"] = true
L["Bronk"] = true
L["Catherine Leland"] = true
L["Christoph Jeffcoat"] = true
L["Clyde Ranthal"] = true
L["Constance Brisboise"] = true
L["Corporal Bluth"] = true
L["Cowardly Crosby"] = "Feiger Crosby"
L["Crazk Sparks"] = true
L["Dalria"] = true
L["Daniel Bartlett"] = true
L["Danielle Zipstitch"] = true
L["Darian Singh"] = true
L["Darnall"] = true
L["Defias Profiteer"] = "Schieber der Defias"
L["Deneb Walker"] = true
L["Derak Nightfall"] = true
L["Dirge Quikcleave"] = true
L["Drac Roughcut"] = true
L["Drake Lindgren"] = true
L["Drovnar Strongbrew"] = true
L["Elynna"] = true
L["Emrul Riknussun"] = true
L["Erika Tate"] = true
L["Evie Whirlbrew"] = true
L["Fradd Swiftgear"] = true
L["Fyldan"] = true
L["Gagsprocket"] = true
L["Gearcutter Cogspinner"] = true
L["George Candarte"] = true
L["Gharash"] = true
L["Ghok'kah"] = true
L["Gigget Zipcoil"] = true
L["Gikkix"] = true
L["Gina MacGregor"] = true
L["Gloria Femmel"] = true
L["Glyx Brewright"] = true
L["Gnaz Blunderflame"] = true
L["Gretta Ganter"] = true
L["Grimtak"] = true
L["Hagrus"] = true
L["Hammon Karwn"] = true
L["Harggan"] = true
L["Harklan Moongrove"] = true
L["Harlown Darkweave"] = true
L["Harn Longcast"] = true
L["Heldan Galesong"] = true
L["Helenia Olden"] = true
L["Himmik"] = true
L["Hula'mahi"] = true
L["Jabbey"] = true
L["Jandia"] = true
L["Janet Hommers"] = true
L["Jangdor Swiftstrider"] = true
L["Jannos Ironwill"] = true
L["Jaquilina Dramet"] = true
L["Jase Farlane"] = true
L["Jazzrik"] = true
L["Jeeda"] = true
L["Jennabink Powerseam"] = true
L["Jessara Cordell"] = true
L["Jinky Twizzlefixxit"] = true
L["Joseph Moore"] = true
L["Jubie Gadgetspring"] = true
L["Jun'ha"] = true
L["Jutak"] = true
L["Kaita Deepforge"] = true
L["Kalldan Felmoon"] = true
L["Kania"] = true
L["Keena"] = true
L["Kelsey Yance"] = true
L["Kendor Kabonka"] = true
L["Khara Deepwater"] = true
L["Khole Jinglepocket"] = true
L["Kiknikle"] = true
L["Killian Sanatha"] = true
L["Kilxx"] = true
L["Kireena"] = true
L["Kithas"] = true
L["Knaz Blunderflame"] = true
L["Kor'geld"] = true
L["Kriggon Talsone"] = true
L["Krinkle Goodsteel"] = true
L["Kulwia"] = true
L["Kzixx"] = true
L["Laird"] = true
L["Lardan"] = true
L["Leo Sarn"] = true
L["Leonard Porter"] = true
L["Lilly"] = true
L["Lindea Rabonne"] = true
L["Lizbeth Cromwell"] = true
L["Logannas"] = true
L["Lokhtos Darkbargainer"] = true
L["Lorelae Wintersong"] = true
L["Magnus Frostwake"] = true
L["Mahu"] = true
L["Mallen Swain"] = true
L["Malygen"] = true
L["Maria Lumere"] = true
L["Martine Tramblay"] = true
L["Masat T'andr"] = true
L["Master Craftsman Omarion"] = "Meisterhandwerker Omarion"
L["Mavralyn"] = true
L["Mazk Snipeshot"] = true
L["Meilosh"] = true
L["Micha Yance"] = true
L["Millie Gregorian"] = true
L["Mishta"] = true
L["Montarr"] = true
L["Muuran"] = true
L["Mythrin'dir"] = true
L["Naal Mistrunner"] = true
L["Namdo Bizzfizzle"] = true
L["Nandar Branson"] = true
L["Nardstrum Copperpinch"] = true
L["Narj Deepslice"] = true
L["Narkk"] = true
L["Nata Dawnstrider"] = true
L["Nergal"] = true
L["Nerrist"] = true
L["Nessa Shadowsong"] = true
L["Nina Lightbrew"] = true
L["Nioma"] = true
L["Nyoma"] = true
L["Ogg'marr"] = true
L["Old Man Heming"] = true
L["Otho Moji'ko"] = true
L["Outfitter Eric"] = "Ausstatter Eric"
L["Penney Copperpinch"] = true
L["Plugger Spazzring"] = true
L["Pratt McGrubben"] = true
L["Qia"] = true
L["Quartermaster Miranda Breechlock"] = "Rüstmeisterin Miranda Knackschloss"
L["Ranik"] = true
L["Rann Flamespinner"] = true
L["Rartar"] = true
L["Rikqiz"] = true
L["Rin'wosho the Trader"] = "Rin'wosho der Händler"
L["Rizz Loosebolt"] = true
L["Ronald Burch"] = true
L["Ruppo Zipcoil"] = true
L["Saenorion"] = true
L["Seersa Copperpinch"] = true
L["Sewa Mistrunner"] = true
L["Shandrina"] = true
L["Shankys"] = true
L["Sheendra Tallgrass"] = true
L["Shen'dralar Provisioner"] = "Versorger der Shen'dralar"
L["Sheri Zipstitch"] = true
L["Smudge Thunderwood"] = true
L["Soolie Berryfizz"] = true
L["Sovik"] = true
L["Stuart Fleming"] = true
L["Sumi"] = true
L["Super-Seller 680"] = "Superverkaufomat 680"
L["Tamar"] = true
L["Tansy Puddlefizz"] = true
L["Tarban Hearthgrain"] = true
L["Tari'qa"] = true
L["Thaddeus Webb"] = true
L["Tharynn Bouden"] = true
L["Tilli Thistlefuzz"] = true
L["Truk Wildbeard"] = true
L["Tunkk"] = true
L["Ulthaan"] = true
L["Ulthir"] = true
L["Uthok"] = true
L["Vaean"] = true
L["Valdaron"] = true
L["Vargus"] = true
L["Veenix"] = true
L["Vendor-Tron 1000"] = "Kaufotron 1000"
L["Vharr"] = true
L["Vivianna"] = true
L["Vizzklick"] = true
L["Wenna Silkbeard"] = true
L["Werg Thickblade"] = true
L["Wik'Tar"] = true
L["Worb Strongstitch"] = true
L["Wrahk"] = true
L["Wulan"] = true
L["Wulmort Jinglepocket"] = true
L["Wunna Darkmane"] = true
L["Xandar Goodbeard"] = true
L["Xen'to"] = true
L["Xizk Goodstitch"] = true
L["Xizzer Fizzbolt"] = true
L["Yonada"] = true
L["Yuka Screwspigot"] = true
L["Zan Shivsproket"] = true
L["Zannok Hidepiercer"] = true
L["Zansoa"] = true
L["Zarena Cromwind"] = true
L["Zargh"] = true
L["Zixil"] = true
L["Zorbin Fandazzle"] = true

local L = LibStub("AceLocale-3.0"):NewLocale("RecipeRadarClassic", "frFR", false)
if not L then return end

   -- the name of the addon!
L["Recipe Radar Classic"] = true

L["Left-click to open RecipeRadar."] = "Clic gauche pour ouvrir Recipe Radar."
L["Right-click and drag to move this button."] = "Faites un clic droit et faites glisser pour déplacer ce bouton."

   -- these show up in the game's Key Bindings screen
L["Recipe Radar Bindings"] = "Attaches De Recipe Radar"
L["Toggle Recipe Radar"] = "Recipe Radar À bascule"

   -- options button and corresponding options frame
L["Options"] = "Les options"
L["Auto-map Contributive Vendors"] = "Recettes Disponibles d'affichage"
L["Auto-select Current Region"] = "Sélection automatique de la région courante"
L["Check Availability for Alts"] = "Examinez la disponibilité pour les alts"
L["Minimap Button Position"] = "Position du bouton sur la Minimap"
L["Show Minimap Button"] = "Montrez le Bouton sur la Minimap"

   -- format strings used in the map tooltips
L["1 recipe"] = "1 recette"
L["%d learnable"] = "%d utilisables"
L["%d recipes"] = "%d recettes"

   -- this appears when the recipe is not in your local database
L["Uncached Recipe"] = "Recette Non présente"

   -- uncached recipe tooltip - see RecipeRadar_Availability_CreateTooltip()
L["You may mouse over the"] = "Vous devez passer la souris sur l'icône pour"
L["icon to lookup this recipe."] = "ajouter cette recette à votre base de donnèe."
L["Warning: if your server has"] = "Avertissement: si votre serveur n'a"
L["not yet seen this item, you"] = "pas encore vu cet article, vous serez"
L["will be disconnected!"] = "déconnecté!"

   -- some regions don't have any recipes for sale
L["No recipes for sale in this region."] = "Aucune recette à vendre dans cette région."

   -- radio button (and tooltip) that indicates a mapped vendor
L["Locate Vendor on Map"] = "Localiser le marchand"
L["Shift-click a vendor to add or remove her location on the world map."] = "Shift-clic sur un marchand pour  ajouter ou enlever sa position sur la carte du monde."

   -- strings in the faction filtering dropdown; we don't need 'Horde' or 'Alliance' because Blizzard provides them for us
L["Factions"] = true
L["Neutral"] = "Neutre"

   -- profession filtering dropdown - these strings must match those returned by GetTradeSkillLine() and GetCraftDisplaySkillLine()
L["Professions"] = "Métiers"
L["Alchemy"] = "Alchimie"
L["Blacksmithing"] = "Forge"
L["Cooking"] = "Cuisine"
L["Enchanting"] = "Enchantement"
L["Engineering"] = "Ingénierie"
L["First Aid"] = "Secourisme"
L["Fishing"] = "Pêche"
L["Herbalism"] = "Herboristerie"
L["Leatherworking"] = "Travail du cuir"
L["Mining"] = "Minage"
L["Poisons"] = true
L["Skinning"] = "Dépeçage"
L["Tailoring"] = "Couture"

   -- strings in the availability filtering dropdown
L["Availability"] = "Disponibilité"
L["Already Known (Alts)"] = "Déjà Connu (Alts)"
L["Already Known (Player)"] = "Déjà Connu (Joueur)"
L["Available Now (Alts)"] = "Disponible Maintenant (Alts)"
L["Available Now (Player)"] = "Disponible Maintenant (Joueur) "
L["Future Prospect (Alts)"] = "Bientôt disponible (Alts)"
L["Future Prospect (Player)"] = "Bientôt disponible (Joueur)"
L["Inapplicable"] = "Innaplicable"

   -- headings for the availability tooltip
L["Available For:"] = "Disponible Pour:"
L["Already Known By:"] = "Déjà Connu Par:"
L["Future Prospect For:"] = "Bientôt disponible pour:"

   -- format string for rank indicator for future prospects; that is, it tells you how soon you can learn the recipe - eg. "163 of 175"
L["%d of %d"] = "%d de %d"

   -- special notes for vendor requirements follow vendor names (eg. "Seasonal Vendor")
L["%s Vendor"] = "%s Marchand"
L["Intermittent"] = true
L["Quest"] = "Quête"
L["Roving"] = "Boudinage"
L["Seasonal"] = "Saisonnier"

   -- other recipe requirements
L["Rogue Only"] = "Voleur Seulement"
L["%s Only"] = "%s Seulement"
L["Rogue"] = "Voleur"
L["Special"] = "Spécial"

   -- menu item in the right-click context menu for mapped vendor buttons
L["Unmap Vendor"] = "Enlevez Marchand"
L["Collapse"] = "Réduire"
L["Collapse All"] = "Réduire Tout"
L["Expand"] = "Etendre"
L["Expand All"] = "Etendre Tout"
L["Map Vendor"] = "Indique la position du marchand sur la carte"

   -- trade skill specialties
L["Gnomish Engineer"] = "Ingénieur gnome"
L["Armorsmith"] = "Fabricant d'armures"
L["Dragonscale Leatherworking"] = "Travail du cuir d'écailles de dragon"
L["Elemental Leatherworking"] = "Travail du cuir élémentaire"
L["Goblin Engineer"] = "Ingénieur gobelin"
L["Master Axesmith"] = "Maître fabricant de haches"
L["Master Hammersmith"] = "Maître Fabricant de marteaux"
L["Master Swordsmith"] = "Maître Fabricant d'épées"
L["Tribal Leatherworking"] = "Travail du cuir tribal"
L["Weaponsmith"] = "Fabricant d'armes"

   -- continent names for alternate region selection
L["Kalimdor"] = true
L["Eastern Kingdoms"] = "Royaumes de l'est"
L["Instances"] = true

   -- instance names for selection
L["Gnomeregan"] = true
L["Wailing Caverns"] = "Cavernes des lamentations"
L["Blackrock Depths"] = "Profondeurs de Blackrock"
L["Dire Maul"] = "Hache-tripes"
L["Naxxramas"] = true

   -- some vendor names may need translating
L["Abigail Shiel"] = true
L["Aendel Windspear"] = true
L["Alchemist Pestlezugg"] = "Alchimiste Pestlezugg"
L["Alexandra Bolero"] = true
L["Algernon"] = true
L["Amy Davenport"] = true
L["Andrew Hilbert"] = true
L["Androd Fadran"] = true
L["Argent Quartermaster Hasana"] = "Intendante de l'Aube d'argent Hasana"
L["Argent Quartermaster Lightspark"] = "Intendant de l'Aube d'argent Lightspark"
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
L["Corporal Bluth"] = "Caporal Bluth"
L["Cowardly Crosby"] = "Crosby la Trouille"
L["Crazk Sparks"] = true
L["Dalria"] = true
L["Daniel Bartlett"] = true
L["Danielle Zipstitch"] = true
L["Darian Singh"] = true
L["Darnall"] = true
L["Defias Profiteer"] = "Profiteur défias"
L["Deneb Walker"] = true
L["Derak Nightfall"] = "Derak Tombenuit"
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
L["Master Craftsman Omarion"] = "Maître-artisan Omarion"
L["Mavralyn"] = true
L["Mazk Snipeshot"] = "Tireur d’élite Mazk"
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
L["Old Man Heming"] = "Vieil Heming"
L["Otho Moji'ko"] = true
L["Outfitter Eric"] = "Eric le tailleur"
L["Penney Copperpinch"] = true
L["Plugger Spazzring"] = true
L["Pratt McGrubben"] = true
L["Qia"] = true
L["Quartermaster Miranda Breechlock"] = "Intendante Miranda Breechlock"
L["Ranik"] = true
L["Rann Flamespinner"] = true
L["Rartar"] = true
L["Rikqiz"] = true
L["Rin'wosho the Trader"] = "Rin'wosho le marchand"
L["Rizz Loosebolt"] = true
L["Ronald Burch"] = true
L["Ruppo Zipcoil"] = true
L["Saenorion"] = true
L["Seersa Copperpinch"] = true
L["Sewa Mistrunner"] = true
L["Shandrina"] = true
L["Shankys"] = true
L["Sheendra Tallgrass"] = true
L["Shen'dralar Provisioner"] = "Approvisionneur Shen'dralar"
L["Sheri Zipstitch"] = true
L["Smudge Thunderwood"] = true
L["Soolie Berryfizz"] = true
L["Sovik"] = true
L["Stuart Fleming"] = true
L["Sumi"] = true
L["Super-Seller 680"] = "Super-Vendeur 680"
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
L["Vendor-Tron 1000"] = "Vendeur-Tron 1000"
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

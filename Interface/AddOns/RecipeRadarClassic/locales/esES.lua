local L = LibStub("AceLocale-3.0"):NewLocale("RecipeRadarClassic", "esES", false)
if not L then return end

   -- the name of the addon!
L["Recipe Radar Classic"] = true

L["Left-click to open RecipeRadar."] = "Clic izquierdo para abrir Recipe Radar."
L["Right-click and drag to move this button."] = "Haga clic derecho y arrastre para mover este botón."

   -- these show up in the game's Key Bindings screen
L["Recipe Radar Bindings"] = "Fijaciones de Recipe Radar"
L["Toggle Recipe Radar"] = "Barra de Recipe Radar"

   -- options button and corresponding options frame
L["Options"] = "Opciones"
L["Auto-map Contributive Vendors"] = "Recetas Disponibles de la Exhibición"
L["Auto-select Current Region"] = "Auto-seleccionar la región actual"
L["Check Availability for Alts"] = "Comprobar la disponibilidad en Alts"
L["Minimap Button Position"] = "Posición del Icono"
L["Show Minimap Button"] = "Mostrar botón en el Minimapa"

   -- format strings used in the map tooltips
L["1 recipe"] = "1 receta"
L["%d learnable"] = "%d disponible"
L["%d recipes"] = "%d recetas"

   -- this appears when the recipe is not in your local database
L["Uncached Recipe"] = "Receta no descargada"

   -- uncached recipe tooltip - see RecipeRadar_Availability_CreateTooltip()
L["You may mouse over the"] = "Puede colocar el ratón sobre la icono"
L["icon to lookup this recipe."] = "para buscar la receta en el servidor."
L["Warning: if your server has"] = "Advertencia: ¡si tu servidor"
L["not yet seen this item, you"] = "todavía no dispone de este"
L["will be disconnected!"] = "artículo, te desconectarán!"

   -- some regions don't have any recipes for sale
L["No recipes for sale in this region."] = "No hay recetas para la venta en esta región."

   -- radio button (and tooltip) that indicates a mapped vendor
L["Locate Vendor on Map"] = "Localizar a Vendedor en Mapa"
L["Shift-click a vendor to add or remove her location on the world map."] = "Haz Shift+Click en un vendedor para agregar o quitar su localización en el mapa del mundo."

   -- strings in the faction filtering dropdown; we don't need 'Horde' or 'Alliance' because Blizzard provides them for us
L["Factions"] = "Bandos"
L["Neutral"] = true

   -- profession filtering dropdown - these strings must match those returned by GetTradeSkillLine() and GetCraftDisplaySkillLine()
L["Professions"] = "Profesiones"
L["Alchemy"] = "Alquimia"
L["Blacksmithing"] = "Herrería"
L["Cooking"] = "Cocina"
L["Enchanting"] = "Encantamiento"
L["Engineering"] = "Ingeniería"
L["First Aid"] = "Primeros auxilios"
L["Fishing"] = "Pesca"
L["Herbalism"] = "Botánica"
L["Leatherworking"] = "Peletería"
L["Mining"] = "Minería"
L["Poisons"] = "Venenos"
L["Skinning"] = "Desollar"
L["Tailoring"] = "Sastrería"

   -- strings in the availability filtering dropdown
L["Availability"] = "Disponibilidad"
L["Already Known (Alts)"] = "Ya conocido (Alts)"
L["Already Known (Player)"] = "Ya conocido (Jugador)"
L["Available Now (Alts)"] = "Disponible (Alts)"
L["Available Now (Player)"] = "Disponible (Jugador)"
L["Future Prospect (Alts)"] = "Perspectiva Futura (Alts)"
L["Future Prospect (Player)"] = "Perspectiva Futura (Jugador)"
L["Inapplicable"] = "Inaplicable"

   -- headings for the availability tooltip
L["Available For:"] = "Disponible para:"
L["Already Known By:"] = "Ya conocido por:"
L["Future Prospect For:"] = "Perspectiva futura para:"

   -- format string for rank indicator for future prospects; that is, it tells you how soon you can learn the recipe - eg. "163 of 175"
L["%d of %d"] = "%d de %d"

   -- special notes for vendor requirements follow vendor names (eg. "Seasonal Vendor")
L["%s Vendor"] = "%s Vendedor"
L["Intermittent"] = "Intermitente"
L["Quest"] = "Misión"
L["Roving"] = "Ambulante"
L["Seasonal"] = "Estacional"

   -- other recipe requirements
L["Rogue Only"] = "Pícaro Sólamente"
L["%s Only"] = "%s Sólamente"
L["Rogue"] = "Pícaro"
L["Special"] = "Especial"

   -- menu item in the right-click context menu for mapped vendor buttons
L["Unmap Vendor"] = "Quitar a vendedor"
L["Collapse"] = "Contraer"
L["Collapse All"] = "Contraer Todos"
L["Expand"] = "Ampliar"
L["Expand All"] = "Ampliar Todos"
L["Map Vendor"] = "Marcar a Vendedor"

   -- trade skill specialties
L["Gnomish Engineer"] = "Ingeniero gnomo"
L["Armorsmith"] = "Forjador de armaduras"
L["Dragonscale Leatherworking"] = "Peletería dragontina"
L["Elemental Leatherworking"] = "Peletería elemental"
L["Goblin Engineer"] = "Ingeniero goblin"
L["Master Axesmith"] = "Maestro forjador de hachas"
L["Master Hammersmith"] = "Maestro forjador de martillos"
L["Master Swordsmith"] = "Maestro invocador"
L["Tribal Leatherworking"] = "Peletería tribal"
L["Weaponsmith"] = "Forjador de armas"

   -- continent names for alternate region selection
L["Kalimdor"] = true
L["Eastern Kingdoms"] = "Reinos del Este"
L["Instances"] = "Instancias"

   -- instance names for selection
L["Gnomeregan"] = true
L["Wailing Caverns"] = "Cuevas de los Lamentos"
L["Blackrock Depths"] = "Profundidades de Roca Negra"
L["Dire Maul"] = "La Masacre"
L["Naxxramas"] = true

   -- some vendor names may need translating
L["Abigail Shiel"] = true
L["Aendel Windspear"] = "Aendel Lanzavento"
L["Alchemist Pestlezugg"] = "Alquimista Morterozugg"
L["Alexandra Bolero"] = true
L["Algernon"] = true
L["Amy Davenport"] = true
L["Andrew Hilbert"] = true
L["Androd Fadran"] = true
L["Argent Quartermaster Hasana"] = "Intendente Argenta Hasana"
L["Argent Quartermaster Lightspark"] = "Intendente Argenta Chispillo"
L["Balai Lok'Wein"] = true
L["Bale"] = "Fardo"
L["Banalash"] = true
L["Blimo Gadgetspring"] = "Blimo Cacharretio"
L["Blixrez Goodstitch"] = "Blixrez Cortefino"
L["Blizrik Buckshot"] = "Blizrik Machobala"
L["Bliztik"] = true
L["Bombus Finespindle"] = "Bombus Bueneje"
L["Borya"] = true
L["Brienna Starglow"] = "Brienna Brillaestrella"
L["Bro'kin"] = true
L["Bronk"] = true
L["Catherine Leland"] = true
L["Christoph Jeffcoat"] = true
L["Clyde Ranthal"] = true
L["Constance Brisboise"] = "Constanza Brisboise"
L["Corporal Bluth"] = "Cabo Bluth"
L["Cowardly Crosby"] = "Blandengue Crosby"
L["Crazk Sparks"] = "Craz Chispaz"
L["Dalria"] = true
L["Daniel Bartlett"] = true
L["Danielle Zipstitch"] = "Danielle Puntillas"
L["Darian Singh"] = true
L["Darnall"] = true
L["Defias Profiteer"] = "Especulador Defias"
L["Deneb Walker"] = "Deneb Camino"
L["Derak Nightfall"] = "Derak Ocaso"
L["Dirge Quikcleave"] = "Dirge Hojágil"
L["Drac Roughcut"] = "Drac Corteseco"
L["Drake Lindgren"] = "Draco Lindgren"
L["Drovnar Strongbrew"] = "Drovanar Brevaforte"
L["Elynna"] = true
L["Emrul Riknussun"] = true
L["Erika Tate"] = true
L["Evie Whirlbrew"] = "Evie Brebegira"
L["Fradd Swiftgear"] = "Fradd Cambioveloz"
L["Fyldan"] = true
L["Gagsprocket"] = "Dentolio"
L["Gearcutter Cogspinner"] = "Cortallave Volopiñón"
L["George Candarte"] = true
L["Gharash"] = true
L["Ghok'kah"] = true
L["Gigget Zipcoil"] = "Gigget Retramuelle"
L["Gikkix"] = true
L["Gina MacGregor"] = true
L["Gloria Femmel"] = true
L["Glyx Brewright"] = "Glyx Buenamezcla"
L["Gnaz Blunderflame"] = "Gnaz Flamerrada"
L["Gretta Ganter"] = true
L["Grimtak"] = true
L["Hagrus"] = true
L["Hammon Karwn"] = true
L["Harggan"] = true
L["Harklan Moongrove"] = "Harklan Arboluna"
L["Harlown Darkweave"] = "Harlown Tejeoscuro"
L["Harn Longcast"] = "Harn Tiralejo"
L["Heldan Galesong"] = "Heldan Sonmistral"
L["Helenia Olden"] = true
L["Himmik"] = true
L["Hula'mahi"] = true
L["Jabbey"] = true
L["Jandia"] = true
L["Janet Hommers"] = true
L["Jangdor Swiftstrider"] = "Jangdor Zanco Veloz"
L["Jannos Ironwill"] = "Jannos Dolocerado"
L["Jaquilina Dramet"] = true
L["Jase Farlane"] = true
L["Jazzrik"] = true
L["Jeeda"] = true
L["Jennabink Powerseam"] = "Jennabink Costura Potente"
L["Jessara Cordell"] = true
L["Jinky Twizzlefixxit"] = "Jinky Arreglatodo"
L["Joseph Moore"] = true
L["Jubie Gadgetspring"] = "Jubie Cacharretio"
L["Jun'ha"] = true
L["Jutak"] = true
L["Kaita Deepforge"] = "Kaita Forjahonda"
L["Kalldan Felmoon"] = "Kalldan Lunavil"
L["Kania"] = true
L["Keena"] = true
L["Kelsey Yance"] = true
L["Kendor Kabonka"] = true
L["Khara Deepwater"] = "Khara Aguahonda"
L["Khole Jinglepocket"] = "Khole Calderilla"
L["Kiknikle"] = true
L["Killian Sanatha"] = true
L["Kilxx"] = true
L["Kireena"] = true
L["Kithas"] = true
L["Knaz Blunderflame"] = "Knaz Flamerrada"
L["Kor'geld"] = true
L["Kriggon Talsone"] = true
L["Krinkle Goodsteel"] = "Krinkle Buenacero"
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
L["Lokhtos Darkbargainer"] = "Lokhtos Tratoscuro"
L["Lorelae Wintersong"] = "Lorelae Cantinvernal"
L["Magnus Frostwake"] = "Magnus Vespescarcha"
L["Mahu"] = true
L["Mallen Swain"] = true
L["Malygen"] = true
L["Maria Lumere"] = true
L["Martine Tramblay"] = true
L["Masat T'andr"] = true
L["Master Craftsman Omarion"] = "Maestro artesano Omarion"
L["Mavralyn"] = true
L["Mazk Snipeshot"] = "Mazk Tirocertero"
L["Meilosh"] = true
L["Micha Yance"] = true
L["Millie Gregorian"] = true
L["Mishta"] = true
L["Montarr"] = true
L["Muuran"] = true
L["Mythrin'dir"] = true
L["Naal Mistrunner"] = "Naal Correbruma"
L["Namdo Bizzfizzle"] = "Namdo Silvabín"
L["Nandar Branson"] = true
L["Nardstrum Copperpinch"] = "Nardstrum Cobrellizco"
L["Narj Deepslice"] = "Narj Tajofondo"
L["Narkk"] = true
L["Nata Dawnstrider"] = "Nata Caminalba"
L["Nergal"] = true
L["Nerrist"] = true
L["Nessa Shadowsong"] = "Nessa Cantosombrío"
L["Nina Lightbrew"] = "Nina Burbuluz"
L["Nioma"] = true
L["Nyoma"] = true
L["Ogg'marr"] = true
L["Old Man Heming"] = "Viejo Heming"
L["Otho Moji'ko"] = true
L["Outfitter Eric"] = "Confecciones Eric"
L["Penney Copperpinch"] = "Penney Cobrellizco"
L["Plugger Spazzring"] = "Plugger Aropatoso"
L["Pratt McGrubben"] = true
L["Qia"] = true
L["Quartermaster Miranda Breechlock"] = "Intendente Miranda Cerrobrecha"
L["Ranik"] = true
L["Rann Flamespinner"] = "Rann Flamejes"
L["Rartar"] = true
L["Rikqiz"] = true
L["Rin'wosho the Trader"] = "Rin'wosho el Comerciante"
L["Rizz Loosebolt"] = "Rizz Tornillosuelto"
L["Ronald Burch"] = true
L["Ruppo Zipcoil"] = "Rupo Retramuelle"
L["Saenorion"] = true
L["Seersa Copperpinch"] = "Seersa Cobrellizco"
L["Sewa Mistrunner"] = "Seua Correbruma"
L["Shandrina"] = true
L["Shankys"] = true
L["Sheendra Tallgrass"] = "Sheendra Pastoalto"
L["Shen'dralar Provisioner"] = "Proveedor Shen'dralar"
L["Sheri Zipstitch"] = "Sheri Puntagueta"
L["Smudge Thunderwood"] = "Borrón Truenedera"
L["Soolie Berryfizz"] = "Soolie Burbubaya"
L["Sovik"] = true
L["Stuart Fleming"] = true
L["Sumi"] = true
L["Super-Seller 680"] = "Supervendedor 680"
L["Tamar"] = true
L["Tansy Puddlefizz"] = "Tansy Burbajea"
L["Tarban Hearthgrain"] = "Tarban Granogar"
L["Tari'qa"] = true
L["Thaddeus Webb"] = true
L["Tharynn Bouden"] = true
L["Tilli Thistlefuzz"] = "Tilli Cardopelusa"
L["Truk Wildbeard"] = "Truk Barbaje"
L["Tunkk"] = true
L["Ulthaan"] = true
L["Ulthir"] = true
L["Uthok"] = true
L["Vaean"] = true
L["Valdaron"] = true
L["Vargus"] = true
L["Veenix"] = true
L["Vendor-Tron 1000"] = "Vende-Tron 1000"
L["Vharr"] = true
L["Vivianna"] = true
L["Vizzklick"] = true
L["Wenna Silkbeard"] = "Wenna Barbasedosa"
L["Werg Thickblade"] = "Werg Filo Grueso"
L["Wik'Tar"] = true
L["Worb Strongstitch"] = "Worb Puntofuerte"
L["Wrahk"] = true
L["Wulan"] = true
L["Wulmort Jinglepocket"] = "Wulmort Calderilla"
L["Wunna Darkmane"] = "Wunna Crinoscura"
L["Xandar Goodbeard"] = "Xandar Bonbarba"
L["Xen'to"] = true
L["Xizk Goodstitch"] = "Xizk Cortefino"
L["Xizzer Fizzbolt"] = "Xizzer Raybuja"
L["Yonada"] = true
L["Yuka Screwspigot"] = "Yuka Llavenrosca"
L["Zan Shivsproket"] = "Zan Chafadento"
L["Zannok Hidepiercer"] = "Zannok Perforapieles"
L["Zansoa"] = true
L["Zarena Cromwind"] = "Zarena Cromvento"
L["Zargh"] = true
L["Zixil"] = true
L["Zorbin Fandazzle"] = "Zorbin Hipnoviento"

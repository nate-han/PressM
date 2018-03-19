-- PressM AIO
-- All (under contruction) In One Tool script
-- By github/nate_han
-- Just Press "M" btw

function showNote(msg)

	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
	
end

function giveWeapon(who, what, amount)

	showNote("Giving: ~g~" .. amount .. " of ~r~" .. what)
	GiveWeaponToPed(who, GetHashKey(what), amount, false)
	
end

function setHealth(who, state)
	
	SetEntityInvincible(who, state)
	
	if state then
	
		showNote("Godmode: ~g~ON")
	
	else
	
		showNote("Godmode: ~r~OFF")
		
	end
	
end

function getCoords(who)

	local coords = GetEntityCoords(who, true)
	local x, y, z = table.unpack(coords)
	
	Citizen.Trace("LOCATION: " .. x .. " " .. y .. " " .. z)
	
	return x, y, z
	
end

function wantedLevel(who, level)

	SetPlayerWantedLevel(who, level, false)
	SetPlayerWantedLevelNow(who, false)

end

function spawnVeh(who, model)

	local x, y, z = getCoords(who)
	
		RequestModel(model)
	
	while not HasModelLoaded(model) do
	
		RequestModel(model)
		Citizen.Trace("Loading Model...")
		Citizen.Wait(0)
		
	end
	
	CreateVehicle(model, x + 4, y + 4, z + 2, 0.0, true, false)

end

Citizen.CreateThread(function()

	local pistols = {"WEAPON_APPISTOL", "WEAPON_COMBATPISTOL", "WEAPON_FLAREGUN", "WEAPON_HEAVYPISTOL", "WEAPON_MARKSMANPISTOL", "WEAPON_PISTOL", "WEAPON_PISTOL50", "WEAPON_REVOLVER", "WEAPON_SNSPISTOL", "WEAPON_STUNGUN", "WEAPON_VINTAGEPISTOL"}
	local smgs = {"WEAPON_ASSAULTSMG", "WEAPON_COMBATPDW", "WEAPON_MACHINEPISTOL", "WEAPON_MICROSMG", "WEAPON_MINISMG", "WEAPON_SMG"}
	local rifles = {"WEAPON_ASSAULTRIFLE", "WEAPON_CARBINERIFLE", "WEAPON_ADVANCEDRIFLE", "WEAPON_SPECIALCARBINE", "WEAPON_COMPACTRIFLE", "WEAPON_BULLPUPRIFLE", "WEAPON_MUSKET"}
	local machineGuns = {"WEAPON_MG", "WEAPON_COMBATMG", "WEAPON_GUSENBERG"}
	local shotguns = {"WEAPON_PUMPSHOTGUN", "WEAPON_SAWNOFFSHOTGUN", "WEAPON_ASSAULTSHOTGUN", "WEAPON_BULLPUPSHOTGUN", "WEAPON_HEAVYSHOTGUN", "WEAPON_DBSHOTGUN", "WEAPON_AUTOSHOTGUN"}
	local snipers = {"WEAPON_SNIPERRIFLE", "WEAPON_HEAVYSNIPER", "WEAPON_MARKSMANRIFLE"}
	local launchers = {"WEAPON_GRENADELAUNCHER", "WEAPON_RPG", "WEAPON_FIREWORK", "WEAPON_HOMINGLAUNCHER", "WEAPON_COMPACTLAUNCHER"}
	local thrown = {"WEAPON_GRENADE", "WEAPON_STICKYBOMB", "WEAPON_SMOKEGRENADE", "WEAPON_BZGAS", "WEAPON_MOLOTOV", "WEAPON_BALL", "WEAPON_FLARE", "WEAPON_PROXMINE", "WEAPON_PIPEBOMB", "WEAPON_SNOWBALL"}
	local melee = {"WEAPON_KNIFE", "WEAPON_NIGHTSTICK", "WEAPON_HAMMER", "WEAPON_BAT", "WEAPON_GOLFCLUB", "WEAPON_CROWBAR", "WEAPON_PETROLCAN", "WEAPON_FIREEXTINGUISHER", "WEAPON_BOTTLE", "WEAPON_DAGGER", "WEAPON_KNUCKLE", "WEAPON_SWITCHBLADE", "WEAPON_BATTLEAXE", "WEAPON_POOLCUE", "WEAPON_WRENCH"}
	local gadgets = {"GADGET_PARACHUTE", "GADGET_NIGHTVISION"}
	local op = {"WEAPON_MINIGUN", "WEAPON_RAILGUN"}
	
	local super = {"sultanrs", "banshee2", "fmj", "pfister811", "prototipo", "reaper", "tyrus", "sheava", "le7b", "turismor", "zentorno", "bullet", "cheetah", "entityxf", "infernus", "adder", "voltic", "vacca", "osiris", "t20"}
	local sports = {"verlierer2", "schafter3", "schafter4", "seven70", "bestiagts", "lynx", "omnis", "tropos", "tampa2", "raptor", "jester", "alpha",  "massacro",  "buffalo3",  "blista2",  "blista3",  "furoregt",  "kuruma",  "kuruma2",  "ninef",  "ninef2",  "banshee",  "buffalo",  "buffalo2",  "carbonizzare",  "comet2",  "coquette",  "elegy2",  "feltzer2",  "fusilade",  "futo",  "khamelion",  "penumbra",  "rapidgt",  "rapidgt2",  "schwarzer",  "sultan",  "surano"}
	local sedan = {"limo2", "schafter5", "schafter6", "cog55", "cog552", "cognoscenti", "cognoscenti2", "warrener", "glendale", "asea", "asea2", "asterope",  "emperor",  "emperor2",  "emperor3",  "fugitive",  "ingot",  "intruder",  "premier",  "primo",  "regina",  "romero",  "schafter2",  "stanier",  "stratum",  "superd",  "surge",  "tailgater",  "washington",  "stretch"}
	local muscle = {"nightshade", "blade", "dukes", "dukes2", "dominator2", "gauntlet2", "stalion", "stalion2", "slamvan2", "buccaneer", "hotknife", "dominator", "gauntlet", "phoenix", "picador", "ratloader", "ruiner", "sabregt", "voodoo2", "vigero", "virgo", "coquette3", "chino", "faction3", "sabregt2", "slamvan3", "virgo2", "virgo3"}
	local sportsClassic = {"mamba", "tornado6", "btype", "pigalle", "coquette2", "casco", "jb700", "manana", "monroe", "peyote", "stinger", "stingergt", "tornado", "tornado2", "tornado3", "tornado4", "ztype", "feltzer3", "tornado5"}
	local utility = {"tanker2", "boattrailer", "armytanker", "armytrailer", "armytrailer2", "freighttrailer", "airtug", "caddy", "caddy2", "docktug", "forklift", "mower", "proptrailer", "ripley", "sadler", "sadler2", "scrap", "tractor", "tractor2", "tractor3", "graintrailer", "baletrailer", "towtruck", "towtruck2", "utillitruck", "utillitruck2", "utillitruck3", "docktrailer", "trailers", "trailers2", "trailers3", "tvtrailer", "raketrailer", "tanker", "trailerlogs", "tr2", "tr3", "tr4", "trflat", "trailersmall"}
	local emergency = {"ambulance", "policet", "fbi", "fbi2", "firetruk", "lguard", "pbus", "police", "police4", "police2", "police3", "policeold1", "policeold2", "pranger", "riot", "sheriff", "sheriff2", "policeb"}
	local compact = {"brioso", "rhapsody", "panto", "blista", "dilettante", "dilettante2", "issi2", "prairie",}
	local service = {"brickade", "rallytruck", "trash2", "bus", "coach", "airbus", "rentalbus", "taxi", "trash", "tourbus"}
	local military = {"barracks3", "barracks", "barracks2", "crusader", "rhino"}
	local suv = {"baller3", "baller4", "baller5", "baller6", "xls", "xls2", "contender", "huntley", "baller", "baller2", "bjxl", "cavalcade", "cavalcade2", "gresley", "dubsta", "dubsta2", "fq2", "granger", "habanero", "landstalker", "mesa", "mesa2", "patriot", "radi",  "rocoto",  "seminole",  "serrano"}
	local commercial = {"mule3", "benson", "biff", "hauler", "mule", "mule2", "packer", "phantom", "pounder", "stockade", "stockade3"}
	local offRoad = {"trophytruck", "trophytruck2", "blazer4", "dubsta3", "monster", "marshall", "insurgent", "insurgent2", "technical", "bfinjection", "blazer", "blazer2", "blazer3", "bodhi2", "dune", "dune2", "dloader", "mesa3", "rancherxl", "rancherxl2", "rebel", "rebel2", "sandking", "sandking2", "brawler"}
	local van = {"rumpo3", "youga2", "boxville4", "gburrito2", "bison", "bison2", "bison3", "boxville", "boxville2", "boxville3", "bobcatxl", "burrito", "burrito2", "burrito3", "burrito4", "burrito5", "gburrito", "camper", "journey", "minivan", "pony", "pony2", "rumpo", "rumpo2", "speedo", "speedo2", "surfer", "surfer2", "taco", "youga", "minivan2"}
	local industrial = {"guardian", "bulldozer", "cutter", "dump", "rubble", "flatbed", "handler", "mixer", "mixer2", "tiptruck", "tiptruck2"}
	local helicopter = {"cargobob4", "supervolito", "supervolito2", "valkyrie2", "volatus", "swift", "savage", "valkyrie", "annihilator", "buzzard", "buzzard2", "cargobob", "cargobob2", "cargobob3", "skylift", "polmav", "maverick", "frogger", "frogger2", "swift2"}
	local plane = {"nimbus", "vestra", "miljet", "besra", "dodo", "blimp2", "velum2", "hydra", "velum2", "blimp", "cuban800", "duster", "stunt", "mammatus", "jet", "shamal", "luxor", "titan", "lazer", "cargoplane", "velum", "luxor2"}
	local motorcycle = {"gargoyle", "cliffhanger", "bf400", "faggio3", "faggio", "vortex", "avarus", "sanctus", "hakuchou2", "nightblade", "chimera", "esskey", "wolfsbane", "zombiea", "zombieb", "defiler", "daemon2", "ratbike", "shotaro", "manchez", "thrust", "sovereign", "innovation", "hakuchou", "enduro", "lectro", "sanchez", "sanchez2", "akuma", "carbonrs", "bagger", "bati", "bati2", "ruffian", "daemon", "double", "pcj", "vader", "faggio2", "hexer", "nemesis", "vindicator"}
	local rail = {"cablecar", "freightcar", "freight", "freightcont1", "freightcont2", "freightgrain", "tankercar", "metrotrain"}
	local coupe = {"windsor2", "cogcabrio", "exemplar", "f620", "felon", "felon2", "Jackal", "oracle", "oracle2", "sentinel", "sentinel2", "zion",  "zion2",  "windsor"}
	local cycle = {"scorcher", "tribike", "tribike2", "tribike3", "fixter", "cruiser", "BMX"}
	local boat = {"toro2", "seashark3", "dinghy4", "tropic2", "speeder2", "tug", "submersible2", "dinghy3", "squalo", "marquis", "dinghy", "dinghy2", "jetmax", "predator", "tropic", "seashark", "seashark2", "submersible", "suntrap", "toro"}
	
    WarMenu.CreateMenu('PressM', 'PressM')
	
	-- SET STATE
	WarMenu.CreateSubMenu('Invincibility', 'PressM', 'Set Invincibility')
	WarMenu.CreateSubMenu('Wanted', 'PressM', 'Set Wanted Level')
	
	--WEAPONS
	WarMenu.CreateSubMenu('Weapons', 'PressM', 'Choose Your Weapons')
	
	WarMenu.CreateSubMenu('Pistols', 'Weapons', 'Pistol List')
	WarMenu.CreateSubMenu('SMGs', 'Weapons', 'SMG List')
	WarMenu.CreateSubMenu('Rifles', 'Weapons', 'Rifle List')
	WarMenu.CreateSubMenu('Machine Guns', 'Weapons', 'Machine Guns List')
	WarMenu.CreateSubMenu('Shotguns', 'Weapons', 'Shotguns List')
	WarMenu.CreateSubMenu('Sniper Rifles', 'Weapons', 'Sniper Rifle List')
	WarMenu.CreateSubMenu('Launchers', 'Weapons', 'Launchers List')
	WarMenu.CreateSubMenu('Thrown', 'Weapons', 'Thrown List')
	WarMenu.CreateSubMenu('Melee', 'Weapons', 'Melee List')
	WarMenu.CreateSubMenu('Gadgets', 'Weapons', 'Gadgets List')
	WarMenu.CreateSubMenu('OP', 'Weapons', 'OP List')
	
	--VEHICLES
	WarMenu.CreateSubMenu('Vehicles', 'PressM', 'Choose Your Vehicles')
	
	WarMenu.CreateSubMenu('Super', 'Vehicles', 'Super List')
	WarMenu.CreateSubMenu('Sports', 'Vehicles', 'Sports List')
	WarMenu.CreateSubMenu('Sports Classic', 'Vehicles', 'Sports Classic List')
	WarMenu.CreateSubMenu('Muscle', 'Vehicles', 'Muscle List')
	WarMenu.CreateSubMenu('Sedan', 'Vehicles', 'Sedan List')
	WarMenu.CreateSubMenu('Utility', 'Vehicles', 'Utility List')
	WarMenu.CreateSubMenu('Emergency', 'Vehicles', 'Emergency List')
	WarMenu.CreateSubMenu('Compact', 'Vehicles', 'Compact List')
	WarMenu.CreateSubMenu('Service', 'Vehicles', 'Service List')
	WarMenu.CreateSubMenu('Military', 'Vehicles', 'Military List')
	WarMenu.CreateSubMenu('SUV', 'Vehicles', 'SUV List')
	WarMenu.CreateSubMenu('Commercial', 'Vehicles', 'Commercial List')
	WarMenu.CreateSubMenu('Off Road', 'Vehicles', 'Off Road List')
	WarMenu.CreateSubMenu('Van', 'Vehicles', 'Van List')
	WarMenu.CreateSubMenu('Industrial', 'Vehicles', 'Industrial List')
	WarMenu.CreateSubMenu('Plane', 'Vehicles', 'Plane List')
	WarMenu.CreateSubMenu('Helicopter', 'Vehicles', 'Helicopter List')
	WarMenu.CreateSubMenu('Motorcycle', 'Vehicles', 'Motorcycle List')
	WarMenu.CreateSubMenu('Rail', 'Vehicles', 'Rail List')
	WarMenu.CreateSubMenu('Coupe', 'Vehicles', 'Coupe List')
	WarMenu.CreateSubMenu('Cycle', 'Vehicles', 'Cycle List')
	WarMenu.CreateSubMenu('Boat', 'Vehicles', 'Boat List')
	
	while true do
	
		local target = PlayerPedId()
		local target2 = PlayerId()
	
		-- MAIN MENU
	
		if WarMenu.IsMenuOpened("PressM") then
		
			if WarMenu.MenuButton('Spawn Weapons', 'Weapons') then
			
			elseif WarMenu.MenuButton("Spawn Vehicles", "Vehicles") then
			
			elseif WarMenu.MenuButton('Set Invincibility', 'Invincibility') then
				
			elseif WarMenu.Button('Get Coordinates') then
		
				local x, y, z = getCoords(target)
				showNote(x .. "~n~" .. y .. "~n~" .. z .. "~n~(also saved in F8)")
				
			elseif WarMenu.MenuButton(" Set Wanted Level", "Wanted") then
				
			end
			
			WarMenu.Display()
			
		-- INVINCIBILITY MENU
			
		elseif WarMenu.IsMenuOpened("Invincibility") then
				
			if WarMenu.Button('On') then
		
				setHealth(target, true)
				
			elseif WarMenu.Button("Off") then
			
				setHealth(target, false)
				
			end
			
			WarMenu.Display()
			
		-- WEAPONS MENU
			
		elseif WarMenu.IsMenuOpened("Weapons") then
			
			if WarMenu.MenuButton("Pistols", "Pistols") then
				
			elseif WarMenu.MenuButton("SMGs", "SMGs") then	
			
			elseif WarMenu.MenuButton("Rifles", "Rifles") then
			
			elseif WarMenu.MenuButton("Machine Guns", "Machine Guns") then
			
			elseif WarMenu.MenuButton("Shotguns", "Shotguns") then
			
			elseif WarMenu.MenuButton("Sniper Rifles", "Sniper Rifles") then
			
			elseif WarMenu.MenuButton("Launchers", "Launchers") then
			
			elseif WarMenu.MenuButton("Thrown", "Thrown") then
			
			elseif WarMenu.MenuButton("Melee", "Melee") then
			
			elseif WarMenu.MenuButton("Gadgets", "Gadgets") then
			
			elseif WarMenu.MenuButton("OP", "OP") then
			
			elseif WarMenu.Button("Full Loadout") then
			
				for i = 1, #pistols do
				
					giveWeapon(target, pistols[i], 100)
					
				end
			
				for i = 1, #smgs do
				
					giveWeapon(target, smgs[i], 100)
					
				end
			
				for i = 1, #rifles do
				
					giveWeapon(target, rifles[i], 100)
					
				end
			
				for i = 1, #machineGuns do
				
					giveWeapon(target, machineGuns[i], 100)
					
				end
			
				for i = 1, #shotguns do
				
					giveWeapon(target, shotguns[i], 100)
					
				end
			
				for i = 1, #snipers do
				
					giveWeapon(target, snipers[i], 100)
					
				end
			
				for i = 1, #launchers do
				
					giveWeapon(target, launchers[i], 100)
					
				end
			
				for i = 1, #thrown do
				
					giveWeapon(target, thrown[i], 100)
					
				end
			
				for i = 1, #melee do
				
					giveWeapon(target, melee[i], 100)
					
				end
			
				for i = 1, #gadgets do
				
					giveWeapon(target, gadgets[i], 100)
					
				end
			
				for i = 1, #op do
				
					giveWeapon(target, op[i], 100)
					
				end
			
			end
				
			WarMenu.Display()
			
		-- PISTOLS MENU
			
		elseif WarMenu.IsMenuOpened("Pistols") then
		
			if WarMenu.Button(pistols[1]) then
				
				giveWeapon(target, pistols[1], 100)
				
			elseif WarMenu.Button(pistols[2]) then
				
				giveWeapon(target, pistols[2], 100)
				
			elseif WarMenu.Button(pistols[3]) then
				
				giveWeapon(target, pistols[3], 100)
				
			elseif WarMenu.Button(pistols[4]) then
				
				giveWeapon(target, pistols[4], 100)
				
			elseif WarMenu.Button(pistols[5]) then
				
				giveWeapon(target, pistols[5], 100)
				
			elseif WarMenu.Button(pistols[6]) then
				
				giveWeapon(target, pistols[6], 100)
				
			elseif WarMenu.Button(pistols[7]) then
				
				giveWeapon(target, pistols[7], 100)
				
			elseif WarMenu.Button(pistols[8]) then
				
				giveWeapon(target, pistols[8], 100)
				
			elseif WarMenu.Button(pistols[9]) then
				
				giveWeapon(target, pistols[9], 100)
				
			elseif WarMenu.Button(pistols[10]) then
			
				giveWeapon(target, pistols[10], 100)
				
			elseif WarMenu.Button(pistols[11]) then
			
				giveWeapon(target, pistols[11], 100)
				
			end
			
			WarMenu.Display()
			
		-- SMGs MENU
				
		elseif WarMenu.IsMenuOpened("SMGs") then
		
			if WarMenu.Button(smgs[1]) then
				
				giveWeapon(target, smgs[1], 100)
				
			elseif WarMenu.Button(smgs[2]) then
				
				giveWeapon(target, smgs[2], 100)
			
			elseif WarMenu.Button(smgs[3]) then
				
				giveWeapon(target, smgs[3], 100)
			
			elseif WarMenu.Button(smgs[4]) then
				
				giveWeapon(target, smgs[4], 100)
			
			elseif WarMenu.Button(smgs[5]) then
				
				giveWeapon(target, smgs[5], 100)
			
			elseif WarMenu.Button(smgs[6]) then
				
				giveWeapon(target, smgs[6], 100)
			
			end
			
			WarMenu.Display()
			
		-- RIFLES MENU
		
		elseif WarMenu.IsMenuOpened("Rifles") then
		
			if WarMenu.Button(rifles[1]) then
				
				giveWeapon(target, rifles[1], 100)
				
			elseif WarMenu.Button(rifles[2]) then
				
				giveWeapon(target, rifles[2], 100)
			
			elseif WarMenu.Button(rifles[3]) then
				
				giveWeapon(target, rifles[3], 100)
			
			elseif WarMenu.Button(rifles[4]) then
				
				giveWeapon(target, rifles[4], 100)
			
			elseif WarMenu.Button(rifles[5]) then
				
				giveWeapon(target, rifles[5], 100)
			
			elseif WarMenu.Button(rifles[6]) then
				
				giveWeapon(target, rifles[6], 100)
			
			elseif WarMenu.Button(rifles[7]) then
				
				giveWeapon(target, rifles[7], 100)
			
			end
			
			WarMenu.Display()
			
		-- MACHINE GUNS
		
		elseif WarMenu.IsMenuOpened("Machine Guns") then
		
			if WarMenu.Button(machineGuns[1]) then
				
				giveWeapon(target, machineGuns[1], 100)
				
			elseif WarMenu.Button(machineGuns[2]) then
				
				giveWeapon(target, machineGuns[2], 100)
				
			elseif WarMenu.Button(machineGuns[3]) then
			
				giveWeapon(target, machineGuns[3], 100)
			
			end
			
			WarMenu.Display()
			
		-- SHOTGUNS MENU
			
		elseif WarMenu.IsMenuOpened("Shotguns") then
		
			if WarMenu.Button(shotguns[1]) then
				
				giveWeapon(target, shotguns[1], 100)
				
			elseif WarMenu.Button(shotguns[2]) then
				
				giveWeapon(target, shotguns[2], 100)
			
			elseif WarMenu.Button(shotguns[3]) then
				
				giveWeapon(target, shotguns[3], 100)
			
			elseif WarMenu.Button(shotguns[4]) then
				
				giveWeapon(target, shotguns[4], 100)
			
			elseif WarMenu.Button(shotguns[5]) then
				
				giveWeapon(target, shotguns[5], 100)
			
			elseif WarMenu.Button(shotguns[6]) then
				
				giveWeapon(target, shotguns[6], 100)
			
			elseif WarMenu.Button(shotguns[7]) then
				
				giveWeapon(target, shotguns[7], 100)
			
			end
			
			WarMenu.Display()
			
		-- SNIPER MENU

		elseif WarMenu.IsMenuOpened("Sniper Rifles") then
		
			if WarMenu.Button(snipers[1]) then
				
				giveWeapon(target, snipers[1], 100)
				
			elseif WarMenu.Button(snipers[2]) then
				
				giveWeapon(target, snipers[2], 100)
			
			elseif WarMenu.Button(snipers[3]) then
				
				giveWeapon(target, snipers[3], 100)
			
			end
			
			WarMenu.Display()
			
		-- LAUNCHER MENU
		
		elseif WarMenu.IsMenuOpened("Launchers") then
		
			if WarMenu.Button(launchers[1]) then
				
				giveWeapon(target, launchers[1], 100)
				
			elseif WarMenu.Button(launchers[2]) then
				
				giveWeapon(target, launchers[2], 100)
			
			elseif WarMenu.Button(launchers[3]) then
				
				giveWeapon(target, launchers[3], 100)
			
			elseif WarMenu.Button(launchers[4]) then
				
				giveWeapon(target, launchers[4], 100)
			
			elseif WarMenu.Button(launchers[5]) then
				
				giveWeapon(target, launchers[5], 100)
			
			end
			
			WarMenu.Display()
			
		-- MELEE MENU
			
		elseif WarMenu.IsMenuOpened("Melee") then
		
			if WarMenu.Button(melee[1]) then
				
				giveWeapon(target, melee[1], 100)
				
			elseif WarMenu.Button(melee[2]) then
				
				giveWeapon(target, melee[2], 100)
			
			elseif WarMenu.Button(melee[3]) then
				
				giveWeapon(target, melee[3], 100)
			
			elseif WarMenu.Button(melee[4]) then
				
				giveWeapon(target, melee[4], 100)
			
			elseif WarMenu.Button(melee[5]) then
				
				giveWeapon(target, melee[5], 100)
			
			elseif WarMenu.Button(melee[6]) then
				
				giveWeapon(target, melee[6], 100)
			
			elseif WarMenu.Button(melee[7]) then
				
				giveWeapon(target, melee[7], 100)
			
			elseif WarMenu.Button(melee[8]) then
				
				giveWeapon(target, melee[8], 100)
			
			elseif WarMenu.Button(melee[9]) then
				
				giveWeapon(target, melee[9], 100)
			
			elseif WarMenu.Button(melee[10]) then
				
				giveWeapon(target, melee[10], 100)
			
			elseif WarMenu.Button(melee[11]) then
				
				giveWeapon(target, melee[11], 100)
			
			elseif WarMenu.Button(melee[12]) then
				
				giveWeapon(target, melee[12], 100)
			
			elseif WarMenu.Button(melee[13]) then
				
				giveWeapon(target, melee[13], 100)
			
			elseif WarMenu.Button(melee[14]) then
				
				giveWeapon(target, melee[14], 100)
			
			elseif WarMenu.Button(melee[15]) then
				
				giveWeapon(target, melee[15], 100)
			
			end
			
			WarMenu.Display()
			
		-- THROWN MENU
		
		elseif WarMenu.IsMenuOpened("Thrown") then
		
			if WarMenu.Button(thrown[1]) then
				
				giveWeapon(target, thrown[1], 100)
				
			elseif WarMenu.Button(thrown[2]) then
				
				giveWeapon(target, thrown[2], 100)
			
			elseif WarMenu.Button(thrown[3]) then
				
				giveWeapon(target, thrown[3], 100)
			
			elseif WarMenu.Button(thrown[4]) then
				
				giveWeapon(target, thrown[4], 100)
			
			elseif WarMenu.Button(thrown[5]) then
				
				giveWeapon(target, thrown[5], 100)
			
			elseif WarMenu.Button(thrown[6]) then
				
				giveWeapon(target, thrown[6], 100)
			
			elseif WarMenu.Button(thrown[7]) then
				
				giveWeapon(target, thrown[7], 100)
			
			elseif WarMenu.Button(thrown[8]) then
				
				giveWeapon(target, thrown[8], 100)
			
			elseif WarMenu.Button(thrown[9]) then
				
				giveWeapon(target, thrown[9], 100)
			
			elseif WarMenu.Button(thrown[10]) then
				
				giveWeapon(target, thrown[10], 100)
			
			end
			
			WarMenu.Display()
			
		-- GADGETS MENU

		elseif WarMenu.IsMenuOpened("Gadgets") then
		
			if WarMenu.Button(gadgets[1]) then
				
				giveWeapon(target, gadgets[1], 100)
				
			end
			
			WarMenu.Display()
			
		-- OP MENU
			
		elseif WarMenu.IsMenuOpened("OP") then
		
			if WarMenu.Button(op[1]) then
				
				giveWeapon(target, op[1], 1000)
			
			elseif WarMenu.Button(op[2]) then
				
				giveWeapon(target, op[2], 100)
			
			end
			
			WarMenu.Display()
			
		-- WANTED LEVEL MENU
		
		elseif WarMenu.IsMenuOpened("Wanted") then
				
			if WarMenu.Button('Off') then
		
				wantedLevel(target2, 0)
				showNote("Wanted Level: ~g~OFF")
				
			elseif WarMenu.Button("1 Star") then
			
				wantedLevel(target2, 1)
				showNote("Wanted Level: ~r~1")
				
			elseif WarMenu.Button("2 Star") then
			
				wantedLevel(target2, 2)
				showNote("Wanted Level: ~r~2")
				
			elseif WarMenu.Button("3 Star") then
			
				wantedLevel(target2, 3)
				showNote("Wanted Level: ~r~3")
				
			elseif WarMenu.Button("4 Star") then
			
				wantedLevel(target2, 4)
				showNote("Wanted Level: ~r~4")
				
			elseif WarMenu.Button("5 Star") then
			
				wantedLevel(target2, 5)
				showNote("Wanted Level: ~r~5")
				
			end
			
			WarMenu.Display()
			
		-- VEHICLE MENU
		
		elseif WarMenu.IsMenuOpened("Vehicles") then
			
			if WarMenu.MenuButton("Super", "Super") then
				
			elseif WarMenu.MenuButton("Sports", "Sports") then
			
			elseif WarMenu.MenuButton("Sedan", "Sedan") then
			
			elseif WarMenu.MenuButton("Utility", "Utility") then
			
			elseif WarMenu.MenuButton("Emergency", "Emergency") then
			
			elseif WarMenu.MenuButton("Compact", "Compact") then
			
			elseif WarMenu.MenuButton("Service", "Service") then
			
			elseif WarMenu.MenuButton("Military", "Military") then
			
			elseif WarMenu.MenuButton("SUV", "SUV") then
			
			elseif WarMenu.MenuButton("Commercial", "Commercial") then
			
			elseif WarMenu.MenuButton("Off Road", "Off Road") then
			
			elseif WarMenu.MenuButton("Van", "Van") then
			
			elseif WarMenu.MenuButton("Muscle", "Muscle") then
			
			elseif WarMenu.MenuButton("Industrial", "Industrial") then
			
			elseif WarMenu.MenuButton("Plane", "Plane") then
			
			elseif WarMenu.MenuButton("Helicopter", "Helicopter") then
			
			elseif WarMenu.MenuButton("Motorcycle", "Motorcycle") then
			
			elseif WarMenu.MenuButton("Rail", "Rail") then
			
			elseif WarMenu.MenuButton("Coupe", "Coupe") then
			
			elseif WarMenu.MenuButton("Sports Classic", "Sports Classic") then
			
			elseif WarMenu.MenuButton("Cycle", "Cycle") then
			
			elseif WarMenu.MenuButton("Boat", "Boat") then
			
			end
			
			WarMenu.Display()
			
		--SUPER MENU
		
		elseif WarMenu.IsMenuOpened("Super") then
			
			if WarMenu.Button(super[1]) then
			
				spawnVeh(target, super[1])
				showNote("Spawning: ~g~" .. super[1])
			
			elseif WarMenu.Button(super[3]) then
			
				spawnVeh(target, super[2])
				showNote("Spawning: ~g~" .. super[2])
			
			elseif WarMenu.Button(super[3]) then
			
				spawnVeh(target, super[3])
				showNote("Spawning: ~g~" .. super[3])
			
			elseif WarMenu.Button(super[4]) then
			
				spawnVeh(target, super[4])
				showNote("Spawning: ~g~" .. super[4])
			
			elseif WarMenu.Button(super[5]) then
			
				spawnVeh(target, super[5])
				showNote("Spawning: ~g~" .. super[5])
			
			elseif WarMenu.Button(super[6]) then
			
				spawnVeh(target, super[6])
				showNote("Spawning: ~g~" .. super[6])
			
			elseif WarMenu.Button(super[7]) then
			
				spawnVeh(target, super[7])
				showNote("Spawning: ~g~" .. super[7])
			
			elseif WarMenu.Button(super[8]) then
			
				spawnVeh(target, super[8])
				showNote("Spawning: ~g~" .. super[8])
						
			elseif WarMenu.Button(super[9]) then
			
				spawnVeh(target, super[9])
				showNote("Spawning: ~g~" .. super[9])
			
			elseif WarMenu.Button(super[10]) then
			
				spawnVeh(target, super[10])
				showNote("Spawning: ~g~" .. super[10])
			
			elseif WarMenu.Button(super[11]) then
			
				spawnVeh(target, super[11])
				showNote("Spawning: ~g~" .. super[11])
			
			elseif WarMenu.Button(super[12]) then
			
				spawnVeh(target, super[12])
				showNote("Spawning: ~g~" .. super[12])
			
			elseif WarMenu.Button(super[13]) then
			
				spawnVeh(target, super[13])
				showNote("Spawning: ~g~" .. super[13])
			
			elseif WarMenu.Button(super[14]) then
			
				spawnVeh(target, super[14])
				showNote("Spawning: ~g~" .. super[14])
			
			elseif WarMenu.Button(super[15]) then
			
				spawnVeh(target, super[15])
				showNote("Spawning: ~g~" .. super[15])
			
			elseif WarMenu.Button(super[16]) then
			
				spawnVeh(target, super[16])
				showNote("Spawning: ~g~" .. super[16])
			
			elseif WarMenu.Button(super[17]) then
			
				spawnVeh(target, super[17])
				showNote("Spawning: ~g~" .. super[17])
			
			elseif WarMenu.Button(super[18]) then
			
				spawnVeh(target, super[18])
				showNote("Spawning: ~g~" .. super[18])
			
			elseif WarMenu.Button(super[19]) then
			
				spawnVeh(target, super[19])
				showNote("Spawning: ~g~" .. super[19])
			
			elseif WarMenu.Button(super[20]) then
			
				spawnVeh(target, super[20])
				showNote("Spawning: ~g~" .. super[20])
			
			end
			
			WarMenu.Display()
		
		--SPORTS MENU
		
		elseif WarMenu.IsMenuOpened("Sports") then
			
			if WarMenu.Button(sports[1]) then
			
				spawnVeh(target, sports[1])
				showNote("Spawning: ~g~" .. sports[1])
			
			elseif WarMenu.Button(sports[2]) then
			
				spawnVeh(target, sports[2])
				showNote("Spawning: ~g~" .. sports[2])
			
			elseif WarMenu.Button(sports[3]) then
			
				spawnVeh(target, sports[3])
				showNote("Spawning: ~g~" .. sports[3])
			
			elseif WarMenu.Button(sports[4]) then
			
				spawnVeh(target, sports[4])
				showNote("Spawning: ~g~" .. sports[4])
			
			elseif WarMenu.Button(sports[5]) then
			
				spawnVeh(target, sports[5])
				showNote("Spawning: ~g~" .. sports[5])
			
			elseif WarMenu.Button(sports[6]) then
			
				spawnVeh(target, sports[6])
				showNote("Spawning: ~g~" .. sports[6])
			
			elseif WarMenu.Button(sports[7]) then
			
				spawnVeh(target, sports[7])
				showNote("Spawning: ~g~" .. sports[7])
			
			elseif WarMenu.Button(sports[8]) then
			
				spawnVeh(target, sports[8])
				showNote("Spawning: ~g~" .. sports[8])
			
			elseif WarMenu.Button(sports[9]) then
			
				spawnVeh(target, sports[9])
				showNote("Spawning: ~g~" .. sports[9])
			
			elseif WarMenu.Button(sports[10]) then
			
				spawnVeh(target, sports[10])
				showNote("Spawning: ~g~" .. sports[10])
			
			elseif WarMenu.Button(sports[11]) then
			
				spawnVeh(target, sports[11])
				showNote("Spawning: ~g~" .. sports[11])
			
			elseif WarMenu.Button(sports[12]) then
			
				spawnVeh(target, sports[12])
				showNote("Spawning: ~g~" .. sports[12])
			
			elseif WarMenu.Button(sports[13]) then
			
				spawnVeh(target, sports[13])
				showNote("Spawning: ~g~" .. sports[13])
			
			elseif WarMenu.Button(sports[14]) then
			
				spawnVeh(target, sports[14])
				showNote("Spawning: ~g~" .. sports[14])
			
			elseif WarMenu.Button(sports[15]) then
			
				spawnVeh(target, sports[15])
				showNote("Spawning: ~g~" .. sports[15])
			
			elseif WarMenu.Button(sports[16]) then
			
				spawnVeh(target, sports[16])
				showNote("Spawning: ~g~" .. sports[16])
			
			elseif WarMenu.Button(sports[17]) then
			
				spawnVeh(target, sports[17])
				showNote("Spawning: ~g~" .. sports[17])
			
			elseif WarMenu.Button(sports[18]) then
			
				spawnVeh(target, sports[18])
				showNote("Spawning: ~g~" .. sports[18])
			
			elseif WarMenu.Button(sports[19]) then
			
				spawnVeh(target, sports[19])
				showNote("Spawning: ~g~" .. sports[19])
			
			elseif WarMenu.Button(sports[20]) then
			
				spawnVeh(target, sports[20])
				showNote("Spawning: ~g~" .. sports[20])
			
			elseif WarMenu.Button(sports[21]) then
			
				spawnVeh(target, sports[21])
				showNote("Spawning: ~g~" .. sports[21])
			
			elseif WarMenu.Button(sports[22]) then
			
				spawnVeh(target, sports[22])
				showNote("Spawning: ~g~" .. sports[22])
			
			elseif WarMenu.Button(sports[23]) then
			
				spawnVeh(target, sports[23])
				showNote("Spawning: ~g~" .. sports[23])
			
			elseif WarMenu.Button(sports[24]) then
			
				spawnVeh(target, sports[24])
				showNote("Spawning: ~g~" .. sports[24])
			
			elseif WarMenu.Button(sports[25]) then
			
				spawnVeh(target, sports[25])
				showNote("Spawning: ~g~" .. sports[25])
			
			elseif WarMenu.Button(sports[26]) then
			
				spawnVeh(target, sports[26])
				showNote("Spawning: ~g~" .. sports[26])
			
			elseif WarMenu.Button(sports[27]) then
			
				spawnVeh(target, sports[27])
				showNote("Spawning: ~g~" .. sports[27])
			
			elseif WarMenu.Button(sports[28]) then
			
				spawnVeh(target, sports[28])
				showNote("Spawning: ~g~" .. sports[28])
			
			elseif WarMenu.Button(sports[29]) then
			
				spawnVeh(target, sports[29])
				showNote("Spawning: ~g~" .. sports[29])
			
			elseif WarMenu.Button(sports[30]) then
			
				spawnVeh(target, sports[30])
				showNote("Spawning: ~g~" .. sports[30])
			
			elseif WarMenu.Button(sports[31]) then
			
				spawnVeh(target, sports[31])
				showNote("Spawning: ~g~" .. sports[31])
			
			elseif WarMenu.Button(sports[32]) then
			
				spawnVeh(target, sports[32])
				showNote("Spawning: ~g~" .. sports[32])
			
			elseif WarMenu.Button(sports[33]) then
			
				spawnVeh(target, sports[33])
				showNote("Spawning: ~g~" .. sports[33])
			
			elseif WarMenu.Button(sports[34]) then
			
				spawnVeh(target, sports[34])
				showNote("Spawning: ~g~" .. sports[34])
			
			elseif WarMenu.Button(sports[35]) then
			
				spawnVeh(target, sports[35])
				showNote("Spawning: ~g~" .. sports[35])
			
			elseif WarMenu.Button(sports[36]) then
			
				spawnVeh(target, sports[36])
				showNote("Spawning: ~g~" .. sports[36])
			
			elseif WarMenu.Button(sports[37]) then
			
				spawnVeh(target, sports[37])
				showNote("Spawning: ~g~" .. sports[37])
			
			elseif WarMenu.Button(sports[38]) then
			
				spawnVeh(target, sports[38])
				showNote("Spawning: ~g~" .. sports[38])
			
			end
			
			WarMenu.Display()
		
		--SPORTS CLASSIC MENU
		
		elseif WarMenu.IsMenuOpened("Sports Classic") then
			
			if WarMenu.Button(sportsClassic[1]) then
			
				spawnVeh(target, sportsClassic[1])
				showNote("Spawning: ~g~" .. sportsClassic[1])
			
			elseif WarMenu.Button(sportsClassic[2]) then
			
				spawnVeh(target, sportsClassic[2])
				showNote("Spawning: ~g~" .. sportsClassic[2])
			
			elseif WarMenu.Button(sportsClassic[3]) then
			
				spawnVeh(target, sportsClassic[3])
				showNote("Spawning: ~g~" .. sportsClassic[3])
			
			elseif WarMenu.Button(sportsClassic[4]) then
			
				spawnVeh(target, sportsClassic[4])
				showNote("Spawning: ~g~" .. sportsClassic[4])
			
			elseif WarMenu.Button(sportsClassic[5]) then
			
				spawnVeh(target, sportsClassic[5])
				showNote("Spawning: ~g~" .. sportsClassic[5])
			
			elseif WarMenu.Button(sportsClassic[6]) then
			
				spawnVeh(target, sportsClassic[6])
				showNote("Spawning: ~g~" .. sportsClassic[6])
			
			elseif WarMenu.Button(sportsClassic[7]) then
			
				spawnVeh(target, sportsClassic[7])
				showNote("Spawning: ~g~" .. sportsClassic[7])
			
			elseif WarMenu.Button(sportsClassic[8]) then
			
				spawnVeh(target, sportsClassic[8])
				showNote("Spawning: ~g~" .. sportsClassic[8])
			
			elseif WarMenu.Button(sportsClassic[9]) then
			
				spawnVeh(target, sportsClassic[9])
				showNote("Spawning: ~g~" .. sportsClassic[9])
			
			elseif WarMenu.Button(sportsClassic[10]) then
			
				spawnVeh(target, sportsClassic[10])
				showNote("Spawning: ~g~" .. sportsClassic[10])
			
			elseif WarMenu.Button(sportsClassic[11]) then
			
				spawnVeh(target, sportsClassic[11])
				showNote("Spawning: ~g~" .. sportsClassic[11])
			
			elseif WarMenu.Button(sportsClassic[12]) then
			
				spawnVeh(target, sportsClassic[12])
				showNote("Spawning: ~g~" .. sportsClassic[12])
			
			elseif WarMenu.Button(sportsClassic[13]) then
			
				spawnVeh(target, sportsClassic[13])
				showNote("Spawning: ~g~" .. sportsClassic[13])
			
			elseif WarMenu.Button(sportsClassic[14]) then
			
				spawnVeh(target, sportsClassic[14])
				showNote("Spawning: ~g~" .. sportsClassic[14])
			
			elseif WarMenu.Button(sportsClassic[15]) then
			
				spawnVeh(target, sportsClassic[15])
				showNote("Spawning: ~g~" .. sportsClassic[15])
			
			elseif WarMenu.Button(sportsClassic[16]) then
			
				spawnVeh(target, sportsClassic[16])
				showNote("Spawning: ~g~" .. sportsClassic[16])
			
			elseif WarMenu.Button(sportsClassic[17]) then
			
				spawnVeh(target, sportsClassic[17])
				showNote("Spawning: ~g~" .. sportsClassic[17])
			
			elseif WarMenu.Button(sportsClassic[18]) then
			
				spawnVeh(target, sportsClassic[18])
				showNote("Spawning: ~g~" .. sportsClassic[18])
			
			elseif WarMenu.Button(sportsClassic[19]) then
			
				spawnVeh(target, sportsClassic[19])
				showNote("Spawning: ~g~" .. sportsClassic[19])
			
			end
			
			WarMenu.Display()
		
		--MOTORCYCLE MENU
		
		elseif WarMenu.IsMenuOpened("Motorcycle") then
			
			if WarMenu.Button(motorcycle[1]) then
			
				spawnVeh(target, motorcycle[1])
				showNote("Spawning: ~g~" .. motorcycle[1])
			
			elseif WarMenu.Button(motorcycle[2]) then
			
				spawnVeh(target, motorcycle[2])
				showNote("Spawning: ~g~" .. motorcycle[2])
			
			elseif WarMenu.Button(motorcycle[3]) then
			
				spawnVeh(target, motorcycle[3])
				showNote("Spawning: ~g~" .. motorcycle[3])
			
			elseif WarMenu.Button(motorcycle[4]) then
			
				spawnVeh(target, motorcycle[4])
				showNote("Spawning: ~g~" .. motorcycle[4])
			
			elseif WarMenu.Button(motorcycle[5]) then
			
				spawnVeh(target, motorcycle[5])
				showNote("Spawning: ~g~" .. motorcycle[5])
			
			elseif WarMenu.Button(motorcycle[6]) then
			
				spawnVeh(target, motorcycle[6])
				showNote("Spawning: ~g~" .. motorcycle[6])
			
			elseif WarMenu.Button(motorcycle[7]) then
			
				spawnVeh(target, motorcycle[7])
				showNote("Spawning: ~g~" .. motorcycle[7])
			
			elseif WarMenu.Button(motorcycle[8]) then
			
				spawnVeh(target, motorcycle[8])
				showNote("Spawning: ~g~" .. motorcycle[8])
			
			elseif WarMenu.Button(motorcycle[9]) then
			
				spawnVeh(target, motorcycle[9])
				showNote("Spawning: ~g~" .. motorcycle[9])
			
			elseif WarMenu.Button(motorcycle[10]) then
			
				spawnVeh(target, motorcycle[10])
				showNote("Spawning: ~g~" .. motorcycle[10])
			
			elseif WarMenu.Button(motorcycle[11]) then
			
				spawnVeh(target, motorcycle[11])
				showNote("Spawning: ~g~" .. motorcycle[11])
			
			elseif WarMenu.Button(motorcycle[12]) then
			
				spawnVeh(target, motorcycle[12])
				showNote("Spawning: ~g~" .. motorcycle[12])
			
			elseif WarMenu.Button(motorcycle[13]) then
			
				spawnVeh(target, motorcycle[13])
				showNote("Spawning: ~g~" .. motorcycle[13])
			
			elseif WarMenu.Button(motorcycle[14]) then
			
				spawnVeh(target, motorcycle[14])
				showNote("Spawning: ~g~" .. motorcycle[14])
			
			elseif WarMenu.Button(motorcycle[15]) then
			
				spawnVeh(target, motorcycle[15])
				showNote("Spawning: ~g~" .. motorcycle[15])
			
			elseif WarMenu.Button(motorcycle[16]) then
			
				spawnVeh(target, motorcycle[16])
				showNote("Spawning: ~g~" .. motorcycle[16])
			
			elseif WarMenu.Button(motorcycle[17]) then
			
				spawnVeh(target, motorcycle[17])
				showNote("Spawning: ~g~" .. motorcycle[17])
			
			elseif WarMenu.Button(motorcycle[18]) then
			
				spawnVeh(target, motorcycle[18])
				showNote("Spawning: ~g~" .. motorcycle[18])
			
			elseif WarMenu.Button(motorcycle[19]) then
			
				spawnVeh(target, motorcycle[19])
				showNote("Spawning: ~g~" .. motorcycle[19])
			
			elseif WarMenu.Button(motorcycle[20]) then
			
				spawnVeh(target, motorcycle[20])
				showNote("Spawning: ~g~" .. motorcycle[20])
			
			elseif WarMenu.Button(motorcycle[21]) then
			
				spawnVeh(target, motorcycle[21])
				showNote("Spawning: ~g~" .. motorcycle[21])
			
			elseif WarMenu.Button(motorcycle[22]) then
			
				spawnVeh(target, motorcycle[22])
				showNote("Spawning: ~g~" .. motorcycle[22])
			
			elseif WarMenu.Button(motorcycle[23]) then
			
				spawnVeh(target, motorcycle[23])
				showNote("Spawning: ~g~" .. motorcycle[23])
			
			elseif WarMenu.Button(motorcycle[24]) then
			
				spawnVeh(target, motorcycle[24])
				showNote("Spawning: ~g~" .. motorcycle[24])
			
			elseif WarMenu.Button(motorcycle[25]) then
			
				spawnVeh(target, motorcycle[25])
				showNote("Spawning: ~g~" .. motorcycle[25])
			
			elseif WarMenu.Button(motorcycle[26]) then
			
				spawnVeh(target, motorcycle[26])
				showNote("Spawning: ~g~" .. motorcycle[26])
			
			elseif WarMenu.Button(motorcycle[27]) then
			
				spawnVeh(target, motorcycle[27])
				showNote("Spawning: ~g~" .. motorcycle[27])
			
			elseif WarMenu.Button(motorcycle[28]) then
			
				spawnVeh(target, motorcycle[28])
				showNote("Spawning: ~g~" .. motorcycle[28])
			
			elseif WarMenu.Button(motorcycle[29]) then
			
				spawnVeh(target, motorcycle[29])
				showNote("Spawning: ~g~" .. motorcycle[29])
			
			elseif WarMenu.Button(motorcycle[30]) then
			
				spawnVeh(target, motorcycle[30])
				showNote("Spawning: ~g~" .. motorcycle[30])
			
			elseif WarMenu.Button(motorcycle[31]) then
			
				spawnVeh(target, motorcycle[31])
				showNote("Spawning: ~g~" .. motorcycle[31])
			
			elseif WarMenu.Button(motorcycle[32]) then
			
				spawnVeh(target, motorcycle[32])
				showNote("Spawning: ~g~" .. motorcycle[32])
			
			elseif WarMenu.Button(motorcycle[33]) then
			
				spawnVeh(target, motorcycle[33])
				showNote("Spawning: ~g~" .. motorcycle[33])
			
			elseif WarMenu.Button(motorcycle[34]) then
			
				spawnVeh(target, motorcycle[34])
				showNote("Spawning: ~g~" .. motorcycle[34])
			
			elseif WarMenu.Button(motorcycle[35]) then
			
				spawnVeh(target, motorcycle[35])
				showNote("Spawning: ~g~" .. motorcycle[35])
			
			elseif WarMenu.Button(motorcycle[36]) then
			
				spawnVeh(target, motorcycle[36])
				showNote("Spawning: ~g~" .. motorcycle[36])
			
			elseif WarMenu.Button(motorcycle[37]) then
			
				spawnVeh(target, motorcycle[37])
				showNote("Spawning: ~g~" .. motorcycle[37])
			
			elseif WarMenu.Button(motorcycle[38]) then
			
				spawnVeh(target, motorcycle[38])
				showNote("Spawning: ~g~" .. motorcycle[38])
			
			elseif WarMenu.Button(motorcycle[39]) then
			
				spawnVeh(target, motorcycle[39])
				showNote("Spawning: ~g~" .. motorcycle[39])
			
			elseif WarMenu.Button(motorcycle[40]) then
			
				spawnVeh(target, motorcycle[40])
				showNote("Spawning: ~g~" .. motorcycle[40])
			
			elseif WarMenu.Button(motorcycle[41]) then
			
				spawnVeh(target, motorcycle[41])
				showNote("Spawning: ~g~" .. motorcycle[41])
			
			elseif WarMenu.Button(motorcycle[42]) then
			
				spawnVeh(target, motorcycle[42])
				showNote("Spawning: ~g~" .. motorcycle[42])
			
			end
			
			WarMenu.Display()
		
		--COUPE MENU
		
		elseif WarMenu.IsMenuOpened("Coupe") then
			
			if WarMenu.Button(coupe[1]) then
			
				spawnVeh(target, coupe[1])
				showNote("Spawning: ~g~" .. coupe[1])
			
			elseif WarMenu.Button(coupe[2]) then
			
				spawnVeh(target, coupe[2])
				showNote("Spawning: ~g~" .. coupe[2])
			
			elseif WarMenu.Button(coupe[3]) then
			
				spawnVeh(target, coupe[3])
				showNote("Spawning: ~g~" .. coupe[3])
			
			elseif WarMenu.Button(coupe[4]) then
			
				spawnVeh(target, coupe[4])
				showNote("Spawning: ~g~" .. coupe[4])
			
			elseif WarMenu.Button(coupe[5]) then
			
				spawnVeh(target, coupe[5])
				showNote("Spawning: ~g~" .. coupe[5])
			
			elseif WarMenu.Button(coupe[6]) then
			
				spawnVeh(target, coupe[6])
				showNote("Spawning: ~g~" .. coupe[6])
			
			elseif WarMenu.Button(coupe[7]) then
			
				spawnVeh(target, coupe[7])
				showNote("Spawning: ~g~" .. coupe[7])
			
			elseif WarMenu.Button(coupe[8]) then
			
				spawnVeh(target, coupe[8])
				showNote("Spawning: ~g~" .. coupe[8])
			
			elseif WarMenu.Button(coupe[9]) then
			
				spawnVeh(target, coupe[9])
				showNote("Spawning: ~g~" .. coupe[9])
			
			elseif WarMenu.Button(coupe[10]) then
			
				spawnVeh(target, coupe[10])
				showNote("Spawning: ~g~" .. coupe[10])
			
			elseif WarMenu.Button(coupe[11]) then
			
				spawnVeh(target, coupe[11])
				showNote("Spawning: ~g~" .. coupe[11])
			
			elseif WarMenu.Button(coupe[12]) then
			
				spawnVeh(target, coupe[12])
				showNote("Spawning: ~g~" .. coupe[12])
			
			elseif WarMenu.Button(coupe[13]) then
			
				spawnVeh(target, coupe[13])
				showNote("Spawning: ~g~" .. coupe[13])
			
			elseif WarMenu.Button(coupe[14]) then
			
				spawnVeh(target, coupe[14])
				showNote("Spawning: ~g~" .. coupe[14])
			
			end
			
			WarMenu.Display()
		
		--COMPACT MENU
		
		elseif WarMenu.IsMenuOpened("Compact") then
		
			if WarMenu.Button(compact[1]) then
			
				spawnVeh(target, compact[1])
				showNote("Spawning: ~g~" .. compact[1])
			
			elseif WarMenu.Button(compact[2]) then
			
				spawnVeh(target, compact[2])
				showNote("Spawning: ~g~" .. compact[2])
			
			elseif WarMenu.Button(compact[3]) then
			
				spawnVeh(target, compact[3])
				showNote("Spawning: ~g~" .. compact[3])
			
			elseif WarMenu.Button(compact[4]) then
			
				spawnVeh(target, compact[4])
				showNote("Spawning: ~g~" .. compact[4])
			
			elseif WarMenu.Button(compact[5]) then
			
				spawnVeh(target, compact[5])
				showNote("Spawning: ~g~" .. compact[5])
			
			elseif WarMenu.Button(compact[6]) then
			
				spawnVeh(target, compact[6])
				showNote("Spawning: ~g~" .. compact[6])
			
			elseif WarMenu.Button(compact[7]) then
			
				spawnVeh(target, compact[7])
				showNote("Spawning: ~g~" .. compact[7])
			
			elseif WarMenu.Button(compact[8]) then
			
				spawnVeh(target, compact[8])
				showNote("Spawning: ~g~" .. compact[8])
			
			end
			
			WarMenu.Display()
			
		
		--SEDAN MENU
		
		elseif WarMenu.IsMenuOpened("Sedan") then
			
			if WarMenu.Button(sedan[1]) then
			
				spawnVeh(target, sedan[1])
				showNote("Spawning: ~g~" .. sedan[1])
			
			elseif WarMenu.Button(sedan[2]) then
			
				spawnVeh(target, sedan[2])
				showNote("Spawning: ~g~" .. sedan[2])
			
			elseif WarMenu.Button(sedan[3]) then
			
				spawnVeh(target, sedan[3])
				showNote("Spawning: ~g~" .. sedan[3])
			
			elseif WarMenu.Button(sedan[4]) then
			
				spawnVeh(target, sedan[4])
				showNote("Spawning: ~g~" .. sedan[4])
			
			elseif WarMenu.Button(sedan[5]) then
			
				spawnVeh(target, sedan[5])
				showNote("Spawning: ~g~" .. sedan[5])
			
			elseif WarMenu.Button(sedan[6]) then
			
				spawnVeh(target, sedan[6])
				showNote("Spawning: ~g~" .. sedan[6])
			
			elseif WarMenu.Button(sedan[7]) then
			
				spawnVeh(target, sedan[7])
				showNote("Spawning: ~g~" .. sedan[7])
			
			elseif WarMenu.Button(sedan[8]) then
			
				spawnVeh(target, sedan[8])
				showNote("Spawning: ~g~" .. sedan[8])
			
			elseif WarMenu.Button(sedan[9]) then
			
				spawnVeh(target, sedan[9])
				showNote("Spawning: ~g~" .. sedan[9])
			
			elseif WarMenu.Button(sedan[10]) then
			
				spawnVeh(target, sedan[10])
				showNote("Spawning: ~g~" .. sedan[10])
			
			elseif WarMenu.Button(sedan[11]) then
			
				spawnVeh(target, sedan[11])
				showNote("Spawning: ~g~" .. sedan[11])
			
			elseif WarMenu.Button(sedan[12]) then
			
				spawnVeh(target, sedan[12])
				showNote("Spawning: ~g~" .. sedan[12])
			
			elseif WarMenu.Button(sedan[13]) then
			
				spawnVeh(target, sedan[13])
				showNote("Spawning: ~g~" .. sedan[13])
			
			elseif WarMenu.Button(sedan[14]) then
			
				spawnVeh(target, sedan[14])
				showNote("Spawning: ~g~" .. sedan[14])
			
			elseif WarMenu.Button(sedan[15]) then
			
				spawnVeh(target, sedan[15])
				showNote("Spawning: ~g~" .. sedan[15])
			
			elseif WarMenu.Button(sedan[16]) then
			
				spawnVeh(target, sedan[16])
				showNote("Spawning: ~g~" .. sedan[16])
			
			elseif WarMenu.Button(sedan[17]) then
			
				spawnVeh(target, sedan[17])
				showNote("Spawning: ~g~" .. sedan[17])
			
			elseif WarMenu.Button(sedan[18]) then
			
				spawnVeh(target, sedan[18])
				showNote("Spawning: ~g~" .. sedan[18])
			
			elseif WarMenu.Button(sedan[19]) then
			
				spawnVeh(target, sedan[19])
				showNote("Spawning: ~g~" .. sedan[19])
			
			elseif WarMenu.Button(sedan[20]) then
			
				spawnVeh(target, sedan[20])
				showNote("Spawning: ~g~" .. sedan[20])
			
			elseif WarMenu.Button(sedan[21]) then
			
				spawnVeh(target, sedan[21])
				showNote("Spawning: ~g~" .. sedan[21])
			
			elseif WarMenu.Button(sedan[22]) then
			
				spawnVeh(target, sedan[22])
				showNote("Spawning: ~g~" .. sedan[22])
			
			elseif WarMenu.Button(sedan[23]) then
			
				spawnVeh(target, sedan[23])
				showNote("Spawning: ~g~" .. sedan[23])
			
			elseif WarMenu.Button(sedan[24]) then
			
				spawnVeh(target, sedan[24])
				showNote("Spawning: ~g~" .. sedan[24])
			
			elseif WarMenu.Button(sedan[25]) then
			
				spawnVeh(target, sedan[25])
				showNote("Spawning: ~g~" .. sedan[25])
			
			elseif WarMenu.Button(sedan[26]) then
			
				spawnVeh(target, sedan[26])
				showNote("Spawning: ~g~" .. sedan[26])
			
			elseif WarMenu.Button(sedan[27]) then
			
				spawnVeh(target, sedan[27])
				showNote("Spawning: ~g~" .. sedan[27])
			
			elseif WarMenu.Button(sedan[28]) then
			
				spawnVeh(target, sedan[28])
				showNote("Spawning: ~g~" .. sedan[28])
			
			elseif WarMenu.Button(sedan[29]) then
			
				spawnVeh(target, sedan[29])
				showNote("Spawning: ~g~" .. sedan[29])
			
			elseif WarMenu.Button(sedan[30]) then
			
				spawnVeh(target, sedan[30])
				showNote("Spawning: ~g~" .. sedan[30])
			
			end
			
			WarMenu.Display()
		
		--CYCLE MENU
		
		elseif WarMenu.IsMenuOpened("Cycle") then
			
			if WarMenu.Button(cycle[1]) then
			
				spawnVeh(target, cycle[1])
				showNote("Spawning: ~g~" .. cycle[1])
			
			elseif WarMenu.Button(cycle[2]) then
			
				spawnVeh(target, cycle[2])
				showNote("Spawning: ~g~" .. cycle[2])
			
			elseif WarMenu.Button(cycle[3]) then
			
				spawnVeh(target, cycle[3])
				showNote("Spawning: ~g~" .. cycle[3])
			
			elseif WarMenu.Button(cycle[4]) then
			
				spawnVeh(target, cycle[4])
				showNote("Spawning: ~g~" .. cycle[4])
			
			elseif WarMenu.Button(cycle[5]) then
			
				spawnVeh(target, cycle[5])
				showNote("Spawning: ~g~" .. cycle[5])
			
			elseif WarMenu.Button(cycle[6]) then
			
				spawnVeh(target, cycle[6])
				showNote("Spawning: ~g~" .. cycle[6])
			
			elseif WarMenu.Button(cycle[6]) then
			
				spawnVeh(target, cycle[6])
				showNote("Spawning: ~g~" .. cycle[6])
			
			end
			
			WarMenu.Display()
		
		--OFF ROAD MENU
		
		elseif WarMenu.IsMenuOpened("Off Road") then
			
			if WarMenu.Button(offRoad[1]) then
			
				spawnVeh(target, offRoad[1])
				showNote("Spawning: ~g~" .. offRoad[1])
			
			elseif WarMenu.Button(offRoad[2]) then
			
				spawnVeh(target, offRoad[2])
				showNote("Spawning: ~g~" .. offRoad[2])
			
			elseif WarMenu.Button(offRoad[3]) then
			
				spawnVeh(target, offRoad[3])
				showNote("Spawning: ~g~" .. offRoad[3])
			
			elseif WarMenu.Button(offRoad[4]) then
			
				spawnVeh(target, offRoad[4])
				showNote("Spawning: ~g~" .. offRoad[4])
			
			elseif WarMenu.Button(offRoad[5]) then
			
				spawnVeh(target, offRoad[5])
				showNote("Spawning: ~g~" .. offRoad[5])
			
			elseif WarMenu.Button(offRoad[6]) then
			
				spawnVeh(target, offRoad[6])
				showNote("Spawning: ~g~" .. offRoad[6])
			
			elseif WarMenu.Button(offRoad[7]) then
			
				spawnVeh(target, offRoad[7])
				showNote("Spawning: ~g~" .. offRoad[7])
			
			elseif WarMenu.Button(offRoad[8]) then
			
				spawnVeh(target, offRoad[8])
				showNote("Spawning: ~g~" .. offRoad[8])
			
			elseif WarMenu.Button(offRoad[9]) then
			
				spawnVeh(target, offRoad[9])
				showNote("Spawning: ~g~" .. offRoad[9])
			
			elseif WarMenu.Button(offRoad[10]) then
			
				spawnVeh(target, offRoad[10])
				showNote("Spawning: ~g~" .. offRoad[10])
			
			elseif WarMenu.Button(offRoad[11]) then
			
				spawnVeh(target, offRoad[11])
				showNote("Spawning: ~g~" .. offRoad[11])
			
			elseif WarMenu.Button(offRoad[12]) then
			
				spawnVeh(target, offRoad[12])
				showNote("Spawning: ~g~" .. offRoad[12])
			
			elseif WarMenu.Button(offRoad[13]) then
			
				spawnVeh(target, offRoad[13])
				showNote("Spawning: ~g~" .. offRoad[13])
			
			elseif WarMenu.Button(offRoad[14]) then
			
				spawnVeh(target, offRoad[14])
				showNote("Spawning: ~g~" .. offRoad[14])
			
			elseif WarMenu.Button(offRoad[15]) then
			
				spawnVeh(target, offRoad[15])
				showNote("Spawning: ~g~" .. offRoad[15])
			
			elseif WarMenu.Button(offRoad[16]) then
			
				spawnVeh(target, offRoad[16])
				showNote("Spawning: ~g~" .. offRoad[16])
			
			elseif WarMenu.Button(offRoad[17]) then
			
				spawnVeh(target, offRoad[17])
				showNote("Spawning: ~g~" .. offRoad[17])
			
			elseif WarMenu.Button(offRoad[18]) then
			
				spawnVeh(target, offRoad[18])
				showNote("Spawning: ~g~" .. offRoad[18])
			
			elseif WarMenu.Button(offRoad[19]) then
			
				spawnVeh(target, offRoad[19])
				showNote("Spawning: ~g~" .. offRoad[19])
			
			elseif WarMenu.Button(offRoad[20]) then
			
				spawnVeh(target, offRoad[20])
				showNote("Spawning: ~g~" .. offRoad[20])
			
			elseif WarMenu.Button(offRoad[21]) then
			
				spawnVeh(target, offRoad[21])
				showNote("Spawning: ~g~" .. offRoad[21])
			
			elseif WarMenu.Button(offRoad[22]) then
			
				spawnVeh(target, offRoad[22])
				showNote("Spawning: ~g~" .. offRoad[22])
			
			elseif WarMenu.Button(offRoad[23]) then
			
				spawnVeh(target, offRoad[23])
				showNote("Spawning: ~g~" .. offRoad[23])
			
			elseif WarMenu.Button(offRoad[24]) then
			
				spawnVeh(target, offRoad[24])
				showNote("Spawning: ~g~" .. offRoad[24])
			
			elseif WarMenu.Button(offRoad[25]) then
			
				spawnVeh(target, offRoad[25])
				showNote("Spawning: ~g~" .. offRoad[25])
			
			end
			
			WarMenu.Display()
		
		--SUV MENU
		
		elseif WarMenu.IsMenuOpened("SUV") then
			
			if WarMenu.Button(suv[1]) then
			
				spawnVeh(target, suv[1])
				showNote("Spawning: ~g~" .. suv[1])
			
			elseif WarMenu.Button(suv[2]) then
			
				spawnVeh(target, suv[2])
				showNote("Spawning: ~g~" .. suv[2])
			
			elseif WarMenu.Button(suv[3]) then
			
				spawnVeh(target, suv[3])
				showNote("Spawning: ~g~" .. suv[3])
			
			elseif WarMenu.Button(suv[4]) then
			
				spawnVeh(target, suv[4])
				showNote("Spawning: ~g~" .. suv[4])
			
			elseif WarMenu.Button(suv[5]) then
			
				spawnVeh(target, suv[5])
				showNote("Spawning: ~g~" .. suv[5])
			
			elseif WarMenu.Button(suv[6]) then
			
				spawnVeh(target, suv[6])
				showNote("Spawning: ~g~" .. suv[6])
			
			elseif WarMenu.Button(suv[7]) then
			
				spawnVeh(target, suv[7])
				showNote("Spawning: ~g~" .. suv[7])
			
			elseif WarMenu.Button(suv[8]) then
			
				spawnVeh(target, suv[8])
				showNote("Spawning: ~g~" .. suv[8])
			
			elseif WarMenu.Button(suv[9]) then
			
				spawnVeh(target, suv[9])
				showNote("Spawning: ~g~" .. suv[9])
			
			elseif WarMenu.Button(suv[10]) then
			
				spawnVeh(target, suv[10])
				showNote("Spawning: ~g~" .. suv[10])
			
			elseif WarMenu.Button(suv[11]) then
			
				spawnVeh(target, suv[11])
				showNote("Spawning: ~g~" .. suv[11])
			
			elseif WarMenu.Button(suv[12]) then
			
				spawnVeh(target, suv[12])
				showNote("Spawning: ~g~" .. suv[12])
			
			elseif WarMenu.Button(suv[13]) then
			
				spawnVeh(target, suv[13])
				showNote("Spawning: ~g~" .. suv[13])
			
			elseif WarMenu.Button(suv[14]) then
			
				spawnVeh(target, suv[14])
				showNote("Spawning: ~g~" .. suv[14])
			
			elseif WarMenu.Button(suv[15]) then
			
				spawnVeh(target, suv[15])
				showNote("Spawning: ~g~" .. suv[15])
			
			elseif WarMenu.Button(suv[16]) then
			
				spawnVeh(target, suv[16])
				showNote("Spawning: ~g~" .. suv[16])
			
			elseif WarMenu.Button(suv[17]) then
			
				spawnVeh(target, suv[17])
				showNote("Spawning: ~g~" .. suv[17])
			
			elseif WarMenu.Button(suv[18]) then
			
				spawnVeh(target, suv[18])
				showNote("Spawning: ~g~" .. suv[18])
			
			elseif WarMenu.Button(suv[19]) then
			
				spawnVeh(target, suv[19])
				showNote("Spawning: ~g~" .. suv[19])
			
			elseif WarMenu.Button(suv[20]) then
			
				spawnVeh(target, suv[20])
				showNote("Spawning: ~g~" .. suv[20])
			
			elseif WarMenu.Button(suv[21]) then
			
				spawnVeh(target, suv[21])
				showNote("Spawning: ~g~" .. suv[21])
			
			elseif WarMenu.Button(suv[22]) then
			
				spawnVeh(target, suv[22])
				showNote("Spawning: ~g~" .. suv[22])
			
			elseif WarMenu.Button(suv[23]) then
			
				spawnVeh(target, suv[23])
				showNote("Spawning: ~g~" .. suv[23])
			
			elseif WarMenu.Button(suv[24]) then
			
				spawnVeh(target, suv[24])
				showNote("Spawning: ~g~" .. suv[24])
			
			elseif WarMenu.Button(suv[25]) then
			
				spawnVeh(target, suv[25])
				showNote("Spawning: ~g~" .. suv[25])
			
			elseif WarMenu.Button(suv[26]) then
			
				spawnVeh(target, suv[26])
				showNote("Spawning: ~g~" .. suv[26])
			
			elseif WarMenu.Button(suv[27]) then
			
				spawnVeh(target, suv[27])
				showNote("Spawning: ~g~" .. suv[27])
			
			end
			
			WarMenu.Display()
		
		--HELICOPTER MENU
		
		elseif WarMenu.IsMenuOpened("Helicopter") then
			
			if WarMenu.Button(helicopter[1]) then
			
				spawnVeh(target, helicopter[1])
				showNote("Spawning: ~g~" .. helicopter[1])
			
			elseif WarMenu.Button(helicopter[2]) then
			
				spawnVeh(target, helicopter[2])
				showNote("Spawning: ~g~" .. helicopter[2])
			
			elseif WarMenu.Button(helicopter[3]) then
			
				spawnVeh(target, helicopter[3])
				showNote("Spawning: ~g~" .. helicopter[3])
			
			elseif WarMenu.Button(helicopter[4]) then
			
				spawnVeh(target, helicopter[4])
				showNote("Spawning: ~g~" .. helicopter[4])
			
			elseif WarMenu.Button(helicopter[5]) then
			
				spawnVeh(target, helicopter[5])
				showNote("Spawning: ~g~" .. helicopter[5])
			
			elseif WarMenu.Button(helicopter[6]) then
			
				spawnVeh(target, helicopter[6])
				showNote("Spawning: ~g~" .. helicopter[6])
			
			elseif WarMenu.Button(helicopter[7]) then
			
				spawnVeh(target, helicopter[7])
				showNote("Spawning: ~g~" .. helicopter[7])
			
			elseif WarMenu.Button(helicopter[8]) then
			
				spawnVeh(target, helicopter[8])
				showNote("Spawning: ~g~" .. helicopter[8])
			
			elseif WarMenu.Button(helicopter[9]) then
			
				spawnVeh(target, helicopter[9])
				showNote("Spawning: ~g~" .. helicopter[9])
			
			elseif WarMenu.Button(helicopter[10]) then
			
				spawnVeh(target, helicopter[10])
				showNote("Spawning: ~g~" .. helicopter[10])
			
			elseif WarMenu.Button(helicopter[11]) then
			
				spawnVeh(target, helicopter[11])
				showNote("Spawning: ~g~" .. helicopter[11])
			
			elseif WarMenu.Button(helicopter[12]) then
			
				spawnVeh(target, helicopter[12])
				showNote("Spawning: ~g~" .. helicopter[12])
			
			elseif WarMenu.Button(helicopter[13]) then
			
				spawnVeh(target, helicopter[13])
				showNote("Spawning: ~g~" .. helicopter[13])
			
			elseif WarMenu.Button(helicopter[14]) then
			
				spawnVeh(target, helicopter[14])
				showNote("Spawning: ~g~" .. helicopter[14])
			
			elseif WarMenu.Button(helicopter[15]) then
			
				spawnVeh(target, helicopter[15])
				showNote("Spawning: ~g~" .. helicopter[15])
			
			elseif WarMenu.Button(helicopter[16]) then
			
				spawnVeh(target, helicopter[16])
				showNote("Spawning: ~g~" .. helicopter[16])
			
			elseif WarMenu.Button(helicopter[17]) then
			
				spawnVeh(target, helicopter[17])
				showNote("Spawning: ~g~" .. helicopter[17])
			
			elseif WarMenu.Button(helicopter[18]) then
			
				spawnVeh(target, helicopter[18])
				showNote("Spawning: ~g~" .. helicopter[18])
			
			elseif WarMenu.Button(helicopter[19]) then
			
				spawnVeh(target, helicopter[19])
				showNote("Spawning: ~g~" .. helicopter[19])
			
			elseif WarMenu.Button(helicopter[20]) then
			
				spawnVeh(target, helicopter[20])
				showNote("Spawning: ~g~" .. helicopter[20])
			
			end
			
			WarMenu.Display()
		
		--PLANE MENU
		
		elseif WarMenu.IsMenuOpened("Plane") then
			
			if WarMenu.Button(plane[1]) then
			
				spawnVeh(target, plane[1])
				showNote("Spawning: ~g~" .. plane[1])
			
			elseif WarMenu.Button(plane[2]) then
			
				spawnVeh(target, plane[2])
				showNote("Spawning: ~g~" .. plane[2])
			
			elseif WarMenu.Button(plane[3]) then
			
				spawnVeh(target, plane[3])
				showNote("Spawning: ~g~" .. plane[3])
			
			elseif WarMenu.Button(plane[4]) then
			
				spawnVeh(target, plane[4])
				showNote("Spawning: ~g~" .. plane[4])
			
			elseif WarMenu.Button(plane[5]) then
			
				spawnVeh(target, plane[5])
				showNote("Spawning: ~g~" .. plane[5])
			
			elseif WarMenu.Button(plane[6]) then
			
				spawnVeh(target, plane[6])
				showNote("Spawning: ~g~" .. plane[6])
			
			elseif WarMenu.Button(plane[7]) then
			
				spawnVeh(target, plane[7])
				showNote("Spawning: ~g~" .. plane[7])
			
			elseif WarMenu.Button(plane[8]) then
			
				spawnVeh(target, plane[8])
				showNote("Spawning: ~g~" .. plane[8])
			
			elseif WarMenu.Button(plane[9]) then
			
				spawnVeh(target, plane[9])
				showNote("Spawning: ~g~" .. plane[9])
			
			elseif WarMenu.Button(plane[10]) then
			
				spawnVeh(target, plane[10])
				showNote("Spawning: ~g~" .. plane[10])
			
			elseif WarMenu.Button(plane[11]) then
			
				spawnVeh(target, plane[11])
				showNote("Spawning: ~g~" .. plane[11])
			
			elseif WarMenu.Button(plane[12]) then
			
				spawnVeh(target, plane[12])
				showNote("Spawning: ~g~" .. plane[12])
			
			elseif WarMenu.Button(plane[13]) then
			
				spawnVeh(target, plane[13])
				showNote("Spawning: ~g~" .. plane[13])
			
			elseif WarMenu.Button(plane[14]) then
			
				spawnVeh(target, plane[14])
				showNote("Spawning: ~g~" .. plane[14])
			
			elseif WarMenu.Button(plane[15]) then
			
				spawnVeh(target, plane[15])
				showNote("Spawning: ~g~" .. plane[15])
			
			elseif WarMenu.Button(plane[16]) then
			
				spawnVeh(target, plane[16])
				showNote("Spawning: ~g~" .. plane[16])
			
			elseif WarMenu.Button(plane[17]) then
			
				spawnVeh(target, plane[17])
				showNote("Spawning: ~g~" .. plane[17])
			
			elseif WarMenu.Button(plane[18]) then
			
				spawnVeh(target, plane[18])
				showNote("Spawning: ~g~" .. plane[18])
			
			elseif WarMenu.Button(plane[19]) then
			
				spawnVeh(target, plane[19])
				showNote("Spawning: ~g~" .. plane[19])
			
			elseif WarMenu.Button(plane[20]) then
			
				spawnVeh(target, plane[20])
				showNote("Spawning: ~g~" .. plane[20])
			
			elseif WarMenu.Button(plane[21]) then
			
				spawnVeh(target, plane[21])
				showNote("Spawning: ~g~" .. plane[21])
			
			elseif WarMenu.Button(plane[22]) then
			
				spawnVeh(target, plane[22])
				showNote("Spawning: ~g~" .. plane[22])
			
			end
			
			WarMenu.Display()
		
		--EMERGENCY MENU
		
		elseif WarMenu.IsMenuOpened("Emergency") then
			
			if WarMenu.Button(emergency[1]) then
			
				spawnVeh(target, emergency[1])
				showNote("Spawning: ~g~" .. emergency[1])
			
			elseif WarMenu.Button(emergency[2]) then
			
				spawnVeh(target, emergency[2])
				showNote("Spawning: ~g~" .. emergency[2])
			
			elseif WarMenu.Button(emergency[3]) then
			
				spawnVeh(target, emergency[3])
				showNote("Spawning: ~g~" .. emergency[3])
			
			elseif WarMenu.Button(emergency[4]) then
			
				spawnVeh(target, emergency[4])
				showNote("Spawning: ~g~" .. emergency[4])
			
			elseif WarMenu.Button(emergency[5]) then
			
				spawnVeh(target, emergency[5])
				showNote("Spawning: ~g~" .. emergency[5])
			
			elseif WarMenu.Button(emergency[6]) then
			
				spawnVeh(target, emergency[6])
				showNote("Spawning: ~g~" .. emergency[6])
			
			elseif WarMenu.Button(emergency[7]) then
			
				spawnVeh(target, emergency[7])
				showNote("Spawning: ~g~" .. emergency[7])
			
			elseif WarMenu.Button(emergency[8]) then
			
				spawnVeh(target, emergency[8])
				showNote("Spawning: ~g~" .. emergency[8])
			
			elseif WarMenu.Button(emergency[9]) then
			
				spawnVeh(target, emergency[9])
				showNote("Spawning: ~g~" .. emergency[9])
			
			elseif WarMenu.Button(emergency[10]) then
			
				spawnVeh(target, emergency[10])
				showNote("Spawning: ~g~" .. emergency[10])
			
			elseif WarMenu.Button(emergency[11]) then
			
				spawnVeh(target, emergency[11])
				showNote("Spawning: ~g~" .. emergency[11])
			
			elseif WarMenu.Button(emergency[12]) then
			
				spawnVeh(target, emergency[12])
				showNote("Spawning: ~g~" .. emergency[12])
			
			elseif WarMenu.Button(emergency[13]) then
			
				spawnVeh(target, emergency[13])
				showNote("Spawning: ~g~" .. emergency[13])
			
			elseif WarMenu.Button(emergency[14]) then
			
				spawnVeh(target, emergency[14])
				showNote("Spawning: ~g~" .. emergency[14])
			
			elseif WarMenu.Button(emergency[15]) then
			
				spawnVeh(target, emergency[15])
				showNote("Spawning: ~g~" .. emergency[15])
			
			elseif WarMenu.Button(emergency[16]) then
			
				spawnVeh(target, emergency[16])
				showNote("Spawning: ~g~" .. emergency[16])
			
			elseif WarMenu.Button(emergency[17]) then
			
				spawnVeh(target, emergency[17])
				showNote("Spawning: ~g~" .. emergency[17])
			
			elseif WarMenu.Button(emergency[18]) then
			
				spawnVeh(target, emergency[18])
				showNote("Spawning: ~g~" .. emergency[18])
			
			end
			
			WarMenu.Display()
		
		--SERVICE MENU
		
		elseif WarMenu.IsMenuOpened("Service") then
			
			if WarMenu.Button(service[1]) then
			
				spawnVeh(target, service[1])
				showNote("Spawning: ~g~" .. service[1])
			
			elseif WarMenu.Button(service[2]) then
			
				spawnVeh(target, service[2])
				showNote("Spawning: ~g~" .. service[2])
			
			elseif WarMenu.Button(service[3]) then
			
				spawnVeh(target, service[3])
				showNote("Spawning: ~g~" .. service[3])
			
			elseif WarMenu.Button(service[4]) then
			
				spawnVeh(target, service[4])
				showNote("Spawning: ~g~" .. service[4])
			
			elseif WarMenu.Button(service[5]) then
			
				spawnVeh(target, service[5])
				showNote("Spawning: ~g~" .. service[5])
			
			elseif WarMenu.Button(service[6]) then
			
				spawnVeh(target, service[6])
				showNote("Spawning: ~g~" .. service[6])
			
			elseif WarMenu.Button(service[7]) then
			
				spawnVeh(target, service[7])
				showNote("Spawning: ~g~" .. service[7])
			
			elseif WarMenu.Button(service[8]) then
			
				spawnVeh(target, service[8])
				showNote("Spawning: ~g~" .. service[8])
			
			elseif WarMenu.Button(service[9]) then
			
				spawnVeh(target, service[9])
				showNote("Spawning: ~g~" .. service[9])
			
			elseif WarMenu.Button(service[10]) then
			
				spawnVeh(target, service[10])
				showNote("Spawning: ~g~" .. service[10])
			
			end
			
			WarMenu.Display()
		
		--MILITARY MENU
		
		elseif WarMenu.IsMenuOpened("Military") then
			
			if WarMenu.Button(military[1]) then
			
				spawnVeh(target, military[1])
				showNote("Spawning: ~g~" .. military[1])
			
			elseif WarMenu.Button(military[2]) then
			
				spawnVeh(target, military[2])
				showNote("Spawning: ~g~" .. military[2])
			
			elseif WarMenu.Button(military[3]) then
			
				spawnVeh(target, military[3])
				showNote("Spawning: ~g~" .. military[3])
			
			elseif WarMenu.Button(military[4]) then
			
				spawnVeh(target, military[4])
				showNote("Spawning: ~g~" .. military[4])
			
			elseif WarMenu.Button(military[5]) then
			
				spawnVeh(target, military[5])
				showNote("Spawning: ~g~" .. military[5])
			
			end
			
			WarMenu.Display()
		
		--COMMERCIAL MENU
		
		elseif WarMenu.IsMenuOpened("Commercial") then
			
			if WarMenu.Button(commercial[1]) then
			
				spawnVeh(target, commercial[1])
				showNote("Spawning: ~g~" .. commercial[1])
			
			elseif WarMenu.Button(commercial[2]) then
			
				spawnVeh(target, commercial[2])
				showNote("Spawning: ~g~" .. commercial[2])
			
			elseif WarMenu.Button(commercial[3]) then
			
				spawnVeh(target, commercial[3])
				showNote("Spawning: ~g~" .. commercial[3])
			
			elseif WarMenu.Button(commercial[4]) then
			
				spawnVeh(target, commercial[4])
				showNote("Spawning: ~g~" .. commercial[4])
			
			elseif WarMenu.Button(commercial[5]) then
			
				spawnVeh(target, commercial[5])
				showNote("Spawning: ~g~" .. commercial[5])
			
			elseif WarMenu.Button(commercial[6]) then
			
				spawnVeh(target, commercial[6])
				showNote("Spawning: ~g~" .. commercial[6])
			
			elseif WarMenu.Button(commercial[7]) then
			
				spawnVeh(target, commercial[7])
				showNote("Spawning: ~g~" .. commercial[7])
			
			elseif WarMenu.Button(commercial[8]) then
			
				spawnVeh(target, commercial[8])
				showNote("Spawning: ~g~" .. commercial[8])
			
			elseif WarMenu.Button(commercial[9]) then
			
				spawnVeh(target, commercial[9])
				showNote("Spawning: ~g~" .. commercial[9])
			
			elseif WarMenu.Button(commercial[10]) then
			
				spawnVeh(target, commercial[10])
				showNote("Spawning: ~g~" .. commercial[10])
			
			elseif WarMenu.Button(commercial[11]) then
			
				spawnVeh(target, commercial[11])
				showNote("Spawning: ~g~" .. commercial[11])
			
			end
			
			WarMenu.Display()
		
		--VAN MENU
		
		elseif WarMenu.IsMenuOpened("Van") then
			
			if WarMenu.Button(van[1]) then
			
				spawnVeh(target, van[1])
				showNote("Spawning: ~g~" .. van[1])
			
			elseif WarMenu.Button(van[2]) then
			
				spawnVeh(target, van[2])
				showNote("Spawning: ~g~" .. van[2])
			
			elseif WarMenu.Button(van[3]) then
			
				spawnVeh(target, van[3])
				showNote("Spawning: ~g~" .. van[3])
			
			elseif WarMenu.Button(van[4]) then
			
				spawnVeh(target, van[4])
				showNote("Spawning: ~g~" .. van[4])
			
			elseif WarMenu.Button(van[5]) then
			
				spawnVeh(target, van[5])
				showNote("Spawning: ~g~" .. van[5])
			
			elseif WarMenu.Button(van[6]) then
			
				spawnVeh(target, van[6])
				showNote("Spawning: ~g~" .. van[6])
			
			elseif WarMenu.Button(van[7]) then
			
				spawnVeh(target, van[7])
				showNote("Spawning: ~g~" .. van[7])
			
			elseif WarMenu.Button(van[8]) then
			
				spawnVeh(target, van[8])
				showNote("Spawning: ~g~" .. van[8])
			
			elseif WarMenu.Button(van[9]) then
			
				spawnVeh(target, van[9])
				showNote("Spawning: ~g~" .. van[9])
			
			elseif WarMenu.Button(van[10]) then
			
				spawnVeh(target, van[10])
				showNote("Spawning: ~g~" .. van[10])
			
			elseif WarMenu.Button(van[11]) then
			
				spawnVeh(target, van[11])
				showNote("Spawning: ~g~" .. van[11])
			
			elseif WarMenu.Button(van[12]) then
			
				spawnVeh(target, van[12])
				showNote("Spawning: ~g~" .. van[12])
			
			elseif WarMenu.Button(van[13]) then
			
				spawnVeh(target, van[13])
				showNote("Spawning: ~g~" .. van[13])
			
			elseif WarMenu.Button(van[14]) then
			
				spawnVeh(target, van[14])
				showNote("Spawning: ~g~" .. van[14])
			
			elseif WarMenu.Button(van[15]) then
			
				spawnVeh(target, van[15])
				showNote("Spawning: ~g~" .. van[15])
			
			elseif WarMenu.Button(van[16]) then
			
				spawnVeh(target, van[16])
				showNote("Spawning: ~g~" .. van[16])
			
			elseif WarMenu.Button(van[17]) then
			
				spawnVeh(target, van[17])
				showNote("Spawning: ~g~" .. van[17])
			
			elseif WarMenu.Button(van[18]) then
			
				spawnVeh(target, van[18])
				showNote("Spawning: ~g~" .. van[18])
			
			elseif WarMenu.Button(van[19]) then
			
				spawnVeh(target, van[19])
				showNote("Spawning: ~g~" .. van[19])
			
			elseif WarMenu.Button(van[20]) then
			
				spawnVeh(target, van[20])
				showNote("Spawning: ~g~" .. van[20])
			
			elseif WarMenu.Button(van[21]) then
			
				spawnVeh(target, van[21])
				showNote("Spawning: ~g~" .. van[21])
			
			elseif WarMenu.Button(van[22]) then
			
				spawnVeh(target, van[22])
				showNote("Spawning: ~g~" .. van[22])
			
			elseif WarMenu.Button(van[23]) then
			
				spawnVeh(target, van[23])
				showNote("Spawning: ~g~" .. van[23])
			
			elseif WarMenu.Button(van[24]) then
			
				spawnVeh(target, van[24])
				showNote("Spawning: ~g~" .. van[24])
			
			elseif WarMenu.Button(van[25]) then
			
				spawnVeh(target, van[25])
				showNote("Spawning: ~g~" .. van[25])
			
			elseif WarMenu.Button(van[26]) then
			
				spawnVeh(target, van[26])
				showNote("Spawning: ~g~" .. van[26])
			
			elseif WarMenu.Button(van[27]) then
			
				spawnVeh(target, van[27])
				showNote("Spawning: ~g~" .. van[27])
			
			elseif WarMenu.Button(van[28]) then
			
				spawnVeh(target, van[28])
				showNote("Spawning: ~g~" .. van[28])
			
			elseif WarMenu.Button(van[29]) then
			
				spawnVeh(target, van[29])
				showNote("Spawning: ~g~" .. van[29])
			
			elseif WarMenu.Button(van[30]) then
			
				spawnVeh(target, van[30])
				showNote("Spawning: ~g~" .. van[30])
			
			elseif WarMenu.Button(van[31]) then
			
				spawnVeh(target, van[31])
				showNote("Spawning: ~g~" .. van[31])
			
			end
			
			WarMenu.Display()
		
		--INDUSTRIAL MENU
		
		elseif WarMenu.IsMenuOpened("Industrial") then
			
			if WarMenu.Button(industrial[1]) then
			
				spawnVeh(target, industrial[1])
				showNote("Spawning: ~g~" .. industrial[1])
			
			elseif WarMenu.Button(industrial[2]) then
			
				spawnVeh(target, industrial[2])
				showNote("Spawning: ~g~" .. industrial[2])
			
			elseif WarMenu.Button(industrial[3]) then
			
				spawnVeh(target, industrial[3])
				showNote("Spawning: ~g~" .. industrial[3])
			
			elseif WarMenu.Button(industrial[4]) then
			
				spawnVeh(target, industrial[4])
				showNote("Spawning: ~g~" .. industrial[4])
			
			elseif WarMenu.Button(industrial[5]) then
			
				spawnVeh(target, industrial[5])
				showNote("Spawning: ~g~" .. industrial[5])
			
			elseif WarMenu.Button(industrial[6]) then
			
				spawnVeh(target, industrial[6])
				showNote("Spawning: ~g~" .. industrial[6])
			
			elseif WarMenu.Button(industrial[7]) then
			
				spawnVeh(target, industrial[7])
				showNote("Spawning: ~g~" .. industrial[7])
			
			elseif WarMenu.Button(industrial[8]) then
			
				spawnVeh(target, industrial[8])
				showNote("Spawning: ~g~" .. industrial[8])
			
			elseif WarMenu.Button(industrial[9]) then
			
				spawnVeh(target, industrial[9])
				showNote("Spawning: ~g~" .. industrial[9])
			
			elseif WarMenu.Button(industrial[10]) then
			
				spawnVeh(target, industrial[10])
				showNote("Spawning: ~g~" .. industrial[10])
			
			elseif WarMenu.Button(industrial[11]) then
			
				spawnVeh(target, industrial[11])
				showNote("Spawning: ~g~" .. industrial[11])
			
			end
			
			WarMenu.Display()
		
		--BOAT MENU
		
		elseif WarMenu.IsMenuOpened("Boat") then
			
			if WarMenu.Button(boat[1]) then
			
				spawnVeh(target, boat[1])
				showNote("Spawning: ~g~" .. boat[1])
			
			elseif WarMenu.Button(boat[2]) then
			
				spawnVeh(target, boat[2])
				showNote("Spawning: ~g~" .. boat[2])
			
			elseif WarMenu.Button(boat[3]) then
			
				spawnVeh(target, boat[3])
				showNote("Spawning: ~g~" .. boat[3])
			
			elseif WarMenu.Button(boat[4]) then
			
				spawnVeh(target, boat[4])
				showNote("Spawning: ~g~" .. boat[4])
			
			elseif WarMenu.Button(boat[5]) then
			
				spawnVeh(target, boat[5])
				showNote("Spawning: ~g~" .. boat[5])
			
			elseif WarMenu.Button(boat[6]) then
			
				spawnVeh(target, boat[6])
				showNote("Spawning: ~g~" .. boat[6])
			
			elseif WarMenu.Button(boat[7]) then
			
				spawnVeh(target, boat[7])
				showNote("Spawning: ~g~" .. boat[7])
			
			elseif WarMenu.Button(boat[8]) then
			
				spawnVeh(target, boat[8])
				showNote("Spawning: ~g~" .. boat[8])
			
			elseif WarMenu.Button(boat[9]) then
			
				spawnVeh(target, boat[9])
				showNote("Spawning: ~g~" .. boat[9])
			
			elseif WarMenu.Button(boat[10]) then
			
				spawnVeh(target, boat[10])
				showNote("Spawning: ~g~" .. boat[10])
			
			elseif WarMenu.Button(boat[11]) then
			
				spawnVeh(target, boat[11])
				showNote("Spawning: ~g~" .. boat[11])
			
			elseif WarMenu.Button(boat[12]) then
			
				spawnVeh(target, boat[12])
				showNote("Spawning: ~g~" .. boat[12])
			
			elseif WarMenu.Button(boat[13]) then
			
				spawnVeh(target, boat[13])
				showNote("Spawning: ~g~" .. boat[13])
			
			elseif WarMenu.Button(boat[14]) then
			
				spawnVeh(target, boat[14])
				showNote("Spawning: ~g~" .. boat[14])
			
			elseif WarMenu.Button(boat[15]) then
			
				spawnVeh(target, boat[15])
				showNote("Spawning: ~g~" .. boat[15])
			
			elseif WarMenu.Button(boat[16]) then
			
				spawnVeh(target, boat[16])
				showNote("Spawning: ~g~" .. boat[16])
			
			elseif WarMenu.Button(boat[17]) then
			
				spawnVeh(target, boat[17])
				showNote("Spawning: ~g~" .. boat[17])
			
			elseif WarMenu.Button(boat[18]) then
			
				spawnVeh(target, boat[18])
				showNote("Spawning: ~g~" .. boat[18])
			
			elseif WarMenu.Button(boat[19]) then
			
				spawnVeh(target, boat[19])
				showNote("Spawning: ~g~" .. boat[19])
			
			elseif WarMenu.Button(boat[20]) then
			
				spawnVeh(target, boat[20])
				showNote("Spawning: ~g~" .. boat[20])
			
			end
			
			WarMenu.Display()
		
		--RAIL MENU
		
		elseif WarMenu.IsMenuOpened("Rail") then
			
			if WarMenu.Button(rail[1]) then
			
				spawnVeh(target, rail[1])
				showNote("Spawning: ~g~" .. rail[1])
			
			elseif WarMenu.Button(rail[2]) then
			
				spawnVeh(target, rail[2])
				showNote("Spawning: ~g~" .. rail[2])
			
			elseif WarMenu.Button(rail[3]) then
			
				spawnVeh(target, rail[3])
				showNote("Spawning: ~g~" .. rail[3])
			
			elseif WarMenu.Button(rail[4]) then
			
				spawnVeh(target, rail[4])
				showNote("Spawning: ~g~" .. rail[4])
			
			elseif WarMenu.Button(rail[5]) then
			
				spawnVeh(target, rail[5])
				showNote("Spawning: ~g~" .. rail[5])
			
			elseif WarMenu.Button(rail[6]) then
			
				spawnVeh(target, rail[6])
				showNote("Spawning: ~g~" .. rail[6])
			
			elseif WarMenu.Button(rail[7]) then
			
				spawnVeh(target, rail[7])
				showNote("Spawning: ~g~" .. rail[7])
			
			elseif WarMenu.Button(rail[8]) then
			
				spawnVeh(target, rail[8])
				showNote("Spawning: ~g~" .. rail[8])
			
			end
			
			WarMenu.Display()
		
		--UTILITY MENU
		
		elseif WarMenu.IsMenuOpened("Utility") then
			
			if WarMenu.Button(utility[1]) then
			
				spawnVeh(target, utility[1])
				showNote("Spawning: ~g~" .. utility[1])
			
			elseif WarMenu.Button(utility[2]) then
			
				spawnVeh(target, utility[2])
				showNote("Spawning: ~g~" .. utility[2])
			
			elseif WarMenu.Button(utility[3]) then
			
				spawnVeh(target, utility[3])
				showNote("Spawning: ~g~" .. utility[3])
			
			elseif WarMenu.Button(utility[4]) then
			
				spawnVeh(target, utility[4])
				showNote("Spawning: ~g~" .. utility[4])
			
			elseif WarMenu.Button(utility[5]) then
			
				spawnVeh(target, utility[5])
				showNote("Spawning: ~g~" .. utility[5])
			
			elseif WarMenu.Button(utility[6]) then
			
				spawnVeh(target, utility[6])
				showNote("Spawning: ~g~" .. utility[6])
			
			elseif WarMenu.Button(utility[7]) then
			
				spawnVeh(target, utility[7])
				showNote("Spawning: ~g~" .. utility[7])
			
			elseif WarMenu.Button(utility[8]) then
			
				spawnVeh(target, utility[8])
				showNote("Spawning: ~g~" .. utility[8])
			
			elseif WarMenu.Button(utility[9]) then
			
				spawnVeh(target, utility[9])
				showNote("Spawning: ~g~" .. utility[9])
			
			elseif WarMenu.Button(utility[10]) then
			
				spawnVeh(target, utility[10])
				showNote("Spawning: ~g~" .. utility[10])
			
			elseif WarMenu.Button(utility[11]) then
			
				spawnVeh(target, utility[11])
				showNote("Spawning: ~g~" .. utility[11])
			
			elseif WarMenu.Button(utility[12]) then
			
				spawnVeh(target, utility[12])
				showNote("Spawning: ~g~" .. utility[12])
			
			elseif WarMenu.Button(utility[13]) then
			
				spawnVeh(target, utility[13])
				showNote("Spawning: ~g~" .. utility[13])
			
			elseif WarMenu.Button(utility[14]) then
			
				spawnVeh(target, utility[14])
				showNote("Spawning: ~g~" .. utility[14])
			
			elseif WarMenu.Button(utility[15]) then
			
				spawnVeh(target, utility[15])
				showNote("Spawning: ~g~" .. utility[15])
			
			elseif WarMenu.Button(utility[16]) then
			
				spawnVeh(target, utility[16])
				showNote("Spawning: ~g~" .. utility[16])
			
			elseif WarMenu.Button(utility[17]) then
			
				spawnVeh(target, utility[17])
				showNote("Spawning: ~g~" .. utility[17])
			
			elseif WarMenu.Button(utility[18]) then
			
				spawnVeh(target, utility[18])
				showNote("Spawning: ~g~" .. utility[18])
			
			elseif WarMenu.Button(utility[19]) then
			
				spawnVeh(target, utility[19])
				showNote("Spawning: ~g~" .. utility[19])
			
			elseif WarMenu.Button(utility[20]) then
			
				spawnVeh(target, utility[20])
				showNote("Spawning: ~g~" .. utility[20])
			
			elseif WarMenu.Button(utility[21]) then
			
				spawnVeh(target, utility[21])
				showNote("Spawning: ~g~" .. utility[21])
			
			elseif WarMenu.Button(utility[22]) then
			
				spawnVeh(target, utility[22])
				showNote("Spawning: ~g~" .. utility[22])
			
			elseif WarMenu.Button(utility[23]) then
			
				spawnVeh(target, utility[23])
				showNote("Spawning: ~g~" .. utility[23])
			
			elseif WarMenu.Button(utility[24]) then
			
				spawnVeh(target, utility[24])
				showNote("Spawning: ~g~" .. utility[24])
			
			elseif WarMenu.Button(utility[25]) then
			
				spawnVeh(target, utility[25])
				showNote("Spawning: ~g~" .. utility[25])
			
			elseif WarMenu.Button(utility[26]) then
			
				spawnVeh(target, utility[26])
				showNote("Spawning: ~g~" .. utility[26])
			
			elseif WarMenu.Button(utility[27]) then
			
				spawnVeh(target, utility[27])
				showNote("Spawning: ~g~" .. utility[27])
			
			elseif WarMenu.Button(utility[28]) then
			
				spawnVeh(target, utility[28])
				showNote("Spawning: ~g~" .. utility[28])
			
			elseif WarMenu.Button(utility[29]) then
			
				spawnVeh(target, utility[29])
				showNote("Spawning: ~g~" .. utility[29])
			
			elseif WarMenu.Button(utility[30]) then
			
				spawnVeh(target, utility[30])
				showNote("Spawning: ~g~" .. utility[30])
			
			elseif WarMenu.Button(utility[31]) then
			
				spawnVeh(target, utility[31])
				showNote("Spawning: ~g~" .. utility[31])
			
			elseif WarMenu.Button(utility[32]) then
			
				spawnVeh(target, utility[32])
				showNote("Spawning: ~g~" .. utility[32])
			
			elseif WarMenu.Button(utility[33]) then
			
				spawnVeh(target, utility[33])
				showNote("Spawning: ~g~" .. utility[33])
			
			elseif WarMenu.Button(utility[34]) then
			
				spawnVeh(target, utility[34])
				showNote("Spawning: ~g~" .. utility[34])
			
			elseif WarMenu.Button(utility[35]) then
			
				spawnVeh(target, utility[35])
				showNote("Spawning: ~g~" .. utility[35])
			
			elseif WarMenu.Button(utility[36]) then
			
				spawnVeh(target, utility[36])
				showNote("Spawning: ~g~" .. utility[36])
			
			elseif WarMenu.Button(utility[37]) then
			
				spawnVeh(target, utility[37])
				showNote("Spawning: ~g~" .. utility[37])
			
			elseif WarMenu.Button(utility[38]) then
			
				spawnVeh(target, utility[38])
				showNote("Spawning: ~g~" .. utility[38])
			
			elseif WarMenu.Button(utility[39]) then
			
				spawnVeh(target, utility[39])
				showNote("Spawning: ~g~" .. utility[39])
			
			elseif WarMenu.Button(utility[40]) then
			
				spawnVeh(target, utility[40])
				showNote("Spawning: ~g~" .. utility[40])
			
			end
			
			WarMenu.Display()
		
		--MUSCLE MENU
		
		elseif WarMenu.IsMenuOpened("Muscle") then
			
			if WarMenu.Button(muscle[1]) then
			
				spawnVeh(target, muscle[1])
				showNote("Spawning: ~g~" .. muscle[1])
			
			elseif WarMenu.Button(muscle[2]) then
			
				spawnVeh(target, muscle[2])
				showNote("Spawning: ~g~" .. muscle[2])
			
			elseif WarMenu.Button(muscle[3]) then
			
				spawnVeh(target, muscle[3])
				showNote("Spawning: ~g~" .. muscle[3])
			
			elseif WarMenu.Button(muscle[4]) then
			
				spawnVeh(target, muscle[4])
				showNote("Spawning: ~g~" .. muscle[4])
			
			elseif WarMenu.Button(muscle[5]) then
			
				spawnVeh(target, muscle[5])
				showNote("Spawning: ~g~" .. muscle[5])
			
			elseif WarMenu.Button(muscle[6]) then
			
				spawnVeh(target, muscle[6])
				showNote("Spawning: ~g~" .. muscle[6])
			
			elseif WarMenu.Button(muscle[7]) then
			
				spawnVeh(target, muscle[7])
				showNote("Spawning: ~g~" .. muscle[7])
			
			elseif WarMenu.Button(muscle[8]) then
			
				spawnVeh(target, muscle[8])
				showNote("Spawning: ~g~" .. muscle[8])
			
			elseif WarMenu.Button(muscle[9]) then
			
				spawnVeh(target, muscle[9])
				showNote("Spawning: ~g~" .. muscle[9])
			
			elseif WarMenu.Button(muscle[10]) then
			
				spawnVeh(target, muscle[10])
				showNote("Spawning: ~g~" .. muscle[10])
			
			elseif WarMenu.Button(muscle[11]) then
			
				spawnVeh(target, muscle[11])
				showNote("Spawning: ~g~" .. muscle[11])
			
			elseif WarMenu.Button(muscle[12]) then
			
				spawnVeh(target, muscle[12])
				showNote("Spawning: ~g~" .. muscle[12])
			
			elseif WarMenu.Button(muscle[13]) then
			
				spawnVeh(target, muscle[13])
				showNote("Spawning: ~g~" .. muscle[13])
			
			elseif WarMenu.Button(muscle[14]) then
			
				spawnVeh(target, muscle[14])
				showNote("Spawning: ~g~" .. muscle[14])
			
			elseif WarMenu.Button(muscle[15]) then
			
				spawnVeh(target, muscle[15])
				showNote("Spawning: ~g~" .. muscle[15])
			
			elseif WarMenu.Button(muscle[16]) then
			
				spawnVeh(target, muscle[16])
				showNote("Spawning: ~g~" .. muscle[16])
			
			elseif WarMenu.Button(muscle[17]) then
			
				spawnVeh(target, muscle[17])
				showNote("Spawning: ~g~" .. muscle[17])
			
			elseif WarMenu.Button(muscle[18]) then
			
				spawnVeh(target, muscle[18])
				showNote("Spawning: ~g~" .. muscle[18])
			
			elseif WarMenu.Button(muscle[19]) then
			
				spawnVeh(target, muscle[19])
				showNote("Spawning: ~g~" .. muscle[19])
			
			elseif WarMenu.Button(muscle[20]) then
			
				spawnVeh(target, muscle[20])
				showNote("Spawning: ~g~" .. muscle[20])
			
			elseif WarMenu.Button(muscle[21]) then
			
				spawnVeh(target, muscle[21])
				showNote("Spawning: ~g~" .. muscle[21])
			
			elseif WarMenu.Button(muscle[22]) then
			
				spawnVeh(target, muscle[22])
				showNote("Spawning: ~g~" .. muscle[22])
			
			elseif WarMenu.Button(muscle[23]) then
			
				spawnVeh(target, muscle[23])
				showNote("Spawning: ~g~" .. muscle[23])
			
			elseif WarMenu.Button(muscle[24]) then
			
				spawnVeh(target, muscle[24])
				showNote("Spawning: ~g~" .. muscle[24])
			
			elseif WarMenu.Button(muscle[25]) then
			
				spawnVeh(target, muscle[25])
				showNote("Spawning: ~g~" .. muscle[25])
			
			elseif WarMenu.Button(muscle[26]) then
			
				spawnVeh(target, muscle[26])
				showNote("Spawning: ~g~" .. muscle[26])
			
			elseif WarMenu.Button(muscle[27]) then
			
				spawnVeh(target, muscle[27])
				showNote("Spawning: ~g~" .. muscle[27])
			
			elseif WarMenu.Button(muscle[28]) then
			
				spawnVeh(target, muscle[28])
				showNote("Spawning: ~g~" .. muscle[28])
			
			end
			
			WarMenu.Display()
		
		-- OPEN MENU
		
		elseif IsControlJustReleased(0, 244) then
		
			WarMenu.OpenMenu("PressM")
		
		end
		
		Citizen.Wait(0)
		
	end
	
end)
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

	local pistols = {"WEAPON_PISTOL", "WEAPON_COMBATPISTOL", "WEAPON_APPISTOL", "WEAPON_PISTOL50", "WEAPON_SNSPISTOL", "WEAPON_HEAVYPISTOL", "WEAPON_VINTAGEPISTOL", "WEAPON_MARKSMANPISTOL","WEAPON_REVOLVER", "WEAPON_STUNGUN", "WEAPON_FLAREGUN"}
	local smgs = {"WEAPON_SMG", "WEAPON_MICROSMG", "WEAPON_ASSAULTSMG", "WEAPON_COMBATPDW", "WEAPON_MINISMG", "WEAPON_MACHINEPISTOL"}
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
		
			if WarMenu.Button("Pistol") then
				
				giveWeapon(target, pistols[1], 100)
				
			elseif WarMenu.Button("Combat Pistol") then
				
				giveWeapon(target, pistols[2], 100)
				
			elseif WarMenu.Button("AP Pistol") then
				
				giveWeapon(target, pistols[3], 100)
				
			elseif WarMenu.Button("Pistol .50") then
				
				giveWeapon(target, pistols[4], 100)
				
			elseif WarMenu.Button("SNS Pistol") then
				
				giveWeapon(target, pistols[5], 100)
				
			elseif WarMenu.Button("Heavy Pistol") then
				
				giveWeapon(target, pistols[6], 100)
				
			elseif WarMenu.Button("Vintage Pistol") then
				
				giveWeapon(target, pistols[7], 100)
				
			elseif WarMenu.Button("Marksman Pistol") then
				
				giveWeapon(target, pistols[8], 100)
				
			elseif WarMenu.Button("Revolver") then
				
				giveWeapon(target, pistols[9], 100)
				
			elseif WarMenu.Button("Stun Gun") then
			
				giveWeapon(target, pistols[10], 100)
				
			elseif WarMenu.Button("Flare Gun") then
			
				giveWeapon(target, pistols[11], 100)
				
			end
			
			WarMenu.Display()
			
		-- SMGs MENU
				
		elseif WarMenu.IsMenuOpened("SMGs") then
		
			if WarMenu.Button("SMG") then
				
				giveWeapon(target, smgs[1], 100)
				
			elseif WarMenu.Button("Micro SMG") then
				
				giveWeapon(target, smgs[2], 100)
			
			elseif WarMenu.Button("Assault SMG") then
				
				giveWeapon(target, smgs[3], 100)
			
			elseif WarMenu.Button("Combat PDW") then
				
				giveWeapon(target, smgs[4], 100)
			
			elseif WarMenu.Button("Mini SMG") then
				
				giveWeapon(target, smgs[5], 100)
			
			elseif WarMenu.Button("Machine Pistol") then
				
				giveWeapon(target, smgs[6], 100)
			
			end
			
			WarMenu.Display()
			
		-- RIFLES MENU
		
		elseif WarMenu.IsMenuOpened("Rifles") then
		
			if WarMenu.Button("Assault Rifle") then
				
				giveWeapon(target, rifles[1], 100)
				
			elseif WarMenu.Button("Carbine Rifle") then
				
				giveWeapon(target, rifles[2], 100)
			
			elseif WarMenu.Button("Advanced Rifle") then
				
				giveWeapon(target, rifles[3], 100)
			
			elseif WarMenu.Button("Special Carbine") then
				
				giveWeapon(target, rifles[4], 100)
			
			elseif WarMenu.Button("Compact Rifle") then
				
				giveWeapon(target, rifles[5], 100)
			
			elseif WarMenu.Button("Bullpup Rifle") then
				
				giveWeapon(target, rifles[6], 100)
			
			elseif WarMenu.Button("Musket") then
				
				giveWeapon(target, rifles[7], 100)
			
			end
			
			WarMenu.Display()
			
		-- MACHINE GUNS
		
		elseif WarMenu.IsMenuOpened("Machine Guns") then
		
			if WarMenu.Button("MG") then
				
				giveWeapon(target, machineGuns[1], 100)
				
			elseif WarMenu.Button("Combat MG") then
				
				giveWeapon(target, machineGuns[2], 100)
				
			elseif WarMenu.Button("Gusenburg") then
			
				giveWeapon(target, machineGuns[3], 100)
			
			end
			
			WarMenu.Display()
			
		-- SHOTGUNS MENU
			
		elseif WarMenu.IsMenuOpened("Shotguns") then
		
			if WarMenu.Button("Pump Shotgun") then
				
				giveWeapon(target, shotguns[1], 100)
				
			elseif WarMenu.Button("Sawn Off Shotgun") then
				
				giveWeapon(target, shotguns[2], 100)
			
			elseif WarMenu.Button("Assault Shotgun") then
				
				giveWeapon(target, shotguns[3], 100)
			
			elseif WarMenu.Button("Pullpup Shotgun") then
				
				giveWeapon(target, shotguns[4], 100)
			
			elseif WarMenu.Button("Heavy Shotgun") then
				
				giveWeapon(target, shotguns[5], 100)
			
			elseif WarMenu.Button("DB Shotgun") then
				
				giveWeapon(target, shotguns[6], 100)
			
			elseif WarMenu.Button("Auto Shotgun") then
				
				giveWeapon(target, shotguns[7], 100)
			
			end
			
			WarMenu.Display()
			
		-- SNIPER MENU

		elseif WarMenu.IsMenuOpened("Sniper Rifles") then
		
			if WarMenu.Button("Sniper Rifle") then
				
				giveWeapon(target, snipers[1], 100)
				
			elseif WarMenu.Button("Heavy Sniper") then
				
				giveWeapon(target, snipers[2], 100)
			
			elseif WarMenu.Button("Marksman Rifle") then
				
				giveWeapon(target, snipers[3], 100)
			
			end
			
			WarMenu.Display()
			
		-- LAUNCHER MENU
		
		elseif WarMenu.IsMenuOpened("Launchers") then
		
			if WarMenu.Button("Grenade Launcher") then
				
				giveWeapon(target, launchers[1], 100)
				
			elseif WarMenu.Button("RPG") then
				
				giveWeapon(target, launchers[2], 100)
			
			elseif WarMenu.Button("Firework Launcher") then
				
				giveWeapon(target, launchers[3], 100)
			
			elseif WarMenu.Button("Homing Launcher") then
				
				giveWeapon(target, launchers[4], 100)
			
			elseif WarMenu.Button("Compact Launcher") then
				
				giveWeapon(target, launchers[5], 100)
			
			end
			
			WarMenu.Display()
			
		-- MELEE MENU
			
		elseif WarMenu.IsMenuOpened("Melee") then
		
			if WarMenu.Button("Knife") then
				
				giveWeapon(target, melee[1], 100)
				
			elseif WarMenu.Button("Nightstick") then
				
				giveWeapon(target, melee[2], 100)
			
			elseif WarMenu.Button("Hammer") then
				
				giveWeapon(target, melee[3], 100)
			
			elseif WarMenu.Button("Baseball Bat") then
				
				giveWeapon(target, melee[4], 100)
			
			elseif WarMenu.Button("Golf Club") then
				
				giveWeapon(target, melee[5], 100)
			
			elseif WarMenu.Button("Crowbar") then
				
				giveWeapon(target, melee[6], 100)
			
			elseif WarMenu.Button("Petrol Can") then
				
				giveWeapon(target, melee[7], 100)
			
			elseif WarMenu.Button("Fire Extinguisher") then
				
				giveWeapon(target, melee[8], 100)
			
			elseif WarMenu.Button("Bottle") then
				
				giveWeapon(target, melee[9], 100)
			
			elseif WarMenu.Button("Antique Cavalry Dagger") then
				
				giveWeapon(target, melee[10], 100)
			
			elseif WarMenu.Button("Knuckle Duster") then
				
				giveWeapon(target, melee[11], 100)
			
			elseif WarMenu.Button("Switchblade") then
				
				giveWeapon(target, melee[12], 100)
			
			elseif WarMenu.Button("Battleaxe") then
				
				giveWeapon(target, melee[13], 100)
			
			elseif WarMenu.Button("Pool Cue") then
				
				giveWeapon(target, melee[14], 100)
			
			elseif WarMenu.Button("Wrench") then
				
				giveWeapon(target, melee[15], 100)
			
			end
			
			WarMenu.Display()
			
		-- THROWN MENU
		
		elseif WarMenu.IsMenuOpened("Thrown") then
		
			if WarMenu.Button("Grenade") then
				
				giveWeapon(target, thrown[1], 100)
				
			elseif WarMenu.Button("Sticky Bomb") then
				
				giveWeapon(target, thrown[2], 100)
			
			elseif WarMenu.Button("Smoke Grenade") then
				
				giveWeapon(target, thrown[3], 100)
			
			elseif WarMenu.Button("BZ Gas") then
				
				giveWeapon(target, thrown[4], 100)
			
			elseif WarMenu.Button("Molotov") then
				
				giveWeapon(target, thrown[5], 100)
			
			elseif WarMenu.Button("Ball") then
				
				giveWeapon(target, thrown[6], 100)
			
			elseif WarMenu.Button("Flare") then
				
				giveWeapon(target, thrown[7], 100)
			
			elseif WarMenu.Button("Proximity Mine") then
				
				giveWeapon(target, thrown[8], 100)
			
			elseif WarMenu.Button("Pipebomb") then
				
				giveWeapon(target, thrown[9], 100)
			
			elseif WarMenu.Button("Snowball") then
				
				giveWeapon(target, thrown[10], 100)
			
			end
			
			WarMenu.Display()
			
		-- GADGETS MENU

		elseif WarMenu.IsMenuOpened("Gadgets") then
		
			if WarMenu.Button("Parachute") then
				
				giveWeapon(target, gadgets[1], 100)
				
			end
			
			WarMenu.Display()
			
		-- OP MENU
			
		elseif WarMenu.IsMenuOpened("OP") then
		
			if WarMenu.Button("Minigun") then
				
				giveWeapon(target, op[1], 1000)
			
			elseif WarMenu.Button("Railgun") then
				
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
		
		-- elseif WarMenu.IsMenuOpened("Sedan") then
			
			-- if WarMenu.Button(sports[1]) then
			
				-- spawnVeh(target, sports[1])
				-- showNote("Spawning: ~g~" .. sports[1])
			
			-- elseif WarMenu.Button(sports[2]) then
			
				-- spawnVeh(target, sports[2])
				-- showNote("Spawning: ~g~" .. sports[2])
			
			-- end
			
			-- WarMenu.Display()
		
		--CYCLE MENU
		
		-- elseif WarMenu.IsMenuOpened("Cycle") then
			
			-- if WarMenu.Button(sports[1]) then
			
				-- spawnVeh(target, sports[1])
				-- showNote("Spawning: ~g~" .. sports[1])
			
			-- elseif WarMenu.Button(sports[2]) then
			
				-- spawnVeh(target, sports[2])
				-- showNote("Spawning: ~g~" .. sports[2])
			
			-- end
			
			-- WarMenu.Display()
		
		--OFF ROAD MENU
		
		-- elseif WarMenu.IsMenuOpened("Off Road") then
			
			-- if WarMenu.Button(sports[1]) then
			
				-- spawnVeh(target, sports[1])
				-- showNote("Spawning: ~g~" .. sports[1])
			
			-- elseif WarMenu.Button(sports[2]) then
			
				-- spawnVeh(target, sports[2])
				-- showNote("Spawning: ~g~" .. sports[2])
			
			-- end
			
			-- WarMenu.Display()
		
		--SUV MENU
		
		-- elseif WarMenu.IsMenuOpened("SUV") then
			
			-- if WarMenu.Button(sports[1]) then
			
				-- spawnVeh(target, sports[1])
				-- showNote("Spawning: ~g~" .. sports[1])
			
			-- elseif WarMenu.Button(sports[2]) then
			
				-- spawnVeh(target, sports[2])
				-- showNote("Spawning: ~g~" .. sports[2])
			
			-- end
			
			-- WarMenu.Display()
		
		--HELICOPTER MENU
		
		-- elseif WarMenu.IsMenuOpened("Helicopter") then
			
			-- if WarMenu.Button(sports[1]) then
			
				-- spawnVeh(target, sports[1])
				-- showNote("Spawning: ~g~" .. sports[1])
			
			-- elseif WarMenu.Button(sports[2]) then
			
				-- spawnVeh(target, sports[2])
				-- showNote("Spawning: ~g~" .. sports[2])
			
			-- end
			
			-- WarMenu.Display()
		
		--PLANE MENU
		
		-- elseif WarMenu.IsMenuOpened("Plane") then
			
			-- if WarMenu.Button(sports[1]) then
			
				-- spawnVeh(target, sports[1])
				-- showNote("Spawning: ~g~" .. sports[1])
			
			-- elseif WarMenu.Button(sports[2]) then
			
				-- spawnVeh(target, sports[2])
				-- showNote("Spawning: ~g~" .. sports[2])
			
			-- end
			
			-- WarMenu.Display()
		
		--EMERGENCY MENU
		
		-- elseif WarMenu.IsMenuOpened("Emergency") then
			
			-- if WarMenu.Button(sports[1]) then
			
				-- spawnVeh(target, sports[1])
				-- showNote("Spawning: ~g~" .. sports[1])
			
			-- elseif WarMenu.Button(sports[2]) then
			
				-- spawnVeh(target, sports[2])
				-- showNote("Spawning: ~g~" .. sports[2])
			
			-- end
			
			-- WarMenu.Display()
		
		--SERVICE MENU
		
		-- elseif WarMenu.IsMenuOpened("Service") then
			
			-- if WarMenu.Button(sports[1]) then
			
				-- spawnVeh(target, sports[1])
				-- showNote("Spawning: ~g~" .. sports[1])
			
			-- elseif WarMenu.Button(sports[2]) then
			
				-- spawnVeh(target, sports[2])
				-- showNote("Spawning: ~g~" .. sports[2])
			
			-- end
			
			-- WarMenu.Display()
		
		--MILITARY MENU
		
		-- elseif WarMenu.IsMenuOpened("Military") then
			
			-- if WarMenu.Button(sports[1]) then
			
				-- spawnVeh(target, sports[1])
				-- showNote("Spawning: ~g~" .. sports[1])
			
			-- elseif WarMenu.Button(sports[2]) then
			
				-- spawnVeh(target, sports[2])
				-- showNote("Spawning: ~g~" .. sports[2])
			
			-- end
			
			-- WarMenu.Display()
		
		--COMMERCIAL MENU
		
		-- elseif WarMenu.IsMenuOpened("Commercial") then
			
			-- if WarMenu.Button(sports[1]) then
			
				-- spawnVeh(target, sports[1])
				-- showNote("Spawning: ~g~" .. sports[1])
			
			-- elseif WarMenu.Button(sports[2]) then
			
				-- spawnVeh(target, sports[2])
				-- showNote("Spawning: ~g~" .. sports[2])
			
			-- end
			
			-- WarMenu.Display()
		
		--VAN MENU
		
		-- elseif WarMenu.IsMenuOpened("Van") then
			
			-- if WarMenu.Button(sports[1]) then
			
				-- spawnVeh(target, sports[1])
				-- showNote("Spawning: ~g~" .. sports[1])
			
			-- elseif WarMenu.Button(sports[2]) then
			
				-- spawnVeh(target, sports[2])
				-- showNote("Spawning: ~g~" .. sports[2])
			
			-- end
			
			-- WarMenu.Display()
		
		--INDUSTRIAL MENU
		
		-- elseif WarMenu.IsMenuOpened("Industrial") then
			
			-- if WarMenu.Button(sports[1]) then
			
				-- spawnVeh(target, sports[1])
				-- showNote("Spawning: ~g~" .. sports[1])
			
			-- elseif WarMenu.Button(sports[2]) then
			
				-- spawnVeh(target, sports[2])
				-- showNote("Spawning: ~g~" .. sports[2])
			
			-- end
			
			-- WarMenu.Display()
		
		--BOAT MENU
		
		-- elseif WarMenu.IsMenuOpened("Boat") then
			
			-- if WarMenu.Button(sports[1]) then
			
				-- spawnVeh(target, sports[1])
				-- showNote("Spawning: ~g~" .. sports[1])
			
			-- elseif WarMenu.Button(sports[2]) then
			
				-- spawnVeh(target, sports[2])
				-- showNote("Spawning: ~g~" .. sports[2])
			
			-- end
			
			-- WarMenu.Display()
		
		--RAIL MENU
		
		-- elseif WarMenu.IsMenuOpened("Rail") then
			
			-- if WarMenu.Button(sports[1]) then
			
				-- spawnVeh(target, sports[1])
				-- showNote("Spawning: ~g~" .. sports[1])
			
			-- elseif WarMenu.Button(sports[2]) then
			
				-- spawnVeh(target, sports[2])
				-- showNote("Spawning: ~g~" .. sports[2])
			
			-- end
			
			-- WarMenu.Display()
		
		--UTILITY MENU
		
		-- elseif WarMenu.IsMenuOpened("Utility") then
			
			-- if WarMenu.Button(sports[1]) then
			
				-- spawnVeh(target, sports[1])
				-- showNote("Spawning: ~g~" .. sports[1])
			
			-- elseif WarMenu.Button(sports[2]) then
			
				-- spawnVeh(target, sports[2])
				-- showNote("Spawning: ~g~" .. sports[2])
			
			-- end
			
			-- WarMenu.Display()
		
		--MUSCLE MENU
		
		-- elseif WarMenu.IsMenuOpened("Muscle") then
			
			-- if WarMenu.Button(sports[1]) then
			
				-- spawnVeh(target, sports[1])
				-- showNote("Spawning: ~g~" .. sports[1])
			
			-- elseif WarMenu.Button(sports[2]) then
			
				-- spawnVeh(target, sports[2])
				-- showNote("Spawning: ~g~" .. sports[2])
			
			-- end
			
			-- WarMenu.Display()
		
		-- OPEN MENU
		
		elseif IsControlJustReleased(0, 244) then
		
			WarMenu.OpenMenu("PressM")
		
		end
		
		Citizen.Wait(0)
		
	end
	
end)

--DRAW_MARKER

--GetPlayersLastVehicle()

--SetPedCoordsKeepVehicle

--SetBlipCoords

--GetDistanceBetweenCoords
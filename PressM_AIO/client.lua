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
	
	showNote(x .. "~n~" .. y .. "~n~" .. z .. "~n~(also saved in F8)")
	Citizen.Trace("LOCATION: " .. x .. " " .. y .. " " .. z)
	
end

function wantedLevel(who, level)

	SetPlayerWantedLevel(who, level, false)
	SetPlayerWantedLevelNow(who, false)

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
	
    WarMenu.CreateMenu('PressM', 'PressM_AIO')
	WarMenu.CreateSubMenu('Weapons', 'PressM', 'Choose Your Weapon')
	WarMenu.CreateSubMenu('Invincibility', 'PressM', 'Set Invincibility')
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
	WarMenu.CreateSubMenu('Wanted', 'PressM', 'Set Wanted Level')
	
	while true do
	
		local target = GetPlayerPed(-1)
		local target2 = PlayerId()
	
		-- MAIN MENU
	
		if WarMenu.IsMenuOpened("PressM") then
		
			if WarMenu.MenuButton('Weapons', 'Weapons') then
			
			elseif WarMenu.MenuButton('Invincibility', 'Invincibility') then
				
			elseif WarMenu.Button('Get Coordinates') then
		
				getCoords(target)
				
			elseif WarMenu.MenuButton("Wanted Level", "Wanted") then
				
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
			
			
		-- OPEN MENU
		
		elseif IsControlJustReleased(0, 244) then
		
			WarMenu.OpenMenu("PressM")
		
		end
		
		Citizen.Wait(0)
		
	end
	
end)

--DRAW_MARKER

--GetPlayersLastVehicle()

--CreateVehicle

--SetPedCoordsKeepVehicle

--SetBlipCoords

--GetDistanceBetweenCoords
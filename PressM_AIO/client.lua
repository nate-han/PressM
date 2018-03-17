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

Citizen.CreateThread(function()

	local target = GetPlayerPed(-1)

    WarMenu.CreateMenu('PressM', 'PressM_AIO')
	WarMenu.CreateSubMenu('Weapons', 'PressM', 'Choose Your Weapon')
	WarMenu.CreateSubMenu('Invincibility', 'PressM', 'Set Invincibility')
	
	while true do
	
		-- MAIN MENU
	
		if WarMenu.IsMenuOpened("PressM") then
		
			if WarMenu.MenuButton('Weapons', 'Weapons') then
			
			elseif WarMenu.MenuButton('Invincibility', 'Invincibility') then
				
			elseif WarMenu.Button('Get Coordinates') then
		
				getCoords(GetPlayerPed(-1))
				
			end
			
			WarMenu.Display()
			
		-- INVINCIBILITY MENU
			
		elseif WarMenu.IsMenuOpened("Invincibility") then
		
			target = GetPlayerPed(-1)
				
			if WarMenu.Button('On') then
		
				setHealth(target, true)
				
			elseif WarMenu.Button("Off") then
			
				setHealth(target, false)
				
			end
			
			WarMenu.Display()
			
		-- WEAPONS MENU
			
		elseif WarMenu.IsMenuOpened("Weapons") then
			
			if WarMenu.Button("Pistol") then
				
				giveWeapon(target, "WEAPON_PISTOL", 100, false)
				
			elseif WarMenu.Button('Parachute') then
				
				giveWeapon(target, "GADGET_PARACHUTE", 1, false)
				
			elseif WarMenu.Button('SMG') then
				
				giveWeapon(target, "WEAPON_MICROSMG", 100, false)
				
			elseif WarMenu.Button('Assault Rifle') then
				
				giveWeapon(target, "WEAPON_ASSAULTRIFLE", 100, false)
				
			elseif WarMenu.Button('Sniper Rifle') then
				
				giveWeapon(target, "WEAPON_HEAVYSNIPER", 100, false)
				
			end
				
			WarMenu.Display()
			
		-- OPEN MENU
		
		elseif IsControlJustReleased(0, 244) then
		
			WarMenu.OpenMenu("PressM")
		
		end
		
		Citizen.Wait(0)
		
	end
	
end)
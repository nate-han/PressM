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
	
	local Invincible = state
	
	if Invincible then
	
		SetEntityInvincible(who, 0)
		showNote("Godmode: ~r~OFF")
		return false
		
	else
		
		SetEntityInvincible(who, 1)
		showNote("Godmode: ~g~ON")
		return true
		
	end
	
end

function getCoords(who)

	local coords = GetEntityCoords(who, true)
	local x, y, z = table.unpack(coords)
	
	showNote(x .. "~n~" .. y .. "~n~" .. z .. "~n~(also saved in F8)")
	Citizen.Trace("LOCATION: " .. x .. " " .. y .. " " .. z)
	
end

Citizen.CreateThread(function()

    local ammo = { "WEAPON_PISTOL", "GADGET_PARACHUTE"}
    local currentItemIndex = 1
    local selectedItemIndex = 1
    local checkbox = true
	local target = GetPlayerPed(-1)

    WarMenu.CreateMenu('PressM', 'PressM_AIO')
	WarMenu.CreateSubMenu('Weapons', 'PressM', 'Choose Your Weapon')
	
	while true do
	
		-- MAIN MENU
	
		if WarMenu.IsMenuOpened("PressM") then
		
			if WarMenu.MenuButton('Weapons', 'Weapons') then
				
				
			elseif WarMenu.Button('Get Coordinates') then
		
				getCoords(GetPlayerPed(-1))
				
			elseif WarMenu.Button("Exit") then
			
				WarMenu.CloseMenu()
				
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
				
			elseif WarMenu.Button("Exit") then
			
				WarMenu.CloseMenu()
				
			end
				
			WarMenu.Display()
			
		-- OPEN MENU
		
		elseif IsControlJustReleased(0, 244) then
		
			WarMenu.OpenMenu("PressM")
		
		end
		
		Citizen.Wait(0)
		
	end
	
end)
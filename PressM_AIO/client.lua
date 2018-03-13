-- PressM AIO
-- All (under contruction) In One Tool script
-- By github/nate_han
-- Just Press "M" btw

function showNote(msg)

	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
	
end

function setHealth(who)

	local max_hp = GetEntityMaxHealth(who)
	local cur_hp = GetEntityHealth(who)
	
	if cur_hp == 0 then
	
		showNote("You actually died.") -- not working
		Citizen.Wait(5000)
		return
	
	elseif cur_hp < max_hp then
	
		showNote("Health: ~r~" .. cur_hp .. "~w~/~g~" .. max_hp)
		SetEntityHealth(who, max_hp)
		
	else
	
		showNote("Health: ~g~" .. cur_hp .. "~w~/~g~" .. max_hp)
		
	end
	
end

function giveWeapon(who, what, amount)

	showNote("Giving: ~g~" .. amount .. " of ~r~" .. what)
	GiveWeaponToPed(who, GetHashKey(what), amount, false)
	
end

function getCoords(who)

	local coords = GetEntityCoords(who, true)
	local x, y, z = table.unpack(coords)
	
	showNote(x .. "~n~" .. y .. "~n~" .. z .. "~n~(also saved in F8)")
	Citizen.Trace("LOCATION: " .. x .. " " .. y .. " " .. z)
	
end

Citizen.CreateThread(function()

	while true do
	
		Citizen.Wait(0)
		
		if(IsControlJustPressed(0, 244)) then
			
			local target = GetPlayerPed(-1)
		
			giveWeapon(target, "WEAPON_PISTOL", 100, false)
			giveWeapon(target, "GADGET_PARACHUTE", 1, false)
			getCoords(target)
			
		end
	end
	
end)

Citizen.CreateThread(function()

	while true do
		
		Citizen.Wait(1000)
	
		local target = GetPlayerPed(-1)
		
		setHealth(target)
		
	end
	
end)
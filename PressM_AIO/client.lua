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

	SetEntityInvincible(who, 1)
	
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

AddEventHandler("playerSpawned", function(spawn)
	
	local target = GetPlayerPed(-1)
	
	setHealth(target)
	
end)

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
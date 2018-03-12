-- PressM snippets
-- Get Coords (of player)
-- By github/nate_han
-- Weapon IDs found here: https://wiki.fivem.net/wiki/Weapons

function GiveWeapon(who, what, amount)
	TriggerEvent("chatMessage", "Giving " .. amount .. " of " .. what .. " to " .. who)
	GiveWeaponToPed(who, GetHashKey(what), amount, false)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(IsControlJustPressed(0, 244)) then
			GiveWeapon(GetPlayerPed(-1), "WEAPON_PISTOL", 50, false)
		end
	end
end)
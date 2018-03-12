-- PressM snippets
-- Play Animation (on player)
-- By github/nate_han
-- Get animation database from here (only amb@ dictionaries work, afaik): https://www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
-- TaskPlayAnim options listed here: https://runtime.fivem.net/doc/reference.html#_0xEA47FE3719165B94

function animPlay(who, dict, anim)
	RequestAnimDict(dict)
	TaskPlayAnim(who, dict, anim, 8.0, 0.0, -1, 16, 1.0, 0, 0, 0)
	Citizen.Wait("5000")
	ClearPedTasksImmediately(who)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(IsControlJustPressed(0, 244)) then
			animPlay(GetPlayerPed(-1), "amb@world_human_tourist_map@male@base", "base")
		end
	end
end)

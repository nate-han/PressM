-- PressM snippets
-- Get Coords (of player)
-- By github/nate_han

function getCoords(who)
	local coords = GetEntityCoords(who, true)
	local coords = tostring(coords)
	TriggerEvent("chatMessage", "Bob", {255,0,0}, coords)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(IsControlJustPressed(0, 244)) then
			getCoords(GetPlayerPed(-1))
		end
	end
end)
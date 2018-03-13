-- PressM snippets
-- Set Health (of player)
-- By github/nate_han

function setHealth(who)
	local max_hp = GetEntityMaxHealth(who)
	local cur_hp = GetEntityHealth(who)
	if cur_hp < max_hp then
		SetEntityHealth(who, max_hp)
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(IsControlJustPressed(0, 244)) then
			setHealth(GetPlayerPed(-1))
		end
	end
end)
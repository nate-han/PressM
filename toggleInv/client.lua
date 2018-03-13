-- PressM snippets
-- Toggle Invincibility (of player)
-- By github/nate_han

function showNote(msg)

	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
	
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

Citizen.CreateThread(function()

	local Invincible

	while true do
	
		Citizen.Wait(0)
		
		if(IsControlJustPressed(0, 244)) then
		
			if Invincible then
			
				Invincible = setHealth(GetPlayerPed(-1), true)
				
			else
			
				Invincible = setHealth(GetPlayerPed(-1), false)
				
			end
			
		end
		
	end
end)
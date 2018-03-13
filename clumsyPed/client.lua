-- PressM snippets
-- Clumsy Ped
-- By github/nate_han

function clumsyPed(who)

	local fall = math.random(0, 3)

	SetPedToRagdoll(who, 2000, 0, fall, false, false, false)
	
end

Citizen.CreateThread(function()

	while true do
	
		Citizen.Wait(0)
		
		if(IsControlJustPressed(0, 244)) then
		
			clumsyPed(GetPlayerPed(-1))
			
		end
		
	end
	
end)
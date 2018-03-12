-- PressM snippets
-- Display Notifications (to player)
-- By github/nate_han
-- Text formatting options found here: http://runtime.fivem.net/doc/reference.html#_0x2ED7843F8F801023

function showNote(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(true, false)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if(IsControlJustPressed(0, 244)) then
			showNote("~r~red~w~, white & ~b~blue~w~ - ~h~KKona")
		end
	end
end)
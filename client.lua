
local isBusy = false
local currentAction = nil
RegisterNetEvent('lorraxs_progress')
AddEventHandler('lorraxs_progress', function(time, isBusyReturn)
    if not isBusy then 
        isBusy = true 
        isBusyReturn(false)		
        SendNuiMessage(json.encode({
            type = 'open',
            thoigian = time
        }))
    else 
        --ESX.ShowNotification('Busy')
	isBusyReturn(true)
        --cb(false)
    end
end)

RegisterNetEvent('lorraxs_progressUp')
AddEventHandler('lorraxs_progressUp', function(time, isBusyReturn)
    if not isBusy then 
        isBusy = true 
        isBusyReturn(false)		
        SendNuiMessage(json.encode({
            type = 'openUp',
            thoigian = time
        }))
    else 
        --ESX.ShowNotification('Busy')
	isBusyReturn(true)
        --cb(false)
    end
end)

RegisterNetEvent('lorraxs_progress:cancel')
AddEventHandler('lorraxs_progress:cancel', function()
	isBusy = false
	SendNuiMessage(json.encode({
            type = 'cancel'
        }))
end)
RegisterNUICallback('done', function()
	isBusy = false
	if currentAction == nil then 
		return 
	else 
		currentAction()
		currentAction = nil 
	end
end)

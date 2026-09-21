local npcDisabled = Config.DefaultDisabled == true

RegisterNetEvent('kruiger:nonpc:setState', function(state)
    npcDisabled = state == true
end)

RegisterNetEvent('kruiger:nonpc:notify', function(message)
    TriggerEvent('chat:addMessage', {
        color = { 0, 170, 255 },
        args = { 'KruigerNoNPC', message }
    })
end)

CreateThread(function()
    TriggerServerEvent('kruiger:nonpc:requestState')
end)

CreateThread(function()
    while true do
        if npcDisabled then
            -- Ambient pedestrians.
            SetPedDensityMultiplierThisFrame(0.0)
            SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)

            -- NPC-driven and ambient traffic.
            SetVehicleDensityMultiplierThisFrame(0.0)
            SetRandomVehicleDensityMultiplierThisFrame(0.0)
            SetParkedVehicleDensityMultiplierThisFrame(0.0)

            -- Prevent additional random ambient vehicle generation.
            SetGarbageTrucks(false)
            SetRandomBoats(false)

            Wait(0)
        else
            Wait(500)
        end
    end
end)

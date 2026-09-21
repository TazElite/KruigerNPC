local npcDisabled = Config.DefaultDisabled == true

local function notify(source, message)
    TriggerClientEvent('kruiger:nonpc:notify', source, message)
end

local function syncState(target)
    TriggerClientEvent('kruiger:nonpc:setState', target, npcDisabled)
end

RegisterCommand(Config.Command, function(source)
    -- Console may toggle the state as well.
    if source ~= 0 and not IsPlayerAceAllowed(tostring(source), Config.AcePermission) then
        notify(source, ('You do not have permission to use /%s.'):format(Config.Command))
        return
    end

    npcDisabled = not npcDisabled
    syncState(-1)

    local stateText = npcDisabled and 'disabled' or 'enabled'
    print(('[KruigerNoNPC] NPCs have been %s server-wide.'):format(stateText))

    if source ~= 0 then
        notify(source, ('NPCs have been %s server-wide.'):format(stateText))
    end
end, false)

RegisterNetEvent('kruiger:nonpc:requestState', function()
    syncState(source)
end)

AddEventHandler('playerJoining', function()
    syncState(source)
end)

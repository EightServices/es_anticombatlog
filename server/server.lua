AddEventHandler('playerDropped', function (reason)
    local src = source
    local data = {
        src = src,
        pos = GetEntityCoords(GetPlayerPed(src)),
        reason = reason,
        name = GetPlayerName(src),
        discord = GetPlayerIdentifier(src, 1)
    }
    TriggerClientEvent('Eight_Anticombatlog:playerDisconnect', -1, data)
end)
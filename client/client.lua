RegisterNetEvent('Eight_Anticombatlog:playerDisconnect')
AddEventHandler('Eight_Anticombatlog:playerDisconnect', function(data)
    local ppeds = GetPlayerPed(-1)
    local pcoords = GetEntityCoords(ppeds)
    local distance = Vdist2(pcoords.x, pcoords.y, pcoords.z, data.pos.x, data.pos.y, data.pos.z)
    if distance < Config.MaxDistance then
        local lang = Config.Language
        DisplayDisconnectMessage(lang, data.name, data.src, data.reason)
    end
end)

function DisplayDisconnectMessage(lang, name, src, reason)
    local ped = GetPlayerPed(-1)
    local coords = GetEntityCoords(ped)
    local startTick = GetGameTimer()

    while GetGameTimer() - startTick < Config.Time * 1000 do
        local distanceToPlayer = Vdist(coords.x, coords.y, coords.z, GetEntityCoords(ped))
        if distanceToPlayer <= Config.MaxDistance then
            local message = Locales[lang].Player .. name .. Locales[lang].ID .. src .. Locales[lang].LeavingTheServer .. reason .. '.'
            DrawText3D(coords.x, coords.y, coords.z + 0.3, message)
        end
        Wait(0)
    end
end

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry('STRING')
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

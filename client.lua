Teleporters = {
    Entrance1 = { -- For more teleports just copy these and name them what you want
        Entrance = vector3(3308.896, 5145.714, 18.30601),
        Exit = vector3(3326.961, 5164.08, 18.46806)
    },
    Entrance2 = {
        Entrance = vector3(3321.494, 5176.436, 18.41522),
        Exit = vector3(3312.482, 5176.403, 23.56409)
    },
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        DistanceCheck()
    end
end)

function DistanceCheck()
    local playerPos = GetEntityCoords(PlayerPedId())
    for k, v in pairs(Teleporters) do
        if Vdist2(playerPos, v.Entrance) < 5 then
            Draw3DText(v.Entrance, "[F] Enter")
            if IsControlJustReleased(1, 23) then
                Teleport(v.Exit)
            end
        end
        if Vdist2(playerPos, v.Exit) < 5 then
            Draw3DText(v.Exit, "[F] Exit")
            if IsControlJustReleased(1, 23) then
                Teleport(v.Entrance)
            end
        end
    end
end

function Teleport(pos)
    DoScreenFadeOut(100)
    Wait(100)
    SetEntityCoords(PlayerPedId(), pos, false)
    DoScreenFadeIn(100)
end

function Draw3DText(pos,text)
    SetTextScale(0.5, 0.5)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(250, 250, 250, 255)
    SetTextDropshadow(1, 1, 1, 1, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    SetDrawOrigin(pos, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

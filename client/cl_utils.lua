CLIENT = {
    InDetector = {}
}

function CLIENT:CheckPlayer(DetectorId)
    TriggerServerEvent("esx_weapon_detector:CheckPlayer", DetectorId)
end

if Config.Dev then
    RegisterCommand("drawradius", function(source, args)
        if #args > 0 then

            local CanDraw = true
            local Radius = tonumber(args[1])

            CreateThread(function()
                local Time = 6

                while Time > 0 do
                    Time = Time - 1
                    Wait(1000)


                    if Time == 0 then
                        CanDraw = false
                    end
                end
            end)

            CreateThread(function()
                while CanDraw do
                    local PlayerPed = PlayerPedId()
                    local PlayerCoords = GetEntityCoords(PlayerPed)
                    DrawMarker(1, PlayerCoords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Radius, Radius, 0.5, 150, 150, 0, 255)
                    
                    Wait(5)
                end
            end)
        end
    end)
end
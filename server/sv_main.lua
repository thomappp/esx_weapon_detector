function SERVER:Init()

    RegisterServerEvent("esx_weapon_detector:CheckPlayer")
    AddEventHandler("esx_weapon_detector:CheckPlayer", function(DetectorId)
        local Player = ESX.GetPlayerFromId(source)
        local Detector = Config.Detectors[DetectorId]
        local PlayerCoords = Player.getCoords(true)
        local DetectorCoords = Detector.Coords
        local Distance = #(PlayerCoords - DetectorCoords)

        if Distance < Detector.Radius then
            local PlayerJob = Player.getJob()

            if self:CanDetectPlayer(PlayerJob.name, Detector.Bypass) then
            
                local Inventory = Player.getInventory()
                local Dectected, Table = self:Detect(Inventory)
    
                if Dectected then
                    print(("%s - (%s) has been detected [%s] with %s weapon(s)."):format(Player.getName(), source, Detector.Name, #Table))
                    self:Text(Detector, Table)
                end
            end
        else
            Player.kick("Make sure you don't use a cheat.")
        end
    end)
end

SERVER:Init()
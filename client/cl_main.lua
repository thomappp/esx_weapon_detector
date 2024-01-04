function CLIENT:Init()

    CreateThread(function()
        while true do

            local PlayerWait = 1000

            for i = 1, #Config.Detectors do
                local Detector = Config.Detectors[i]
                local DetectorCoords = Detector.Coords
                local PlayerCoords = GetEntityCoords(PlayerPedId())
                local Distance = #(PlayerCoords - DetectorCoords)

                if Distance < Detector.Radius then
                    if not self.InDetector[i] then
                        self.InDetector[i] = true
                        self:CheckPlayer(i)
                        ESX.ShowNotification(("Weapon Detector: %s"):format(Detector.Name))
                    end
                else
                    if self.InDetector[i] then
                        self.InDetector[i] = false
                    end
                end
            end

            Wait(PlayerWait)
        end
    end)
end

CLIENT:Init()
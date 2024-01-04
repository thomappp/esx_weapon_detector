SERVER = {}

function SERVER:CanDetectPlayer(PlayerJob, Bypass)

    for _, Job in pairs(Bypass) do
        if PlayerJob == Job then
            return false
        end
    end

    return true
end

function SERVER:Detect(Inventory)
    local Table = {}

    for _, InventoryItem in pairs(Inventory) do
        if InventoryItem.metadata.type == "weapon" then
            table.insert(Table, InventoryItem.name)
        end
    end

    return #Table > 0, Table
end

function SERVER:GetText(Detector, Table)
    if #Table > 1 then
        -- To make finding the individual more fun, don't give his / her name !
        return ("Someone has been detected [%s] with %s weapons."):format(Detector.Name, #Table)
    else
        return ("Someone has been detected [%s] with a weapon."):format(Detector.Name)
    end
end

function SERVER:Text(Detector, Table)
    for _, Job in pairs(Detector.Bypass) do

        local Players = ESX.GetExtendedPlayers('job', Job)
        local Text = self:GetText(Detector, Table)

        for _, Player in pairs(Players) do
            Player.showNotification(Text)
        end
    end
end
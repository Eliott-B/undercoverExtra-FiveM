function Notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function IsDrivingVehicle(ped)
    local veh = GetVehiclePedIsUsing(ped)
    if (veh == 0) then
        return false
    end
    return true
end

function GetVehicleModel(vehModels, veh)
    local vehModel = GetEntityModel(veh)
    for model, _ in pairs(vehModels) do
        local hash = GetHashKey(model)
        if (vehModel == hash) then
            return model
        end
    end
end

RegisterCommand("beacon", function()
    local vehModels = Config.VehiclesModels
    local ped = PlayerPedId()
    if (not DoesEntityExist(ped) or IsEntityDead(ped)) then
        Notify("~r~[ERROR] Invalid entity status!")
        return
    end
    if (IsDrivingVehicle(ped) == false) then
        Notify("~r~[ERROR] You are not driving a vehicle!")
        return
    end
    local veh = GetVehiclePedIsUsing(ped)
    local model = GetVehicleModel(vehModels, veh)
    for group, extra in pairs(vehModels[model]) do
        -- true = désactivé; false = activé
        local isActivated = IsVehicleExtraTurnedOn(veh, vehModels[model][group][1])
        for i = 1, #extra do
            SetVehicleExtra(veh, extra[i], isActivated)
        end
    end
    if (IsVehicleExtraTurnedOn(veh, vehModels[model]["group1"][1])) then
        Notify("[BEACON] Switched ~g~ON")
        return
    end
    Notify("[BEACON] Switched ~r~OFF")
end)

RegisterKeyMapping('beacon', 'Add/Remove beacon', 'keyboard', 'f7')
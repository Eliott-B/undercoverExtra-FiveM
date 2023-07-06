-- client side
RegisterKeyMapping('beacon', 'Add/Remove beacon', 'keyboard', 'f7')

RegisterCommand('beacon', function()

    local playerPed = PlayerPedId()

    if (DoesEntityExist(playerPed) and not IsEntityDead(playerPed)) then

        if (IsPedSittingInAnyVehicle(playerPed)) then 
            local vehicle = GetVehiclePedIsIn(playerPed, false)

            if (GetPedInVehicleSeat(vehicle, -1) == playerPed) then 
                local vehModel = GetEntityModel(vehicle)

                local vehicles = {
                    ['cliobana'] = {
                        ['enable'] = {8, 9}
                    },
                    ['508bana'] = {
                        ['enable'] = {1, 4}
                    },
                    ['peug_207'] = {
                        ['enable'] = {1, 3}
                    },
                    ['expertbana'] = {
                        ['enable'] = {1, 3},
                        ['disable'] = {4}
                    }
                }

                for model, status in pairs(vehicles) do
                    local hash = GetHashKey(model)
                    if (vehModel == hash) then
                        if (IsVehicleExtraTurnedOn(vehicle, status["enable"][1])) then
                            for statu, extras in pairs(status) do
                                for i = 1, #extras, 1 do
                                    if (statu == 'enable') then
                                        SetVehicleExtra(vehicle, extras[i], true)
                                    else
                                        SetVehicleExtra(vehicle, extras[i], false)
                                    end
                                end
                            end
                            Notify('~y~Beacon removed!')
                        else
                            for statu, extra in pairs(status) do
                                for i = 1, #extra, 1 do
                                    if (statu == 'enable') then
                                        SetVehicleExtra(vehicle, extra[i], false)
                                    else
                                        SetVehicleExtra(vehicle, extra[i], true)
                                    end
                                end
                            end
                            Notify('~y~Beacon added!')
                        end
                        return
                    end
                end
                Notify('~r~~h~ERROR :~h~ you are not in a undercover vehicle!')

            else 
                Notify('~r~~h~ERROR :~h~ you are not the driver!')
            end 

        else
            Notify('~r~~h~ERROR :~h~ you are not in a vehicule!')
        end 
    end
end)

function Notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end
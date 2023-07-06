-- client side
RegisterKeyMapping('beacon', 'Add/Remove beacon', 'keyboard', 'f7')

RegisterCommand('beacon', function()

    local playerPed = PlayerPedId()

    if (DoesEntityExist(playerPed) and not IsEntityDead(playerPed)) then

        if (IsPedSittingInAnyVehicle(playerPed)) then 
            local vehicle = GetVehiclePedIsIn(playerPed, false)

            if (GetPedInVehicleSeat( vehicle, -1) == playerPed) then 
                local model = GetEntityModel(vehicle)

                if (model == GetHashKey('508bana')) then

                    if(IsVehicleExtraTurnedOn(vehicle,1)) then
                        SetVehicleExtra(vehicle, 1, true)
                        SetVehicleExtra(vehicle, 4, true)
                        Notify('~y~Beacon removed!')
                    else
                        SetVehicleExtra(vehicle, 1, false)
                        SetVehicleExtra(vehicle, 4, false)
                        Notify('~y~Beacon added!')
                    end

                elseif (model == GetHashKey('cliobana')) then

                    if(IsVehicleExtraTurnedOn(vehicle,8)) then
                        SetVehicleExtra(vehicle, 8, true)
                        SetVehicleExtra(vehicle, 9, true)
                        Notify('~y~Beacon removed!')
                    else
                        SetVehicleExtra(vehicle, 8, false)
                        SetVehicleExtra(vehicle, 9, false)
                        Notify('~y~Beacon added!')
                    end

                elseif (model == GetHashKey('peug_207')) then

                    if(IsVehicleExtraTurnedOn(vehicle,1)) then
                        SetVehicleExtra(vehicle, 1, true)
                        SetVehicleExtra(vehicle, 3, true)
                        Notify('~y~Beacon removed!')
                    else
                        SetVehicleExtra(vehicle, 1, false)
                        SetVehicleExtra(vehicle, 3, false)
                        Notify('~y~Beacon added!')
                    end

                else
                    Notify('~r~~h~ERROR :~h~ you are not in a undercover vehicle!')
                end

            else 
                Notify('~r~~h~ERROR :~h~ you are not the driver!')
            end 

        else
            Notify('~r~~h~ERROR :~h~ you are not in a vehicule!')
        end 
    end
end)

function Notify( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end
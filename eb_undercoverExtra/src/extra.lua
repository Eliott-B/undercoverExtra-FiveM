-- client side
RegisterKeyMapping('beacon', ' My Keypress Key', 'keyboard', 'f7')

RegisterCommand('beacon', function()

    local playerPed = PlayerPedId()

    if (DoesEntityExist(playerPed) and not IsEntityDead(playerPed)) then

        if (IsPedSittingInAnyVehicle(playerPed)) then 
            local vehicle = GetVehiclePedIsIn(playerPed, false)

            if (GetPedInVehicleSeat( vehicle, -1) == playerPed) then 
                local model = GetEntityModel(vehicle)
                local name = GetDisplayNameFromVehicleModel(model)

                if (name == 'samu') then

                    if(IsVehicleExtraTurnedOn(vehicle,1)) then
                        SetVehicleExtra(vehicle, 1, true)
                        SetVehicleExtra(vehicle, 4, true)
                        Notify('~y~Beacon removed!')
                    else
                        SetVehicleExtra(vehicle, 1, false)
                        SetVehicleExtra(vehicle, 4, false)
                        Notify('~y~Beacon added!')
                    end

                else
                    Notify('~r~~h~ERROR :~h~ you are not in a Peugeot 508 BANALISÉ !')
                end

            else 
                Notify('~r~~h~ERROR :~h~ you are not the driver !')
            end 

        else
            Notify('~r~~h~ERROR :~h~ you are not in a vehicule !')
        end 
    end
end)

function Notify( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end
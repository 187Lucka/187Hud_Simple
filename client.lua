HUD_actif = true

--Show HUD

RegisterNetEvent("187Hud:Show")
AddEventHandler("187Hud:Show", function(data)
    SendNUIMessage({
        type = "show",
        status = true
    })
end)

--Hide HUD

RegisterNetEvent("187Hud:Hide")
AddEventHandler("187Hud:Hide", function(data)
    SendNUIMessage({
        type = "hide",
        status = false
    })
end)

RegisterCommand("hud", function(source, args, rawCommand)
    if HUD_actif then
        HUD_actif = false
        TriggerEvent("187Hud:Hide")
    else
        HUD_actif = true
        TriggerEvent("187Hud:Show")
    end
end, false)

--Update HUD

_wait_ = 750

Citizen.CreateThread(function()

 HUD_actif = true;

 Wait(500)

 print("HUD by 187Shop (https://discord.gg/187Shop) | https://187shop.tebex.io/")

 while true do

    if HUD_actif then

        player = PlayerPedId()

        heal = GetEntityHealth(player)/2
        armor = GetPedArmour(player)

        TriggerEvent('esx_status:getStatus', 'thirst', function(status)
            if status then thirst = status.val / 10000 end
        end)

        TriggerEvent('esx_status:getStatus', 'hunger', function(status)
            if status then hunger = status.val / 10000 end
        end)

        if hunger == nil then hunger = 0 end
        if thirst == nil then thirst = 0 end

        hunger = math.floor(hunger)
        thirst = math.floor(thirst)

        SendNUIMessage({
            type = "show",
            status = true,
            heal =   heal,
            armor =  armor,
            hunger = hunger,
            thirst = thirst,
        })

        _wait_ = 1000

    else
        _wait_ = 1500

    end
    Wait(_wait_)
 end 

end)
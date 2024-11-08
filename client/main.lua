local QBCore = exports['qb-core']:GetCoreObject()
local onDuty = false
local clean = false
local delivery = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerPed = PlayerPedId()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == Config.Job then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)


RegisterNetEvent("rz:burgershot:shop")
AddEventHandler("rz:burgershot:shop", function()
    if onDuty then
        local PlayerData = QBCore.Functions.GetPlayerData()
        if PlayerData.job and PlayerData.job.name == Config.Job then 
            TriggerServerEvent("inventory:server:OpenInventory", "shop", "burgershot", Config.Shop)
        end
    else 
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
	end  
end)

---------Burger Shot Job---------

RegisterNetEvent("DD-burgershot:duty")
AddEventHandler("DD-burgershot:duty", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("DD-burgershot:tray")
AddEventHandler("DD-burgershot:tray", function()
    TriggerEvent("inventory:client:SetCurrentStash", "tray")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "tray", {
        maxweight = 5000,
        slots = 5,
    })
end)

RegisterNetEvent("DD-burgershot:tray2")
AddEventHandler("DD-burgershot:tray2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "tray2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "tray2", {
        maxweight = 5000,
        slots = 5,
    })
end)

RegisterNetEvent("DD-burgershot:storge")
AddEventHandler("DD-burgershot:storge", function()
    if onDuty then
        TriggerEvent("inventory:client:SetCurrentStash", "storge")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "storge", {
            maxweight = 250000,
            slots = 40,
        })
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:storge2")
AddEventHandler("DD-burgershot:storge2", function()
    if onDuty then
        TriggerEvent("inventory:client:SetCurrentStash", "storge2")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "storge2", {
            maxweight = 250000,
            slots = 40,
        })
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:client:bigcola")
AddEventHandler("DD-burgershot:client:bigcola", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('DD-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("bigcola", Lang:t("label.bigcola"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('DD-burgershot:server:bigcola')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.BigEmptyGlass)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:client:smallcola")
AddEventHandler("DD-burgershot:client:smallcola", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('DD-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("smallcola", Lang:t("label.smallcola"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('DD-burgershot:server:smallcola')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.SmallEmptyGlass)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:client:coffee")
AddEventHandler("DD-burgershot:client:coffee", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('DD-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("coffee2", Lang:t("label.coffee2"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('DD-burgershot:server:coffee')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.CoffeeEmptyGlass)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:client:bigpotato")
AddEventHandler("DD-burgershot:client:bigpotato", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('rz:eat:server:get:bigpotato', function(HasItems)  
                if HasItems then
                    QBCore.Functions.Progressbar("bigpotato", Lang:t("label.bigpotato"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {
                        model = "prop_cs_fork",
                        bone = 28422,
                        coords = vector3(-0.005, 0.00, 0.00),
                        rotation = vector3(175.0, 160.0, 0.0),
                    }, {}, function() -- Done
                            TriggerServerEvent('DD-burgershot:server:bigpotato')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:client:smallpotato")
AddEventHandler("DD-burgershot:client:smallpotato", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('rz:eat:server:get:smallpotato', function(HasItems)  
                if HasItems then
                    QBCore.Functions.Progressbar("smallpotato", Lang:t("label.smallpotato"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {
                        model = "prop_cs_fork",
                        bone = 28422,
                        coords = vector3(-0.005, 0.00, 0.00),
                        rotation = vector3(175.0, 160.0, 0.0),
                    }, {}, function() -- Done
                            TriggerServerEvent('DD-burgershot:server:smallpotato')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:client:rings")
AddEventHandler("DD-burgershot:client:rings", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('rz:eat:server:get:rings', function(HasItems)  
                if HasItems then
                    QBCore.Functions.Progressbar("rings", Lang:t("label.rings"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {
                        model = "prop_cs_fork",
                        bone = 28422,
                        coords = vector3(-0.005, 0.00, 0.00),
                        rotation = vector3(175.0, 160.0, 0.0),
                    }, {}, function() -- Done
                        TriggerServerEvent('DD-burgershot:server:rings')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:client:nuggets")
AddEventHandler("DD-burgershot:client:nuggets", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('rz:eat:server:get:nuggets', function(HasItems)  
                if HasItems then
                    QBCore.Functions.Progressbar("nuggets", Lang:t("label.nuggets"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {
                        model = "prop_cs_fork",
                        bone = 28422,
                        coords = vector3(-0.005, 0.00, 0.00),
                        rotation = vector3(175.0, 160.0, 0.0),
                    }, {}, function() -- Done
                            TriggerServerEvent('DD-burgershot:server:nuggets')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:client:meat")
AddEventHandler("DD-burgershot:client:meat", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('DD-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("meat", Lang:t("label.meat"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {
                        model = "prop_cs_fork",
                        bone = 28422,
                        coords = vector3(-0.005, 0.00, 0.00),
                        rotation = vector3(175.0, 160.0, 0.0),
                    }, {}, function() -- Done
                            TriggerServerEvent('DD-burgershot:server:meat')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.FrozenMeat)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:client:bleederburger")
AddEventHandler("DD-burgershot:client:bleederburger", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('rz:eat:server:get:bleederburger', function(HasItems)  
                if HasItems then
                    QBCore.Functions.Progressbar("bleederburger", Lang:t("label.bleederburger"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "mini@repair",
                        anim = "fixing_a_player",
                        flags = 49,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('DD-burgershot:server:bleederburger')
                            Dirt()
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:client:bigkingburger")
AddEventHandler("DD-burgershot:client:bigkingburger", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('rz:eat:server:get:bigkingburger', function(HasItems)  
                if HasItems then
                    QBCore.Functions.Progressbar("bigkingburger", Lang:t("label.bigkingburger"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "mini@repair",
                        anim = "fixing_a_player",
                        flags = 49,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('DD-burgershot:server:bigkingburger')
                            Dirt()
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end) 
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:client:wrap")
AddEventHandler("DD-burgershot:client:wrap", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('rz:eat:server:get:wrap', function(HasItems)  
                if HasItems then
                    QBCore.Functions.Progressbar("wrap", Lang:t("label.wrap"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "mini@repair",
                        anim = "fixing_a_player",
                        flags = 49,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('DD-burgershot:server:wrap')
                            Dirt()
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end) 
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:client:macaroon")
AddEventHandler("DD-burgershot:client:macaroon", function()
    if onDuty then
        if clean then 
            QBCore.Functions.Progressbar("macaroon", Lang:t("label.macaroon"), Config.ProgressbarTime, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "mp_common",
                anim = "givetake1_a",
                flags = 8,
            }, {}, {}, function() -- Done
                    TriggerServerEvent('DD-burgershot:server:macaroon')
                    Dirt()
                QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
            end, function()
                QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
            end)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:client:chocolateicecream")
AddEventHandler("DD-burgershot:client:chocolateicecream", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('DD-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("chocolateicecream", Lang:t("label.chocolateicecream"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('DD-burgershot:server:chocolateicecream')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.Cone) 
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:client:vanillaicecream")
AddEventHandler("DD-burgershot:client:vanillaicecream", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('DD-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("vanillaicecream", Lang:t("label.vanillaicecream"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('DD-burgershot:server:vanillaicecream')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.Cone) 
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:client:thesmurfsicecream")
AddEventHandler("DD-burgershot:client:thesmurfsicecream", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('DD-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("thesmurfsicecream", Lang:t("label.thesmurfsicecream"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('DD-burgershot:server:thesmurfsicecream')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.Cone) 
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:client:strawberryicecream")
AddEventHandler("DD-burgershot:client:strawberryicecream", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('DD-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("strawberryicecream", Lang:t("label.strawberryicecream"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('DD-burgershot:server:strawberryicecream')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.Cone) 
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:client:matchaicecream")
AddEventHandler("DD-burgershot:client:matchaicecream", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('DD-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("matchaicecream", Lang:t("label.matchaicecream"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('DD-burgershot:server:matchaicecream')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.Cone) 
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:client:ubeicecream")
AddEventHandler("DD-burgershot:client:ubeicecream", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('DD-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("ubeicecream", Lang:t("label.ubeicecream"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('DD-burgershot:server:ubeicecream')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.Cone) 
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:client:smurfetteicecream")
AddEventHandler("DD-burgershot:client:smurfetteicecream", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('DD-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("smurfetteicecream", Lang:t("label.smurfetteicecream"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('DD-burgershot:server:smurfetteicecream')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.Cone) 
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:client:unicornicecream")
AddEventHandler("DD-burgershot:client:unicornicecream", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('DD-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("unicornicecream", Lang:t("label.unicornicecream"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('DD-burgershot:server:unicornicecream')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.Cone) 
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("DD-burgershot:client:clean")
AddEventHandler("DD-burgershot:client:clean", function()
    QBCore.Functions.Progressbar("clean", Lang:t("label.clean"), Config.ProgressbarTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@world_human_bum_standing@twitchy@idle_a",
        anim = "idle_a",
        flags = 49,
    }, {}, {}, function() -- Done
            clean = true
        QBCore.Functions.Notify(Lang:t("notify.dirt2"), "success")
    end, function()
        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
    end)
end)

function Dirt()
	if math.random(1,100) < Config.Dirt then
		clean = false
        QBCore.Functions.Notify(Lang:t("notify.dirt"), "error")
	end
end

RegisterNetEvent("DD-burgershot:client:sellingfinish")
AddEventHandler("DD-burgershot:client:sellingfinish", function()
    if delivery == true then
        local car = GetVehiclePedIsIn(PlayerPedId(),true)
        NetworkFadeOutEntity(car, true,false)
        QBCore.Functions.DeleteVehicle(car)
        delivery = false
        exports['DD-target']:RemoveZone("sell-box")
        RemoveBlip(delivery_blip)
        QBCore.Functions.Notify(Lang:t("notify.finish"), "primary")
    else
        QBCore.Functions.Notify(Lang:t("notify.notselling"), "primary")
    end
end)

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(vector3(-1183.37, -884.14, 13.86))
    SetBlipSprite(blip, 106)
    SetBlipDisplay(blip, 2)
    SetBlipScale(blip, 0.5)
    SetBlipColour(blip, 1)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Burger Shot")
    EndTextCommandSetBlipName(blip)
end)


function StartDelivery()
    QBCore.Functions.Notify(Lang:t("notify.wait_order"), "primary")
    Wait(Config.DeliveryWait)
    random = math.random(1,#Config.Locations["coords"])
    QBCore.Functions.Notify(Lang:t("notify.neworder"), "primary")
    SetNewWaypoint(Config.Locations["coords"][random]["x"],Config.Locations["coords"][random]["y"])
    exports['DD-target']:AddCircleZone('sell-box', vector3(Config.Locations["coords"][random]["x"],Config.Locations["coords"][random]["y"],Config.Locations["coords"][random]["z"]), 2.0,{ 
        name = 'sell-box', debugPoly = false, useZ=true}, {
        options = {{label = Lang:t("label.deliver") ,icon = 'fas fa-sign-in-alt', action = function() TriggerEvent('DD-burgershot:client:sell-box') end}},
        distance = 2.0
    })
    delivery_blip = AddBlipForCoord(Config.Locations["coords"][random]["x"],Config.Locations["coords"][random]["y"],Config.Locations["coords"][random]["z"])
    SetBlipSprite(delivery_blip, 89)
    SetBlipColour(delivery_blip, 1)
    SetBlipScale(delivery_blip,0.8)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Lang:t("label.blip_customer"))
    EndTextCommandSetBlipName(delivery_blip)
end

-------------

RegisterNetEvent("DD-burgershot:client:spawn-van")
AddEventHandler("DD-burgershot:client:spawn-van", function()
    QBCore.Functions.SpawnVehicle(Config.Van, function(vehicle)
        TriggerEvent("DD-burgershot:client:delivery-start-big-box")
        SetEntityCoords(PlayerPed, Config.CarSpawnCoord.x, Config.CarSpawnCoord.y, Config.CarSpawnCoord.z-1.0)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
        SetVehicleLivery(vehicle, 15)
        SetVehicleColours(vehicle, 62, 62, 62)
    end, Config.CarSpawnCoord, true)
end)

RegisterNetEvent("DD-burgershot:client:spawn-bike")
AddEventHandler("DD-burgershot:client:spawn-bike", function()
    QBCore.Functions.SpawnVehicle(Config.Bike, function(vehicle)
        TriggerEvent("DD-burgershot:client:delivery-start-big-box")
        SetEntityCoords(PlayerPed, Config.CarSpawnCoord.x, Config.CarSpawnCoord.y, Config.CarSpawnCoord.z-1.0)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
        SetVehicleLivery(vehicle, 15)
        SetVehicleColours(vehicle, 62, 62, 62)
    end, Config.CarSpawnCoord, true)
end)

RegisterNetEvent('DD-burgershot:client:delivery-start-big-box', function() -- small
    delivery = true
    StartDelivery()
end)

RegisterNetEvent('DD-burgershot:client:sell-box', function()
    QBCore.Functions.TriggerCallback('DD-burgershot:itemcheck', function(data)
        if data then 
            exports['DD-target']:RemoveZone("sell-box")
            QBCore.Functions.Progressbar("packetsell", Lang:t("label.packetsell"), Config.ProgressbarTime, false, true, { 
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
                }, {
                animDict = "timetable@jimmy@doorknock@",
                anim = "knockdoor_idle",
                flags = 49,
            }, {}, {}, function() -- Done
                TriggerServerEvent('DD-burgershot:server:sell-box')
                RemoveBlip(delivery_blip)
                StartDelivery()
                map = true
                ClearPedTasksImmediately(ped)
            end, function() -- Cancel
                -- Cancel
            end)
        else
            QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
        end
    end, Config.PackageItem)
end)

Citizen.CreateThread(function()
    local spawn_ped = 0x8B7D3766 
    local ped_coord = { x = -1178.17, y = -891.55, z = 12.80, h = 308.7}
    RequestModel(spawn_ped)
    while not HasModelLoaded(spawn_ped) do
        Wait(1)
    end
    ped = CreatePed(1, spawn_ped, ped_coord.x, ped_coord.y, ped_coord.z, ped_coord.h, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true) 
    SetPedDiesWhenInjured(ped, false) 
    SetPedCanPlayAmbientAnims(ped, true) 
    SetPedCanRagdollFromPlayerImpact(ped, false) 
    SetEntityInvincible(ped, true)    
    FreezeEntityPosition(ped, true) 
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GUARD_STAND", 0, true); 
end)

RegisterNetEvent('DD-burgershot:sellpacket', function(data)
    if delivery == false then
        exports['qb-menu']:openMenu({
            {
                header = Lang:t("qbmenu.packetmenuheader"),
                isMenuHeader = true
            },
            { 
                header = Lang:t("Spawn Van"),
                params = {
                    event = "DD-burgershot:client:spawn-van",
                }
            },
            { 
                header = Lang:t("Spawn Bike"),
                params = {
                    event = "DD-burgershot:client:spawn-bike",
                }
            },
        })
    elseif delivery == true then
        exports['qb-menu']:openMenu({
            {
                header = Lang:t("qbmenu.packetmenuheader"),
                isMenuHeader = true
            },
            { 
                header = Lang:t("Stop Sale"),
                params = {
                    event = "DD-burgershot:client:sellingfinish",
                }
            },
        })
    end
end)
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('DD-burgershot:ordermenu', function(data)
    exports['qb-menu']:openMenu({
        {
            header = Lang:t("qbmenu.Fridge"),
            isMenuHeader = true
        },
        {
            header = Lang:t("qbmenu.orderıtems"),
            txt = Lang:t("qbmenu.orderıtemstxt"),
            params = {
                event = "rz:burgershot:shop"
            }
        },
        {
            header = Lang:t("qbmenu.fridgeheader"),
            txt = Lang:t("qbmenu.fridgetxt"),
            params = {
                event = "DD-burgershot:storge2"
            }
        },
        { 
            header = Lang:t("qbmenu.macaroonheader"),
            txt = Lang:t("qbmenu.macaroontxt"),
            params = {
                event = "DD-burgershot:client:macaroon",
            }
        },
        { 
            header = Lang:t("qbmenu.icecream"),
            txt = Lang:t("label.IceCreamStation"),
            params = {
                event = "DD-burgershot:icecream",
            }
        },
        {
            header = Lang:t("qbmenu.closemenu"), 
            params = { 
                event = "qb-menu:client:closeMenu"
            }
        },
    })
end)

RegisterNetEvent('DD-burgershot:dutymenu', function(data)
    exports['qb-menu']:openMenu({
        {
            header = Lang:t("qbmenu.dutymenu"),
            isMenuHeader = true
        },
        { 
            header = Lang:t("qbmenu.dutyonoff"),
            params = {
                event = "DD-burgershot:duty",
            }
        },
        {
            header = Lang:t("qbmenu.closemenu"),
            params = { 
                event = "qb-menu:client:closeMenu"
            }
        },
    })
end)

RegisterNetEvent('DD-burgershot:friesmenu', function(data)
    exports['qb-menu']:openMenu({
        {
            header = Lang:t("qbmenu.friestmenu"),
            isMenuHeader = true
        },
        { 
            header = Lang:t("qbmenu.friestmenu"),
            txt = "",
            params = {
                event = "DD-burgershot:friestlist",
            }
        },
        {
            header = Lang:t("qbmenu.closemenu"),
            params = { 
                event = "qb-menu:client:closeMenu"
            }
        },
    })
end)

RegisterNetEvent('DD-burgershot:friestlist', function(data)
    exports['qb-menu']:openMenu({
        {
            header = Lang:t("qbmenu.frieslistmenu"),
            isMenuHeader = true
        },
        { 
            header = Lang:t("qbmenu.bigpotatoheader"),
            txt = Lang:t("qbmenu.bigpotatotxt"),
            params = {
                event = "DD-burgershot:client:bigpotato",
            }
        },
        { 
            header = Lang:t("qbmenu.smallpotatoheader"),
            txt = Lang:t("qbmenu.smallpotatotxt"),
            params = {
                event = "DD-burgershot:client:smallpotato",
            }
        },
        { 
            header = Lang:t("qbmenu.ringsheader"),
            txt = Lang:t("qbmenu.ringstxt"),
            params = {
                event = "DD-burgershot:client:rings",
            }
        },
        { 
            header = Lang:t("qbmenu.nuggetsheader"),
            txt = Lang:t("qbmenu.nuggetstxt"),
            params = {
                event = "DD-burgershot:client:nuggets",
            }
        },
        { 
            header = Lang:t("qbmenu.backmenu"),
            params = {
                event = "DD-burgershot:friesmenu",
            }
        },
    })
end)

RegisterNetEvent('DD-burgershot:meatmenu', function(data)
    exports['qb-menu']:openMenu({
        {
            header =  Lang:t("qbmenu.friesmeatmenu"),
            isMenuHeader = true
        },
        { 
            header = Lang:t("qbmenu.friesmeatheader"),
            txt = Lang:t("qbmenu.friesmeatxt"),
            params = {
                event = "DD-burgershot:client:meat",
            }
        },
    })
end)

RegisterNetEvent('DD-burgershot:drinkmenu', function(data)
    exports['qb-menu']:openMenu({
        {
            header = "Drink List Menu",
            isMenuHeader = true
        },
        { 
            header = Lang:t("qbmenu.bigsizecola"),
            txt = Lang:t("qbmenu.bigsizecolatxt"),
            params = {
                event = "DD-burgershot:client:bigcola",
            }
        },
        { 
            header = Lang:t("qbmenu.smallsizecola"),
            txt = Lang:t("qbmenu.smallsizecolatxt"),
            params = {
                event = "DD-burgershot:client:smallcola",
            }
        },
        { 
            header = Lang:t("qbmenu.coffee"),
            txt = Lang:t("qbmenu.coffeetxt"),
            params = {
                event = "DD-burgershot:client:coffee",
            }
        },
    })
end)

RegisterNetEvent('DD-burgershot:burgermenu', function(data)
    exports['qb-menu']:openMenu({
        {
            header = Lang:t("qbmenu.burgermenu"),
            isMenuHeader = true
        },
        { 
            header = Lang:t("qbmenu.bleederburgerheader"),
            txt = Lang:t("qbmenu.bleederburgertxt"),
            params = {
                event = "DD-burgershot:client:bleederburger",
            }
        },
        { 
            header = Lang:t("qbmenu.bigkingburgerheader"),
            txt = Lang:t("qbmenu.bigkingburgertxt"),
            params = {
                event = "DD-burgershot:client:bigkingburger",
            }
        },
        { 
            header = Lang:t("qbmenu.wrapheader"),
            txt = Lang:t("qbmenu.wraptxt"),
            params = {
                event = "DD-burgershot:client:wrap",
            }
        },
    })
end)

RegisterNetEvent('DD-burgershot:icecream', function(data)
    exports['qb-menu']:openMenu({
        {
            header = Lang:t("qbmenu.icecream"),
            isMenuHeader = true
        },
        { 
            header = Lang:t("qbmenu.chocolateicecream"),
            params = {
                event = "DD-burgershot:client:chocolateicecream",
            }
        },
        { 
            header = Lang:t("qbmenu.vanillaicecream"),
            params = {
                event = "DD-burgershot:client:vanillaicecream",
            }
        },
        { 
            header = Lang:t("qbmenu.thesmurfsicecream"),
            params = {
                event = "DD-burgershot:client:thesmurfsicecream",
            }
        },
        ----
        { 
            header = Lang:t("qbmenu.strawberryicecream"),
            params = {
                event = "DD-burgershot:client:strawberryicecream",
            }
        },
        { 
            header = Lang:t("qbmenu.matchaicecream"),
            params = {
                event = "DD-burgershot:client:matchaicecream",
            }
        },
        { 
            header = Lang:t("qbmenu.ubeicecream"),
            params = {
                event = "DD-burgershot:client:ubeicecream",
            }
        },
        { 
            header = Lang:t("qbmenu.smurfetteicecream"),
            params = {
                event = "DD-burgershot:client:smurfetteicecream",
            }
        },
        { 
            header = Lang:t("qbmenu.unicornicecream"),
            params = {
                event = "DD-burgershot:client:unicornicecream",
            }
        },
        { 
            header = Lang:t("qbmenu.backmenu"),
            params = {
                event = "DD-burgershot:ordermenu",
            }
        },
    })
end)


exports['DD-target']:AddCircleZone('duty', vector3(Config.Duty.x, Config.Duty.y, Config.Duty.z), 1.0,{
    name = 'duty', debugPoly = false, useZ=true}, {
    options = {{label = Lang:t("label.duty") ,icon = 'fa-solid fa-hand-holding', job = Config.Job, action = function() TriggerEvent('DD-burgershot:dutymenu') end}},
    distance = 1.0
})

exports['DD-target']:AddCircleZone('tray', vector3(Config.Tray.x, Config.Tray.y, Config.Tray.z), 1.0,{
    name = 'tray', debugPoly = false, useZ=true}, {
    options = {{label = Lang:t("label.tray") ,icon = 'fa-solid fa-hand-holding', action = function() TriggerEvent('DD-burgershot:tray') end}},
    distance = 2.0
})

exports['DD-target']:AddCircleZone('tray2', vector3(Config.Tray2.x, Config.Tray2.y, Config.Tray2.z), 1.0,{
    name = 'tray2', debugPoly = false, useZ=true}, {
    options = {{label = Lang:t("label.tray") ,icon = 'fa-solid fa-hand-holding',  action = function() TriggerEvent('DD-burgershot:tray2') end}},
    distance = 2.0
})

exports['DD-target']:AddCircleZone('Storge', vector3(Config.Storge.x, Config.Storge.y, Config.Storge.z), 1.0,{
    name = 'Storge', debugPoly = false, useZ=true}, {
    options = {{label = Lang:t("label.storge") ,icon = 'fa-solid fa-hand-holding', job = Config.Job, action = function() TriggerEvent('DD-burgershot:storge') end}},
    distance = 1.0
})

exports['DD-target']:AddCircleZone('Fridge', vector3(Config.Fridge.x, Config.Fridge.y, Config.Fridge.z), 1.0,{
    name = 'Fridge', debugPoly = false, useZ=true}, {
    options = {{label = Lang:t("label.Fridge") ,icon = 'fa-solid fa-hand-holding', job = Config.Job, action = function() TriggerEvent('DD-burgershot:ordermenu') end}},
    distance = 1.0
})

exports['DD-target']:AddCircleZone('Fries', vector3(Config.Fries.x, Config.Fries.y, Config.Fries.z), 1.0,{
    name = 'Fries', debugPoly = false, useZ=true}, {
    options = {{label = Lang:t("label.Fries") ,icon = 'fa-solid fa-hand-holding', job = Config.Job, action = function() TriggerEvent('DD-burgershot:friesmenu') end}},
    distance = 1.0
})

exports['DD-target']:AddCircleZone('Drink', vector3(Config.Drink.x, Config.Drink.y, Config.Drink.z), 1.0,{
    name = 'Drink', debugPoly = false, useZ=true}, {
    options = {{label = Lang:t("label.Drink") ,icon = 'fa-solid fa-hand-holding', job = Config.Job, action = function() TriggerEvent('DD-burgershot:drinkmenu') end}},
    distance = 1.0
})

exports['DD-target']:AddCircleZone('Meat', vector3(Config.MeatStation.x, Config.MeatStation.y, Config.MeatStation.z), 1.0,{
    name = 'Meat', debugPoly = false, useZ=true}, {
    options = {{label = Lang:t("label.Meat") ,icon = 'fa-solid fa-hand-holding', job = Config.Job, action = function() TriggerEvent('DD-burgershot:meatmenu') end}},
    distance = 1.0
})

exports['DD-target']:AddCircleZone('BurgerStation', vector3(Config.BurgerStation.x, Config.BurgerStation.y, Config.BurgerStation.z), 1.0,{
    name = 'BurgerStation', debugPoly = false, useZ=true}, {
    options = {{label = Lang:t("label.BurgerStation") ,icon = 'fa-solid fa-hand-holding', job = Config.Job, action = function() TriggerEvent('DD-burgershot:burgermenu') end}},
    distance = 1.0
})

exports['DD-target']:AddCircleZone('PackageStation', vector3(Config.PackageStation.x, Config.PackageStation.y, Config.PackageStation.z), 1.0,{
    name = 'PackageStation', debugPoly = false, useZ=true}, {
    options = {{label = Lang:t("label.PackageStation") ,icon = 'fa-solid fa-hand-holding', job = Config.Job, action = function() TriggerServerEvent('DD-burgershot:server:package') end}},
    distance = 1.0
})


exports['DD-target']:AddCircleZone('Clean', vector3(Config.Clean.x, Config.Clean.y, Config.Clean.z), 1.0,{
    name = 'Clean', debugPoly = false, useZ=true}, {
    options = {{label = Lang:t("label.Clean") ,icon = 'fa-solid fa-hand-holding', job = Config.Job, action = function() TriggerEvent('DD-burgershot:client:clean') end}},
    distance = 1.0
})

exports['DD-target']:AddCircleZone('SellItem', vector3(Config.SellItem.x, Config.SellItem.y, Config.SellItem.z), 1.0,{
    name = 'SellItem', debugPoly = false, useZ=true}, {
    options = {{label = Lang:t("label.SellItem") ,icon = 'fa-solid fa-hand-holding', job = Config.Job, action = function() TriggerEvent('DD-burgershot:sellpacket') end}},
    distance = 1.0
})





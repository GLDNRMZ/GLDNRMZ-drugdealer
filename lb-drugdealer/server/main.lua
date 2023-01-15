local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('lb-drugdealer:server:sellItems', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if Config.Items[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (Config.Items[Player.PlayerData.items[k].name].price * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Player.PlayerData.items[k].name], "remove")
                end
            end
        end
        Player.Functions.AddMoney("cash", price)
        TriggerClientEvent('QBCore:Notify', src, "Now fuck off before the the 5-0 shows up!!")
	end
end)

RegisterNetEvent('lb-drugdealer:server:sellmeth', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil and Player.PlayerData.items[k].name == "meth" then
                if Config.Items[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (Config.Items[Player.PlayerData.items[k].name].price * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Player.PlayerData.items[k].name], "remove")
                end
            end
        end
        if price > 0 then
            Player.Functions.AddMoney("cash", price)
            TriggerClientEvent('QBCore:Notify', src, "You sold your meth for $".. price)
        else
            TriggerClientEvent('QBCore:Notify', src, "You don't have meth to sell")
        end
	end
end)

RegisterNetEvent('lb-drugdealer:server:sellcoke', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil and Player.PlayerData.items[k].name == "coke" then
                if Config.Items[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (Config.Items[Player.PlayerData.items[k].name].price * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Player.PlayerData.items[k].name], "remove")
                end
            end
        end
        if price > 0 then
            Player.Functions.AddMoney("cash", price)
            TriggerClientEvent('QBCore:Notify', src, "You sold your coke for $".. price)
        else
            TriggerClientEvent('QBCore:Notify', src, "You don't have coke to sell")
        end
	end
end)

RegisterNetEvent('lb-drugdealer:server:selllsd', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil and Player.PlayerData.items[k].name == "lsd" then
                if Config.Items[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (Config.Items[Player.PlayerData.items[k].name].price * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Player.PlayerData.items[k].name], "remove")
                end
            end
        end
        if price > 0 then
            Player.Functions.AddMoney("cash", price)
            TriggerClientEvent('QBCore:Notify', src, "You sold your lsd for $".. price)
        else
            TriggerClientEvent('QBCore:Notify', src, "You don't have lsd to sell")
        end
	end
end)

RegisterNetEvent('lb-drugdealer:server:sellheroin', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil and Player.PlayerData.items[k].name == "heroin" then
                if Config.Items[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (Config.Items[Player.PlayerData.items[k].name].price * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Player.PlayerData.items[k].name], "remove")
                end
            end
        end
        if price > 0 then
            Player.Functions.AddMoney("cash", price)
            TriggerClientEvent('QBCore:Notify', src, "You sold your heroin for $".. price)
        else
            TriggerClientEvent('QBCore:Notify', src, "You don't have heroin to sell")
        end
	end
end)

RegisterNetEvent('lb-drugdealer:server:sellmoonshine', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil and Player.PlayerData.items[k].name == "moonshine" then
                if Config.Items[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (Config.Items[Player.PlayerData.items[k].name].price * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Player.PlayerData.items[k].name], "remove")
                end
            end
        end
        if price > 0 then
            Player.Functions.AddMoney("cash", price)
            TriggerClientEvent('QBCore:Notify', src, "You sold your moonshine for $".. price)
        else
            TriggerClientEvent('QBCore:Notify', src, "You don't have moonshine to sell")
        end
	end
end)

RegisterNetEvent('lb-drugdealer:server:selljoints', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil and Player.PlayerData.items[k].name == "joint" then
                if Config.Items[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (Config.Items[Player.PlayerData.items[k].name].price * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Player.PlayerData.items[k].name], "remove")
                end
            end
        end
        if price > 0 then
            Player.Functions.AddMoney("cash", price)
            TriggerClientEvent('QBCore:Notify', src, "You sold your joints for $".. price)
        else
            TriggerClientEvent('QBCore:Notify', src, "You don't have joints to sell")
        end
	end
end)

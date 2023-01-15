local QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = {}

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(200)
        PlayerJob = QBCore.Functions.GetPlayerData().job
        isLoggedIn = true
    end
end)

------------------------------
 -- RESOURCE START/LOAD IN --
------------------------------
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        PlayerJob = QBCore.Functions.GetPlayerData().job
        LocateGuy()
    end
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    LocateGuy()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

function loadAnimDict(dict) while (not HasAnimDictLoaded(dict)) do RequestAnimDict(dict) Wait(0) end end

function LocateGuy()

    if not DoesEntityExist(conBoss) then

        RequestModel(Config.BossModel) while not HasModelLoaded(Config.BossModel) do Wait(0) end

        conBoss = CreatePed(0, Config.BossModel, Config.BossCoords, false, false)
        
        SetEntityAsMissionEntity(conBoss)
        SetPedFleeAttributes(conBoss, 0, 0)
        SetBlockingOfNonTemporaryEvents(conBoss, true)
        SetEntityInvincible(conBoss, true)
        FreezeEntityPosition(conBoss, true)
        loadAnimDict("amb@world_human_leaning@female@wall@back@holding_elbow@idle_a")        
        TaskPlayAnim(conBoss, "amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", "idle_a", 8.0, 1.0, -1, 01, 0, 0, 0, 0)

        exports['qb-target']:AddTargetEntity(conBoss, { 
            options = {
                { 
                    type = "client",
                    event = "lb-drugdealer:client:tracktheguy",
                	icon = "fa-solid fa-location-dot",
                	label = "¿Buscar distribuidor?",
                },
            }, 
            distance = 1.5, 
        })
    end
end

function DeleteDrugDealer()
    if DoesEntityExist(drugdealer) then
        DeletePed(drugdealer)
    end
end

function TrackBlip()
	tracked = AddBlipForCoord(findme.x, findme.y, findme.z)
    SetBlipSprite(tracked, 162)
    SetBlipColour(tracked, 1)
    SetBlipAlpha(tracked, 200)
    SetBlipDisplay(tracked, 4)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Dealer Location")
    EndTextCommandSetBlipName(tracked)

    SetTimeout(120000, function() --2 minutes then removes blip from map.
        QBCore.Functions.Notify("Blip has expired.", 'error')
        RemoveBlip(tracked)
    end)
end

CreateThread(function()
    while true do
        Wait(5)
        local hours = GetClockHours()
        if hours >= Config.Open or hours < Config.Close then
                RequestModel(GetHashKey(Config.Model))
                while not HasModelLoaded(GetHashKey(Config.Model)) do
                    Wait(0)
                end

                if not DoesEntityExist(drugdealer) then

                    local pickaspotbro = math.random(#Config.Locations)
                
                    drugdealer = CreatePed(0, GetHashKey(Config.Model) , Config.Locations[pickaspotbro].x, Config.Locations[pickaspotbro].y, Config.Locations[pickaspotbro].z, Config.Locations[pickaspotbro].w, false, false)

                    SetEntityAsMissionEntity(drugdealer)
                    SetPedFleeAttributes(drugdealer, 0, 0)
                    SetBlockingOfNonTemporaryEvents(drugdealer, true)
                    SetEntityInvincible(drugdealer, true)
                    FreezeEntityPosition(drugdealer, true)
                    TaskStartScenarioInPlace(drugdealer, "WORLD_HUMAN_AA_SMOKE", 0, true)

                    exports['qb-target']:AddTargetEntity(drugdealer, {
                        options = {
                            { 
                                icon = "fa-solid fa-capsules",
                                label = "Sell all of your drugs to Narcos?",
                                action = function(entity)
                                    TriggerEvent('animations:client:EmoteCommandStart', {"argue"})
									if math.random(1, 100) >= 10 then
										exports['ps-dispatch']:SuspiciousActivity()
									end	
									QBCore.Functions.Progressbar("negotiate", "Negotiating Price..", 20000, false, false, {
                                        disableMovement = false,
                                        disableCarMovement = true,
                                        disableMouse = false,
                                        disableCombat = false,
                                    }, {}, {}, {}, function()
                                        ClearPedTasks(PlayerPedId())
                                        if PlayerJob.name ~= "police" then
											
											exports['qb-menu']:openMenu({
                                                {
                                                    header = "Deal to Narcos",
                                                    isMenuHeader = true
                                                },
                                                {
                                                    header = "",
            										txt = "Everything you got",
													icon = "fa-sharp fa-solid fa-chart-pie",
            										params = {
														isServer = true,
                										event = "lb-drugdealer:server:sellItems",
            										}
                                                },
												{
                                                    header = "",
            										txt = "All of your METH",
													icon = "fa-solid fa-burst",
            										params = {
														isServer = true,
                										event = "lb-drugdealer:server:sellmeth",
            										}
                                                },
												{
                                                    header = "",
            										txt = "All of your COKE",
													icon = "fa-solid fa-leaf",
            										params = {
														isServer = true,
                										event = "lb-drugdealer:server:sellcoke",
            										}
                                                },
												{
                                                    header = "",
            										txt = "All of your JOINTS",
													icon = "fa-solid fa-joint",
            										params = {
														isServer = true,
                										event = "lb-drugdealer:server:selljoints",
            										}
                                                },
												{
                                                    header = "",
            										txt = "All of your HEROIN",
													icon = "fa-solid fa-syringe",
            										params = {
														isServer = true,
                										event = "lb-drugdealer:server:sellheroin",
            										}
                                                },
												{
                                                    header = "",
            										txt = "All of your LSD",
													icon = "fa-sharp fa-solid fa-vial",
            										params = {
														isServer = true,
                										event = "lb-drugdealer:server:selllsd",
            										}
												},	
												{
                                                    header = "",
            										txt = "All of your MOONSHINE",
													icon = "fa-solid fa-jug",
            										params = {
														isServer = true,
                										event = "fa-solid fa-bottle-droplet",
            										}
                                                },
                                                {
                                                    header = "Close menu",
                                                    txt = "",
                                                    icon = "fa-solid fa-angle-left",
                                                    params = {
                                                        event = 'qb-menu:closeMenu'
                                                    }
                                                },
                                            })
                                        else
                                            QBCore.Functions.Notify("Get away from me piggy!", "error")
                                        end
                                    end)
                                end,
                            },
                        },
                        distance = 2.5,
                    })
                end
        else
            DeleteDrugDealer()
        end
    end
end)

function HackingSuccess(success)
    if success then
        TriggerEvent('mhacking:hide')
        findme = GetEntityCoords(drugdealer)
        SetNewWaypoint(findme.x, findme.y)
        TrackBlip()
        QBCore.Functions.Notify("Dealer found. Their location is now marked on your GPS", "primary", 6000)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    else
        TriggerEvent('mhacking:hide')
        QBCore.Functions.Notify("You failed the hack.", "error")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end
end

RegisterNetEvent('lb-drugdealer:client:tracktheguy')
AddEventHandler('lb-drugdealer:client:tracktheguy', function()
    if DoesEntityExist(drugdealer) then
        TriggerEvent('animations:client:EmoteCommandStart', {"think4"})
        QBCore.Functions.Progressbar("locate_guy", "Receiving GPS hack instructions..", 10500, false, false, {
            disableMovement = false,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = false,
        }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"texting"})
        Wait(2000)
        TriggerEvent("mhacking:show")
	    TriggerEvent("mhacking:start", 10, 20, HackingSuccess)
        end)
    else
        QBCore.Functions.Notify("It's too early to do this. Come back later.", "error")
    end
end)

-------------------------------------------------------------------------------
-- DEBUG COMMAND (MAKE SURE YOU COMMENT THIS OUT WHEN YOU'RE DONE DEBUGGING) --
-------------------------------------------------------------------------------

-- RegisterCommand('tpdealer', function()
--     if DoesEntityExist(drugdealer) then
--         findme = GetEntityCoords(drugdealer)
--         SetEntityCoords(PlayerPedId(), findme)
--     else
--         QBCore.Functions.Notify("Unable to locate the dealer at this time. He must be sleeping.", "error", 6000)
--     end
-- end)


--------------------
-- RESOURCE STOP --
--------------------

AddEventHandler('onResourceStop', function(resourceName) 
	if GetCurrentResourceName() == resourceName then
        DeleteDrugDealer()
        exports['qb-target']:RemoveZone("locateguy")
	end 
end)


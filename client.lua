local ESX = exports.es_extended:getSharedObject()

RegisterCommand('-+pausemenu', function(source, args, rawCommand)
     if IsPauseMenuActive() == 1 then 
            return 
     end
    PauseMenu(true)
end)


RegisterKeyMapping('-+pausemenu', 'Apri Menu di Pausa', 'keyboard', 'ESCAPE')
TriggerEvent('chat:removeSuggestion', '/-+pausemenu')

RegisterNUICallback('close', function(data, cb)
    PauseMenu(false)
end)

RegisterNUICallback('riprendi', function(data, cb)
    PauseMenu(false)
end)

RegisterNUICallback('map', function(data, cb)
    PauseMenu(false)
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'),0,-1) 
end)

RegisterNUICallback('impostazioni', function(data, cb)
    PauseMenu(false)
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'),0,-1) 
end)

RegisterNUICallback('tasti', function(data, cb)
    PauseMenu(false)
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_KEYMAPPING_MENU'),0,-1) 
end)

RegisterNUICallback('esci', function(data, cb)
    TriggerServerEvent('ricky:pausemenu:esci')
end)

PauseMenu = function(bool)
    ESX.TriggerServerCallback('ricky:pauseMenu:info', function(info)
    SetNuiFocus(bool,bool)
    SendNUIMessage({
       event = 'open',
       status = bool,


       playerOn = "numPlayer",
       numPlayer = info.playerOn,

       ping = "myPing",
       myPing = info.ping
    })
end)
end

CreateThread(function()
    while true do 
        SetPauseMenuActive(false) 
        Wait(10)
    end
end)

Citizen.CreateThread(function()
  while true do
    Wait(5000)
    ESX.TriggerServerCallback('ricky:pauseMenu:info', function(info)
    SendNUIMessage({
        playerOn = "numPlayer",
        numPlayer = info.playerOn,
        ping = "myPing",
        myPing = info.ping
     })
    end)
   end
end)

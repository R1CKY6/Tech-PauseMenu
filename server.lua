local ESX = exports.es_extended:getSharedObject()


ESX.RegisterServerCallback("ricky:pauseMenu:info", function(source,cb)
  local xPlayer = ESX.GetPlayerFromId(source)
  local xPlayers = ESX.GetPlayers()
  local info = {
    ping = GetPlayerPing(xPlayer.source),
    playerOn = #xPlayers
  }
  cb(info)
end)

RegisterServerEvent('ricky:pausemenu:esci')
AddEventHandler('ricky:pausemenu:esci', function()
    DropPlayer(source, Tech.ExitMessage)
end)
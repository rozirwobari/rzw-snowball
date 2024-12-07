local ESX = exports["es_extended"]:getSharedObject()
local RZWServerSnowBall = {}
RZWServerSnowBall.PlayerDelay = {}

RZWServerSnowBall.DelayChecked = function (identifier)
    if not RZWConfigSnowBall.DelayCollect then print('DelayCollect False') return true end
    print('DelayCollect True')
    if RZWServerSnowBall.PlayerDelay[identifier] then
        if RZWServerSnowBall.PlayerDelay[identifier] <= 0 then
            RZWServerSnowBall.PlayerDelay[identifier] = 10
            return true
        end
    else
        RZWServerSnowBall.PlayerDelay[identifier] = 10
        return true
    end
    return false
end

RegisterServerEvent('rzw-snowball:server:GetSnowBall')
AddEventHandler('rzw-snowball:server:GetSnowBall', function()
    local source = source -- Save Source
    local xPlayer = ESX.GetPlayerFromId(source)
    local cuaca = lib.callback.await('rzw-snowball:client:CuacaChecked', xPlayer.source)
    local isInVehicle = lib.callback.await('rzw-snowball:client:IsInVehicle', xPlayer.source)
    local delayChecked = RZWServerSnowBall.DelayChecked(xPlayer.identifier)

    if not delayChecked then
        TriggerClientEvent('ox_lib:notify', xPlayer.source, {
            title = 'SnowBall',
            description = 'Tunggu ' .. RZWServerSnowBall.PlayerDelay[xPlayer.identifier] .. ' Detik Untuk Mengambil SnowBall',
            position = 'top',
            duration = 7000,
            type = 'error',
            style = {
                backgroundColor = '#172A3E',
                color = '#D48D48',
                ['.description'] = {
                  color = '#E3E2E3'
                }
            },
        })
    end
    if cuaca and not isInVehicle then
        xPlayer.addInventoryItem(RZWConfigSnowBall.ItemName, 1)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if not RZWConfigSnowBall.DelayCollect then return end
        for key, value in pairs(RZWServerSnowBall.PlayerDelay) do
            if RZWServerSnowBall.PlayerDelay[key] >= 1 then
                RZWServerSnowBall.PlayerDelay[key] = RZWServerSnowBall.PlayerDelay[key] - 1
            end
        end
    end
end)

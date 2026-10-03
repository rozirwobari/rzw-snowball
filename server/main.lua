local ESX = exports["es_extended"]:getSharedObject()
local RZWSnowBall = {}
local Config = lib.load("shared.main")

function RZWSnowBall:Init()
    self.DelaySnowPlayer = {}
    RegisterServerEvent("rzw-snowball:server:GetSnowBall")
    AddEventHandler("rzw-snowball:server:GetSnowBall", function ()
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            if self.DelaySnowPlayer[xPlayer.source] then return end
            local IsSnowWeather = lib.callback.await('rzw-snowball:client:IsSnowWeather', xPlayer.source)
            if IsSnowWeather then
                xPlayer.addInventoryItem(Config.ItemName, 1)
                self.DelaySnowPlayer[xPlayer.source] = true
                SetTimeout((Config.DelayCollect * 1000), function()
                    self.DelaySnowPlayer[xPlayer.source] = nil
                end)
            end
        end
    end)
end

RZWSnowBall:Init()
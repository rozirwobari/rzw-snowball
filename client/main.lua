local RZWSnowBall = {}
local Config = lib.load("shared.main")

function RZWSnowBall:Init()
    self.DelaySnow = false
    lib.addKeybind({
        name = 'rzw_snowball',
        description = 'press '..Config.Keybind..' to get snowball',
        defaultKey = Config.Keybind,
        allowInPauseMenu = true,
        onPressed = function(selfBind)
            if self:IsSnowWeather() and not self.DelaySnow then
                self:GetSnowBall()
            end
        end
    })

    lib.callback.register('rzw-snowball:client:IsSnowWeather', function()
        return self:IsSnowWeather()
    end)
end

function RZWSnowBall:GetSnowBall()
    if lib.progressCircle({
        duration = 1500,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true
        },
        anim = {
            dict = 'anim@mp_snowball',
            clip = 'pickup_snowball'
        },
    }) then
        self.DelaySnow = true
        SetTimeout((Config.DelayCollect * 1000), function()
            self.DelaySnow = false
        end)
        TriggerServerEvent('rzw-snowball:server:GetSnowBall')
    end
end

function RZWSnowBall:IsSnowWeather()
    local weather = GetPrevWeatherTypeHashName()
    return Config.WeatherList[weather] or false
end

RZWSnowBall:Init()
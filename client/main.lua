local RZWClientSnowBall = {}
RZWClientSnowBall.AntiSpawm = false

RZWClientSnowBall.CuacaChecked = function()
    local cuaca = GetPrevWeatherTypeHashName()
    return RZWConfigSnowBall.Cuaca[cuaca]
end

RZWClientSnowBall.IsInVehicle = function()
    return IsPedInAnyVehicle(PlayerPedId(), true)
end

lib.callback.register('rzw-snowball:client:CuacaChecked', function()
    return RZWClientSnowBall.CuacaChecked()
end)

lib.callback.register('rzw-snowball:client:IsInVehicle', function()
    return RZWClientSnowBall.IsInVehicle()
end)

RegisterCommand('getsnowball', function(xPlayer, args, showError)
    if RZWClientSnowBall.AntiSpawm then return end
    RZWClientSnowBall.AntiSpawm = true
    if not RZWClientSnowBall.CuacaChecked() then
        lib.notify({
            title = 'SnowBall',
            description = 'Tidak Ada Salju',
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
        RZWClientSnowBall.AntiSpawm = false
        return
    end

    if RZWClientSnowBall.IsInVehicle() then
        lib.notify({
            title = 'SnowBall',
            description = 'Mengambil SnowBall tidak bisa di dalam kendaraan',
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
        RZWClientSnowBall.AntiSpawm = false
        return
    end

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
        RZWClientSnowBall.AntiSpawm = false
        TriggerServerEvent('rzw-snowball:server:GetSnowBall')
    else
        RZWClientSnowBall.AntiSpawm = false
    end
end, false)

RegisterKeyMapping('getsnowball', 'Mengamil Bola Salju', 'keyboard', RZWConfigSnowBall.Keybind)

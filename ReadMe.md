# rzw_snowball

Sistem Mengambil Bola Salju untuk Framework ESX

## 🔗 Links
- 💾 [Download](https://github.com/rozirwobari/rzw-snowball)

## ✨ Features

### Mengambil Bola Salju

- Mengambil Bola Salju tidak bisa di dalam kendaraan
- Mengambil Bola Salju terdapat delay tidak bisa spam
- Hanya bisa mengambil bola salju di cuaca salju

### Tambahkan di ox_inventory -> data -> weapons.lua
```lua
['WEAPON_SNOWBALL'] = {
    label = 'Snow Ball',
    weight = 1,
    throwable = true,
},
```

## 📦 Dependencies

- [ox_inventory](https://github.com/overextended/ox_inventory)
- [ox_lib](https://github.com/overextended/ox_lib)
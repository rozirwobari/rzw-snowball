# ❄️ rzw-snowball

<p align="center">
  <img src="https://img.shields.io/badge/version-2.0.0-blue.svg?style=for-the-badge" alt="Version 2.0.0">
  <img src="https://img.shields.io/badge/FiveM-Resource-orange.svg?style=for-the-badge" alt="FiveM">
  <img src="https://img.shields.io/badge/Framework-ESX-red.svg?style=for-the-badge" alt="ESX">
  <img src="https://img.shields.io/badge/Dependency-ox__lib-green.svg?style=for-the-badge" alt="ox_lib">
  <img src="https://img.shields.io/badge/Lua-5.4-purple.svg?style=for-the-badge" alt="Lua 5.4">
</p>

<p align="center">
  A lightweight, secure, and modern FiveM script that allows players to collect snowballs from the ground during snowy weather. Built with <b>ox_lib</b> and <b>ESX</b>.
</p>

---

## Features

- **Weather Detection**: Players can only gather snowballs when the weather matches designated snow conditions (default: `Xmas`).
- **Server-Side Validation & Anti-Exploit**:
  - Server verifies client weather state via `ox_lib` callbacks before granting items.
  - Built-in server-side cooldown prevents trigger injection and spamming.
- **FiveM Native Key Mapping**: Powered by `lib.addKeybind` (default: **G**). Players can customize their key in `GTA Settings -> Key Mappings -> FiveM`.
- **Smooth Progress & Animation**: Interactive `ox_lib` circular progress bar with native GTA snowball pickup animation (`anim@mp_snowball`).
- **High Performance**: 100% event-driven with zero idle thread loops (**0.00 ms** resmon).
- **Fully Configurable**: Easily configure item names, cooldown intervals, keybinds, and valid weather lists.

---

## Requirements & Dependencies

Make sure you have installed and started the following resources prior to `rzw-snowball`:

| Dependency | Description |
| :--- | :--- |
| **[ox_lib](https://github.com/overextended/ox_lib)** | Required for keybinds, progress circle, modular loader, and callbacks |
| **[es_extended](https://github.com/esx-framework/esx_core)** | Required for player inventory management (`xPlayer.addInventoryItem`) |

---

## Installation

1. Download or clone this repository into your FiveM server's resources directory:
   ```bash
   git clone https://github.com/rozirwobari/rzw-snowball.git
   ```
2. Make sure the snowball item (default: `WEAPON_SNOWBALL`) is registered in your items table or inventory configuration (e.g. `ox_inventory/data/items.lua` or ESX items database).
3. Add the resource to your `server.cfg` **after** `ox_lib` and `es_extended`:
   ```cfg
   ensure ox_lib
   ensure es_extended
   ...
   ensure rzw-snowball
   ```
4. Restart your server or run `ensure rzw-snowball` in the server console.

---

## Configuration

The configuration file is located at `shared/main.lua`:

```lua
local Config = {}

-- Default keybind to collect snowball (customizable in Key Mappings)
Config.Keybind = "G"

-- Item name given to the player's inventory
Config.ItemName = "WEAPON_SNOWBALL"

-- Delay / Cooldown between collections (in seconds)
Config.DelayCollect = 5

-- List of weather hashes where snowball pickup is enabled
Config.WeatherList = {
    [`Xmas`] = true,
    -- [`SNOW`] = true, -- Add more weather hashes if needed
}

return Config
```

---

## How to Use in Game

1. Set the server weather to **Xmas** (or any weather enabled in `Config.WeatherList`).
2. Stand on foot outside vehicles.
3. Press **G** (or your custom re-bound key).
4. A 1.5-second progress animation will play while your character scoops snow from the ground.
5. You will receive 1x Snowball (`WEAPON_SNOWBALL`) in your inventory.
6. A 5-second cooldown is enforced before you can scoop another snowball.

---

## 🇮🇩 Dokumentasi Bahasa Indonesia

### Ringkasan
`rzw-snowball` adalah script FiveM modern dan ringan untuk mengambil bola salju saat cuaca bersalju. Dibuat menggunakan framework **ESX** dan library **ox_lib**.

### Fitur Unggulan
- **Validasi Cuaca**: Pengambilan bola salju hanya aktif saat cuaca bersalju (default: `Xmas`).
- **Aman dari Spam & Cheat**: Dilengkapi pengecekan ganda di server menggunakan callback serta rate limit cooldown di server side.
- **Keybind FiveM**: Menggunakan tombol default **G** yang bisa diatur ulang oleh masing-masing player di menu *Settings GTA -> Key Mappings -> FiveM*.
- **Animasi Realistis**: Menggunakan animasi bawaan GTA dengan progress bar melingkar dari `ox_lib`.
- **Optimal**: Resmon 0.00 ms karena tidak ada loop/tick yang berjalan terus-menerus.

---

## License

This project is open-source and free to use for FiveM servers. Please keep credit to the original author.

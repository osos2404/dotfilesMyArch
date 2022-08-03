pcall(require, "luarocks.loader")
--[[
 _____ __ _ __ _____ _____ _____ _______ _____
|     |  | |  |  ___|  ___|     |       |  ___|
|  -  |  | |  |  ___|___  |  |  |  | |  |  ___|
|__|__|_______|_____|_____|_____|__|_|__|_____|
               ~ AestheticArch ~
            https://github.com/rxyhn
--]]

-- 📚 Library
local gfs = require("gears.filesystem")
local awful = require("awful")
local beautiful = require("beautiful")
dpi = beautiful.xresources.apply_dpi

-- 🎨 Themes
themes = {
      "day",      -- [1] 🌕 Beautiful Light Colorscheme
      "night",    -- [2] 🌑 Aesthetic Dark Colorscheme
}

theme = themes[2]
beautiful.init(gfs.get_configuration_dir() .. "theme/" .. theme .."/theme.lua")

-- 🌊 Default Applications
terminal = "kitty"
editor = terminal .. " -e " .. os.getenv("EDITOR")
vscode = "code"
browser = "firefox"
browser2 = "google-chrome-stable"
burp_proxy = "burpsuite"
launcher = "rofi -show drun -theme " .. gfs.get_configuration_dir() .. "theme/rofi.rasi"
file_manager = "nautilus"
music_client = terminal .. " --class music -e ncmpcpp"

-- 🌏 Weather API
openweathermap_key = "7c1ea146ad340954c33752bbf0e4a621" -- API Key
openweathermap_city_id = "3688465" -- City ID
weather_units = "metric" -- Unit

-- 🖥 Screen
screen_width = awful.screen.focused().geometry.width
screen_height = awful.screen.focused().geometry.height

-- 🚀 Launch Autostart
awful.spawn.with_shell(gfs.get_configuration_dir() .. "configuration/autostart")

-- 🤖 Import Configuration & module
require("configuration")
require("module")

-- ✨ Import Daemons, UI & Widgets
require("signal")
require("ui")

-- 🗑 Garbage Collector Settings
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)

-- Fondo de pantalla
local wallpaper_cmd="feh --bg-fill /home/santiago/Imágenes/fondo.jpg"
os.execute(wallpaper_cmd)
-- Teclado cambiar
local change_key_map="setxkbmap -option grp:alt_space_toggle latam,us &"
os.execute(change_key_map)

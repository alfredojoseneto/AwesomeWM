local awful = require("awful")

local wallpaper = "feh --bg-fill ~/.config/awesome/themes/wallpapers/debian.png"

local autostart = {
	wifi = "nm-applet",
	bluetooth = "blueman-applet",
	volumicon = "volumeicon",
	dropbpx = "dropbox start",
	wallpaper = wallpaper,
}

for _, v in pairs(autostart) do
	awful.util.spawn_with_shell("pgrep -u $USER -x " .. v .. " > /dev/null || (" .. v .. " &)")
	-- awful.util.spawn_with_shell(v .. " &")
end

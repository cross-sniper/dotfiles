-- Autorun programs
awful = require("awful")
autorun = true
autorunApps =
{
	"xfce4-panel",
	"blueman-applet",
	"nm-applet",
	"nitrogen --restore",
	"picom",
	"dunst",
	"alacritty"

}
if autorun then
   for app = 1, #autorunApps do
       awful.util.spawn(autorunApps[app])
   end
end

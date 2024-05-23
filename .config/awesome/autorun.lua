-- Autorun programs
awful = require("awful")
autorun = true
autorunApps =
{
   "alacritty",
   "nitrogen --restore",

}
if autorun then
   for app = 1, #autorunApps do
       awful.util.spawn(autorunApps[app])
   end
end

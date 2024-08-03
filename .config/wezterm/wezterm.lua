local wez = require"wezterm"
local act = wez.action
local conf = {
  background = {
    {
      source = {
        File = {
          path = "~/Pictures/my-hero-academia-wallpaper-59.jpg"
        }
      },
      height = 'Cover',
      width = 'Cover',
      opacity = 0.8
    },
    {
      source = {
        Gradient = {
          colors = {
            "#000000"
          },
          orientation = 'Vertical'
        }
      },
      height = "100%",
      width = "100%",
      opacity = 0.9
    }
  },


  font_size = 20,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
  }
}
conf.font =
  wez.font('JetBrainsMono Nerd Font', {bold=true})

return conf


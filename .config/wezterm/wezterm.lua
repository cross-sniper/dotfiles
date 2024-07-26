local wez = require"wezterm"
local act = wez.action
local conf = {
  background = {
    {
      source = {
        File = {
          path = "~/Pictures/my-hero-academia-wallpaper-11.png"
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

return conf


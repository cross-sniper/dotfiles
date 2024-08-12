local fns = require("fns")
local keymap = fns.keymap
keymap("n", "<leader>ns", "nohlsearch")
keymap("n", "<leader>fb", "Telescope buffers")

-- I like most of the defaults for Telescope hence not much to configure here
local telescope = require "telescope"

telescope.setup {
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
    }
}

---- Command Reference ----
-- <leader>f for find_files
-- <leader>g for live_grep
-- <leader>b for buffers 
-- ESC ESC to exit
-- More commands on :Telescope 
-- Keybindings on keymaps.lua

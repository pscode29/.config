-- Reference - https://github.com/folke/tokyonight.nvim

vim.g.tokyonight_style = "day"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "green", error = "orange"}

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]

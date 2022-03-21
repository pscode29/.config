local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Space is the leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows TODO - Not working 
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate between buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- jk as replacement for ESC in insert and visual mode
keymap("i", "jk", "<ESC>", opts)
keymap("v", "jk", "<ESC>", opts)

-- Stay in indent mode TODO need to test this
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- In visual block mode, move selected lines up and down 
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Toggle file explorer 
-- keymap("n", "<leader>e", ":Lex 30<cr>", opts) -- for lex netrw
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)  -- for nvim-tree

-- Telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)

-- Close all my buffers
keymap("n", "<leader>Q", ":bufdo bdelete<cr>", opts)
-- Save current buffer
keymap("n", "<leader>s", ":w<cr>", opts)
-- Save and Exit
keymap("n", "<leader>ss", ":wq<cr>", opts)
-- Force Exit
keymap("n", "<leader>q", ":q!<cr>", opts)

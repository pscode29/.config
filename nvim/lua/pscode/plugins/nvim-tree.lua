vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
}

vim.g.nvim_tree_indent_markers = 1  -- 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_git_hl = 1  -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_highlight_opened_files = 1  -- 0 by default, will enable folder and file icon highlight for opened files/directories.

local nvim_tree = require "nvim-tree"
local nvim_tree_config = require "nvim-tree.config"

nvim_tree.setup {
  disable_netrw        = true,
  hijack_netrw         = true,
  ignore_ft_on_setup   = {},
  auto_close           = true,
  open_on_tab          = false,
  update_cwd           = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view= {
    width = 30,
    height = 30,
    hide_root_folder = false, 
    side = 'left',
    auto_resize = true,
    preserve_window_proportions = true,
    mappings = {
      custom_only = false,
      -- In app key maps
      list = {
        { key = "h", cb = nvim_tree_config.nvim_tree_callback "close_node" },  -- to collapse expanded nodes
      }
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
} 
-------------------- Default actions reference ---------------------------------------------------------------------- 

-- <CR> or o on the root folder will cd in the above directory
-- <C-]> will cd in the directory under the cursor
-- <BS> will close current opened directory or parent
-- type a to add a file. Adding a directory requires leaving a leading / at the end of the path.
-- you can add multiple directories by doing foo/bar/baz/f and it will add foo bar and baz directories and f as a file
-- type r to rename a file
-- type <C-r> to rename a file and omit the filename on input
-- type x to add/remove file/directory to cut clipboard
-- type c to add/remove file/directory to copy clipboard
-- type y will copy name to system clipboard
-- type Y will copy relative path to system clipboard
-- type gy will copy absolute path to system clipboard
-- type p to paste from clipboard. Cut clipboard has precedence over copy (will prompt for confirmation)
-- type d to delete a file (will prompt for confirmation)
-- type D to trash a file (configured in setup())
-- type ]c to go to next git item
-- type [c to go to prev git item
-- type - to navigate up to theparent directory of the current file/directory
-- type s to open a file with default system application or a folder with default file manager (if you want to change the command used to do it see :h nvim-tree.setup under system_open)
-- if the file is a directory, <CR> will open the directory otherwise it will open the file in the buffer near the tree
-- if the file is a symlink, <CR> will follow the symlink (if the target is a file)
-- <C-v> will open the file in a vertical split
-- <C-x> will open the file in a horizontal split
-- <C-t> will open the file in a new tab
-- <Tab> will open the file as a preview (keeps the cursor in the tree)
-- I will toggle visibility of hidden folders / files
-- H will toggle visibility of dotfiles (files/folders starting with a .)
-- R will refresh the tree
-- Double left click acts like <CR>
-- Double right click acts like <C-]>
-- W will collapse the whole tree
-- S will prompt the user to enter a path and then expands the tree to match the path
-- . will enter vim command mode with the file the cursor is on
-- C-k will toggle a popup with file infos about the file under the cursor 

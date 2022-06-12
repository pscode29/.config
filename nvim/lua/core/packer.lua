-- Everything from here - https://github.com/wbthomason/packer.nvim
-- Bootstrapping Packer
local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path})
end

vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]])

local packer = require("packer")
-- Define plugins that packer should install
packer.startup {
  function(use)
    -- Packer install packer kind of thing
    use "wbthomason/packer.nvim"
    -- Lua functions
    use "nvim-lua/plenary.nvim"
    -- Popup API
    use "nvim-lua/popup.nvim"
    -- Icons
    use "kyazdani42/nvim-web-devicons"
    -- File explorer
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]]) -- not sure why this is needed but the doc suggests that
    use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
    }
    -- Syntax highlighting
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    }
    -- Fuzzy finder
    use "nvim-telescope/telescope.nvim"
    -- Completions
    use "hrsh7th/nvim-cmp"  -- Plugin that enables completion
    use "L3MON4D3/LuaSnip"  -- Snippet completion engine/parser, not just for lua, needed for all languages, even if you do not use snippets
    -- Completion sources
    use "hrsh7th/cmp-nvim-lsp"  -- Plugin that provides completion source from language servers, this is used in lsp.lua
    use "hrsh7th/cmp-buffer"  -- Plugin that provides completion source from buffer
    use "hrsh7th/cmp-path"  -- Plugin that provides completion source for paths
    use "saadparwaiz1/cmp_luasnip" -- snippet completions source for lua snippets
    -- Add more completion sources here if needed
    -- LSPs
    use "neovim/nvim-lspconfig"  -- Builtin LSP
    use "williamboman/nvim-lsp-installer"  -- LSP Installer
    -- LSP Server specific settings plugin, example for better json support
    use "b0o/SchemaStore.nvim"
    -- Code outline 
    use "stevearc/aerial.nvim"
    -- Commenting
    use "numToStr/Comment.nvim"
    -- Integrated terminal
    use "akinsho/nvim-toggleterm.lua"
    -- Status line
    use "nvim-lualine/lualine.nvim"
    -- Bufferline
    use "akinsho/bufferline.nvim"


    -- Colorschemes
    use 'folke/tokyonight.nvim'

    if packer_bootstrap then
      require("packer").sync()
    end
  end,

  config = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    }
  },
}

    -- Essential plugins
--    use "wbthomason/packer.nvim" -- Packer install packer sort of thing
--    use "nvim-lua/popup.nvim" -- Needed by many other plugins
--    use "nvim-lua/plenary.nvim" -- Needed by many other plugins
--    use "kyazdani42/nvim-web-devicons"  -- Needed for explorer icons, also used by some other plugins
--
--    -- Colorschemes
--    use "folke/tokyonight.nvim"
--    use "ful1e5/onedark.nvim"
--
--    -- File explorers
--    use "kyazdani42/nvim-tree.lua"
--
--    -- Telescope
--    use "nvim-telescope/telescope.nvim"
--
--    -- LSPs
--    use "neovim/nvim-lspconfig"
--    use "williamboman/nvim-lsp-installer"
--
--    -- Treesitter
--    use {
--        "nvim-treesitter/nvim-treesitter",
--        run = ":TSUpdate",
--    }
--
--    -- Comment
--    use {"terrortylor/nvim-comment"}
--
--    -- Lualine
--    use {"nvim-lualine/lualine.nvim"}
--
--    -- Bufferline
--    use {"akinsho/bufferline.nvim"}
--
--    -- Toggleterm
--    use {"akinsho/toggleterm.nvim"}
--
--    -- Autopair
--    use {"windwp/nvim-autopairs"}
--
--    if packer_bootstrap then
--      require("packer").sync()
--    end
--
--end)

--------------------------------------- Command reference ------------------------------------
-- Regenerate compiled loader file
-- :PackerCompile

-- Remove any disabled or unused plugins
-- :PackerClean

-- Clean, then install missing plugins
-- :PackerInstall

-- Clean, then update and install plugins
-- :PackerUpdate

-- Perform `PackerUpdate` and then `PackerCompile`
-- :PackerSync

-- Loads opt plugin immediately
-- :PackerLoad completion-nvim ale
------------------------------------------------------------------------------------------------

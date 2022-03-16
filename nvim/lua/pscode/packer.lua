-- Everything from here - https://github.com/wbthomason/packer.nvim
-- Bootstrapping Packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git', 
        'clone', 
        '--depth', 
        '1', 
        'https://github.com/wbthomason/packer.nvim', 
        install_path})
    end

vim.cmd([[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost packer.lua source <afile> | PackerCompile
    augroup end
    ]])

return require('packer').startup(function(use)
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'rounded' })
            end
        }
    }

    -- Essential plugins
    use "wbthomason/packer.nvim" -- Packer install packer sort of thing
    use "nvim-lua/popup.nvim" -- Needed by many other plugins
    use "nvim-lua/plenary.nvim" -- Needed by many other plugins 
    use "kyazdani42/nvim-web-devicons"  -- Needed for explorer icons, also used by some other plugins
    
    -- Colorschemes
    use "folke/tokyonight.nvim"
    
    -- File explorers
    use "kyazdani42/nvim-tree.lua"  -- https://github.com/kyazdani42/nvim-tree.lua

    -- Telescope
    use "nvim-telescope/telescope.nvim"

    -- LSPs
    use "neovim/nvim-lspconfig"  -- https://github.com/neovim/nvim-lspconfig
    use "glepnir/lspsaga.nvim"

    -- Completions 
    use 'hrsh7th/nvim-cmp'  -- Plugin that enables completion - https://github.com/hrsh7th/nvim-cmp
    -- Completion sources
    use 'hrsh7th/cmp-nvim-lsp'  -- Plugin that provides completion source from language servers, this is used in lsp.lua
    use 'hrsh7th/cmp-buffer'  -- Plugin that provides completion source from buffer 
    use 'hrsh7th/cmp-path'  -- Plugin that provides completion source for paths 

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }

    -- Comment
    use {"terrortylor/nvim-comment"}

    -- Lualine
    use {"nvim-lualine/lualine.nvim"}

    -- Bufferline
    -- use {"akinsho/bufferline.nvim"}

    -- Toggleterm
    use {"akinsho/toggleterm.nvim"}

    
    if packer_bootstrap then
      require('packer').sync()
    end
end)

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

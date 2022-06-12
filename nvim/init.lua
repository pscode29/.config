for _, source in ipairs {
    "core.options",
    "core.keymaps",
    "core.packer",
    "plugins.icons",
    "plugins.neo-tree",
    "plugins.treesitter",
    "plugins.telescope",
    "plugins.cmp",
    "plugins.nvim-lsp-installer",
    "plugins.lsp",
    "plugins.aerial",
    "plugins.comment",
    "plugins.lualine",
    "plugins.bufferline",
    "colorschemes.tokyonight",
  } do
    local status_ok, fault = pcall(require, source)
    if not status_ok then
        vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
    end
end

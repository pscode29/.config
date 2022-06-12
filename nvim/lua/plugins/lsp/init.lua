-- The init file inside a folder exports all the files inside the folder so you dont have to export each file separately
-- Inspiration from AstroNvim, Official docs and ChrisAtMachine
-- Get the lspconfig from Neovim, we will update this config for whichever lsp we are using
local status_ok, lspconfig = pcall(require, "lspconfig")
if status_ok then
  require "plugins.lsp.handlers"
  local insert = table.insert
  local sign_define = vim.fn.sign_define

  -- Define signs for LSP messages
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }
  for _, sign in ipairs(signs) do
    sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end
  -- Properties of diagnostic message and window
  vim.diagnostic.config({
    virtual_text = false,  -- The virtual diagnostic message, gets pretty ugly so I am disabling them
    signs = { active = signs },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {  -- LSP message window design
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

  -- Place holder for servers, once you install them using lsp-installer this will be updated below
  local servers = {}

  -- Update the servers table with installed servers
  local installer_avail, lsp_installer = pcall(require, "nvim-lsp-installer")
  if installer_avail then
    for _, server in ipairs(lsp_installer.get_installed_servers()) do
      insert(servers, server.name)
    end
  end

-- print("Pushpraj: This msg is coming from lsp/handlers.lua")
-- print("I have following language servers installed - ")
  -- For each server, add these capabilities, on attach actions and additional server specific settings
  for _, server in ipairs(servers) do
    -- print(server)
    local opts = M.server_settings(server)
    lspconfig[server].setup(opts)
  end
end

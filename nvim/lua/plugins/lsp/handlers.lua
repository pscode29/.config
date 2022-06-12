-- A placeholder to hold instance variables and methods
M = {}
local keymap = vim.keymap.set


-- Autocommand to highlight lsp things, my understanding, taken from AstroNvim
local function lsp_highlight_document(client)
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
      group = "lsp_document_highlight",
      pattern = "<buffer>",
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = "lsp_document_highlight",
      pattern = "<buffer>",
      callback = vim.lsp.buf.clear_references,
    })
  end
end

-- Define the attachment actions
-- When a buffer is attached with an LSP server, these are keymaps to do LSP actions like hover or go to reference etc.
M.on_attach = function(client, bufnr)
  keymap("n", "K", function()
    vim.lsp.buf.hover()  -- Hover with Shift K
  end, { desc = "Hover symbol details", buffer = bufnr })
  keymap("n", "<leader>la", function()
    vim.lsp.buf.code_action()
  end, { desc = "LSP code action", buffer = bufnr })
  keymap("n", "<leader>lf", function()
    vim.lsp.buf.formatting_sync()
  end, { desc = "Format code", buffer = bufnr })
  keymap("n", "<leader>lh", function()
    vim.lsp.buf.signature_help()
  end, { desc = "Signature help", buffer = bufnr })
  keymap("n", "<leader>lr", function()
    vim.lsp.buf.rename()
  end, { desc = "Rename current symbol", buffer = bufnr })
  keymap("n", "gD", function()  -- Go to reference with gD
    vim.lsp.buf.declaration()
  end, { desc = "Declaration of current symbol", buffer = bufnr })
  keymap("n", "gI", function()
    vim.lsp.buf.implementation()
  end, { desc = "Implementation of current symbol", buffer = bufnr })
  keymap("n", "gd", function()
    vim.lsp.buf.definition()
  end, { desc = "Show the definition of current symbol", buffer = bufnr })
  keymap("n", "gr", function()
    vim.lsp.buf.references()
  end, { desc = "References of current symbol", buffer = bufnr })
  keymap("n", "<leader>ld", function()
    vim.diagnostic.open_float()
  end, { desc = "Hover diagnostics", buffer = bufnr })
  keymap("n", "[d", function()
    vim.diagnostic.goto_prev()
  end, { desc = "Previous diagnostic", buffer = bufnr })
  keymap("n", "]d", function()
    vim.diagnostic.goto_next()
  end, { desc = "Next diagnostic", buffer = bufnr })
  keymap("n", "gl", function()
    vim.diagnostic.open_float()
  end, { desc = "Hover diagnostics", buffer = bufnr })
  vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
    vim.lsp.buf.formatting()
  end, { desc = "Format file with LSP" })

  -- If a highligher is available like aerial then use that
  local aerial_avail, aerial = pcall(require, "aerial")
  if aerial_avail then
    aerial.on_attach(client, bufnr)
    lsp_highlight_document(client)
  end
end

-- Define the capabilities to be provided by the lserver
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.completion.completionItem.preselectSupport = true
M.capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
M.capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
M.capabilities.textDocument.completion.completionItem.deprecatedSupport = true
M.capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
M.capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
M.capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { "documentation", "detail", "additionalTextEdits" },
}

function M.server_settings(server_name)
  local opts = {
    capabilities = M.capabilities,
    on_attach = M.on_attach
  }
  -- Add additional settings from server_settings
  -- For e.g. vim is defined as global object in sumoneko_lua.lua and hence the warning sign that vim is not a global variable is gone
  local has_custom_opts, server_custom_opts = pcall(require, "plugins.lsp.server-settings." .. server_name)  -- the . in the end of "lsp.server-settings." is important
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
  end
  return opts
end

-- By default formatting is disabled, generally this is overridden by specialized formatters
function M.disable_formatting(client)
  client.resolved_capabilities.document_formatting = false
end

return M

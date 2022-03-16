local cmp = require "cmp"

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

cmp.setup({
    -- snippet = {} -- I do not use snippets, add here if required
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),  -- Helps scrolling left I guess
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),  -- Helps scrolling right I guess 
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),  -- Open completion menu without typing 
        ['<C-y>'] = cmp.config.disable,  -- I do not know what it does, does not matter
        ['<C-e>'] = cmp.mapping.close(),  -- Close completion menu 
        ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),  -- Scrolling down with Tab in the menu
        ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),  -- Scrolling up with S-TAB 
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- ENTER to select the selected completion option 
    },
    sources = cmp.config.sources{
        { name = 'nvim_lsp'},  -- From that lsp completion source
        { name = 'buffer'},  -- From that buffer completion source
        { name = 'path'},  -- From that path completion source
        { name = 'cmdline'},  -- From that command line completion source
    documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
    },
    formatting = {
        format = function(entry, vim_item)
        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
        vim_item.menu = ({
            nvim_lsp = "[LSP]",
            buffer = "[Buffer]",
            path = "[Path]"
        })[entry.source.name]
        return vim_item
    end
    },
})


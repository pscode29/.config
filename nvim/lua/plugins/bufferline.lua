local utils = require "plugins.utils"

local status_ok, bufferline = pcall(require, "bufferline")
if status_ok then
  bufferline.setup({
    options = {
      offsets = {
        { filetype = "NvimTree", text = "", padding = 1 },
        { filetype = "neo-tree", text = "", padding = 1 },
        { filetype = "Outline", text = "", padding = 1 },
      },
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      max_name_length = 14,
      max_prefix_length = 13,
      tab_size = 20,
      separator_style = "thin",
    },
  })
end

-----------------------------------------------------------------------------------------------------
-- Set colors for neo-tree
-----------------------------------------------------------------------------------------------------
-- Get all the colors from core.colors
local C = require "core.colors"

-- Define what you want for neotree
local bufferline_colors = {
    BufferLineFill = { fg = C.grey_9, bg = C.grey_4 },
    BufferLineBackground = { fg = C.grey_9, bg = C.grey_4 },
    BufferLineBufferVisible = { fg = C.fg, bg = C.bg },
    BufferLineBufferSelected = { fg = C.white, bg = C.bg, bold = true },
    BufferLineTab = { fg = C.grey_9, bg = C.bg },
    BufferLineTabSelected = { fg = C.fg, bg = C.bg },
    BufferLineTabClose = { fg = C.red_4, bg = C.bg },
    BufferLineIndicatorSelected = { fg = C.bg, bg = C.bg },
    BufferLineSeparator = { fg = C.grey_4, bg = C.grey_4 },
    BufferLineSeparatorVisible = { fg = C.bg, bg = C.bg },
    BufferLineSeparatorSelected = { fg = C.grey_4, bg = C.grey_4 },
    BufferLineCloseButton = { fg = C.grey_9, bg = C.grey_4 },
    BufferLineCloseButtonVisible = { fg = C.grey_10, bg = C.bg },
    BufferLineCloseButtonSelected = { fg = C.red_4, bg = C.bg },
    BufferLineModified = { fg = C.red_4, bg = C.grey_4 },
    BufferLineModifiedVisible = { fg = C.fg, bg = C.bg },
    BufferLineModifiedSelected = { fg = C.green_2, bg = C.bg },
    BufferLineError = { fg = C.red_1, bg = C.red_1 },
    BufferLineErrorDiagnostic = { fg = C.red_1, bg = C.red_1 },
}

-- Define highlights
local highlights = {}
highlights = vim.tbl_deep_extend("force", highlights, bufferline_colors)

-- Apply colors
for group, spec in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, utils.parse_style(spec))
end
 -----------------------------------------------------------------------------------------------------

local function get_hl_colors(name)
  local hl = vim.api.nvim_get_hl_by_name(name, true)
  return {
    fg = hl.fg,
    bg = hl.bg
  }
end

local hl = vim.api.nvim_set_hl
function extend_hl(name, new_def)
  local current_def = vim.api.nvim_get_hl(0, { name = name })
  local merged_def = vim.tbl_extend('force', current_def, new_def)
  vim.api.nvim_set_hl(0, name, merged_def)
end

local normal_colors = get_hl_colors("Normal")

hl(0, 'LspSignatureActiveParameter', {
  fg = normal_colors.fg,
  bold = true,
  underline = true,
  bg = normal_colors.bg
})
extend_hl('Number', { italic = false })
extend_hl("DiagnosticError", { bg = "NONE" })
extend_hl("NormalFloat", { bg = "NONE" })
extend_hl("NotifyBackground", { link = "NormalFloat" })


-- Nord theme
local nord = require("nord.colors")
vim.g.nord_italic = false
hl(0, "@lsp.typemod.property.declaration.typescript", { fg = nord.nord5_gui })
hl(0, "@type", { fg = nord.nord15_gui })
hl(0, "@keyword.function", { fg = nord.nord9_gui })
hl(0, "@lsp.typemod.class.defaultLibrary.typescript", { fg = nord.nord10_gui })
hl(0, "@lsp.typemod.function.declaration.typescript", { fg = nord.nord4_gui })
hl(0, "@property", { fg = nord.nord4_gui })
hl(0, "FloatBorder", { bg = "NONE", fg = nord.nord10_gui })

vim.diagnostic.config({
  update_in_insert = false,
  severity_sort = true,
  virtual_text = {
    current_line = true,
  },
  float = {
    source = "always",
    border = 'rounded'
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✕',
      [vim.diagnostic.severity.WARN] = '△',
      [vim.diagnostic.severity.INFO] = '●',
      [vim.diagnostic.severity.HINT] = '○',
    },
  },
  underline = true,
  jump = { float = true },
})


require("notify").setup({
  background_colour = "#000000"
})

--[[
  black = "#2E3440", -- nord0 in palette
	dark_gray = "#3B4252", -- nord1 in palette
	gray = "#434C5E", -- nord2 in palette
	light_gray = "#4C566A", -- nord3 in palette
	light_gray_bright = "#616E88", -- out of palette
	darkest_white = "#D8DEE9", -- nord4 in palette
	darker_white = "#E5E9F0", -- nord5 in palette
	white = "#ECEFF4", -- nord6 in palette
	teal = "#8FBCBB", -- nord7 in palette
	off_blue = "#88C0D0", -- nord8 in palette
	glacier = "#81A1C1", -- nord9 in palette
	blue = "#5E81AC", -- nord10 in palette
	red = "#BF616A", -- nord11 in palette
	orange = "#D08770", -- nord12 in palette
	yellow = "#EBCB8B", -- nord13 in palette
	green = "#A3BE8C", -- nord14 in palette
	purple = "#B48EAD", -- nord15 in palette
--]]

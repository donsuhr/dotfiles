local function get_hl_colors(name)
	local hl = vim.api.nvim_get_hl(0, { name = name })
	return {
		fg = hl.fg,
		bg = hl.bg,
	}
end

local hl = vim.api.nvim_set_hl
function extend_hl(name, new_def)
	local current_def = vim.api.nvim_get_hl(0, { name = name })
	local merged_def = vim.tbl_extend("force", current_def, new_def)
	vim.api.nvim_set_hl(0, name, merged_def)
end

local normal_colors = get_hl_colors("Normal")

extend_hl("Number", { italic = false })
extend_hl("DiagnosticError", { bg = "NONE" })
extend_hl("NormalFloat", { bg = "NONE" })
extend_hl("NotifyBackground", { link = "NormalFloat" })

-- Nord theme
local nord = require("nord.colors")
vim.g.nord_italic = false
hl(0, "@keyword.function", { fg = nord.nord9_gui })
hl(0, "@lsp.typemod.class.defaultLibrary.typescript", { fg = nord.nord10_gui })
hl(0, "@lsp.typemod.function.declaration.typescript", { fg = nord.nord4_gui })
hl(0, "@lsp.typemod.property.declaration.typescript", { fg = nord.nord5_gui })
hl(0, "@property", { fg = nord.nord4_gui })
hl(0, "@type", { fg = nord.nord15_gui })
hl(0, "AvanteSidebarWinSeparator", { fg = nord.nord3_gui })
hl(0, "BlinkCmpDocBorder", { bg = "NONE", fg = nord.nord10_gui })
hl(0, "BlinkCmpKind", { fg = nord.nord4_gui, bg = "NONE" })
hl(0, "BlinkCmpMenu", { bg = "NONE", fg = nord.nord4_gui })
hl(0, "BlinkCmpMenuBorder", { bg = "NONE", fg = nord.nord10_gui })
hl(0, "BlinkCmpMenuSelection", { bg = nord.nord15_gui, fg = nord.nord0_gui })
hl(0, "BlinkCmpScrollBarThumb", { fg = nord.nord10_gui, bg = nord.nord10_gui })
hl(0, "BlinkCmpSource", { fg = nord.nord4_gui, bg = "NONE" })
hl(0, "DiagnosticUnderlineError", { sp = nord.nord11_gui, undercurl = true })
hl(0, "DiagnosticUnderlineInfo", { sp = nord.nord15_gui, undercurl = true })
hl(0, "DiagnosticUnderlineWarn", { sp = nord.nord13_gui, undercurl = true })
hl(0, "FloatBorder", { bg = "NONE", fg = nord.nord10_gui })
hl(0, "LspSignatureActiveParameter", {
	fg = normal_colors.fg,
	bold = true,
	underline = true,
	bg = normal_colors.bg,
})
hl(0, "MatchParen", { fg = nord.nord15_gui, bg = nord.nord3_gui, bold = true }) -- Example colors
hl(0, "MatchParen", { fg = nord.nord15_gui, bg = nord.nord3_gui, bold = true }) -- Example colors
hl(0, "NvimTreeWindowPicker", { bg = nord.nord14_gui, fg = nord.nord0_gui, bold = true })
hl(0, "RenderMarkdownCode", { bg = nord.nord1_gui })
hl(0, "VertSplit", { fg = nord.nord3_gui })
hl(0, "WinSeparator", { fg = nord.nord3_gui })

-- folder name

hl(0, "NvimTreeRootFolder", { fg = nord.nord15_gui, bold = true })
hl(0, "NvimTreeFolderName", { fg = nord.nord9_gui, bold = false })
hl(0, "NvimTreeOpenedFolderName", { fg = nord.nord9_gui, bold = false })
-- arrow
hl(0, "NvimTreeFolderArrowOpen", { fg = nord.nord9_gui })
hl(0, "NvimTreeFolderArrowClosed", { fg = nord.nord9_gui })
-- folder icon
hl(0, "NvimTreeOpenedFolderIcon", { fg = nord.nord9_gui })
hl(0, "NvimTreeFolderIcon", { fg = nord.nord9_gui })
hl(0, "DevIconDefault", { fg = nord.nord15_gui })

-- :Inspect shows highlight under cursor

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

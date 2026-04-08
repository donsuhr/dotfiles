local function extend_hl(name, new_def)
	local current_def = vim.api.nvim_get_hl(0, { name = name })
	local merged_def = vim.tbl_extend("force", current_def, new_def)
	vim.api.nvim_set_hl(0, name, merged_def)
end

local hl = vim.api.nvim_set_hl
local normal = vim.api.nvim_get_hl(0, { name = "Normal" })

extend_hl("Number", { italic = false })
extend_hl("DiagnosticError", { bg = "NONE" })
extend_hl("NormalFloat", { bg = "NONE" })
extend_hl("NotifyBackground", { link = "NormalFloat" })

hl(0, "LspSignatureActiveParameter", {
	fg = normal.fg,
	bold = true,
	underline = true,
	bg = normal.bg,
})

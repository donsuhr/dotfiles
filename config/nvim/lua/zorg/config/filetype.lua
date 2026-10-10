-- Go html/template files (.gohtml): treat as html for autoclose/emmet/snippets/lsp.
-- Neovim has no builtin mapping for this extension.
vim.filetype.add({
	extension = {
		gohtml = "html",
	},
})

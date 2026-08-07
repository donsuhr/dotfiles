vim.lsp.config("ts_ls", {
	settings = {
		typescript = {
			tsdk = ".yarn/sdks/typescript/lib",
		},
	},
})

local base_on_attach = vim.lsp.config.eslint.on_attach
vim.lsp.config("eslint", {
	on_attach = function(client, bufnr)
		if not base_on_attach then
			return
		end

		base_on_attach(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "LspEslintFixAll",
		})
	end,
	settings = {
		experimental = {
			useFlatConfig = true,
		},
		packageManager = "yarn",
		nodePath = ".yarn/sdks",
	},
})

vim.lsp.enable("eslint")
vim.lsp.enable("ts_ls")

require("conform").formatters.prettier = {
	command = vim.fn.getcwd() .. "/.yarn/sdks/prettier/bin/prettier.cjs",
}

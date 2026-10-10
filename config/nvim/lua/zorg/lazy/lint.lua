return {
	"mfussenegger/nvim-lint",
	enabled = true,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		-- golangci-lint needs to run from the go module/workspace root to
		-- find .golangci.yml, but nvim's cwd is often somewhere else.
		local golangcilint = lint.linters.golangcilint
		lint.linters.golangcilint = function()
			local linter = vim.deepcopy(golangcilint)
			linter.cwd = vim.fs.root(0, { "go.work", "go.mod", ".git" })
			return linter
		end

		lint.linters_by_ft = {
			-- js linting in lsp causes duplicate errors here
			-- css = { "eslint_d" },
			go = { "golangcilint" },
			markdown = { "markdownlint-cli2" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}

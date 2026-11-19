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
			-- nvim-lint decides file vs dir once at load time using nvim's cwd.
			-- If cwd isn't in a go module it passes the single file, which makes
			-- typecheck report "undefined: X" for symbols in sibling files.
			-- Lint the package dir whenever the buffer is inside a module.
			local bufdir = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
			if bufdir and vim.fs.root(bufdir, { "go.mod" }) then
				local args = vim.deepcopy(linter.args)
				args[#args] = bufdir
				linter.args = args
			end
			return linter
		end

		lint.linters_by_ft = {
			-- js linting in lsp causes duplicate errors here
			-- css = { "eslint_d" },
			go = { "golangcilint" },
			markdown = { "markdownlint-cli2" },
			make = { "checkmake" },
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

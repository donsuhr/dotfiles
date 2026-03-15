return {
	"stevearc/conform.nvim",
	enabled = true,
	opts = {},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local jsFmt = { "prettierd" }

		require("conform").setup({
			log_level = vim.log.levels.DEBUG,
			format_on_save = {
				async = false,
				quiet = false,
				timeout_ms = 2000,
				lsp_format = "fallback",
			},

			formatters_by_ft = {
				lua = { "stylua" },
				javascript = jsFmt,
				typescript = jsFmt,
				javascriptreact = jsFmt,
				typescriptreact = jsFmt,
				css = jsFmt,
				html = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				yaml = { "prettier" },
				["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
				["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },

				-- Use the "_" filetype to run formatters on filetypes that don't
				-- have other formatters configured.
				["_"] = { "trim_whitespace" },
			},

			formatters = {
				prettier = {
					require_cwd = true,

					cwd = require("conform.util").root_file({
						".prettierrc",
						".prettierrc.json",
						".prettierrc.yml",
						".prettierrc.yaml",
						".prettierrc.json5",
						".prettierrc.js",
						".prettierrc.cjs",
						".prettierrc.mjs",
						".prettierrc.toml",
						"prettier.config.js",
						"prettier.config.cjs",
						"prettier.config.mjs",
					}),
				},
				["markdown-toc"] = {
					condition = function(_, ctx)
						for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
							if line:find("<!%-%- toc %-%->") then
								return true
							end
						end
					end,
				},
				["markdownlint-cli2"] = {
					condition = function(_, ctx)
						local diag = vim.tbl_filter(function(d)
							return d.source == "markdownlint"
						end, vim.diagnostic.get(ctx.buf))
						return #diag > 0
					end,
				},
			},
		})
	end,
}

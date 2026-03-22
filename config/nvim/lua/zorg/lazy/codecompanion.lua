return {
	{
		"olimorris/codecompanion.nvim",
		enabled = true,
		version = "^19.0.0",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},

		opts = {
			interactions = {
				chat = { adapter = { name = "claude_code" } },
				inline = { adapter = { name = "gemini" } },
				cmd = { adapter = { name = "claude_code" } },
				cli = {
					agent = "claude_code",
					agents = {
						claude_code = {
							cmd = "claude",
							args = {},
							description = "Claude Code CLI",
							provider = "terminal",
						},
					},
				},
				background = {
					chat = {
						callbacks = {
							["on_ready"] = {
								actions = {
									"interactions.background.builtin.chat_make_title",
								},
								-- Enable "on_ready" callback which contains the title generation action
								enabled = true,
							},
						},
						opts = {
							-- Enable background interactions generally
							enabled = true,
						},
					},
				},
			},
			adapters = {
				http = {
					gemini = function()
						return require("codecompanion.adapters").extend("gemini", {
							env = {
								api_key = "cmd:bws secret get 88f086ad-617f-471d-9bb8-b41500295257 | jq -r '.value'",
							},
							defaults = {
								mode = "plan",
							},
						})
					end,
				},
				acp = {
					claude_code = function()
						return require("codecompanion.adapters").extend("claude_code", {
							env = {
								CLAUDE_CODE_OAUTH_TOKEN = "cmd:bws secret get dac157db-5495-4d70-90eb-b4120035e354 | jq -r '.value'",
							},
							defaults = {
								mode = "plan",
							},
						})
					end,
				},
			},
			display = {
				chat = {
					window = {
						width = 0.3, -- Set to 0.5 for 50% width, or integer for columns
					},
				},
			},
		},
		config = function(_, opts)
			require("codecompanion").setup(opts)

			vim.keymap.set(
				{ "n", "v" },
				"<leader>ai",
				"<cmd>CodeCompanionActions<cr>",
				{ noremap = true, silent = true }
			)
			vim.keymap.set({ "n", "v" }, "<leader>at", function()
				vim.cmd("CodeCompanionChat Toggle")
			end, { noremap = true, silent = true })
			vim.keymap.set("v", "<leader>as", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

			vim.api.nvim_create_autocmd("TermOpen", {
				pattern = "*claude*",
				callback = function()
					vim.api.nvim_win_set_width(0, math.floor(vim.o.columns * 0.33))
				end,
			})

			-- Expand 'cc' into 'CodeCompanion' in the command line
			vim.cmd([[cab cc CodeCompanion]])
		end,
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "codecompanion" },
	},
}

return {
	{
		"olimorris/codecompanion.nvim",
		enabled = true,
		version = "^19.0.0",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"lalitmee/codecompanion-spinners.nvim",
			"ravitemer/codecompanion-history.nvim",
			"cairijun/codecompanion-agentskills.nvim",
		},

		opts = {
			interactions = {
				chat = { adapter = { name = "claude_code" } },
				inline = {
					adapter = {
						name = "gemini",
						model = "gemini-3-flash-preview", -- "gpt-4o"
					},
				},
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
			},
			adapters = {
				http = {
					gemini = function()
						return require("codecompanion.adapters").extend("gemini", {
							env = {
								api_key = "cmd:bws secret get "
									.. (os.getenv("BWS_GEMINI_UUID") or "")
									.. " | jq -r '.value'",
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
								CLAUDE_CODE_OAUTH_TOKEN = "cmd:bws secret get "
									.. (os.getenv("BWS_CLAUDE_UUID") or "")
									.. " | jq -r '.value'",
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
			extensions = {
				spinner = {
					-- enabled = true, -- This is the default
					opts = {
						-- Your spinner configuration goes here
						style = "cursor-relative",
					},
				},
				agentskills = {
					opts = {
						paths = {
							{ "~/.config/agents/skills", recursive = true }, -- Recursive search
						},
					},
				},
				history = {
					enabled = true,
					opts = {
						-- Keymap to open history from chat buffer (default: gh)
						keymap = "gh",
						-- Keymap to save the current chat manually (when auto_save is disabled)
						save_chat_keymap = "sc",
						-- Save all chats by default (disable to save only manually using 'sc')
						auto_save = true,
						-- Number of days after which chats are automatically deleted (0 to disable)
						expiration_days = 0,
						-- Picker interface (auto resolved to a valid picker)
						picker = "fzf-lua", --- ("telescope", "snacks", "fzf-lua", or "default")
						---Optional filter function to control which chats are shown when browsing
						chat_filter = nil, -- function(chat_data) return boolean end
						-- Customize picker keymaps (optional)
						picker_keymaps = {
							rename = { n = "r", i = "<M-r>" },
							delete = { n = "d", i = "<M-d>" },
							duplicate = { n = "<C-y>", i = "<C-y>" },
						},
						---Automatically generate titles for new chats
						auto_generate_title = true,
						title_generation_opts = {
							---Adapter for generating titles (defaults to current chat adapter)
							adapter = "gemini", -- "copilot"
							---Model for generating titles (defaults to current chat model)
							model = "gemini-3-flash-preview", -- "gpt-4o"
							---Number of user prompts after which to refresh the title (0 to disable)
							refresh_every_n_prompts = 0, -- e.g., 3 to refresh after every 3rd user prompt
							---Maximum number of times to refresh the title (default: 3)
							max_refreshes = 3,
							format_title = function(original_title)
								-- this can be a custom function that applies some custom
								-- formatting to the title.
								return original_title
							end,
						},
						---On exiting and entering neovim, loads the last chat on opening chat
						continue_last_chat = true,
						---When chat is cleared with `gx` delete the chat from history
						delete_on_clearing_chat = false,
						---Directory path to save the chats
						dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
						---Enable detailed logging for history extension
						enable_logging = false,

						-- Summary system
						summary = {
							-- Keymap to generate summary for current chat (default: "gcs")
							create_summary_keymap = "gcs",
							-- Keymap to browse summaries (default: "gbs")
							browse_summaries_keymap = "gbs",

							generation_opts = {
								adapter = "gemini", -- defaults to current chat adapter
								model = "gemini-3-flash-preview", -- defaults to current chat model
								context_size = 90000, -- max tokens that the model supports
								include_references = true, -- include slash command content
								include_tool_outputs = true, -- include tool execution results
								system_prompt = nil, -- custom system prompt (string or function)
								format_summary = nil, -- custom function to format generated summary e.g to remove <think/> tags from summary
							},
						},
						--[[
                -- Memory system (requires VectorCode CLI)
                memory = {
                    -- Automatically index summaries when they are generated
                    auto_create_memories_on_summary_generation = true,
                    -- Path to the VectorCode executable
                    vectorcode_exe = "vectorcode",
                    -- Tool configuration
                    tool_opts = { 
                        -- Default number of memories to retrieve
                        default_num = 10 
                    },
                    -- Enable notifications for indexing progress
                    notify = true,
                    -- Index all existing memories on startup
                    -- (requires VectorCode 0.6.12+ for efficient incremental indexing)
                    index_on_startup = false,
                },
                ]]
					},
				},
			},
		},
		config = function(_, opts)
			require("codecompanion").setup(opts)

			-- ai: actions
			vim.keymap.set(
				{ "n", "v" },
				"<leader>ai",
				"<cmd>CodeCompanionActions<cr>",
				{ noremap = true, silent = true }
			)

			-- at: toggle
			vim.keymap.set({ "n", "v" }, "<leader>at", function()
				vim.cmd("CodeCompanionChat Toggle")
			end, { noremap = true, silent = true })

			-- as: send to ai
			vim.keymap.set("v", "<leader>as", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

			-- ac: send to ai cli
			vim.keymap.set({ "n", "v" }, "<LocalLeader>ac", function()
				return require("codecompanion").cli("#{this}", { focus = false })
			end, { desc = "Add context to the CLI agent" })

			-- ad: diagnostics cli
			vim.keymap.set("n", "<LocalLeader>ad", function()
				return require("codecompanion").cli(
					"#{diagnostics} Can you fix these?",
					{ focus = false, submit = true }
				)
			end, { desc = "Send diagnostics to CLI agent" })

			vim.api.nvim_create_autocmd("TermOpen", {
				pattern = "*claude*",
				callback = function()
					vim.api.nvim_win_set_width(0, math.floor(vim.o.columns * 0.28))
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

--[=[
Modes (interactions): 
  - CLI: :CodeCompanionCLI - A terminal wrapper around agent CLI tools such a Claude Code
    - :CodeCompanionCLI Ask - open a cute prompt that has access to # - save/send with :w
      - "Can you explain #{buffers}?, 'What does #{this} do?'
  - Chat: :CodeCompanionChat - A chat buffer where you can converse with an LLM
    - `#` add neovim editor context, e.g. #{buffer, messages, diff, quickfix}
      - e.g. "What does the code in #{buffer} do?"
      - "Compare #{buffer:old_file.js} with #{buffer:new_file.js} and explain the differences."
      - #{diagnostics} can you explain the LSP errors in this file and how to fix them?
    - `@` tools - perform specific tasks - running shell commands, editing buffers, etc
      - Can you use @{grep_search} to find occurrences of "hello world"
      - @{agent_skills}
    - `/` - Slash commands. e.g. /file, /mode - dynamically insert context into chat buffer
    - `\` - Backslash commands - ACP commands: e.g. \grill-me \pr-review
    - Ctrl-C - destroy a chat
    - `q` - top the current request
    - `ga` - select adapter
    - `gy` - yank last code block
    - `zo` / `zc` - fold open / close
    - `[[` / `]]` - move between responses
    - `{` / `}` - cycle chats

  - Cmd: :CodeCompanionCmd  - Create Neovim commands in the command-line
  - Inline: :CodeCompanion or :cc - An inline interaction that can write code directly into a buffer
    - The interaction will evaluate the prompt and either write code or open a chat buffer
    - from Prompt Library
      - /commit - Generate a commit message
      - /explain - Explain how selected code in a buffer works
      - /fix - Fix the selected code
      - /lsp - Explain the LSP diagnostics for the selected code
      - /tests - Generate unit tests for selected code
  - Background - Runs tasks in the background such as compacting chat messages or generating titles for chats

Miscellaneous
  - npx ccusage@latest

]=]

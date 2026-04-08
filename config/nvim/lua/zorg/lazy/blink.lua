return {
	"saghen/blink.cmp",
	enabled = true,
	dependencies = {
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
		"onsails/lspkind.nvim",
		"nvim-tree/nvim-web-devicons",
		"Kaiser-Yang/blink-cmp-avante",
	},
	-- use a release tag to download pre-built binaries
	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {

		keymap = {
			preset = "enter",
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
		},

		snippets = { preset = "luasnip" },

		fuzzy = { implementation = "prefer_rust_with_warning" },

		signature = { enabled = true },

		sources = {
			-- default = { "avante", "lsp", "path", "snippets", "buffer" },
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				--[[
				avante = {
					module = "blink-cmp-avante",
					name = "Avante",
					opts = {},
				},
        ]]
			},
			per_filetype = {
				codecompanion = { "codecompanion" },
			},
		},

		appearance = {
			nerd_font_variant = "normal",
		},

		completion = {
			documentation = {
				auto_show = true,
			},
			ghost_text = { enabled = true },
			list = {
				selection = { preselect = true, auto_insert = false },
			},
			menu = {
				draw = {
					columns = {
						{ "label", "label_description", "kind_icon", "kind", "source_name", gap = 1 },
					},
					components = {
						label = {
							width = { max = 30 },
						},
						kind = {
							text = function(ctx)
								local replacements = {
									["Method"] = " meth",
									["Snippet"] = " snip",
									["Variable"] = "  var",
									["Function"] = " func",
									["Keyword"] = "  key",
									["Field"] = "field",
									["Class"] = "class",
								}
								local result = string.gsub(ctx.kind, "(%w+)", replacements)
								return result
							end,
						},
						source_name = {
							text = function(ctx)
								local replacements = {
									["Buffer"] = " Buf",
									["LSP"] = " LSP",
									["Snippets"] = "Snip",
								}
								local result = string.gsub(ctx.source_name, "(%w+)", replacements)
								return result
							end,
						},
					},
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}

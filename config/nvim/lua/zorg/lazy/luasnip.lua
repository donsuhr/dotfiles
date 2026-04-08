return {
	"L3MON4D3/LuaSnip",
	enabled = true,
	version = "v2.*",
	build = "make install_jsregexp",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	config = function()
		-- require("luasnip").filetype_extend("javascript", { "javascriptreact" })
		-- require("luasnip").filetype_extend("typescript", { "typescriptreact" })
		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}

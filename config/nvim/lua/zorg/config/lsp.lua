vim.lsp.config("lua_ls", {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath("config")
				and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
				path = {
					"lua/?.lua",
					"lua/?/init.lua",
				},
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		})
	end,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

vim.diagnostic.config({
	virtual_text = true, -- Show inline messages
	virtual_lines = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✕",
			[vim.diagnostic.severity.WARN] = "△",
			[vim.diagnostic.severity.INFO] = "●",
			[vim.diagnostic.severity.HINT] = "○",
		},
	},
	underline = true,
	update_in_insert = false, -- Don't update diagnostics while typing
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
})

vim.keymap.set("n", "<leader>dn", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })

vim.keymap.set("n", "<leader>dp", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic" })

vim.keymap.set("n", "<leader>dc", function()
	vim.diagnostic.open_float({ focusable = true })
end, { desc = "Current Diagnostic" })

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "rename" })

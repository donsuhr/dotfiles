vim.g.mapleader = ","
vim.g.maplocalleader = ","

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>dn", vim.diagnostic.goto_next)
keymap("n", "<leader>dp", vim.diagnostic.goto_prev)

-- Buffer delete but keep window
keymap("n", "<leader>bd", ":bp | bd #<CR>", opts)

-- remap native comment toggle
keymap("n", "<leader>ci", "<Cmd>normal gcc<CR>", opts)

keymap('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr, desc = 'Go to implementation' })
keymap('n', "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = 'rename' })

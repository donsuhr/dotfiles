return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  enabled = true,
  config = function()
    require('fzf-lua').register_ui_select()

    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    keymap("n", "<leader>zf", ":FzfLua files<CR>", opts)
    keymap("n", "<leader>zb", ":FzfLua buffers<CR>", opts)
    keymap("n", "<leader>zl", ":FzfLua lines<CR>", opts)
    keymap("n", "<leader>zh", ":FzfLua history<CR>", opts)
    keymap("n", "<leader>zg", ":FzfLua live_grep<CR>", opts)
    keymap("n", "<leader>zo", ":FzfLua global<CR>", opts)
    keymap("n", "<leader>zc", ":FzfLua git_bcommits<CR>", opts)
    keymap("n", "<leader>ut", ":FzfLua undotree<CR>", opts)
    keymap("n", "gr", ":FzfLua lsp_references<CR>", { silent = true, nowait = true })
    keymap("n", "gd", ":FzfLua lsp_definitions<CR>", opts)
    keymap("n", "gy", ":FzfLua lsp_declarations<CR>", opts)
    keymap({ "n", "v" }, "<leader>aj", ":FzfLua lsp_code_actions<CR>", opts)
    -- gl : go to link http://www.google.com
  end
}

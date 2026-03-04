return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      filters = {
        dotfiles = false,
        git_ignored = false,
      },
      modified = {
        enable = true,
      },
      hijack_directories = {
        enable = true,   -- Enable hijacking
        auto_open = true -- Automatically open when opening a directory
      },
      renderer = {
        icons = {
          git_placement = "signcolumn",
          bookmarks_placement = "signcolumn",

          glyphs = {
            bookmark = "",
            modified = "",
            hidden = "󱙝",
            git = {
              unstaged = "×",
              staged = "",
              unmerged = "󰧾",
              untracked = "",
              renamed = "",
              deleted = "",
              ignored = "∅"
            }
          }

        }
      }
    }
    -- folder name
    vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = '#88c0d0', bold = false })
    vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = '#88c0d0', bold = false })
    -- arrow
    vim.api.nvim_set_hl(0, 'NvimTreeFolderArrowOpen', { fg = '#81a1c1' })
    vim.api.nvim_set_hl(0, 'NvimTreeFolderArrowClosed', { fg = '#81a1c1' })
    -- folder icon
    vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderIcon', { fg = '#b48ead' })
    vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = '#b48ead' })


    vim.keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>", { silent = true })
    vim.keymap.set("n", "<leader>no", ":NvimTreeFocus<CR>", { silent = true })
    vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>", { silent = true })
  end
}

local augroup = vim.api.nvim_create_augroup("FocusEvents", { clear = true })

vim.api.nvim_create_autocmd("FocusLost", {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.cmd("wall!")
    -- Only switch to Normal mode if currently in Insert or Visual mode
    if vim.fn.mode() == 'i' or vim.fn.mode() == 'v' or vim.fn.mode() == 'V' then
      vim.cmd('stopinsert') -- Exit insert mode
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
    end
  end,
})


vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = augroup,
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end
})


vim.api.nvim_create_autocmd("FileChangedShellPost", {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.cmd("echohl WarningMsg | echo \"File changed on disk. Buffer reloaded.\" | echohl None")
  end
})


vim.api.nvim_create_autocmd({ "CursorHold" }, {
  group = augroup,
  pattern = "*",
  callback = function()
    if #vim.api.nvim_list_wins() > 0 then
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(win).relative ~= "" then
          -- A float window is open, do not show diagnostics
          return
        end
      end
    end


    vim.diagnostic.open_float(nil, {
      scope = "cursor",
      focusable = false,
      close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre", "WinLeave" },
    })
  end,
})


vim.api.nvim_create_autocmd({ "VimEnter" }, {
  group = augroup,
  callback = function()
    if vim.fn.argc() > 0 then
      vim.cmd("NvimTreeFindFile")
    else
      vim.cmd("NvimTreeOpen")
    end
    vim.cmd([[wincmd w]])
  end,
})


vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = {
    "css",
    "html",
    "lua",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  callback = function() vim.treesitter.start() end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "*",
  desc = "Prevent comment continuation",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { 'c', 'r', 'o' }
  end,
})

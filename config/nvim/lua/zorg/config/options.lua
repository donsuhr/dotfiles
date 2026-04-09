local opt = vim.opt

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2

-- Search
opt.ignorecase = true
opt.smartcase = true

-- UI
opt.background = "dark"
opt.conceallevel = 0
opt.cursorline = true
opt.inccommand = "split"
opt.mouse = "a"
opt.number = true
opt.relativenumber = false
opt.scrolloff = 10
opt.signcolumn = "yes"
opt.termguicolors = true
opt.title = true
opt.winborder = "rounded"
opt.laststatus = 3

-- Behavior
opt.autoread = true
opt.backupcopy = "yes"
opt.belloff = "all"
opt.completeopt = "menu,menuone,noinsert"
opt.showcmd = true
opt.showmode = false
opt.spell = false
opt.spelllang = "en_us"
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 2000
opt.undodir = vim.fn.stdpath("data") .. "/undo"
opt.undofile = true
opt.undolevels = 2000
opt.updatetime = 750
opt.exrc = true
opt.wrap = false
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Format options
opt.formatoptions:remove({ "c", "r", "o" })

-- Shortmess
opt.shortmess:append("c")

-- Wildignore
opt.wildignore:append({
	"*.swp",
	"*.bak",
	"*.pyc",
	"*.class",
})
opt.wildmenu = true
opt.wildmode = "longest:full,full"

vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.have_nerd_font = true

vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_uniform_diff_background = true
vim.g.nord_italic = false
vim.g.nord_bold = false

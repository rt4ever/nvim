local opt = vim.opt

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true

-- Indentation
opt.expandtab = false
opt.shiftwidth = 8
opt.tabstop = 8
opt.softtabstop = 8
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Windows
opt.splitright = true
opt.splitbelow = true

-- Editing
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.mouse = "a"

-- Clipboard
opt.clipboard = "unnamedplus"

-- Performance
opt.updatetime = 250

-- Completion
opt.completeopt = {
	"menu",
	"menuone",
	"noselect",
}

-- Persistent undo
opt.undofile = true

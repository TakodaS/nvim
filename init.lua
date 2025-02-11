local g = vim.g
g.mapleader = " "
--init entrypoint for nvim config
if not pcall(require, "bootstrap") then
	print("Failed to bootstrap lazy")
end
if not pcall(require, "plugins") then
	print("Failed to initialize plugins")
end
if not pcall(require, "plugin-config") then
	print("Failed to configure plugins")
end

local cmd = vim.cmd
local fn = vim.fn

local opt = vim.opt
--# Set global options
vim.api.nvim_exec("set ff=unix", false)
opt.autoread = true
opt.background = "dark"
opt.completeopt = { "menuone", "noinsert", "noselect" } -- completion options (for deoplete)
opt.cursorline = true -- highlight current line
opt.encoding = "utf-8"
opt.expandtab = true -- spaces instead of tabs
opt.hidden = true -- enable background buffers
opt.ignorecase = true -- ignore case in search
opt.joinspaces = false -- no double spaces with join
opt.list = true -- show some invisible characters
opt.maxmempattern = 1000 -- for Riv
opt.mouse = "nv" -- Enable mouse in normal and visual modes
opt.number = true -- show line numbers
opt.relativenumber = true -- number relative to current line
opt.scrolloff = 4 -- lines of context
opt.shiftround = true -- round indent
opt.shiftwidth = 2 -- size of indent
opt.sidescrolloff = 8 -- columns of context
opt.smartcase = true -- do not ignore case with capitals
opt.smartindent = true -- insert indents automatically
opt.splitbelow = true -- put new windows below current
opt.splitright = true -- put new vertical splits to right
opt.termguicolors = true -- truecolor support
opt.wildmode = { "list", "longest" } -- command-line completion mode
opt.wrap = false -- disable line wrap

vim.keymap.set("n", "<leader>e", "<cmd>e $MYVIMRC<cr>")
vim.keymap.set("n", "<leader>s", "<cmd>luafile $MYVIMRC<cr>")
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", ";")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("t", "jk", "<C-\\><C-n>")

vim.api.nvim_exec("set shell=powershell", false)
vim.api.nvim_exec("set shellcmdflag=-command", false)
vim.api.nvim_exec('set shellquote="', false)
vim.api.nvim_exec("set shellxquote=", false)
vim.api.nvim_exec("set wrap", false)

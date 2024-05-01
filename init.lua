local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
--
require("lazy").setup({
	"tpope/vim-dispatch",
	opt = true,
	cmd = { "Dispatch", "Make", "Focus", "Start" },

	{ "adelarsq/neofsharp.vim" },
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-treesitter/nvim-treesitter" },
	{ "mhartington/formatter.nvim" },

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},
	{ "neoclide/coc-tabnine" },
	{ "neoclide/coc.nvim", branch = "release" },
	{ "tpope/vim-fugitive" },
	{ "preservim/nerdcommenter" },
	{ "tpope/vim-surround" },
	{ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } },
	{ "kaarmu/typst.vim" },
	{ "udalov/kotlin-vim" },
	{ "rust-lang/rust.vim" },
	{ "github/copilot.vim" },
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = { { "nvim-lua/plenary.nvim" }, { "github/copilot.vim" } },
		opts = {
			debug = true,
		},
	},
	{ "EdenEast/nightfox.nvim" },
})

require("neo-tree").setup({
	filesystem = {
		hijack_netrw_behavior = "open_current",
	},
	window = {
		mappings = {
			["P"] = function(state)
				local node = state.tree:get_node()
				require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
			end,
		},
	},
})
vim.api.nvim_exec("nnoremap - :Neotree toggle current reveal_force_cwd<cr>", false)
--vim.api.nvim_exec("nnoremap | :Neotree reveal<cr>", false) --broken?
require("nvim-web-devicons").setup()
require("lualine").setup()
require("formatter").setup({ --WARNING: Plugin is broken, adds ^M to EOL
	--logging = true,

	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		python = {
			---- "formatter.filetypes.lua" defines default configurations for the
			---- "lua" filetype
			----
			--require("formatter.filetypes.python").isort,
			require("formatter.filetypes.python").black,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		javascript = {
			require("formatter.filetypes.javascript").jsbeautify,
		},
		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		--["*"] = {
		---- "formatter.filetypes.any" defines default configurations for any
		---- filetype
		--require("formatter.filetypes.any").remove_trailing_whitespace,
		--},
	},
})
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt
--# Set global options
vim.api.nvim_exec("set ff=unix", false)
vim.cmd("colorscheme duskfox")
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

g.mapleader = " "
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

vim.keymap.set("n", "<leader>e", "<cmd>vsplit $MYVIMRC<cr>")
vim.keymap.set("n", "<leader>s", "<cmd>source $MYVIMRC<cr>")
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", ";")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("t", "jk", "<C-\\><C-n>")

vim.api.nvim_exec("set shell=powershell", false)
vim.api.nvim_exec("set shellcmdflag=-command", false)
vim.api.nvim_exec('set shellquote="', false)
vim.api.nvim_exec("set shellxquote=", false)
vim.api.nvim_exec("set wrap", false)

-- Autogroups

vim.api.nvim_create_augroup("AutoFormat", {
	clear = true,
})
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "AutoFormat",
	pattern = "*",
	callback = "Format",
})

-- User defined commands
vim.cmd('command! Chat CopilotChat')

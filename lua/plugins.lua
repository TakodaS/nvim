-- load plugins in a safe manner
local lazy = require('lazy')
local plugins = {
	{"tpope/vim-dispatch",
	opt = true,
	cmd = { "Dispatch", "Make", "Focus", "Start" },
        },
	{ "adelarsq/neofsharp.vim" },
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-treesitter/nvim-treesitter" },

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
}
print("Initializing plugins")
lazy.setup(plugins)
print("Plugins initialized")

-- load plugins in a safe manner
local lazy = require("lazy")

local plugins = { -- Plugins that modify the look of Neovim
	{
		"nvim-lualine/lualine.nvim",
		requires = {
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim",
		},
	},
	{ "kyazdani42/nvim-web-devicons" },
	{ "EdenEast/nightfox.nvim" },

	-- Plugins that change editor commands
	{
		"tpope/vim-dispatch",
		opt = true,
		cmd = { "Dispatch", "Make", "Focus", "Start" },
	},
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-treesitter/nvim-treesitter" },
	{ "tpope/vim-fugitive" },
	{ "preservim/nerdcommenter" },
	{ "tpope/vim-surround" },
	-- Language support
	{ "adelarsq/neofsharp.vim" },
	{ "kaarmu/typst.vim" },
	{ "udalov/kotlin-vim" },
	{ "rust-lang/rust.vim" },
	-- Formatting
	{
		"stevearc/conform.nvim",
		opts = {},
	},

	-- Mason
	{
		"williamboman/mason.nvim",
	}, -- Copilot functionality
	{ "github/copilot.vim" },
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = { { "nvim-lua/plenary.nvim" }, { "github/copilot.vim" } },
		opts = {
			debug = true,
		},
	},
}

lazy.setup(plugins)

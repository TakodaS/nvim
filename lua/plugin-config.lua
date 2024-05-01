-- Mason
require("mason").setup()
-- Lualine
require("lualine").setup({
	options = {
		section_separators = { "", "" },
		component_separators = { "", "" },
	},
})
-- Conform formatter
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettierd", "prettier" } },
		typescript = { { "prettierd", "prettier" } },
		typst = { "typstfmt" },
		json = { "prettierd" },
		rust = { "rustfmt" },
		go = { "gofmt", "goimports" },
		sh = { "shfmt" },
		md = { "prettierd" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })

-- Neotree
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
vim.cmd("colorscheme duskfox")

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Copilot
vim.cmd("command! Chat CopilotChat")

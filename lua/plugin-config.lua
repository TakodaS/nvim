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
vim.cmd('command! Chat CopilotChat')

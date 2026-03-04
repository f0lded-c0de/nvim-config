return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local function my_on_attach(bufnr)
			local api = require "nvim-tree.api"

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end
			
			api.config.mappings.default_on_attach(bufnr)

			-- Custom  mappings
			vim.keymap.set('n', 's', api.node.open.horizontal, opts("Open: Horizontal Split"))
			vim.keymap.set('n', 'v', api.node.open.vertical, opts("Open: Vertical Split"))
			vim.keymap.set('n', 't', api.node.open.tab, opts("Open: New Tab"))
			vim.keymap.set('n', '<C-s>', api.node.run.system, opts("Run System"))
			vim.keymap.del("n", "<C-v>", { buffer = bufnr })
			vim.keymap.del("n", "<C-t>", { buffer = bufnr })
			vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
		end

		require("nvim-tree").setup {
			on_attach = my_on_attach,
		}
	end,
}

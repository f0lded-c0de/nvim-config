-- Vim Settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.number = true
vim.opt.wrap = false
vim.opt.smartindent = true

-- NeoVim KeyBinds
-- vim.keymap.set('mode(n, v, i)', 'keymap(<{key}-{key}>)(Ctrl=C, Shift=S)', 'command(<CR>=enter)', { noremap = true, silent = true, desc = "Description displayed in WhichKey tab" })
vim.keymap.set('n', '<S-h>', ':tabprev<CR>', { noremap = true, silent = true, desc = "Go to previous tab" })
vim.keymap.set('n', '<S-l>', ':tabnext<CR>', { noremap = true, silent = true, desc = "Go to next tab" })
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true, desc = "Go to the left window" })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true, desc = "Go to the down window" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true, desc = "Go to the up window" })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true, desc = "Go to the right window" })
vim.keymap.set('n', '<C-n>', function()
	require('nvim-tree.api').tree.toggle()
end, { noremap = true, silent = true, desc = "Toggle nvim-tree Sidebar" })

-- Plugins Startup
require("config.lazy")

-- Toggleterm config
require("config.toggleterm")

-- Dark or Light mode
vim.keymap.set('n', '<C-s>', function()
	if vim.o.background == "dark" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end
	print(vim.o.background .. " mode")
end, { noremap = true, silent = true, desc = "Go to next tab" })
vim.o.background = "light"
vim.o.background = "dark"

-- Telescope KeyBinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

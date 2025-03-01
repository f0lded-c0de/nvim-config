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
function ToggleRelativeNumbers()
	vim.wo.relativenumber = not vim.wo.relativenumber
end
vim.keymap.set('n', '<leader>n', ':lua ToggleRelativeNumbers()<CR>', { noremap = true, silent = true, desc = "Toggle relative number" })

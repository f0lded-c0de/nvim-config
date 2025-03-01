-- vim.keymap.set('mode(n, v, i)', 'keymap(<{key}-{key}>)(Ctrl=C, Shift=S)', 'command(<CR>=enter)', { noremap = true, silent = true, desc = "Description displayed in WhichKey tab" })
vim.keymap.set('n', '<S-h>', ':tabprev<CR>', { noremap = true, silent = true, desc = "Go to previous tab" })
vim.keymap.set('n', '<S-l>', ':tabnext<CR>', { noremap = true, silent = true, desc = "Go to next tab" })
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true, desc = "Go to the left window" })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true, desc = "Go to the down window" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true, desc = "Go to the up window" })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true, desc = "Go to the right window" })
vim.keymap.set('n', '<leader>Lu', ':Lazy update<CR>', { noremap = true, silent = true, desc = "Lazy update" })
function ToggleRelativeNumbers()
	vim.wo.relativenumber = not vim.wo.relativenumber
end
vim.keymap.set('n', '<leader>n', ':lua ToggleRelativeNumbers()<CR>', { noremap = true, silent = true, desc = "Toggle relative number" })

-- Nvim-tree
vim.keymap.set('n', '<C-n>', function()
	require('nvim-tree.api').tree.toggle()
end, { noremap = true, silent = true, desc = "Toggle nvim-tree Sidebar" })

-- Vim-startify
vim.keymap.set('n', '<leader>Sl', ':SLoad<CR>', { noremap = true, silent = true, desc = "Load a session" })
vim.keymap.set('n', '<leader>Ss', ':SSave<CR>', { noremap = true, silent = true, desc = "Save a session" })
vim.keymap.set('n', '<leader>Sd', ':SDelete<CR>', { noremap = true, silent = true, desc = "Delete a session" })
vim.keymap.set('n', '<leader>Sc', ':SClose<CR>', { noremap = true, silent = true, desc = "Close a session" })

-- Mini.nvim
---- Mini-trailspace
vim.keymap.set('n', '<leader>t', ':lua MiniTrailspace.trim()<CR>', { noremap = true, silent = true, desc = "Remove all trailing whitespaces" })

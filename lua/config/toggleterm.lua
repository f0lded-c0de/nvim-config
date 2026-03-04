-- Terminal Keybinds
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Normal Mode Keybinds
vim.keymap.set('n', '<leader><C-v>', ':ToggleTerm size=30 direction=vertical<CR>', {
	noremap = true, 
	silent = true,
	desc = "Toggle terminal in vertical mode",
})
vim.keymap.set('n', '<leader><C-h>', ':ToggleTerm size=5 direction=horizontal<CR>', {
	noremap = true, 
	silent = true,
	desc = "Toggle terminal in horizontal mode",
})
vim.keymap.set('n', '<leader><C-f>', ':ToggleTerm direction=float<CR>', {
	noremap = true, 
	silent = true,
	desc = "Toggle terminal in float mode",
})
vim.keymap.set('n', '<leader><C-t>', ':ToggleTerm direction=tab<CR>', {
	noremap = true, 
	silent = true,
	desc = "Toggle terminal in tab mode",
})

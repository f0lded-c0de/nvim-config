vim.keymap.set('n', '<leader>c', ':ALEToggle<CR>', { noremap = true, silent = true, desc = "Toggle linting (inline syntax errors)" })
vim.cmd([[
  augroup ClearALEErrorsInInsertMode
    autocmd!
    autocmd InsertEnter * ALEDisable
  augroup END
]])

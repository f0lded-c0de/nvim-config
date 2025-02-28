vim.keymap.set('n', '<leader>s', function()
	if vim.o.background == "dark" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end
	print(vim.o.background .. " mode")
end, { noremap = true, silent = true, desc = "Switch dark and light mode" })
vim.o.background = "light"
vim.o.background = "dark"

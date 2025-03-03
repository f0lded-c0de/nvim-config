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

-- Markdown editing
vim.keymap.set('n', '<leader>eh', 's<lt>code>', { noremap = true, silent = true, desc = "Turn ` into <code>" })
vim.keymap.set('n', '<leader>el', 's<lt>/code>', { noremap = true, silent = true, desc = "Turn ` into </code>" })

-- Create Callouts
local function make_example()
	vim.api.nvim_input('<Esc>')
	vim.schedule(function()
		local start_line = vim.fn.line("'<")
		local end_line = vim.fn.line("'>")
		local linum = end_line - start_line + 1
		local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
		vim.api.nvim_win_set_cursor(0, {start_line, 0})
		if linum > 1 then
			vim.api.nvim_input('V' .. tostring(linum -1) .. '<CR>')
		else
			vim.api.nvim_input('V')
		end
		vim.schedule(function()
			local keys = vim.api.nvim_replace_termcodes('dO<details><CR><summary>:clipboard: Example</summary><CR></details><Esc>P', true, false, true)
			vim.api.nvim_feedkeys(keys, "n", true)
		end)
		vim.schedule(function()
			local code_bolk = 0
			local i = 1
			while i <= linum do
				if lines[i]:sub(1, 3) == "```" then
					if code_bolk == 0 then
						code_bolk = 1
						keys = vim.api.nvim_replace_termcodes('O<Esc><CR><CR>', true, false, true)
						vim.api.nvim_feedkeys(keys, "n", true)
					else
						code_bolk = 0
						keys = vim.api.nvim_replace_termcodes('<CR>', true, false, true)
						vim.api.nvim_feedkeys(keys, "n", true)
					end
				elseif code_bolk == 0 then
					keys = vim.api.nvim_replace_termcodes('A<BR><Esc><CR>', true, false, true)
					vim.api.nvim_feedkeys(keys, "n", true)
				else
					keys = vim.api.nvim_replace_termcodes('<CR>', true, false, true)
					vim.api.nvim_feedkeys(keys, "n", true)
				end
				i = i + 1
			end
		end)
	end)
end
vim.keymap.set('v', '<leader>Ee', make_example, { noremap = true, silent = true, desc = "Turn selection into example collapsible" })
vim.keymap.set('n', '<leader>Ee', 'i<lt>details><CR><lt>summary>:clipboard: Example<lt>/summary><CR><lt>/details><Esc>O', { noremap = true, silent = true, desc = "Create example collapsible" })

-- Test functions
-- local function test_linumber()
--	local linum = vim.fn.line(".")
--	print("Line number : " .. linum .. ".")
--end
--local function test_codeblockline()
--end

--vim.keymap.set('n', '<leader>Et', test_linumber, { noremap = true, silent = true, desc = "Test functions" })
--vim.keymap.set('n', '<leader>Er', test_codeblockline, { noremap = true, silent = true, desc = "Test codeblocks" })

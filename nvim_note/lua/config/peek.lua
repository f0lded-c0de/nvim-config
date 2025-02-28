vim.keymap.set('n', '<leader>q', function()
	local peek = require("peek")
	if peek.is_open() then
		peek.close()
	else
		peek.open()
	end
end, { noremap = true, silent = true, desc = "Toggle markdown preview" })

return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			open_mapping = [[<c-\>]],  -- Set your toggle key (Ctrl+\ in this example)
			direction = "vertical",
			size = function(term)
				if term.direction == "vertical" then
					return vim.o.columns * 0.3
				end
			end,
		},
	},
}

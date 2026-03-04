return {
  "FtVim/ft_count_lines.nvim",
  config = function()
    require("ft_count_lines").setup({
        enable_on_start = true --Default is false
    })
  end
}

return {
  "FtVim/ft_count_lines.nvim",
  config = function()
    -- Don't enable automatically at startup
    require("ft_count_lines").setup({ enable_on_start = false })

    -- Enable after VimEnter, with a tiny delay to ensure everything is ready
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.defer_fn(function()
          -- Try to enable; ignore if it fails (e.g., still on empty buffer)
          pcall(require("ft_count_lines").enable)
        end, 50) -- 50ms delay
      end,
    })
  end,
}

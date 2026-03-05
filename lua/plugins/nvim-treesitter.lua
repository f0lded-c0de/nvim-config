return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,               -- don't lazy-load this plugin
  build = ":TSUpdate",        -- run after install/update to keep parsers up to date
  config = function()
    -- 1. (Optional) Set custom install directory – the default is fine for most users.
    --    If you omit this, parsers will be installed in stdpath('data')/site.
    require("nvim-treesitter").setup {
      install_dir = vim.fn.stdpath('data') .. '/site',  -- same as default
    }

    -- 2. Install the parsers you need.
    --    This is a no‑op if they are already installed.
    --    The operation runs asynchronously by default – you don't need to wait.
    local parsers = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "html" }
    require("nvim-treesitter").install(parsers)

    -- 3. Enable treesitter highlighting for the languages you use.
    --    (This replicates your old `highlight = { enable = true }`.)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = parsers,   -- use the same list of languages
      callback = function()
        vim.treesitter.start()
      end,
    })

    -- 4. Indentation is disabled by default, so you don't need to do anything.
    --    If you ever want to enable it, you would set:
    --    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
}

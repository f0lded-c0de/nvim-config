-- Vim Settings
require("config.nvim")

-- NeoVim Config
require("config.keybinds")

-- Plugins Startup
require("config.lazy")

-- Mini.nvim modules
require("mini.animate").setup()
require('mini.comment').setup({})

--  Fun Stuff
require("config.fun")

-- Toggleterm Config
require("config.toggleterm")

-- Everforest Config
require("config.everforest")

-- Telescope Config
require("config.telescope")

-- ALE Config
require("config.ALE")

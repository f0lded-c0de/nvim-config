-- Vim Settings
require("config.nvim")

-- Plugins Startup
require("config.lazy")

-- NeoVim Config
require("config.keybinds")

-- Mini.nvim modules
require("mini.comment").setup()
require("mini.trailspace").setup()
require("config.mini-animate")
require("config.mini-move")

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

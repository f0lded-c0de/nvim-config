# Installation

Clone this repo in your `~/.config/` (or equivalent), and add these lines to `~/.zshrc` :
```bash
export NVIM_APPNAME=nvim-config/nvim_base
alias nv="export NVIM_APPNAME=nvim-config/nvim_base && nvim" # Switch to and open with basic config
alias nvn="export NVIM_APPNAME=nvim-config/nvim_note && nvim" # Switch to and open with note-taking config
alias nvc="export NVIM_APPNAME=nvim-config/nvim_code && nvim" # Switch to and open with coding config
```
You can then use these aliases to open NeoVim with any config.


# Configs documentation

## nvim_base :

Basic config, template to build a new config, and useful to work on current configs, in case stuff gets broken in the process.
Contains everything that is common to every other configs.

### Plugins included

- everforest-nvim
    * Colorscheme for NeoVim.
    * Configured to dim inactive windows (better visibility of focused window).
    * Custom keybinding:
        + Switch Dark/Light mode: `<C-s>`
- nvim-treesitter
    * Language parser required in many other plugins.
- which-key.nvim
    * Interactive keybinding hints through a popup.
- nvim-tree.lua
    * Side-bar file explorer.
    * Custom keybinding:
        + Toggle on/off side-bar: `<C-n>`
    * Added custom internal mapping when focused on side-bar (in order to match the Split Window keybinding of `<C-w>`) :
        + 'Open: Horizontal Split' : `<C-s>`
- plenary.nvim
    * Lua utility Library required by telescope.nvim.
- telescope.nvim
    * Extensible fuzzy finder.


### Custom Keybindings :

| Keybinding | Action                    |
| ---------- | ------------------------- |
| `<S-h>`    | Go to previous tab        |
| `<S-l>`    | Go to next tab            |
| `<C-h>`    | Go to left window         |
| `<C-j>`    | Go to down window         |
| `<C-k>`    | Go to up window           |
| `<C-l>`    | Go to right window        |
| `<C-n>`    | Toggle nvim-tree side-bar |
| `<C-s>`    | Toggle dark/light mode    |

### Custom Settings :

```vim
set tabstop = 4
set shiftwidth = 4
set softtabstop = 4
set number = true
set wrap = false
```


## nvim_code :

Base config for coding. Work in progress.


## nvim_note :

Config dedicated to note-taking. Includes plugins to edit Markdown files, as well as preview them easily.


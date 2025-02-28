<a name="top"></a>
# Table of Content

- [Installation](#installation)
    - [Requirements:](#requirements)
    - [Set up:](#set-up)
- [Configs Documentation](#configs-documentation)
    - [nvim_base](#nvim_base)
        - [Plugins included](#plugins-included)
        - [Custom Keybindings](#custom-keybindings)
        - [Custom Settings](#custom-settings)
    - [nvim_code](#nvim_code)
        - [Plugins included](#plugins-included-1)
        - [Custom Keybindings](#custom-keybindings-1)
        - [Custom Settings](#custom-settings-1)
    - [nvim_note](#nvim_note)
        - [Plugins included](#plugins-included-2)
        - [Custom Keybindings](#custom-keybindings-2)


# Installation

### Requirements:

- [deno](https://deno.com) is required to use the markdown live preview plugin in the nvim_note config.


### Set up:

Clone this repo in your `~/.config/` (or equivalent), and add these lines to `~/.zshrc` :
```bash
export NVIM_APPNAME=nvim-config/nvim_base
alias nv="export NVIM_APPNAME=nvim-config/nvim_base && nvim" # Switch to and open with basic config
alias nvn="export NVIM_APPNAME=nvim-config/nvim_note && nvim" # Switch to and open with note-taking config
alias nvc="export NVIM_APPNAME=nvim-config/nvim_code && nvim" # Switch to and open with coding config
```
You can then use these aliases to open NeoVim with any config.

# Configs Documentation

## nvim_base

Basic config, template to build a new config, and useful to work on current configs, in case stuff gets broken in the process.
Every plugin, setting, or keybind included in this config is also included in every other configs.

### Plugins included:

- <details>
    <summary>[everforest-nvim](https://github.com/neanias/everforest-nvim)</summary>
    * Colorscheme for NeoVim.
    * Configured to dim inactive windows (better visibility of focused window).
    * Custom keybinding:
        + Switch Dark/Light mode: `<C-s>`
    </details>
- <details>
    <summary>[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)</summary>
    * Language parser required in many other plugins.
    </details>
- [which-key.nvim](https://github.com/folke/which-key.nvim)
    * Interactive keybinding hints through a popup.
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
    * Side-bar file explorer.
    * Custom keybinding:
        + Toggle on/off side-bar: `<C-n>`
    * Changed internal mapping when focused on side-bar (in order to match the Split Window keybinding of `<C-w>`) :
        + 'Open: Horizontal Split': `s`
        + 'Open: Vertical Split': `v`
        + 'Open: New Tab': `t`
        + 'Run System': `<C-s>` (because `s` was already taken by this, so swapped them)
    * To see ALL keybindings (default and custom), when focused on sidebar: `?`
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
    * Lua utility Library required by telescope.nvim.
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
    * Extensible fuzzy finder.


### Custom Keybindings:

| Keybinding | Action                                             |
| ---------- | -------------------------------------------------- |
| `<S-h>`    | Go to previous tab                                 |
| `<S-l>`    | Go to next tab                                     |
| `<C-h>`    | Go to left window                                  |
| `<C-j>`    | Go to down window                                  |
| `<C-k>`    | Go to up window                                    |
| `<C-l>`    | Go to right window                                 |
| `<C-n>`    | Toggle nvim-tree side-bar                          |
| `<C-s>`    | Toggle dark/light mode                             |
| `?`        | Toggle keybind help<br>(When on nvim tree sidebar) |


### Custom Settings:

```lua
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.number = true
vim.opt.wrap = false
vim.opt.cursorline = true
```

[Back to top](#top)


## nvim_code

Coding dedicated config. Include stuff to help write/edit code as well as testing it. Tested only with the C language, although nothing I implemented was only designed for the C language.

### Plugins included:

- [ALE](https://github.com/dense-analysis/ale)
    * Inline syntax errors (compilation errors).
    * Can probably do other stuff, but didn't want to get into it as it was only for the inline errors that I added it.
    * Custom keybind:
        + Toggle inline errors: `<leader>c`
    * Custom config:
        + Added a custom function (written by chatGPT tbh) to disable inline errors when entering insert mode. Will have to toggle it back on afterward.
            + If you do not want this option you can remove the function in nvim_code/lua/config/ALE.lua. Be aware that the first line is the toggle keybind.
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
    * Integrated terminal manager.
    * Very powerful, can be used to manage several terminals in various ways at the same time, but I only included it in order to make managing one terminal much more intuitive than it is by default.
    * Custom keybindings:
        + Toggle term: `<C-\>`
        + Toggle term in vertical, horizontal, float, or tab mode: `(<leader><C-{first_letter_of_mode}>)`
        + Now works in terminal mode: `<esc>`
        + Now works in terminal mode: `<C-{h, j, k, l}>`
            + Lets the terminal in terminal mode, so you can naviguate seamlessly while never leaving terminal mode in your term.
        + Exits terminal mode and then does `<C-w>`: `<C-w>`
    * Size for horizontal and vertical mode can be changed in the keybinds in `/lua/config/toggleterm.lua`.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
    * Autopairing plugin (match opening brackets/quotes/etc with closing ones after cursor).

### Custom Keybindings:

| Keybinding             | Action                    |
| ---------------------- | ------------------------- |
| `<C-\>`                | Toggle term on and off    |
| `(<leader><C-{mode}>)` | Toggle term in {mode}     |


### Custom Settings:

```lua
vim.opt.smartindent = true
```


[Back to top](#top)


## nvim_note

Config dedicated to note-taking. Includes plugins to edit Markdown files, as well as preview them easily.

### Plugins included:

- [markdown.nvim](https://github.com/tadmccorkle/markdown.nvim)
    * Enhanced Markdown editing tools.
    * Included for the inline styling keybindings and Table of Content creator.
    * Custom keybindings:
        + Set selected text (Visual mode) to bold: `<C-b>`
        + Set selected text (Visual mode) to italics: `<C-i>`
        + Create Table of Content: `<leader>t`
            + (Based on Markdown headings in your file)
- [peek.nvim](https://github.com/toppair/peek.nvim)
    * Markdown file live previewer.
    * Opens another window (outside of the terminal) showing a live preview of the file in a GitHub style, updating in real time.
    * Custom keybinding:
        + Toggle preview window: `<C-q>`
    * **Warning!**
        + This plugin requires [deno](https://deno.com).
        + Doesn't work on every system. 
            + Worked fine when tested on Dells running Ubuntu.
            + Didn't work when tested on iMacs running Ubuntu.
- [bullets.vim](https://github.com/bullets-vim/bullets.vim)
    * Automated bullet lists.

### Custom Keybindings:

| Keybinding  | Action                      |
| ----------- | --------------------------- |
| `<C-b>`     | Set selected text to bold   |
| `<C-i>`     | Set selected text to italic |
| `<leader>t` | Create Table of Content     |
| `<leader>q` | Toggle preview window       |


[Back to top](#top)

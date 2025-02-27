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
    - [nvim_note](#nvim_note)
        - [Plugins included](#plugins-included)
        - [Custom Keybindings](#custom-keybindings)


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
Contains everything that is common to every other configs.

### Plugins included:

- [everforest-nvim](https://github.com/neanias/everforest-nvim)
    * Colorscheme for NeoVim.
    * Configured to dim inactive windows (better visibility of focused window).
    * Custom keybinding:
        + Switch Dark/Light mode: `<C-s>`
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
    * Language parser required in many other plugins.
- [which-key.nvim](https://github.com/folke/which-key.nvim)
    * Interactive keybinding hints through a popup.
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
    * Side-bar file explorer.
    * Custom keybinding:
        + Toggle on/off side-bar: `<C-n>`
    * Added custom internal mapping when focused on side-bar (in order to match the Split Window keybinding of `<C-w>`) :
        + 'Open: Horizontal Split' : `<C-s>`
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
    * Lua utility Library required by telescope.nvim.
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
    * Extensible fuzzy finder.


### Custom Keybindings:

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

### Custom Settings:

```vim
set tabstop = 4
set shiftwidth = 4
set softtabstop = 4
set number = true
set wrap = false
```

[Back to top](#top)


## nvim_code

Base config for coding. Work in progress.

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
    * Warning!
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
| `<C-q>`     | Toggle preview window       |


[Back to top](#top)

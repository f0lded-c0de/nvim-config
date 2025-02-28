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

<details>
  <summary><a href="https://github.com/neanias/everforest-nvim">everforest-nvim</a> : Colorscheme for NeoVim.</summary>
  <ul>
    <li>Configured to dim inactive windows (better visibility of focused window).</li>
    <li>
      Custom keybinding:
      <ul>
        <li>Switch Dark/Light mode: <code>&lt;C-s&gt;</code></li>
      </ul>
    </li>
  </ul>
</details>
<details>
  <summary><a href="https://github.com/nvim-treesitter/nvim-treesitter">nvim-treesitter</a> : Language parser required in many other plugins.</summary>
</details>
<details>
  <summary><a href="https://github.com/folke/which-key.nvim">which-key.nvim</a> : Interactive keybinding hints through a popup.</summary>
</details>
<details>
  <summary><a href="https://github.com/nvim-tree/nvim-tree.lua">nvim-tree.lua</a> : Side-bar file explorer.</summary>
  <ul>
    <li>
      Custom keybinding:
      <ul>
        <li>Toggle on/off side-bar: <code>&lt;C-n&gt;</code></li>
      </ul>
    </li>
    <li>
      Changed internal mapping when focused on side-bar (in order to match the Split Window keybinding of <code>&lt;C-w&gt;</code>):
      <ul>
        <li>'Open: Horizontal Split': <code>s</code></li>
        <li>'Open: Vertical Split': <code>v</code></li>
        <li>'Open: New Tab': <code>t</code></li>
        <li>'Run System': <code>&lt;C-s&gt;</code> (because <code>s</code> was already taken by this, so swapped them)</li>
      </ul>
    </li>
    <li>To see ALL keybindings (default and custom), when focused on sidebar: <code>?</code></li>
  </ul>
</details>
<details>
  <summary><a href="https://github.com/nvim-lua/plenary.nvim">plenary.nvim</a> : Lua utility Library required by telescope.nvim.</summary>
</details>
<details>
  <summary><a href="https://github.com/nvim-telescope/telescope.nvim">telescope.nvim</a> : Extensible fuzzy finder.</summary>
</details>
<details>
    <summary><a href="https://github.com/nacro90/numb.nvim">numb.nvim</a> : Line number peeker.</summary>
    <ul>
        <li>Show you where you would end up when typing <code>:{number}</code>, while typing live</li>
    </ul>
</details>
<details>
    <summary><a href="https://github.com/Eandrju/cellular-automaton.nvim">cellular-automaton.nvim</a> : Surprise ! Press <code>&lt;leader&gt;fml</code> ;)</summary>
    <ul>
        <li>Press <code>&lt;leader&gt;fml</code> when in any file with any kind of text in it.</li>
    </ul>
</details>
<details>
    <summary><a href="https://github.com/windwp/nvim-autopairs">nvim-autopairs</a> : Autopairing plugin.</summary>
    <ul>
        <li>Match opening brackets/quotes/etc with closing ones after cursor.</li>
    </ul>
</details>
<details>
    <summary><a href="https://github.com/declancm/cinnamon.nvim">cinnamon.nvim</a> : Smooth scrolling.</summary>
</details>


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
vim.opt.relativenumber = true
```

[Back to top](#top)


## nvim_code

Coding dedicated config. Include stuff to help write/edit code as well as testing it. Tested only with the C language, although nothing I implemented was only designed for the C language.

### Plugins included:

<details>
  <summary><a href="https://github.com/dense-analysis/ale">ALE</a> : Inline syntax errors (compilation errors).</summary>
  <ul>
    <li>Can probably do other stuff, but didn't want to get into it as it was only for the inline errors that I added it.</li>
    <li>
      Custom keybind:
      <ul>
        <li>Toggle inline errors: <code>&lt;leader&gt;c</code></li>
      </ul>
    </li>
    <li>
      Custom config:
      <ul>
        <li>
          Added a custom function (written by chatGPT tbh) to disable inline errors when entering insert mode. Will have to toggle it back on afterward.
          <ul>
            <li>If you do not want this option you can remove the function in <code>nvim_code/lua/config/ALE.lua</code>. Be aware that the first line is the toggle keybind.</li>
          </ul>
        </li>
      </ul>
    </li>
  </ul>
</details>
<details>
  <summary><a href="https://github.com/akinsho/toggleterm.nvim">toggleterm.nvim</a> : Integrated terminal manager.</summary>
  <ul>
    <li>Very powerful, can be used to manage several terminals in various ways at the same time, but I only included it in order to make managing one terminal much more intuitive than it is by default.</li>
    <li>
      Custom keybindings:
      <ul>
        <li>Toggle term: <code>&lt;C-\&gt;</code></li>
        <li>Toggle term in vertical, horizontal, float, or tab mode: <code>(&lt;leader&gt;&lt;C-{first_letter_of_mode}&gt;)</code></li>
        <li>Now works in terminal mode: <code>&lt;esc&gt;</code></li>
        <li>
          Now works in terminal mode: <code>&lt;C-{h, j, k, l}&gt;</code>
          <ul>
            <li>Lets the terminal in terminal mode, so you can naviguate seamlessly while never leaving terminal mode in your term.</li>
          </ul>
        </li>
        <li>Exits terminal mode and then does <code>&lt;C-w&gt;</code>: <code>&lt;C-w&gt;</code></li>
      </ul>
    </li>
    <li>Size for horizontal and vertical mode can be changed in the keybinds in <code>/lua/config/toggleterm.lua</code>.</li>
  </ul>
</details>
<details>
    <summary><a href="https://github.com/kobbikobb/move-lines.nvim">move-lines.nvim</a> : Move selected lines up or down.</summary>
</details>
<details>
    <summary><a href="https://github.com/numToStr/Comment.nvim">Comment.nvim</a> : Powerful comment plugin.</summary>
</details>


### Custom Keybindings:

| Keybinding             | Action                    |
| ---------------------- | ------------------------- |
| `<C-\>`                | Toggle term on and off    |
| `(<leader><C-{mode}>)` | Toggle term in {mode}     |
| `<leader>c`            | Toggle inline error       |


### Custom Settings:

```lua
vim.opt.smartindent = true
```


[Back to top](#top)


## nvim_note

Config dedicated to note-taking. Includes plugins to edit Markdown files, as well as preview them easily.

### Plugins included:

<details>
  <summary><a href="https://github.com/tadmccorkle/markdown.nvim">markdown.nvim</a> : Enhanced Markdown editing tools.</summary>
  <ul>
    <li>Included for the inline styling keybindings and Table of Content creator.</li>
    <li>
      Custom keybindings:
      <ul>
        <li>Set selected text (Visual mode) to bold: <code>&lt;C-b&gt;</code></li>
        <li>Set selected text (Visual mode) to italics: <code>&lt;C-i&gt;</code></li>
        <li>
          Create Table of Content: <code>&lt;leader&gt;t</code>
          <ul>
            <li>(Based on Markdown headings in your file)</li>
          </ul>
        </li>
      </ul>
    </li>
  </ul>
</details>
<details>
  <summary><a href="https://github.com/toppair/peek.nvim">peek.nvim</a> : Markdown file live previewer.</summary>
  <ul>
    <li>Opens another window (outside of the terminal) showing a live preview of the file in a GitHub style, updating in real time.</li>
    <li>
      Custom keybinding:
      <ul>
        <li>Toggle preview window: <code>&lt;C-q&gt;</code></li>
      </ul>
    </li>
    <li>
      <strong>Warning!</strong>
      <ul>
        <li>This plugin requires <a href="https://deno.com">deno</a>.</li>
        <li>
          Doesn't work on every system.
          <ul>
            <li>Worked fine when tested on Dells running Ubuntu.</li>
            <li>Didn't work when tested on iMacs running Ubuntu.</li>
          </ul>
        </li>
      </ul>
    </li>
  </ul>
</details>
<details>
  <summary><a href="https://github.com/bullets-vim/bullets.vim">bullets.vim</a> : Automated bullet lists.</summary>
</details>


### Custom Keybindings:

| Keybinding  | Action                      |
| ----------- | --------------------------- |
| `<C-b>`     | Set selected text to bold   |
| `<C-i>`     | Set selected text to italic |
| `<leader>t` | Create Table of Content     |
| `<leader>q` | Toggle preview window       |


[Back to top](#top)

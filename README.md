# Usage

Add these lines to `~/.zshrc` :
```zsh
export NVIM_APPNAME=nvim-config/nvim_base
alias nv="export NVIM_APPNAME=nvim-config/nvim_base && nvim" # Switch to and open with basic config
alias nvn="export NVIM_APPNAME=nvim-config/nvim_note && nvim" # Switch to and open with note-taking config
alias nvc="export NVIM_APPNAME=nvim-config/nvim_code && nvim" # Switch to and open with coding config
```

# Configs documentation
## nvim_base :

Basic config, template to build a new config, and useful to work on current configs, in case stuff gets broken in the process.
Contains everything that is common to every other configs.

### Plugins included
- nvim-treesitter


## nvim_code :

Base config for coding. Work in progress.

## nvim_note :

Config dedicated to note-taking. Includes plugins to edit Markdown files, as well as preview them easily.



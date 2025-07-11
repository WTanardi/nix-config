# Billy's nix configuration

This is my dotfiles repo managed using nix and home-manager to ensure easy reproducibility

## Getting started

### Step 1: Install Nix

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

### Step 2: Apply Nix config

```sh
nix shell nixpkgs#home-manager nixpkgs#gh --command sh -c "\
  gh auth login \
  && gh repo clone WTanardi/nix-config --depth=1 \
  && cd nix-config/ \
  && home-manager switch --flake ./nix-config#willi -b bckp \
"
```
### Step 3: Done !

Anytime you want to refresh/update the config, cd into the root folder (nix-config/) and do

```sh
hms
```

which is a shortcut I've setup for 

```sh
home-manager switch --flake ~/nix-config/.#willi
```

## Neovim

My neovim setup is pretty basic, it is a clone of [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim/tree/master/lua), the only major difference is that it doesn't use mason, because mason doesn't work well with nix.

### Plugins
- [blink.cmp](https://github.com/Saghen/blink.cmp)
- [conform.nvim](https://github.com/stevearc/conform.nvim) 
- [fidget.nvim](https://github.com/j-hui/fidget.nvim) 
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [guess-indent.nvim](https://github.com/NMAC427/guess-indent.nvim)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [lazy.nvim](https://github.com/folke/lazy.nvim) 
- [lazydev.nvim](https://github.com/folke/lazydev.nvim)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [mini.nvim](https://github.com/echasnovski/mini.nvim)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) 
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) 
- [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)

- [deferred-clipboard.nvim](https://github.com/EtiamNullam/deferred-clipboard.nvim)
- [gx.nvim](https://github.com/chrishrb/gx.nvim)
- [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)

### Language servers
- [lua-language-server](https://github.com/LuaLS/lua-language-server)
- [pyright](https://github.com/microsoft/pyright)
- [typescript-language-server](https://github.com/typescript-language-server/typescript-language-server)
- [emmet-ls](https://github.com/aca/emmet-ls)
- [gopls](https://github.com/golang/tools/tree/master/gopls)
- [vscode-langservers-extracted](https://github.com/hrsh7th/vscode-langservers-extracted)
- [bash-language-server](https://github.com/bash-lsp/bash-language-server)
- [nixd](https://github.com/nix-community/nixd)

### Formatters
- [stylua](https://github.com/JohnnyMorganz/StyLua)
- [black](https://github.com/psf/black)
- [prettierd](https://github.com/fsouza/prettierd)
- [markdownlint-cli2](https://github.com/DavidAnson/markdownlint-cli2)
- [nixfmt](https://github.com/NixOS/nixfmt)

## Zsh
My zsh/cli config is very minimal, I just use a few aliases and some cli tools that acts as an upgrade to the defaults

### CLI tools
- [eza](https://github.com/eza-community/eza)
- [zoxide](https://github.com/ajeetdsouza/zoxide)

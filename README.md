# Billy's nix configuration

Dotfiles for macOS, managed with [nix-darwin](https://github.com/nix-darwin/nix-darwin) (system) and [home-manager](https://github.com/nix-community/home-manager) (user).

| File | What it owns |
| --- | --- |
| `darwin.nix` | macOS system: zsh in `/etc`, Touch ID sudo, Homebrew (Flutter, CocoaPods) |
| `home.nix` + `zsh/` `nvim/` `tmux/` `starship/` | user: packages, git, ssh, shell, editor |

`darwin-rebuild` applies **both**. Determinate Nix owns the Nix install, so `nix.enable = false` in `darwin.nix`.

The flake output is `soluix`. Rename `hostname` in `flake.nix` if you want it to match `scutil --get LocalHostName`.

## Getting started

### Step 1: Install Nix

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

### Step 2: Clone and apply

First-time bootstrap (installs nix-darwin and applies home-manager):

```sh
nix shell nixpkgs#gh --command sh -c "\
  gh auth login \
  && gh repo clone WTanardi/nix-config --depth=1 \
  && sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake ~/nix-config#soluix \
"
```

If this repo is already at `~/nix-config` (existing home-manager machine):

```sh
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake ~/nix-config#soluix
```

Conflicting dotfiles are copied to `*.backup`.

### Step 3: Later updates

```sh
drs
```

which is

```sh
sudo darwin-rebuild switch --flake ~/nix-config#soluix
```

User-only rebuild (no macOS system changes):

```sh
hms
```

which is

```sh
home-manager switch --flake ~/nix-config#williamtanardi
```

Prefer `drs` on this Mac so system and home stay in sync.

## Flutter / iOS simulator

nix-darwin cannot replace Xcode. The App Store Xcode + Homebrew Flutter is what `flutter run` needs.

1. Install [Homebrew](https://brew.sh) if it is not already at `/opt/homebrew`.
2. Install **Xcode** from the App Store, open it once, and install the iOS platform / Simulator runtime (Settings → Components).
3. Apply this config (`drs`). That installs official Flutter and CocoaPods via Homebrew, not `pkgs.flutter`.
4. `open -a Simulator`, then `flutter devices`, then `flutter run`.

Do not put `pkgs.flutter` back in `home.nix`. The Nix store copy is read-only, so iOS framework unpack and codesign fail on current macOS.

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

{ config, pkgs, ... }:
{
  home = {
    username = "williamtanardi";
    homeDirectory = "/home/williamtanardi";

    stateVersion = "25.05"; # Don't change

    packages = with pkgs; [
      eza
      zoxide
      fd
      lazygit
      gh
      unzip
      wsl-open
      gnumake
      ripgrep
      fzf
      gcc
      xclip
      tree-sitter
      bun
      cargo
      pandoc
      sqlite

      docker

      typescript
      typescript-language-server
      gleam
      erlang
      rebar3

      exercism

      nodejs_latest
      pnpm

      vscode

      tailwindcss
    ];
    file = {
      ".config/nvim" = {
        source = ./nvim;
        recursive = true;
      };
    };
  };

  imports = [
    # Languages
    # ./languages/python.nix
    ./languages/lua.nix
    ./languages/go.nix
  ];

  programs = {
    home-manager = {
      enable = true;
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    git = {
      enable = true;
      settings = {
        user = {
          name = "WTanardi";
          email = "william.tanardi@gmail.com";
        };
        fetch.prune = true;
        core = {
          sshCommand = "ssh -i ~/.ssh/id_ed25519_personal";
        };
        init.defaultBranch = "main";
      };

      includes = [
        {
          condition = "gitdir:~/code/";
          contents = {
            user = {
              email = "william.tanardi@soluix.ai";
              name = "williamtanardi-soluix";
            };
            core = {
              sshCommand = "ssh -i ~/.ssh/id_ed25519_work";
            };
          };
        }
      ];
    };
  };
  nixpkgs.config = {
    # allowBroken = true;
    allowUnfree = true;
  };
}

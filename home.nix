{ config, pkgs, ... }:
{
  home = {
    username = "williamtanardi";
    homeDirectory = "/home/williamtanardi";

    stateVersion = "25.05"; # Don't change

    sessionVariables = {
      GOPRIVATE = "github.com/soluixdeveloper/*";
    };

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
      yarn
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

      prettierd
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
    ./languages/python.nix
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
        url."git@github.com:soluixdeveloper/".insteadOf = "https://github.com/soluixdeveloper/";
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
            url."git@github.com:soluixdeveloper/".insteadOf = "https://github.com/soluixdeveloper/";
          };
        }
      ];
    };

    ssh = {
      enable = true;
      matchBlocks = {
        "*" = {
          addKeysToAgent = "yes";
        };
        "github.com" = {
          hostname = "github.com";
          identityFile = "~/.ssh/id_ed25519_work";
        };
      };
    };
  };
  nixpkgs.config = {
    # allowBroken = true;
    allowUnfree = true;
  };
}

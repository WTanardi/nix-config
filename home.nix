{ config, pkgs, ... }: {
  home = {
    username = "williamtanardi";
    homeDirectory = "/Users/williamtanardi";

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

      typescript
      typescript-language-server

      nodejs
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
    home-manager = { enable = true; };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    git = {
      enable = true;
      userEmail = "william.tanardi@soluix.ai";
      userName = "williamtanardi-soluix";
    };
  };
}

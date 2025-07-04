{ config, pkgs, ... }:

{
  home = {
    username = "willi";
    homeDirectory = "/home/willi";

    stateVersion = "25.05"; # Don't change

    packages = with pkgs; [
      eza
      ripgrep
      fzf
      lazygit
      zoxide
      fd
      xclip
      unzip
      gnumake
      gh
      wsl-open

      lua54Packages.jsregexp
      markdownlint-cli2
      prettierd

      gcc
      cargo

      zig
      lua
      go
    ];
    file = {
      ".config/nvim" = {
        source = ./nvim;
        recursive = true;
      };
    };
  };

  programs = {
    home-manager = { enable = true; };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    git = {
      enable = true;
      userEmail = "william.tanardi@gmail.com";
      userName = "WTanardi";
    };
  };
}

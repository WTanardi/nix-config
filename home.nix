{ config, pkgs, ... }: {
  home = {
    username = "willi";
    homeDirectory = "/home/willi";

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

      lua
      go
      typescript

      bun
      cargo
      luajitPackages.jsregexp
      luajitPackages.luarocks
      go-blueprint
      air
      templ
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

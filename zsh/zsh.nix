{ config, pkgs, ... }: {
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autocd = true;
      autosuggestion = { enable = true; };
      oh-my-zsh = { enable = true; };
      shellAliases = {
        n = "nvim";
        ls = "eza --icons=always";
        cd = "z";
        ll = "eza -l";
        la = "eza -l -a";
        sau = "sudo apt update && sudo apt upgrade && sudo apt autoremove";
        c = "clear";
        lg = "lazygit";
        hms = "home-manager switch --flake ~/nix-config/.#willi";
      };
    };
  };
}

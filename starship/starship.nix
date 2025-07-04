{ config, pkgs, ... }: {
  programs = {
    starship = {
      enable = true;
      settings = {
        add_newline = false;
        right_format = "$time";
      };
    };
  };
}

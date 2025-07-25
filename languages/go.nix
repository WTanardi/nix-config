{ config, pkgs, ... }: {
  home = {
    packages = with pkgs; [
      # Go
      go
      go-blueprint
      air
      templ
    ];
  };
}

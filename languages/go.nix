{ config, pkgs, ... }:
{
  programs.go.enable = true;

  home = {
    packages = with pkgs; [
      go-blueprint
      air
      templ
      cobra-cli
      goreleaser
    ];
  };
}

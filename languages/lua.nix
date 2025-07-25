{ config, pkgs, ... }:

let
  myLua = pkgs.luajitPackages.withPackages (ps:
    with ps; [
      # Lua packages
      ps.jsregexp
      ps.luarocks
    ]);
in {
  home = {
    packages = with pkgs; [
      # Lua
      lua
      luajitPackages.jsregexp
      luajitPackages.luarocks
    ];
  };
}

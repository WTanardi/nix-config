{ config, pkgs, ... }:
{
  programs = {
    neovim = {
      enable = true;
      
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraLuaConfig = ''${ builtins.readFile ./init.lua}'';

      withNodeJs = true;
      withPython3 = true;
			withRuby = true;
    };
  };
}

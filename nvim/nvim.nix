{ config, pkgs, ... }: {
  programs = {
    neovim = {
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraLuaConfig = "${builtins.readFile ./init.lua}";

      withNodeJs = true;
      withPython3 = true;
      withRuby = true;

      extraPackages = with pkgs; [
        # Runtime dependencies
        ripgrep
        fzf
        gnumake
        gcc
        luajit
        xclip
        lua54Packages.jsregexp

        # Language servers
        gopls
        typescript-language-server
        lua-language-server
        htmx-lsp
        eslint_d

        # Formatters
        nixfmt
        stylua
        prettierd
        markdownlint-cli2
      ];
    };
  };
}

{ config, pkgs, ... }:
{
  programs = {
    neovim = {
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      initLua = "${builtins.readFile ./init.lua}";

      withNodeJs = true;
      withPython3 = true;
      withRuby = true;

      extraPackages = with pkgs; [
        # Language servers
        lua-language-server
        pyright
        typescript-language-server
        emmet-ls
        go
        gopls
        vscode-langservers-extracted
        bash-language-server
        nixd
        eslint_d
        tailwindcss-language-server

        # Formatters
        stylua
        ruff
        prettierd
        markdownlint-cli2
        nixfmt
      ];
    };
  };
}

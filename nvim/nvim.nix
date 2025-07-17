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
        # Language servers
        lua-language-server
        pyright
        typescript-language-server
        emmet-ls
        gopls
        vscode-langservers-extracted
        bash-language-server
        nixd
        eslint_d
        templ
        htmx-lsp

        # Formatters
        stylua
        black
        prettierd
        markdownlint-cli2
        nixfmt
      ];
    };
  };
}

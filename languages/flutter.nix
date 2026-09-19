{ lib, pkgs, ... }:

{
  home = {
    packages = [ pkgs.fvm ];

    sessionVariables = {
      LANG = "en_US.UTF-8";
      LC_ALL = "en_US.UTF-8";
    };

    sessionPath = [
      "/opt/homebrew/bin"
      "/opt/homebrew/sbin"
    ];
  };

  programs.zsh.initExtra = lib.mkAfter ''
    if [[ "''${DEVELOPER_DIR:-}" == /nix/store/* ]]; then
      unset DEVELOPER_DIR
    fi
    if [[ "''${SDKROOT:-}" == /nix/store/* ]]; then
      unset SDKROOT
    fi
    unset NIX_APPLE_SDK_VERSION
  '';
}

{
  config,
  pkgs,
  lib,
  ...
}:

let
  # Build a custom gcloud bundle that includes the mandatory GKE auth plugin binary
  gcloud-with-gke = pkgs.google-cloud-sdk.withExtraComponents (
    with pkgs.google-cloud-sdk.components;
    [
      gke-gcloud-auth-plugin
    ]
  );
in
{
  home = {
    username = "williamtanardi";
    homeDirectory = "/home/williamtanardi";

    stateVersion = "25.05"; # Don't change

    sessionVariables = {
      GOPRIVATE = "github.com/soluixdeveloper/*";
      LD_LIBRARY_PATH = lib.mkAfter "${pkgs.stdenv.cc.cc.lib}/lib";
      KUBECONFIG = "kubeconfig-bci-dev.yaml";
      NIX_LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath (
        with pkgs;
        [
          stdenv.cc.cc.lib
          zlib
          glibc
          openssl
          icu
          curl
          util-linux
          libsecret
        ]
      );
    };

    packages = with pkgs; [
      eza
      zoxide
      fd
      lazygit
      gh
      unzip
      wsl-open
      gnumake
      ripgrep
      fzf
      gcc
      xclip
      tree-sitter
      bun
      yarn
      cargo
      pandoc
      sqlite
      stdenv.cc.cc.lib
      sshpass
      zip
      k9s
      kubectl
      gcloud-with-gke
      nix-ld
      zlib
      glibc
      openssl
      icu
      curl
      util-linux
      libsecret
      cursor-cli

      openvpn
      docker
      gpgme

      typescript
      typescript-language-server

      nodejs_latest
      pnpm

      vscode

      ruff
      prettierd
      tailwindcss
    ];
    file = {
      ".config/nvim" = {
        source = ./nvim;
        recursive = true;
      };
    };
  };

  imports = [
    # Languages
    ./languages/python.nix
    ./languages/lua.nix
    ./languages/go.nix
  ];

  programs = {
    home-manager = {
      enable = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    git = {
      enable = true;
      settings = {
        user = {
          name = "WTanardi";
          email = "william.tanardi@gmail.com";
        };
        fetch.prune = true;
        init.defaultBranch = "main";
        url."git@github.com:".insteadOf = "https://github.com/";
      };

      includes = [
        {
          condition = "gitdir:~/code/";
          contents = {
            user = {
              email = "william.tanardi@soluix.ai";
              name = "williamtanardi-soluix";
            };
            url."git@github.com:soluixdeveloper/".insteadOf = "https://github.com/soluixdeveloper/";
          };
        }
      ];
    };

    ssh = {
      enable = true;
      matchBlocks = {
        "*" = {
          addKeysToAgent = "yes";
        };
        "github.com" = {
          hostname = "github.com";
          identityFile = "~/.ssh/id_ed25519_work";
        };
      };
    };

  };
  nixpkgs.config = {
    # allowBroken = true;
    allowUnfree = true;
  };
}

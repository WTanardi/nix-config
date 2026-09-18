{
  description = "nix-darwin and Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      nix-darwin,
      home-manager,
      ...
    }:
    let
      system = "aarch64-darwin";
      username = "soluix";
      hostname = "soluix";

      homeModules = [
        ./home.nix
        ./nvim/nvim.nix
        ./zsh/zsh.nix
        ./starship/starship.nix
        ./tmux/tmux.nix
      ];

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs username; };
        modules = [
          ./darwin.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.${username}.imports = homeModules;
          }
        ];
      };

      homeConfigurations."williamtanardi" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = homeModules;
      };
    };
}

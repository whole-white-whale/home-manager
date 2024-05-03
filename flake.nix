{
  description = "My Home Manager configuration";

  inputs = {
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, home-manager, nixpkgs, ... }:

    let
      pkgs = nixpkgs.legacyPackages.${system};
      system = "x86_64-linux";

    in
    {
      homeConfigurations.sery = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home.nix
        ];
      };
    };
}

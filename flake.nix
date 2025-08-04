{

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yt-x = {
      url = "github:Benexl/yt-x";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {

    nixosConfigurations.principal = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        { nix.settings.experimental-features = ["nix-command" "flakes"]; }
        ./hosts/principal/configuration.nix

	./nixosModules

	stylix.nixosModules.stylix

	home-manager.nixosModules.home-manager

      ];

    };

    nixosConfigurations.juanaManso = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
	{ nix.settings.experimental-features = ["nix-command" "flakes"]; }
	./hosts/juanaManso/configuration.nix

	./nixosModules

	stylix.nixosModules.stylix

	home-manager.nixosModules.home-manager

      ];
    };

    homeManagerModules.default = ./homeManagerModules;

  };
  
}

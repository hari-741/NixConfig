{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    grub2-themes.url = "github:vinceliuice/grub2-themes";
  };

  outputs = { self, nixpkgs, home-manager, grub2-themes, ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in{ 
      nixosConfigurations = {
        Ark = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
          ./configuration.nix
          grub2-themes.nixosModules.default
          ];
        };
      };
      homeConfigurations = {
        hari = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
          ./home.nix
          ];
        };
      };
    };
}

{
  description = "WSL NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    }; #home-manager
  }; #Inputs

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./database.nix
        ./odoo.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            users = {
              nixos = import ./home-manager/nixos.nix;
            }; #home-manager users
          }; #home-manager module
        } #home-manager
      ]; #modules
    }; #nixos host
  }; #Outputs
}

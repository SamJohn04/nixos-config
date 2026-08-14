{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs"; # this line is optional, prevents downloading two versions of nixpkgs but disables cache
    };
  };
  outputs = { self, nixpkgs, ... } @ inputs: {
    nixosConfigurations.nixos-home-hp = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [ ./system/configuration.nix ];
    };
  };
}

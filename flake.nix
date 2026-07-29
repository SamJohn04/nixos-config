{
    description = "A very basic flake";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        awww.url = "git+https://codeberg.org/LGFae/awww";
    };
    outputs = { self, nixpkgs, ... } @ inputs: {
        nixosConfigurations.nixos-home-hp = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [ ./configuration.nix ];
        };
    };
}

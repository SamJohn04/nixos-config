{
    description = "A very basic flake";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    outputs = { self, nixpkgs }: {
        nixosConfigurations.nixos-home-hp = nixpkgs.lib.nixosSystem {
            modules = [ ./configuration.nix ];
        };
    };
}

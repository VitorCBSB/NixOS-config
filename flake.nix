{
  description = "Configuration flake for my machine.";

  inputs = {
    nixpkgs.url = "https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz";
  };

  outputs = { self, nixpkgs, ... } @inputs: 
  {
    nixosConfigurations = {
      lambda = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
        ];
      };
    };
  };
}

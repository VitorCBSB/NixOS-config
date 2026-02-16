{
  description = "Configuration flake for my machine.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-nvidia.url = "github:NixOS/nixpkgs/ab9ad415916a0fb89d1f539a9291d9737e95148e";
  };

  outputs = { self, nixpkgs, nixpkgs-nvidia, ... } @inputs: 
  {
    nixosConfigurations = {
      lambda = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./configuration.nix
        ];
      };
    };
  };
}

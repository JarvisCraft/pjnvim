{
  description = "PROgrm_JARvis's Neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };
  };

  outputs = inputs@{ nixpkgs, flake-parts, nixvim, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem = { pkgs, system, ... }:
        let
          module = {
            inherit pkgs;
            module = ./config;
          };
          nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule module;
        in {
          checks.default =
            nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule module;
          packages = {
            nvim = nvim;
            default = nvim;
          };
          formatter = pkgs.nixfmt-rfc-style;
        };
    };
}

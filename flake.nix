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
          nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
            inherit pkgs;
            module = ./config;
          };
        in {
          checks = {
            default = nixvim.lib.${system}.check.mkTestDerivationFromNvim {
              inherit nvim;
              name = "PJNvim";
            };
          };
          packages = {
            nvim = nvim;
            default = nvim;
          };
          devShells = {
            neovide = pkgs.mkShell {
              inputsFrom = [ nvim ];
              packages = [ pkgs.neovide ];
              shellHook = "${pkgs.neovide}/bin/neovide .";
            };

            kitty = pkgs.mkShell {
              inputsFrom = [ nvim ];
              packages = [ pkgs.kitty ];
              shellHook = "${nvim}/bin/nvim .";
            };
          };
          formatter = pkgs.nixfmt-rfc-style;
        };
    };
}

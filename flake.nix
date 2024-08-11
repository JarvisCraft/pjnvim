{
  description = "PROgrm_JARvis's Neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
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

  outputs = { nixpkgs, flake-utils, nixvim, ... }:
    (flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
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
      })) // {
        config = ./config;
      };
}

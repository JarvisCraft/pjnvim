{
  description = "PROgrm_JARvis's Neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
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
    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      flake-parts,
      git-hooks,
      nixvim,
      treefmt-nix,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [
        git-hooks.flakeModule
        treefmt-nix.flakeModule
      ];
      perSystem =
        {
          pkgs,
          system,
          config,
          ...
        }:
        let
          module = {
            inherit pkgs;
            module = ./config;
          };
          nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule module;
        in
        {
          checks.default = nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule module;
          packages = rec {
            default = nvim;
            editor = default.extend {
              vimAlias = true;
              viAlias = true;
            };
          };
          formatter = config.treefmt.build.wrapper;
          treefmt.config = {
            projectRootFile = "flake.nix";
            programs = {
              nixfmt.enable = true;
              stylua.enable = true;
            };
          };
          pre-commit.settings = {
            package = pkgs.prek;
            hooks = {
              treefmt = {
                enable = true;
                package = config.treefmt.build.wrapper;
              };
              nil.enable = true;
              statix.enable = true;
              deadnix.enable = true;
              flake-checker.enable = true;
            };
          };
          devShells.default = config.pre-commit.devShell;
        };
    };
}

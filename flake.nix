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
    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        nixpkgs-stable.follows = "nixpkgs";
      };
    };
  };

  outputs =
    inputs@{
      flake-parts,
      git-hooks,
      nixvim,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [ git-hooks.flakeModule ];
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
          formatter = pkgs.nixfmt-rfc-style;
          pre-commit.settings.hooks = {
            nixfmt-rfc-style.enable = true;
            nil.enable = true;
            statix.enable = true;
            stylua.enable = true;
            flake-checker.enable = true;
            deadnix.enable = true;
          };
          devShells.default = config.pre-commit.devShell;
        };
    };
}

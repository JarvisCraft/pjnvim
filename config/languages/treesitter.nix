{ lib, ... }:
let
  inherit (lib.nixvim) mkRaw;
in
{
  dependencies.tree-sitter.enable = true;
  plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      settings = {
        highlight.enable = true;
        incremental_selection = {
          enable = true;
          keymaps = {
            init_selection = "ti";
            scope_incremental = "ts";
            node_incremental = "tn";
            node_decremental = "tN";
          };
        };
        indent.enable = true;
      };
    };
    treesitter-context.enable = true;
    # hmts.enable = true;
    nvim-ufo = {
      enable = true;
      settings = {
        openFoldHlTimeout = 0;
        providerSelector = ''
          function()
            return { "lsp", "indent" }
          end
        '';
        preview = {
          winConfig = {
            border = "rounded";
            winblend = 0;
          };
          mappings = {
            close = "q";
            switch = "K";
          };
        };
      };
    };
  };

  keymaps = [
    {
      key = "zR";
      action = mkRaw "function() require('ufo').openAllFolds() end";
      options.desc = "Open all folds";
    }
    {
      key = "zM";
      action = mkRaw "function() require('ufo').closeAllFolds() end";
      options.desc = "Close all folds";
    }
  ];
}

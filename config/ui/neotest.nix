{ lib, ... }:
let
  inherit (lib.nixvim) mkRaw;
in
{
  plugins.neotest = {
    enable = true;
    adapters = {
      plenary.enable = true;
      java.enable = true;
      pest.enable = true;
    };
  };

  keymaps = [
    {
      key = "<leader>Tn";
      action = mkRaw "function() require('neotest').run.run() end";
      options.desc = "Run nearest test";
    }
    {
      key = "<leader>Tf";
      action = mkRaw "function() require('neotest').run.run(vim.fn.expand('%')) end";
      options.desc = "Run file tests";
    }
    {
      key = "<leader>Ts";
      action = mkRaw "function() require('neotest').run.stop() end";
      options.desc = "Stop tests";
    }
    {
      key = "<leader>To";
      action = mkRaw "function() require('neotest').output.open() end";
      options.desc = "Toggle test output";
    }
    {
      key = "<leader>Tt";
      action = mkRaw "function() require('neotest').summary.toggle() end";
      options.desc = "Toggle test summary";
    }
  ];
}

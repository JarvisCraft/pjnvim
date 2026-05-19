{ lib, ... }:
let
  inherit (lib.nixvim) mkRaw;
in
{
  plugins = {
    fugitive.enable = true;
    gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
        current_line_blame_opts.delay = 250;
        trouble = true;
      };
    };
    diffview.enable = true;
    lazygit = {
      enable = true;
      settings.floating_window_use_plenary = 1;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<CR>";
      options.desc = "LazyGit (root dir)";
    }
    {
      key = "]c";
      action = mkRaw "function() require('gitsigns').next_hunk() end";
      options.desc = "Next hunk";
    }
    {
      key = "[c";
      action = mkRaw "function() require('gitsigns').prev_hunk() end";
      options.desc = "Prev hunk";
    }
    {
      key = "<leader>hs";
      action = mkRaw "function() require('gitsigns').stage_hunk() end";
      options.desc = "Stage hunk";
    }
    {
      key = "<leader>hr";
      action = mkRaw "function() require('gitsigns').reset_hunk() end";
      options.desc = "Reset hunk";
    }
    {
      key = "<leader>hb";
      action = mkRaw "function() require('gitsigns').blame_line({ full = true }) end";
      options.desc = "Blame line";
    }
  ];

  extraConfigLua = ''
    require("telescope").load_extension("lazygit")
  '';
}

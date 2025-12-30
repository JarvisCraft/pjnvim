{
  plugins.overseer.enable = true;
  keymaps = [
    {
      mode = "n";
      key = "<leader>or";
      action = "<cmd>OverseerRun<CR>";
      options.desc = "Run task";
    }
    {
      mode = "n";
      key = "<leader>oo";
      action = "<cmd>OverseerOpen<CR>";
      options.desc = "Open tasks configuration";
    }
    {
      mode = "n";
      key = "<leader>od";
      action = "<cmd>OverseerClose<CR>";
      options.desc = "Close tasks configuration";
    }
    {
      mode = "n";
      key = "<leader>os";
      action = "<cmd>OverseerShell<CR>";
      options.desc = "Run shell command";
    }
    {
      mode = "n";
      key = "<leader>to";
      action = "<cmd>OverseerToggle<CR>";
      options.desc = "Toggle tasks configuration";
    }
  ];
}

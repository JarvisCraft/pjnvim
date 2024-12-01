{
  plugins.precognition = {
    enable = true;
    settings = {
      disabled_fts = [ "alpha" ];
      startVisible = false;
    };
  };

  keymaps = [
    {
      key = "<leader>tp";
      action = "<cmd>Precognition toggle<CR>";
      options.desc = "Toggle precognition";
    }
  ];
}

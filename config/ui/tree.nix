{
  plugins.neo-tree = {
    enable = true;
    closeIfLastWindow = true;
    buffers = {
      bindToCwd = false;
      followCurrentFile.enabled = true;
    };
  };
  keymaps = [{
    mode = "n";
    key = "<leader>tt";
    action = "<cmd>Neotree toggle<CR>";
    options.desc = "Toggle file tree";
  }];
}

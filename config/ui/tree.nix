{
  plugins.neo-tree = {
    enable = true;
    closeIfLastWindow = true;
    buffers = {
      bindToCwd = false;
      followCurrentFile.enabled = true;
    };
    filesystem.filteredItems.alwaysShow = [".gitignore"];
  };
  keymaps = [{
    mode = "n";
    key = "<leader>tt";
    action = "<cmd>Neotree toggle<CR>";
    options.desc = "Toggle file tree";
  }];
}

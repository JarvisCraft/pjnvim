{
  plugins = {
    undotree = {
      enable = true;
      settings = {
        autoOpenDiff = true;
        focusOnToggle = true;
      };
    };
  };
  keymaps = [{
    mode = "n";
    key = "<leader>tu";
    action = "<cmd>UndotreeToggle<CR>";
    options = {
      silent = true;
      desc = "Toggle Undo tree";
    };
  }];
}

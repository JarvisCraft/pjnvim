{
  plugins.neo-tree = {
    enable = true;
    closeIfLastWindow = true;
    filesystem = {
      useLibuvFileWatcher = true;
      followCurrentFile.enabled = true;
      filteredItems.alwaysShow = [
        ".envrc"
        ".gitignore"
      ];
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>Neotree toggle<CR>";
      options.desc = "Toggle file tree";
    }
    {
      mode = "n";
      key = "<leader>tf";
      action = "<cmd>Neotree focus<CR>";
      options.desc = "Focus on file tree";
    }
  ];
}

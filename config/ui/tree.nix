{
  plugins.neo-tree = {
    enable = true;
    settings = {
      close_if_last_window = true;
      filesystem = {
        use_libuv_file_watcher = true;
        follow_current_file.enabled = true;
        filtered_items.always_show = [
          ".envrc"
          ".gitignore"
          ".github"
          ".gitlab-ci.yml"
        ];
      };
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

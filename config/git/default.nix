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
  ];

  extraConfigLua = ''
    require("telescope").load_extension("lazygit")
  '';
}

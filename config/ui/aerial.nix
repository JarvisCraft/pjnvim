{
  plugins.aerial = {
    enable = true;
    settings = {
      backends = [
        "treesitter"
        "lsp"
        "markdown"
        "man"
      ];
      layout = {
        default_direction = "prefer_right";
        placement = "window";
        max_width = [
          40
          0.2
        ];
        width = null;
        min_width = 10;
      };
      filter_kind = [
        "Class"
        "Constructor"
        "Enum"
        "Function"
        "Interface"
        "Module"
        "Method"
        "Struct"
      ];
      nerd_font = "auto";
      highlight_on_jump = 300;
      close_on_select = false;
      manage_folds = false;
    };
  };

  keymaps = [
    {
      key = "<leader>a";
      action = "<cmd>AerialToggle!<CR>";
      options.desc = "Toggle code outline";
    }
  ];
}

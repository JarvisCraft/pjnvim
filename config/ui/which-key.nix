{
  plugins.which-key = {
    enable = true;
    settings.spec = [
      {
        __unkeyed-1 = "<leader>c";
        desc = "Code";
      }
      {
        __unkeyed-1 = "<leader>b";
        desc = "Buffer";
      }
      {
        __unkeyed-1 = "<leader>r";
        desc = "Refactor";
      }
      {
        __unkeyed-1 = "<leader>f";
        desc = "Telescope";
      }
      {
        __unkeyed-1 = "<leader>t";
        desc = "Toggle";
      }
      {
        __unkeyed-1 = "<leader>g";
        desc = "Git";
      }
      {
        __unkeyed-1 = "<leader>l";
        desc = "LSP";
      }
    ];
    /*
      registrations = {
        "<leader>c" = {
          desc = "Code";
          _ = "which_key_ignore";
        };
        "<leader>b" = {
          desc = "Buffer";
          _ = "which_key_ignore";
        };
        "<leader>r" = {
          desc = "Refactor";
          _ = "which_key_ignore";
        };
        "<leader>f" = {
          desc = "Telescope";
          _ = "which_key_ignore";
        };
        "<leader>t" = {
          desc = "Toggle";
          _ = "which_key_ignore";
        };
        "<leader>g" = {
          desc = "Git";
          _ = "which_key_ignore";
        };
        "<leader>l" = {
          desc = "LSP";
          _ = "which_key_ignore";
        };
      };
    */
  };
}

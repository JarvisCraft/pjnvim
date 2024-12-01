{
  plugins.noice = {
    enable = true;
    settings = {
      notify.enabled = true;
      messages.enabled = true;
      lsp = {
        override = {
          "cmp.entry.get_documentation" = true;
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
        };
        message.enabled = true;
        progress = {
          enabled = true;
          view = "mini";
        };
      };
    };
  };
}

{
  lsp.servers.marksman.enable = true;

  plugins = {
    markdown-preview.enable = true;
    markview = {
      enable = true;
      settings.preview.filetypes = [
        "markdown"
        "latex"
        "tex"
      ];
    };
  };
}

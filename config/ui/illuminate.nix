{
  plugins.illuminate = {
    enable = true;
    settings = {
      providers = [
        "lsp"
        "treesitter"
        "regex"
      ];
      delay = 100;
      filetypes_denylist = [
        "dirvish"
        "fugitive"
        "NvimTree"
        "neo-tree"
        "dashboard"
        "lazy"
        "TelescopePrompt"
        "alpha"
        "qf"
        "Outline"
        "aerial"
      ];
      under_cursor = true;
    };
  };
}

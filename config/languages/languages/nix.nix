{
  lsp.servers.nil_ls.enable = true;

  plugins.none-ls.sources = {
    formatting.nixfmt.enable = true;
    code_actions.statix.enable = true;
    diagnostics = {
      statix.enable = true;
      deadnix.enable = true;
    };
  };
}

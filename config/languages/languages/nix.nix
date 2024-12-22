{ pkgs, ... }:
{
  plugins = {
    lsp.servers.nil_ls.enable = true;
    none-ls.sources = {
      formatting.nixfmt = {
        enable = true;
        package = pkgs.nixfmt-rfc-style;
      };
      code_actions.statix.enable = true;
      diagnostics.statix.enable = true;
    };
  };
}

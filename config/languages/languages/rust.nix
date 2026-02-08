{
  plugins = {
    rustaceanvim = {
      enable = true;
      settings.server.default_settings.rust-analyzer = {
        cargo.features = "all";
        diagnostics.styleLints.enable = true;
        files.excludeDirs = [
          ".cargo"
          ".direnv"
          ".git"
          "node_modules"
          "target"
        ];
      };
    };
    crates = {
      enable = true;
      settings = {
        lsp.enabled = true;
        completion.crates.enabled = true;
      };
    };

    # Rust frameworks
    none-ls.sources.formatting.leptosfmt.enable = true;
  };
}

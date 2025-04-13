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
        null_ls.enabled = true;
        completion = {
          cmp.enabled = true;
          crates.enabled = true;
        };
      };
    };
  };
}

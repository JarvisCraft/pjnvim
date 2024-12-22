{
  plugins = {
    rustaceanvim = {
      enable = true;
      settings.server.default_settings.rust-analyzer.files.excludeDirs = [ ".direnv" ];
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

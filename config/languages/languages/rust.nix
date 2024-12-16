{
  plugins = {
    rustaceanvim = {
      enable = true;
      settings.server.default_settings.rust-analyzer.files.excludeDirs = [ ".direnv" ];
    };
    crates-nvim.enable = true;
  };
}

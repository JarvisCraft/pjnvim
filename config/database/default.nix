{ pkgs, ... }:
{
  extraPlugins = [ pkgs.vimPlugins.nvim-dbee ];
  extraConfigLua = ''
    dbee = require("dbee")
    dbee.install()
    dbee.setup()
  '';
}

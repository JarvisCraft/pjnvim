{
  plugins.lualine = {
    enable = true;
    settings.options = {
      alwaysDivideMiddle = true;
      globalstatus = true;
      ignoreFocus = [ "neo-tree" ];
      extensions = [ "fzf" ];
    };
  };
}

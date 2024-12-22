{
  plugins.luasnip = {
    enable = true;
    fromLua = [ { paths = ./luasnip; } ];
    settings = {
      update_events = "TextChanged,TextChangedI";
      cut_selection_keys = "<Tab>";
    };
  };
}

{ lib, ... }:
{
  plugins.alpha =
    let
      inherit (lib.nixvim) mkRaw;
      button =
        text: shortcut: action:

        {
          type = "button";
          val = text;
          on_press = action;
          opts = {
            inherit shortcut;
            position = "center";
            cursor = 3;
            width = 50;
            align_shortcut = "right";
            hl_shortcut = "Keyword";
          };
        };
    in
    {
      enable = true;
      settings.layout = [
        {
          type = "padding";
          val = 2;
        }
        {
          type = "text";
          val = [
            "██████╗     ██╗███╗   ██╗██╗   ██╗██╗███╗   ███╗"
            "██╔══██╗    ██║████╗  ██║██║   ██║██║████╗ ████║"
            "██████╔╝    ██║██╔██╗ ██║██║   ██║██║██╔████╔██║"
            "██╔═══╝██   ██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║"
            "██║    ╚█████╔╝██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║"
            "╚═╝     ╚════╝ ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
          ];
          opts = {
            hl = "type";
            position = "center";
          };
        }
        {
          type = "padding";
          val = 2;
        }
        (button "󰿅 Quit" ":qa" (mkRaw "function() vim.cmd[[qa]] end"))
      ];
    };
}

{ lib, ... }:
{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        alwaysDivideMiddle = true;
        globalstatus = true;
        ignoreFocus = [ "neo-tree" ];
        extensions = [
          "fzf"
          "neo-tree"
          "trouble"
          "mason"
          "lazy"
          "man"
        ];
      };
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [
          "branch"
          "diff"
        ];
        lualine_c = [
          (lib.nixvim.mkRaw ''{ "filename", path = 1 }'')
          (lib.nixvim.mkRaw ''{ "navic", color_correction = "dynamic", separator = " " }'')
        ];
        lualine_x = [
          "diagnostics"
          "filetype"
        ];
        lualine_y = [ "progress" ];
        lualine_z = [ "location" ];
      };
    };
  };

  plugins.navic = {
    enable = true;
    settings = {
      lsp.auto_attach = true;
      separator = "  ";
    };
  };
}

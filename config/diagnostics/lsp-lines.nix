{ lib, ... }:
{
  plugins.lsp-lines.enable = true;
  diagnostic.settings.virtual_lines.only_current_line = true;
  keymaps = [
    {
      key = "<leader>tl";
      action = lib.nixvim.mkRaw ''
        function()
          require('lsp_lines').toggle();
        end
      '';
      options.desc = "Toggle LSP lines";
    }
  ];
}

{ lib, ... }:
{
  plugins.lsp-lines.enable = true;
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

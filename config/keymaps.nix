{ lib, ... }:
{
  keymaps = [
    {
      key = "<leader>th";
      action = lib.nixvim.mkRaw ''
        function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end
      '';
      options.desc = "Toggle Inlay Hints";
    }
  ];
}

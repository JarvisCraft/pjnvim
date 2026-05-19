{ lib, ... }:
{
  plugins.inc-rename.enable = true;

  keymaps = [
    {
      key = "<leader>rn";
      action = lib.nixvim.mkRaw ''
        function()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end
      '';
      options = {
        expr = true;
        silent = true;
        desc = "Rename Symbol";
      };
    }
  ];
}

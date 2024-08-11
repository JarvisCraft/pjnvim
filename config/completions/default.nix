{
  plugins = {
    cmp = {
      enable = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "buffer"; }
          { name = "async_path"; }
          { name = "git"; }
          { name = "cmdline"; }
          { name = "emoji"; }
          { name = "fish"; }
          { name = "latex_symbols"; }
        ];
        window = {
          completion.border = "rounded";
          documentation.border = "rounded";
        };
        mapping = {
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-e>" = "cmp.mapping.close()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          # https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#safely-select-entries-with-cr
          "<CR>" = ''
            cmp.mapping({
              i = function(fallback)
                if cmp.visible() and cmp.get_active_entry() then
                  cmp.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                  })
                else
                  fallback()
                end
              end,
              s = cmp.mapping.confirm({ select = true }),
              c = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true
              }),
            })
          '';
          "<Esc>" = "cmp.mapping.abort()";
        };
        snippet.expand = "luasnip";
        experimental.ghost_text = true;
      };
    };
    lspkind.enable = true;
  };
}

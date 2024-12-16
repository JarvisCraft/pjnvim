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
          { name = "emoji"; }
          { name = "fish"; }
          { name = "latex_symbols"; }
          { name = "crates"; }
          { name = "nvim_lua"; }
        ];
        window = {
          completion.border = "rounded";
          documentation.border = "rounded";
        };
        mapping = {
          # Basics
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = false })";
          # Completion choice and snippet argument jumps
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<Tab>" = ''
            cmp.mapping(
                function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        local luasnip = require('luasnip')
                        if luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end
                end,
                {'i', 's'}
            )
          '';
          "<S-Tab>" = ''
            cmp.mapping(
                function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        local luasnip = require('luasnip')
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end
                end,
                {'i', 's'}
            )
          '';
          # Docs navigation
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          # Close
          "<Esc>" = "cmp.mapping.abort()";
          "<C-e>" = "cmp.mapping.close()";
        };
        snippet.expand = "luasnip";
        experimental.ghost_text = true;
      };
      filetype =
        let
          texSources = [
            { name = "buffer"; }
            { name = "async_path"; }
            { name = "luasnip"; }
            { name = "vimtex"; }
            {
              name = "latex_symbols";
              option.strategy = 2;
            }
          ];
        in
        {
          tex.sources = texSources;
          latex.sources = texSources;
          gitcommit.sources = [
            { name = "buffer"; }
            { name = "async_path"; }
            { name = "conventionalcommits"; }
          ];
        };
    };
    lspkind.enable = true;
  };
}

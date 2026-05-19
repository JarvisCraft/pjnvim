{ lib, ... }:
{
  lsp = {
    inlayHints.enable = true;
    keymaps = [
      {
        key = "[d";
        action = lib.nixvim.mkRaw "function() vim.diagnostic.goto_prev() end";
        options = {
          silent = true;
          desc = "Go to the previous diagnostic";
        };
      }
      {
        key = "]d";
        action = lib.nixvim.mkRaw "function() vim.diagnostic.goto_next() end";
        options = {
          silent = true;
          desc = "Go to the next diagnostic";
        };
      }
      {
        key = "<leader>e";
        action = lib.nixvim.mkRaw "function() vim.diagnostic.open_float() end";
        options = {
          silent = true;
          desc = "Show line diagnostics";
        };
      }
      {
        key = "<leader>ca";
        lspBufAction = "code_action";
        options = {
          silent = true;
          desc = "Code Actions";
        };
      }

      {
        key = "<leader>cf";
        lspBufAction = "format";
        options = {
          silent = true;
          desc = "Format";
        };
      }
      {
        key = "gd";
        lspBufAction = "definition";
        options = {
          silent = true;
          desc = "Goto definition (assignment)";
        };
      }
      {
        key = "gD";
        lspBufAction = "declaration";
        options = {
          silent = true;
          desc = "Goto declaration (first occurrence)";
        };
      }
      {
        key = "gR";
        lspBufAction = "references";
        options = {
          silent = true;
          desc = "Goto references";
        };
      }
      {
        key = "gt";
        lspBufAction = "type_definition";
        options = {
          silent = true;
          desc = "Goto Type Definition";
        };
      }
      {
        key = "gi";
        lspBufAction = "implementation";
        options = {
          silent = true;
          desc = "Goto Implementation";
        };
      }
      {
        key = "K";
        lspBufAction = "hover";
        options = {
          silent = true;
          desc = "Hover";
        };
      }
      {
        key = "<leader>ls";
        lspBufAction = "signature_help";
        options = {
          silent = true;
          desc = "Signature Help";
        };
      }
    ];
  };

  keymaps = [
    {
      key = "<leader>xx";
      action = "<cmd>Trouble diagnostics toggle<CR>";
      options.desc = "Toggle diagnostics (Trouble)";
    }
    {
      key = "<leader>xw";
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<CR>";
      options.desc = "Toggle workspace diagnostics";
    }
    {
      key = "<leader>xq";
      action = "<cmd>Trouble qflist toggle<CR>";
      options.desc = "Toggle quickfix list";
    }
    {
      key = "<leader>xl";
      action = "<cmd>Trouble loclist toggle<CR>";
      options.desc = "Toggle location list";
    }
  ];

  plugins = {
    lsp.enable = true;
    trouble.enable = true;
  };
}

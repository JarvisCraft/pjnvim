{
  # Languages
  plugins = {
    lsp = {
      enable = true;
      servers = {
        lua_ls.enable = true;
        clangd.enable = true;
        html.enable = true;
        jsonls.enable = true;
        jsonnet_ls.enable = true;
        nil_ls.enable = true;
        pest_ls.enable = true;
      };
      inlayHints = true;
      keymaps = {
        silent = true;
        diagnostic = {
          "[d" = {
            action = "goto_prev";
            desc = "Go to the previous diagnostic";
          };
          "]d" = {
            action = "goto_next";
            desc = "Go to the next diagnostic";
          };
          "<leader>e" = {
            action = "open_float";
            desc = "Show line diagnostics";
          };
        };
        lspBuf = {
          "<leader>ca" = {
            action = "code_action";
            desc = "Code Actions";
          };
          "<leader>rn" = {
            action = "rename";
            desc = "Rename Symbol";
          };
          "<leader>cf" = {
            action = "format";
            desc = "Format";
          };
          "gd" = {
            action = "definition";
            desc = "Goto definition (assignment)";
          };
          "gD" = {
            action = "declaration";
            desc = "Goto declaration (first occurrence)";
          };
          "gR" = {
            action = "references";
            desc = "Goto references";
          };
          "gt" = {
            action = "type_definition";
            desc = "Goto Type Defition";
          };
          "gi" = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          "k" = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>ls" = {
            action = "signature_help";
            desc = "Signature Help";
          };
        };
      };
    };
    trouble.enable = true;
  };
}

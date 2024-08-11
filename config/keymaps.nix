{
  keymaps = [{
    key = "<leader>th";
    action = "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>";
    options.desc = "Toggle Inlay Hints";
  }];
}

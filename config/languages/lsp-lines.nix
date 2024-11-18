{
  plugins.lsp-lines.enable = true;
  keymaps = [{
    key = "<leader>tl";
    action = ''<cmd>lua require("lsp_lines").toggle()<CR>'';
    options.desc = "Toggle LSP lines";
  }];
}

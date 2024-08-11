{ pkgs, ... }: {
  opts = {
    # Mouse
    mouse = "a";
    cursorline = true;
    mousemoveevent = true;

    # Numbering
    number = true;
    relativenumber = true;
    signcolumn = "yes";

    # Tabulation
    tabstop = 4;
    softtabstop = 4;
    showtabline = 2;
    expandtab = true;

    # Indentaion
    smartindent = true;
    smarttab = true;
    shiftwidth = 4;

    # Wrapping
    wrap = true;
    linebreak = true;

    # Commands
    timeout = true;
    timeoutlen = 300;

    # Persistence
    swapfile = false;
    undofile = true;

    # Splitting
    splitbelow = true;
    splitright = true;

    # Terminal
    shell = "${pkgs.fish}/bin/fish";

    # Rendering
    updatetime = 50;
    termguicolors = true;

    # Folding
    foldcolumn = "1";
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;

    # Miscellaneous
    scrolloff = 8;
  };
}

{ pkgs, ... }: {
  plugins = {
    vimtex = {
      enable = true;
      settings = {
        view_enabled = true;
        view_automatic = true;
        view_method = "zathura";
        format_enabled = true;
        fold_enabled = true;
      };
      # texlivePackage = pkgs.texlive.combined.scheme-full;
      texlivePackage = pkgs.texliveFull;
    };
    ltex-extra.enable = true;
  };
}

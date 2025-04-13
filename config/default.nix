{ ... }:
{
  imports = [
    ./lazy
    ./options.nix
    ./keymaps.nix
    ./performance.nix
    ./util
    ./colorscheme.nix
    ./diagnostics

    ./direnv
    ./languages

    ./completions
    ./snippets

    ./formatting

    ./terminal
    ./ui
    ./git
    ./telescope
    ./wilder
    # ./database
  ];

  clipboard.providers.wl-copy.enable = true;

  plugins = {
    # auto-session.enable = true;
    # lastplace.enable = true;

    # Visuals

    fidget = {
      enable = true;
      settings.progress = {
        suppress_on_insert = true;
        ignore_done_already = true;
      };
    };
  };
}

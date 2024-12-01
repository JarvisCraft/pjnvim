{ ... }:
{
  vimAlias = true;
  viAlias = true;

  imports = [
    ./options.nix
    ./keymaps.nix
    # ./performance.nix
    ./util
    ./colorscheme.nix

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
      progress = {
        suppressOnInsert = true;
        ignoreDoneAlready = true;
        pollRate = 0.5;
      };
    };
  };
}

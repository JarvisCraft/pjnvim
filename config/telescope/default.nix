{ pkgs, lib, ... }:
{
  plugins.telescope = {
    enable = true;
    extensions = {
      ui-select = {
        enable = true;
        settings = lib.nixvim.mkRaw "require('telescope.themes').get_cursor {}";
      };
      fzf-native.enable = true;
      media-files.enable = true;
      undo.enable = true;
    };
    settings.pickers.colorscheme.enable_preview = true;

    keymaps = {
      "<leader>ff" = {
        action = "find_files";
        options.desc = "Telescope Files";
      };
      "<leader>fg" = {
        action = "git_files";
        options.desc = "Telescope Git Files";
      };
      "<leader>fw" = {
        action = "live_grep";
        options.desc = "Telescope Live Grep";
      };
      "<leader>fd" = {
        action = "diagnostics";
        options.desc = "Telescope Diagnostics";
      };
      "<leader>fm" = {
        action = "media_files";
        options.desc = "Telescope Media Files";
      };
      "<leader>fr" = {
        action = "resume";
        options.desc = "Telescope Resume";
      };
      "<leader>ft" = {
        action = "colorscheme";
        options.desc = "Telescope Colorscheme";
      };
      "<leader>fc" = {
        action = "command_history";
        options.desc = "Telescope Command History";
      };
      "<leader>fb" = {
        action = "buffers";
        options.desc = "Telescope Buffers";
      };
      "<leader>fo" = {
        action = "oldfiles";
        options.desc = "Telescope Recent Files";
      };
      # Docs
      "<leader>fM" = {
        action = "man_pages";
        options.desc = "Telescope Man Pages";
      };
      "<leader>fH" = {
        action = "help_tags";
        options.desc = "Telescope Help Pages";
      };
      "<leader>fC" = {
        action = "commands";
        options.desc = "Telescope Commands";
      };
      "<leader>fV" = {
        action = "vim_options";
        options.desc = "Telescope Vim Options";
      };
      "<leader>fA" = {
        action = "autocommands";
        options.desc = "Telescope Autocommands";
      };
    };
  };
  dependencies = {
    chafa.enable = true;
    imagemagick.enable = true;
    ffmpegthumbnailer.enable = true;
    poppler-utils.enable = true;
    epub-thumbnailer.enable = pkgs.stdenv.isLinux;
    fontpreview.enable = pkgs.stdenv.isLinux;
  };
}

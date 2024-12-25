{ ... }:

# https://github.com/cantino/mcfly
{
  programs = {
    mcfly = {
      # ~/Code/github/Dietr1ch/home-manager/modules/programs/mcfly.nix
      enable = true;

      settings = {
        # colors = {
        #   menubar = {
        #     bg = "black";
        #     fg = "red";
        #   };
        #   darkmode = {
        #     prompt = "cyan";
        #     timing = "yellow";
        #     results_selection_fg = "cyan";
        #     results_selection_bg = "black";
        #     results_selection_hl = "red";
        #   };
        # };
      };  # ..programs.mcfly.settings

      keyScheme = "vim";
      fzf = {
        enable = true;
      };
      fuzzySearchFactor = 2;
    };  # ..programs.mcfly
  };  # ..programs
}

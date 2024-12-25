{ ... }:

# https://github.com/cantino/mcfly
{
  programs = {
    mcfly = {
      # ~/Code/github/Dietr1ch/home-manager/modules/programs/mcfly.nix
      enable = true;

      keyScheme = "vim";
      fzf = {
        enable = true;
      };
      fuzzySearchFactor = 2;
    };  # ..programs.mcfly
  };  # ..programs
}

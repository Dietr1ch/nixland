{ pkgs, ... }:

{
  programs = {
    carapace = {
      # ~/Code/github/Dietr1ch/home-manager/modules/programs/carapace.nix
      # https://github.com/carapace-sh/carapace-bin/
      enable = true;
    };  # ..programs.carapace
  };  # ..programs
}

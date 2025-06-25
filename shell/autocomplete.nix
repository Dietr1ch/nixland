{ ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.carapace
    carapace = {
      # ~/Code/github/Dietr1ch/home-manager/modules/programs/carapace.nix
      # https://github.com/carapace-sh/carapace-bin/
      enable = true;

      enableFishIntegration = true;
      enableNushellIntegration = true;
    }; # ..programs.carapace
  }; # ..programs
}

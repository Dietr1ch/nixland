{ pkgs, ... }:

{
  # programs = {
  #   librewolf = {
  #     enable = true;
  #     # package = pkgs.librewolf-wayland;
  #   };  # ..programs.librewolf
  # };  # ..programs

  home = {
    packages = with pkgs; [
      librewolf-wayland

      kdePackages.plasma-browser-integration
    ]; # ..home.packages
  }; # ..home
}

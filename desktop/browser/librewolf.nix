{ pkgs, ... }:

{
  programs = {
    librewolf = {
      enable = true;

      package = pkgs.librewolf-wayland;

      # https://librewolf.net/docs/settings/
      # settings = {
      #   # "webgl.disabled" = false;
      #   # "privacy.resistFingerprinting.letterboxing" = true;
      #   # "privacy.resistFingerprinting" = false;
      # };
    }; # ..programs.librewolf
  }; # ..programs

  home = {
    packages = with pkgs; [
      librewolf-wayland

      kdePackages.plasma-browser-integration
    ]; # ..home.packages
  }; # ..home
}

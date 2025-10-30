{ pkgs, ... }:

{
  programs = {
    librewolf = {
      enable = true;

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
      kdePackages.plasma-browser-integration
    ]; # ..home.packages
  }; # ..home
}

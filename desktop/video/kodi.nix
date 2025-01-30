{ pkgs, ... }:

{
  programs = {
    kodi = {
      # https://home-manager-options.extranix.com/?release=master&query=kodi
      # ~/Code/github/Dietr1ch/home-manager/modules/programs/kodi.nix
      enable = true;

      package = pkgs.kodi-wayland;
    };  # ..programs.kodi
  };
}

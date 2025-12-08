{ pkgs, ... }:

{
  programs = {
    kodi = {
      # https://home-manager-options.extranix.com/?release=master&query=kodi
      # ~/Projects/home-manager/modules/programs/kodi.nix
      enable = true;

      package = pkgs.kodi-wayland;
    }; # ..programs.kodi
  };
}

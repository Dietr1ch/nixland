{ pkgs, ... }:

{
  imports = [ ./kodi.nix ];

  home = {
    packages = with pkgs; [
      vlc
    ];
  };
}

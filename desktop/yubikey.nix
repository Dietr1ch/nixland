{ pkgs, ... }:

# https://nixos.wiki/wiki/Yubikey
{
  home = {
    packages = with pkgs; [
      yubikey-manager
      yubikey-manager-qt
      yubikey-personalization
      yubikey-personalization-gui
    ];
  };
}

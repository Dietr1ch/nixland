{ pkgs, ... }:

# https://nixos.wiki/wiki/Yubikey
{
  home = {
    packages = with pkgs; [
      yubikey-manager
      yubioath-flutter
    ];
  };
}

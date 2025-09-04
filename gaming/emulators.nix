{ pkgs, ... }:

# https://wiki.nixos.org/wiki/RetroArch
{
  home = {
    packages = with pkgs; [
      # BROKEN: emulationstation-de  # error: Package ‘freeimage-3.18.0-unstable-2024-04-18’ in /nix/store/8ly89qdcjh6pb5xamvq4vrzqnifwshn3-source/pkgs/by-name/fr/freeimage/package.nix:114 is marked as insecure, refusing to evaluate.

      retroarch
      retroarch-joypad-autoconfig

      libretro.beetle-gba
      libretro.beetle-psx-hw
      libretro.desmume
      libretro.dolphin
      libretro.snes9x
    ];
  };
}

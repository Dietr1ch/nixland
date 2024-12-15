{ pkgs, ... }:

# https://wiki.nixos.org/wiki/RetroArch
{
  home = {
    packages = with pkgs; [
      emulationstation-de

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

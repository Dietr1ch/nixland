{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # Emulators
      dolphinEmu

      # Retro Arch
      retroarch
      libretro.desmume
      libretro.dolphin
      libretro.beetle-psx-hw
      libretro.beetle-snes
      libretro.beetle-gba
    ];
  };
}

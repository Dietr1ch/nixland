{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      lutris

      wine
      winetricks
      # 32-bit support
      # support both 32- and 64-bit applications
      # wineWowPackages.stable
      # wine-staging (version with experimental features)
      # wineWowPackages.staging
      wineWowPackages.waylandFull # (Unstable)
    ];
  };
}

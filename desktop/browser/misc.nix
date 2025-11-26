{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      lynx

      vdhcoapp
      yt-dlp
    ];
  };
}

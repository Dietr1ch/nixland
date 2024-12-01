{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      vdhcoapp
      yt-dlp
    ];
  };
}

{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      ffmpeg
      flacon
      shntool
      sox

      # BROKEN: k3b
    ];
  };
}

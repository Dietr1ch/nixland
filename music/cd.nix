{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      flacon

      ffmpeg
      shntool
      sox

      # BROKEN: k3b
    ];
  };
}

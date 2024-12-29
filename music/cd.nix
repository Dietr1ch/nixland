{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # TODO: Add `flacon`
      # flacon

      ffmpeg
      shntool
      sox

      # BROKEN: k3b
    ];
  };
}

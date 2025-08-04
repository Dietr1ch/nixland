{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      stockfish
      uchess
      gnuchess
      # BROKEN: en-croissant
      chessdb
    ];
  };
}

{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      stockfish
      uchess
      gnuchess
      en-croissant
      chessdb
    ];
  };
}

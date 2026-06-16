{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/gaming/chess.nix
    packages = with pkgs; [
      stockfish
      uchess
      gnuchess
      # BROKEN: en-croissant
      chessdb
    ];
  };
}

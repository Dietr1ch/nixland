{ pkgs, lib, ... }:

{
  # Partially mirrors ~/Projects/systemn/desktop/shell/spelling.nix
  home = {
    sessionVariables = {
      DICTIONARY = lib.mkDefault "en_AU";
      DICPATH = lib.mkDefault "${pkgs.hunspell}/bin/hunspell";
    };

    packages = with pkgs; [
      ispell

      hunspell
      hunspellDicts.en_AU-large

      harper
    ];
  };
}

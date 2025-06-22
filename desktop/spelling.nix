{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      ispell

      hunspell
      hunspellDicts.en_GB-large

      harper
    ];
  };
}

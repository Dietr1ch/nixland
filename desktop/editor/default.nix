{ lib, pkgs, ... }:

{
  imports = [
    ./emacs.nix
    ./helix.nix
  ];

  home = {
    sessionVariables = {
      DICTIONARY = lib.mkDefault "en_GB";
      DICPATH = lib.mkDefault "${pkgs.hunspell}/bin/hunspell";
    };

    packages = with pkgs; [
      hunspell
      hunspellDicts.en_GB-large
    ];
  };
}

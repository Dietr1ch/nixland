{ pkgs, ... }:

{
  imports = [
    ./emacs.nix
    ./helix.nix
  ];

  home = {
    sessionVariables = {
      DICTIONARY = "en_GB";
    };

    packages = with pkgs; [ hunspell ];
  };
}

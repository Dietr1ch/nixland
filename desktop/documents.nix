{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      libreoffice-fresh
      okular

      pandoc
    ];
  };
}

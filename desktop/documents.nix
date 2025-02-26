{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      libreoffice-fresh
      kdePackages.okular

      pandoc
    ];
  };
}

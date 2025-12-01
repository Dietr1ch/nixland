{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      flacon
      shntool
      sox

      kdePackages.k3b
    ];
  };
}

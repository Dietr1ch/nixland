{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      vokoscreen-ng
      kdePackages.spectacle
    ];
  };
}

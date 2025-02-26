{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      vokoscreen
      kdePackages.spectacle
    ];
  };
}

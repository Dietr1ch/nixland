{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      vokoscreen
      spectacle
    ];
  };
}

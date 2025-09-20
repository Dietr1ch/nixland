{ pkgs, ... }:

# https://nixos.wiki/wiki/C
{
  home = {
    packages = with pkgs; [
      gcc
    ]; # ..home.packages
  }; # ..home

}

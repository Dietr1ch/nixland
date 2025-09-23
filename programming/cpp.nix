{ pkgs, ... }:

# https://nixos.wiki/wiki/C
{
  home = {
    packages = with pkgs; [
      gcc
      gdb
    ]; # ..home.packages
  }; # ..home

}

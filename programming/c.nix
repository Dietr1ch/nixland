{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      gcc
      gdb
    ]; # ..home.packages
  }; # ..home

}

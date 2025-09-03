{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      gcc
    ]; # ..home.packages
  }; # ..home

}

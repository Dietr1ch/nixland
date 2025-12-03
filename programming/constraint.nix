{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      z3
    ]; # ..home.packages
  }; # ..home
}

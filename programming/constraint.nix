{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      z3

      python313Packages.z3
    ]; # ..home.packages
  }; # ..home
}

{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      z3

      python313Packages.z3-solver
    ]; # ..home.packages
  }; # ..home
}

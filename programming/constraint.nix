{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      clang
      z3

      python313Packages.z3
    ]; # ..home.packages
  }; # ..home
}

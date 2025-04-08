{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      gnumake
      just
    ]; # ..home.packages
  }; # ..home

}

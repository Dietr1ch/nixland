{ pkgs, ... }:

# https://wiki.nixos.org/wiki/Devenv
{
  home = {
    packages = with pkgs; [
      devenv
    ]; # ..home.packages
  }; # ..home
}

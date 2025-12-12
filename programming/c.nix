{ pkgs, ... }:

# https://nixos.wiki/wiki/C
{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/c.nix
    packages = with pkgs; [
      gcc
    ]; # ..home.packages
  }; # ..home

}

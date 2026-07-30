{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/config/taplo.nix
    packages = with pkgs; [
      taplo
    ]; # ..home.packages
  }; # ..home
}

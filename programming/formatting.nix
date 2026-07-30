{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/formatting.nix
    packages = with pkgs; [
      treefmt
    ]; # ..home.packages
  }; # ..home

}

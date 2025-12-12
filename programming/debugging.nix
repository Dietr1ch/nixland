{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/debugging.nix
    packages = with pkgs; [
      gdb
    ]; # ..home.packages
  }; # ..home

}

{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/zig.nix
    packages = with pkgs; [
      zig

      zls
      zig-zlint
    ]; # ..home.packages
  }; # ..home

}

{ pkgs, ... }:

# https://nixos.wiki/wiki/C
{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/cpp.nix
    packages = with pkgs; [
      gcc

      clang-tools
    ]; # ..home.packages
  }; # ..home

}

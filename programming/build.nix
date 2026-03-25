{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/build.nix
    packages = with pkgs; [
      pkg-config
      gnumake
      just
      just-lsp

      binutils
      lld
      mold
    ]; # ..home.packages
  }; # ..home

}

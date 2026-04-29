{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/config/dhall.nix
    packages = with pkgs; [
      dhall
      dhall-lsp-server
      dhall-json
    ]; # ..home.packages
  }; # ..home
}

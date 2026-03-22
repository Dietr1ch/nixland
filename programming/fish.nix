{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/fish.nix
    packages = with pkgs; [
      fish-lsp
    ]; # ..home.packages
  }; # ..home
}

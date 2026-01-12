{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/grammars.nix
    packages = with pkgs; [
      tree-sitter
    ]; # ..home.packages
  }; # ..home
}

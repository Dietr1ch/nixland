{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      fish-lsp
    ]; # ..home.packages
  }; # ..home
}

{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/nix.nix
    packages = with pkgs; [
      # LSP
      nixd

      nix-diff

      nixfmt

      nixpkgs-review
    ]; # ..home.packages
  }; # ..home
}

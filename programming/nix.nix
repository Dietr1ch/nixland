{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/nix.nix
    packages = with pkgs; [
      # LSP
      nixd

      nix-diff

      # NOTE nixfmt still points to nixfmt-classic
      nixfmt-rfc-style

      nixpkgs-review
    ]; # ..home.packages
  }; # ..home
}

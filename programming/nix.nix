{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # LSP
      nixd
      # nil

      # NOTE nixfmt still points to nixfmt-classic
      nixfmt-rfc-style

      nixpkgs-review
    ]; # ..home.packages
  }; # ..home
}

{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # LSP
      nixd
      # nil

      nixpkgs-fmt
      nixpkgs-review
    ];  # ..home.packages
  };  # ..home
}

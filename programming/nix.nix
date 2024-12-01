{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # LSP
      nixd
      # nil

      nixpkgs-fmt
    ];  # ..home.packages
  };  # ..home
}

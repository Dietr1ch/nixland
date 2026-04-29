{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/config/nix.nix
    packages = with pkgs; [
      # Formatting
      nixpkgs-fmt

      # LSP
      vscode-langservers-extracted
    ]; # ..home.packages
  }; # ..home

}

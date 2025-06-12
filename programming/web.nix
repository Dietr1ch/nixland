{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      emmet-ls

      vscode-langservers-extracted
      prettier
    ]; # ..home.packages
  }; # ..home
}

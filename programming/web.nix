{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      emmet-ls

      vscode-langservers-extracted
    ]; # ..home.packages
  }; # ..home
}

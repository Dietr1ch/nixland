{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/web.nix
    packages = with pkgs; [
      emmet-ls

      vscode-langservers-extracted
      prettier

      wasm-pack
    ]; # ..home.packages
  }; # ..home
}

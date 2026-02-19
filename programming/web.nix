{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/web.nix
    packages = with pkgs; [
      static-web-server

      emmet-ls
      htmx-lsp2

      typescript
      typescript-language-server

      vscode-langservers-extracted
      prettier

      wasm-pack
      wasm-bindgen-cli
    ]; # ..home.packages
  }; # ..home
}

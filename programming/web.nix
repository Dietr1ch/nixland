{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/web.nix
    packages = with pkgs; [
      # Servers
      static-web-server

      # Formatters
      prettier

      # Optimisers
      closurecompiler
      subfont

      # Language servers
      htmx-lsp2
      vscode-langservers-extracted

      # Tools
      xh
      wasm-pack
      wasm-bindgen-cli
      oha
    ]; # ..home.packages
  }; # ..home
}

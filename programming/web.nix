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
      emmet-ls
      htmx-lsp2
      vscode-langservers-extracted

      # Tools
      wasm-pack
      wasm-bindgen-cli
    ]; # ..home.packages
  }; # ..home
}

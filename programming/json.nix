{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # Formatting
      nixpkgs-fmt

      # LSP
      vscode-langservers-extracted
    ]; # ..home.packages
  }; # ..home

  programs = {
    jq = {
      # ~/Projects/home-manager/modules/programs/jq.nix
      # https://github.com/jqlang/jq
      enable = true;
    };
  };
}

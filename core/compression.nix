{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # Extract
      kdePackages.ark

      # In sync with ~/Projects/systemn/system/files/compression.nix
      arj
      brotli
      lbzip2
      lrzip
      pbzip2
      pigz
      pixz
      unzip
      xz
      zip
    ];
  };
}

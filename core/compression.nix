{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # Extract
      kdePackages.ark
      brotli
      lbzip2
      xz

      zip
      unzip
    ];
  };
}

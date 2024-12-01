{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # Extract
      ark
      brotli
      lbzip2
      xz

      zip
      unzip
    ];
  };
}

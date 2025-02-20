{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      ghc
    ];  # ..home.packages
  };  # ..home

}

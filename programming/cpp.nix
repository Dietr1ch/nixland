{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      gcc

      clang
      clang-analyzer
    ]; # ..home.packages
  }; # ..home

}

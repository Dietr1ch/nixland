{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      online-judge-template-generator
      online-judge-tools
      online-judge-verify-helper
    ]; # ..home.packages
  }; # ..home

}

{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      clingo
      clingcon
    ];
  }; # ..home

}

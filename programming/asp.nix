{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/asp.nix
    packages = with pkgs; [
      clingo
      clingcon
    ];
  }; # ..home

}

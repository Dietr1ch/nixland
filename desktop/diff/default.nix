{ pkgs, ... }:

{
  imports = [ ./meld.nix ];

  programs = {
    git = {
      difftastic = {
        enable = true;
        background = "dark";
      };
    }; # ..programs.git
  }; # ..programs

  home = {
    packages = with pkgs; [ diffsitter ];
  }; # ..home
}

{ pkgs, ... }:

{
  imports = [ ./meld.nix ];

  programs = {
    difftastic = {
      enable = true;
      options = {
        background = "dark";
      };

      git = {
        enable = true;
      };
    }; # ..programs.difftastic
  }; # ..programs

  home = {
    packages = with pkgs; [ diffsitter ];
  }; # ..home
}

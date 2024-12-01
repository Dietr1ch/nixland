{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      desktop-file-utils  # Utils for *.desktop files
    ];
  };
}

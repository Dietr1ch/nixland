{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [ zeal-qt6 ];
  };
}

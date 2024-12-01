{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      pgadmin
    ];
  };
}

{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      vmpk
    ];
  };
}

{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      vmpk
      qpwgraph
    ];
  };
}

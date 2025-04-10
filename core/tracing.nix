{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      lttng-tools
      lttng-ust
    ];
  };
}

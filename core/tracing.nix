{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # BROKEN: lttng-tools
      # BROKEN: lttng-ust
    ];
  };
}

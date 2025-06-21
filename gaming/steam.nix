{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      steam
      # steam-run
      # steamcmd
    ];

    sessionVariables = {
      "PROTON_ENABLE_WAYLAND" = "1";
    };
  };
}

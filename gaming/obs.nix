{ pkgs, ... }:

{
  programs = {
    obs-studio = {
      enable = true;
      plugins = with pkgs; [
        # obs-studio-plugins.obs-ndi
      ];
    };
  };

  home = {
    sessionVariables = {
      "OBS_VKCAPTURE" = "1";
    };
  };
}

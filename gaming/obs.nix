{ pkgs, ... }:

{
  programs = {
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        # BROKEN: distroav # NDI-6 is broken
        input-overlay
        obs-advanced-masks
        obs-backgroundremoval
        obs-pipewire-audio-capture
        obs-source-switcher
        obs-vkcapture
        wlrobs
      ];
    };
  };

  home = {
    sessionVariables = {
      "OBS_VKCAPTURE" = "1";
    };
  };
}

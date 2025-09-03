{ pkgs, ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.obs-studio
    obs-studio = {
      enable = true;

      plugins = with pkgs.obs-studio-plugins; [
        # BROKEN: distroav # NDI-6 is broken
        input-overlay
        obs-advanced-masks
        obs-backgroundremoval
        obs-gstreamer
        obs-pipewire-audio-capture
        obs-source-switcher
        obs-vaapi # optional AMD hardware acceleration
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

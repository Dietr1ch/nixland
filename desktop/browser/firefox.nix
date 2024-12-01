{ pkgs, ... }:

{
  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox-wayland;

      profiles = {

        # "Dietrich-nix" = {
        #   settings = {
        #     "widget.use-xdg-desktop-portal.file-picker" = 1;
        #   };

        #   # https://nur.nix-community.org/repos/rycee/
        #   extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        #     vimium
        #     sidebery
        #     org-capture
        #     form-history-control

        #     ublock-origin
        #     privacy-badger
        #     https-everywhere
        #     clearurls
        #     decentraleyes
        #     ghostery
        #     privacy-redirect
        #     privacy-badger
        #     # languagetool
        #     # disconnect

        #     tampermonkey
        #     playback-speed
        #     ublacklist
        #     sponsorblock
        #     video-downloadhelper
        #   ];
        # };

      };
    };  # ..programs.firefox
  };  # ..programs

  home = {
    sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
      MOZ_USE_XINPUT2 = "1";
    };
  };
}

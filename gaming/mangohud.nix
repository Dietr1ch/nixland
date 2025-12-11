{ ... }:

{
  programs = {
    # ~/Projects/home-manager/modules/programs/mangohud.nix
    mangohud = {
      enable = true;

      enableSessionWide = false;

      settingsPerApplication = {
        # ~/.config/MangoHud/mpv.conf
        "mpv" = {
          no_display = true;
        };
      };
    };
  };
}

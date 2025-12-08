{ ... }:

{
  programs = {
    # ~/Projects/home-manager/modules/programs/mangohud.nix
    mangohud = {
      enable = true;

      enableSessionWide = false;

      # ~/.config/MangoHud/MangoHud.conf
      # https://github.com/flightlessmango/MangoHud/blob/master/data/MangoHud.conf
      settings = {
        output_folder = "/tmp/mangohud/";
      };

      settingsPerApplication = {
        # ~/.config/MangoHud/mpv.conf
        "mpv" = {
          no_display = true;
        };
      };
    };
  };
}

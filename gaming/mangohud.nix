{ ... }:

{
  programs = {
    # ~/Code/github/Dietr1ch/home-manager/modules/programs/mangohud.nix
    mangohud = {
      enable = true;

      enableSessionWide = false;

      settings = {
        full = true;
        output_folder = "/tmp/mangohud/";
      };

      # https://github.com/flightlessmango/MangoHud/blob/master/data/MangoHud.conf
      settingsPerApplication = {
        "mpv" = {
          no_display = true;
        };
      };
    };
  };
}

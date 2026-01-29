{ lib, ... }:

{
  services = {
    # https://home-manager-options.extranix.com/?release=master&query=services.syncthing
    syncthing = {
      enable = true;

      # https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html#Specifiers
      guiAddress = lib.mkDefault "%t/%N.socket";

      # https://home-manager-options.extranix.com/?release=master&query=services.syncthing.tray
      tray = {
        enable = true;
      };
    };
  };
}

{ ... }:

{
  services = {
    # https://home-manager-options.extranix.com/?release=master&query=services.syncthing
    syncthing = {
      enable = true;

      # https://www.freedesktop.org/software/systemd/man/latest/systemd.unit.html#Specifiers
      guiAddress = "%t/%N.socket";
    };
  };
}

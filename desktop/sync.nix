{ ... }:

{
  services = {
    # https://home-manager-options.extranix.com/?release=master&query=services.syncthing
    syncthing = {
      enable = true;
      tray = {
        enable = true;
      };
    };
  };
}

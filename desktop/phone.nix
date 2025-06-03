{ ... }:

{
  # https://home-manager-options.extranix.com/?release=master&query=services.kdeconnect
  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };
  };
}

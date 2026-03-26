{
  config,
  pkgs,
  lib,
  ...
}:

{
  home = {
    # In Sync with ~/Projects/systemn/desktop/gaming/comms.nix
    packages = with pkgs; [
      revolt-desktop
      vesktop
    ];
  }; # ..home

  services = {
    # https://home-manager-options.extranix.com/?release=master&query=mpd-discord-rpc
    mpd-discord-rpc = {
      enable = lib.mkDefault config.services.mpd.enable;

      settings = {
        hosts = [
          "localhost:${toString config.services.mpd.network.port}"
        ];
        format = {
          details = "$title";
          state = "On $album by $artist";
        };
      };
    }; # ..services.mpd-discord-rpc
  }; # ..services
}

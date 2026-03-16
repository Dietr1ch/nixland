{ lib, ... }:

{
  services = {
    # https://home-manager-options.extranix.com/?release=master&query=services.home-manager
    home-manager = {
      autoUpgrade = {
        enable = true;

        useFlake = true;
        # flakeDir	= "${config.xdg.configHome}/home-manager"
        frequency = "weekly";
      }; # ..services.home-manager.autoUpgrade

      autoExpire = {
        enable = true;

        frequency = lib.mkDefault "monthly";
        store = {
          cleanup = lib.mkDefault true;
          # options = builtins.concatStringsSep " " [
          #   "--delete-older-than 30d"
          # ];
        };
        timestame = "-30 days";
      }; # ..services.home-manager.autoExpire
    }; # ..services.home-manager
  }; # ..services
}

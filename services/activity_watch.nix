{ pkgs, ... }:

{
  services = {
    activitywatch = {
      enable = true;

      package = pkgs.aw-server-rust;

      watchers = {

        "aw-watcher-window" = {
          package = pkgs.activitywatch;
          settings = {
            poll_time = 1;
            exclude_title = true;
          };
        };

        "aw-watcher-afk" = {
          package = pkgs.activitywatch;
          settings = {
            timeout = 300; # 5m
            poll_time = 5; # 5s
          };
        };

      }; # ..services.activitywatch.watchers

    }; # ..services.activitywatch
  }; # ..services
}

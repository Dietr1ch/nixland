{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      cantata
      mpdas
    ];
  };

  programs = {
    # https://github.com/nix-community/home-manager/blob/master/modules/programs/ncmpcpp.nix
    ncmpcpp = {
      enable = true;

      settings = {
        follow_now_playing_lyrics = "yes";
        enable_window_title = "no";
      };

      bindings = [
        # https://gist.github.com/Soft/959188/1ffff2f3360b651c74bb9b7b5c6d854ab71b7d08
        { key = "up"; command = "volume_up"; }
        { key = "down"; command = "volume_down"; }

        { key = "j"; command = "scroll_down"; }
        { key = "k"; command = "scroll_up"; }
        { key = "J"; command = [ "select_item" "scroll_down" ]; }
        { key = "K"; command = [ "select_item" "scroll_up" ]; }
        { key = "ctrl-u"; command = [ "page_up" ]; }
        { key = "ctrl-d"; command = [ "page_down" ]; }

        { key = "n"; command = [ "next_found_item" ]; }
        { key = "N"; command = [ "previous_found_item" ]; }

        { key = "."; command = [ "show_lyrics" ]; }
      ];
    };
  };

  services = {
    # ~/Code/github/Dietr1ch/home-manager/modules/services/mpd.nix
    mpd = {
      enable = true;

      network = {
        listenAddress = "any";
      };
    };  # ..services.mpd

    # ~/Code/github/Dietr1ch/home-manager/modules/services/mpdris2.nix
    mpdris2 = {
      enable = true;

      multimediaKeys = true;
      notifications = true;
    };  # ..services.mpdris2
  };  # ..services

  systemd = {
    user = {
      services = {
        mpdas = {
          Unit = {
            Description = "MPD Auto Scrobbler";
            After = [ "mpd.service" ];
          };
          Install = {
            WantedBy = [ "default.target" ];
          };
          Service = {
            ExecStart = "${pkgs.mpdas}/bin/mpdas";
            Restart = "on-failure";
            RestartSec = "5s";
            Type = "simple";
          };
        };
      };
    };
  };
}

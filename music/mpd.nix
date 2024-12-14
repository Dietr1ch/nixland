{ config, pkgs, ... }:

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
    # ~/Code/github/Dietr1ch/nixpkgs/pkgs/servers/mpd/default.nix
    mpd = {
      enable = true;

      network = {
        listenAddress = "any";
      };

      # https://github.com/MusicPlayerDaemon/MPD/tree/master/doc/mpdconf.example
      # https://wiki.archlinux.org/title/Music_Player_Daemon#Audio_configuration
      extraConfig = ''
        # extraConfig from ~/Code/github/Dietr1ch/nixland/music/mpd.nix
        audio_output {
          type  "pipewire"
          name  "PipeWire Sound Server"
        }

        zeroconf_enabled  "yes"
        zeroconf_name			"Music Player ${config.home.username}@%h"
      '';
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

{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.beets
    # https://github.com/nix-community/home-manager/blob/master/modules/programs/beets.nix
    beets = {
      enable = true;

      mpdIntegration = {
        host = lib.mkDefault "localhost";
        port = lib.mkDefault config.services.mpd.network.port;
        enableUpdate = true;
        enableStats = true;
      };

      # ~/.config/beets/config.yaml
      settings = {
        # Library
        per_disc_numbering = true;
        original_year = true;

        paths = {
          default = "%the{$albumartist}/$original_year - $album%aunique{}/$disc-$track $title";
          singleton = "Non-Album/$artist/$title";
          comp = "Compilations/$album%aunique{}/$track $title";
        };

        format_item = "$artist / $original_year - $album / $title";
        format_album = "$albumartist / $original_year - $album";
        threaded = true;
        ignore = ".AppleDouble ._* *~ .DS_Store";

        art_filename = "cover";
        fetchart.google_search = true;

        lyrics = {
          auto = true;
          fallback = "No lyrics found";
        };

        ui.color = true;

        # https://docs.beets.io/en/latest/plugins/index.html
        plugins = [
          "bpd"
          "chroma"
          "the"
          "inline"
          "web"
          "fetchart"
          "embedart"
          "lyrics"
          "missing"
          "duplicates"
          "ftintitle"
          "scrub"
          "convert"
          "mbcollection"
          "bandcamp"
          "lastgenre"
          "random"
          # "artistcountry"

          # https://docs.beets.io/en/latest/plugins/fish.html
          "fish"
        ];

        # Plugins
        # -------

        # https://github.com/snejus/beetcamp
        bandcamp = {
          lyrics = true;
          art = true;
          data_source_mismatch_penalty = 0.1;
        };
        # Echonest
        echonest.auto = true;

        # LastGenre
        lastGenre = {
          count = 3;
          min_weight = 35;
        };
        # Embedart
        embedart = {
          auto = true;
          maxwidth = 400;
        };
        mpdstats.rating_mix = 0.95;

        # Convert (https://docs.beets.io/en/latest/plugins/convert.html)
        convert = {
          copy_album_art = true;
          embed = true;
          max_bitrate = 320;
          threads = 8;
          format = "opus";
          formats = {
            opus = {
              command = "${pkgs.ffmpeg}/bin/ffmpeg -i $source -n -c:a libopus -b:a 320k $dest";
              extension = "opus";
            };
          };
        };
      }; # ..programs.beets.settings
    }; # ..programs.beets
  }; # ..programs

  home = {
    packages = with pkgs; [
      cuetools
      ffmpeg
      flac

      python313Packages.beetcamp
    ];
  }; # ..home
}

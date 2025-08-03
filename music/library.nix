{ pkgs, ... }:

{
  programs = {
    beets = {
      enable = true;

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
          "lastgenre"
          "mpdstats"
          "random"
          # "artistcountry"
        ];

        # Plugins
        # -------

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

        # Convert
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
      ffmpeg
      flac
    ];
  }; # ..home
}

{ ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.qutebrowser
    qutebrowser = {
      enable = true;

      # Generates ~/.config/qutebrowser/config.py
      settings = {
        completion = {
          shrink = true;
        };
        url = {
          default_page = "about:blank";
          start_pages = [ "about:blank" ];
        };
        hints = {
          # Dvorak
          chars = "aoeuidhtns";
        };
        tabs = {
          position = "left";
          show = "switching";
          mode_on_change = "normal";
          last_close = "close";
        };
        statusbar = {
          show = "in-mode";
        };

        colors = {
          webpage = {
            darkmode = {
              enabled = true;
            };
            preferred_color_scheme = "dark";
            bg = "gray";
          };
        };
      };

      keyBindings = {
        normal = {
          "e" = "hint";
          "E" = "hint all tab";
          "x" = "tab-close";
          "X" = "tab-close -o";

          "<<" = "navigate prev";
          ">>" = "navigate next";

          ",v" = "spawn mpv {url}";
          ",p" = "spawn --userscript qute-pass";
          ",l" = ''config-cycle spellcheck.languages ["en-GB"] ["en-US"]'';
        };
      };
      searchEngines = {
        "d" = "https://duckduckgo.com/?q={}";
        "g" = "https://www.google.com/search?q={}";
        "w" = "https://en.wikipedia.org/wiki/Special:Search?search={}&go=Go&ns0=1";
        "aw" = "https://wiki.archlinux.org/?search={}";

        "hmopt" = "https://home-manager-options.extranix.com/?release=master&query={}";
        "nxopt" = "https://search.nixos.org/options?channel=unstable&type=packages&query={}";

        "nw" = "https://wiki.nixos.org/index.php?search={}";
      };
      extraConfig = ''
        # See ~/Code/github/Dietr1ch/nixland/desktop/browser/qutebrowser.nix
        # See ~/.config/home-manager/home/browsers.nix
        # programs.qutebrowser.extraConfig:
      '';
    }; # ..programs.qutebrowser

    mpv = {
      enable = true;
      config = {
        hwdec = "auto-safe";
        vo = "gpu";
        profile = "gpu-hq";

        gpu-context = "wayland";
      };
    }; # ..programs.mpv
  }; # ..programs
}

{ pkgs, ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.parallel
    parallel = {
      enable = true;
      package = pkgs.parallel-full;
      will-cite = true;
    };

    # File tools
    # ==========
    # File manager
    yazi = {
      # ~/Projects/home-manager/modules/programs/yazi.nix
      # https://github.com/sxyazi/yazi
      enable = true;
    };
    # File finding
    broot = {
      # ~/Projects/home-manager/modules/programs/broot.nix
      # https://github.com/Canop/broot
      enable = true;
    };
    fd = {
      # ~/Projects/home-manager/modules/programs/fd.nix
      # https://github.com/sharkdp/fd
      enable = true;
      ignores = [
        ".git/"

        "*.bak"
        "*.lock"
      ];
    };
    # File searching
    ripgrep = {
      # ~/Projects/home-manager/modules/programs/ripgrep.nix
      # https://github.com/BurntSushi/ripgrep
      enable = true;

      # arguments = [
      #   "--max-columns-preview"
      #   "--colors=line:style:bold"
      # ];
    };
    # Directory listing
    eza = {
      # ~/Projects/home-manager/modules/programs/eza.nix
      # https://github.com/eza-community/eza
      # https://eza.rocks
      enable = true;

      git = true;
    };
    # File printing
    # https://home-manager-options.extranix.com/?release=master&query=programs.bat
    bat = {
      # ~/Projects/home-manager/modules/programs/bat.nix
      # https://github.com/sharkdp/bat
      enable = true;

      # Generates ~/.config/bat/config
      config = {
        # NOTE: Check `bat --list-themes`
        theme = "Nord";

        map-syntax = [
          "*.ino:C++"
          ".ignore:Git Ignore"
          "*.jenkinsfile:Groovy"
          "*.props:Java Properties"
        ];
      };
    };
    # Selector
    skim = {
      # ~/Projects/home-manager/modules/programs/skim.nix
      # https://github.com/skim-rs/skim
      enable = true;

      defaultCommand = "fd --type 'f'";
      # defaultOptions = [
      #   "--height 40%"
      #   "--prompt ⟫"
      # ];
      changeDirWidgetCommand = "fd --type 'd'";
      # changeDirWidgetOptions = [
      #   "--preview 'tree -C {} | head -200'"
      # ];
      fileWidgetCommand = "fd --type 'f'";
      # fileWidgetOptions = [];
    }; # ..programs.skim


    # JSON
    jq = {
      enable = true;
    };
    jqp = {
      enable = true;
    };

    fastfetch = {
      enable = true;

      settings = {
        display = {
          key.width = 4;
          separator = "";
          size.binaryPrefix = "si";
        };
        # https://github.com/fastfetch-cli/fastfetch/blob/dev/presets/all.jsonc
        modules = [
          "title"
          # "separator"
          {
            key = " ";
            type = "os";
            keyColor = "blue";
            format = "{3}";
          }
          "host"

          # Machine
          {
            key = "󰌽 ";
            type = "board";
            showPerCoreCount = true;
            keyColor = "red";
          }
          {
            key = "󰌽 ";
            type = "cpu";
            showPerCoreCount = true;
            keyColor = "red";
          }
          {
            key = " ";
            type = "memory";
            keyColor = "red";
          }

          # System
          {
            key = "󰌽 ";
            type = "kernel";
            keyColor = "yellow";
          }
          {
            key = "󰅐 ";
            type = "uptime";
            keyColor = "green";
          }
          "loadavg"

          {
            key = " ";
            type = "packages";
            keyColor = "red";
          }

          # Desktop
          {
            key = " ";
            type = "wm";
            keyColor = "cyan";
          }

          {
            key = " ";
            type = "colors";
            keyColor = "magenta";
            symbol = "circle";
          }
        ];
      };
    }; # ..programs.fastfetch
  }; # ..programs

  home = {
    packages = with pkgs; [
      gawk

      ## Viewers
      hexyl
      lnav

      ## Watchers
      pv
      libnotify
      inotify-tools
      fswatch

      # Text
      sd # sed replacement

      # System
      htop
      bottom
      zenith

      # Disk
      duf
      dua

      hyperfine

      trash-cli

      wl-clipboard-rs

      # System
      # ------
      nix-tree
    ];
  };
}

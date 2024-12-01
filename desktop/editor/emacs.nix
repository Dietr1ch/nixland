{ pkgs, ... }:

{
  programs = {
    emacs = {
      enable = true;

      package = pkgs.emacs30-pgtk;
      extraPackages = epkgs: with epkgs; [
      ];
    };  # ..programs.emacs
  };  # ..programs

  home = {
    packages = with pkgs; [
      # emacs
      # -----
      # email
      # mu
      # org-roam
      sqlite
      graphviz
    ];

    sessionVariables = {
      LSP_USE_PLISTS = "true";
    };
  };  # ..home

  services = {
    emacs = {
      enable = true;
      defaultEditor = true;

      client = {
        enable = true;
        arguments = [
          "--create-frame"
          "--alternate-editor"
          "false"
        ];
      };
    };
  };

  systemd = {
    user = {
      services = {
        emacs = {
          Unit = {
            After = [ "graphical-session-pre.target" ];
          };
        };
      };
    };
  };
}

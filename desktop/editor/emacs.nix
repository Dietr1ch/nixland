{ pkgs, ... }:

{
  programs = {
    emacs = {
      enable = true;

      package = pkgs.emacs30-pgtk;
      extraPackages = epkgs: with epkgs; [ ];
    }; # ..programs.emacs
  }; # ..programs

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
  }; # ..home

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

  # ~/.config/systemd/user/emacs.service
  systemd = {
    user = {
      services = {
        emacs = {
          # NOTE: I think this fixes startup when the graphical session fails
          Unit = {
            After = [ "graphical-session-pre.target" ];
          };
          Service = {
            # Allow long startups due to recompilation.
            TimeoutStartSec = 60;
          };
        };
      };
    };
  };
}

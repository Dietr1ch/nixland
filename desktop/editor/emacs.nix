{ pkgs, ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.emacs
    emacs = {
      enable = true;

      package = pkgs.emacs-pgtk;
      extraPackages = epkgs: with epkgs; [
        vterm
      ];
    }; # ..programs.emacs
  }; # ..programs

  home = {
    packages = with pkgs; [
      # emacs
      # -----
      # email
      # mu
      # org-roam

      emacs-lsp-booster
      emacs-all-the-icons-fonts

      sqlite
      graphviz
    ];

    sessionVariables = {
      "LSP_USE_PLISTS" = "true";
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

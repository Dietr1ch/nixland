{ pkgs, ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.emacs
    emacs = {
      enable = true;

      package = pkgs.emacs-pgtk;
      extraPackages = epkgs: with epkgs; [
        # NOTE: tree-sitter-langs gets built, but isn't available to emacs
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
      emacsclient-commands

      emacs-lsp-booster
      emacs-all-the-icons-fonts

      sqlite
      graphviz
    ];

    # Needed at both compile-time and run-time
    # https://discourse.doomemacs.org/t/using-lsp-use-plists-with-rust-analyzer-stops-updating-diagnostics-on-save/2832
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
          after = [
            "graphical-session-pre.target"
          ];
          serviceConfig = {
            # Allow long startups due to recompilation.
            TimeoutStartSec = 60;
          };

          environment = {
            "LSP_USE_PLISTS" = "true";
          };
        };
      };
    };
  };
}

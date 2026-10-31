{ pkgs, lib, ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.emacs
    emacs = {
      enable = true;

      package = pkgs.emacs-pgtk;
      extraPackages =
        epkgs: with epkgs; [
          # NOTE: tree-sitter-langs gets built, but isn't available to emacs
          vterm
        ]; # ..programs.emacs.extraPackages
    }; # ..programs.emacs

    git = {
      settings = {
        mergetool = {
          "ediff" = {
            cmd = "emacsclient --eval '(ediff-merge-files-with-ancestor \"$LOCAL\" \"$REMOTE\" \"$BASE\" nil \"$MERGED\")'";
          }; # ..programs.git.settings.mergetool."ediff"
        }; # ..programs.git.settings.mergetool
      }; # ..programs.git.settings
    }; # ..programs.git
  }; # ..programs

  home = {
    packages = with pkgs; [
      # org-roam
      emacsclient-commands

      emacs-lsp-booster
      emacs-all-the-icons-fonts

      sqlite
      graphviz
    ]; # ..home.packages

    # Needed at both compile-time and run-time
    # https://discourse.doomemacs.org/t/using-lsp-use-plists-with-rust-analyzer-stops-updating-diagnostics-on-save/2832
    sessionVariables = {
      "LSP_USE_PLISTS" = "true";
      "VISUAL" = lib.mkDefault "emacsclient --quiet";
      "EDITOR" = lib.mkDefault "emacsclient --quiet --no-window-system --alternate-editor hx";
    }; # ..home.sessionVariables
  }; # ..home

  services = {
    emacs = {
      enable = true;

      client = {
        enable = true;
        arguments = [
          "--create-frame"
          "--quiet"
          "--alternate-editor"
          "false"
        ]; # ..services.emacs.client.arguments
      }; # ..services.emacs.client
    }; # ..services.emacs
  }; # ..services

  # Generates ~/.config/systemd/user/emacs.service
  systemd = {
    user = {
      services = {
        emacs = {
          Service = {
            # Restart even on successful exits.
            # This makes updating and restarting easier
            Restart = lib.mkForce "always";

            # Allow long startups due to recompilation.
            TimeoutStartSec = 60;

            Environment = [
              "LSP_USE_PLISTS=true"
              "LD_PRELOAD="
            ]; # ..systemd.user.services.emacs.Service.Environment
          }; # ..systemd.user.services.emacs.Service
        }; # ..systemd.user.services.emacs
      }; # ..systemd.user.services
    }; # ..systemd.user
  }; # ..systemd
}

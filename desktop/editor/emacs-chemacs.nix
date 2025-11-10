{ pkgs, ... }:

{
  imports = [ ./emacs.nix ];

  home = {
    file = {
      # chemacs2
      # ========

      # git clone https://github.com/plexus/chemacs2 ~/.emacs.d
      ".emacs.d" = {
        recursive = true;
        source = pkgs.fetchFromGitHub {
          # https://github.com/plexus/chemacs2
          owner = "plexus";
          repo = "chemacs2";
          rev = "c2d700b784c793cc82131ef86323801b8d6e67bb"; # 2023-01-20 (Master on 2025-11-10)
          sha256 = "XsJ2hHoQGoDbM7J+VvO1u0+f+jJCQqcUqQjzvTlnnG0=";
        };
      };

      # Configuration
      ".emacs-profile" = {
        text = ''
          spacemacs-dev
        '';
      };

      ".emacs-profiles.el" = {
        text = ''
          (
           ;; Spacemacs @develop
           ("spacemacs-dev" . ((user-emacs-directory . "~/.config/emacs/spacemacs-dev/distro")
                                   (env . (("SPACEMACSDIR" . "~/.config/emacs/spacemacs-dev/config")))))

           ;; doom-emacs
           ("doom" . ((user-emacs-directory . "~/.config/emacs/doom/distro")
                      (env . (("DOOMDIR" . "~/.config/emacs/doom/config")))))
           )
        '';
      };

      # Spacemacs
      # =========
      # TODO: Switch to a flake-backed Spacemacs config

      # git clone https://github.com/syl20bnr/spacemacs --branch 'develop' ~/.config/emacs/spacemacs/distro-ro
      # ".config/emacs/spacemacs/distro-ro" = {
      #   recursive = true;
      #   source = pkgs.fetchFromGitHub {
      #     # https://github.com/syl20bnr/spacemacs
      #     owner = "syl20bnr";
      #     repo = "spacemacs";
      #     rev = "26b8fe0c317915b622825877eb5e5bdae88fb2b2";
      #     sha256 = "00cfm6caaz85rwlrbs8rm2878wgnph6342i9688w4dji3dgyz3rz";
      #   };
      # };

      # Doom Emacs
      # ==========
      # TODO: Switch to a flake-backed doom-emacs config

      # git clone https://github.com/hlissner/doomemacs ~/.config/emacs/doom/distro-ro
      # ".config/emacs/doom/distro-ro" = {
      #   recursive = true;
      #   source = pkgs.fetchFromGitHub {
      #     # https://github.com/hlissner/doomemacs
      #     owner = "hlissner";
      #     repo = "doomemacs";
      #     rev = "26b8fe0c317915b622825877eb5e5bdae88fb2b2";
      #     sha256 = "00cfm6caaz85rwlrbs8rm2878wgnph6342i9688w4dji3dgyz3rz";
      #   };
      # };

    }; # ..home.file
  }; # ..home
}

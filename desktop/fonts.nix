{ pkgs, ... }:

# https://nixos.wiki/wiki/Fonts
{
  fonts = {
    fontconfig = {
      enable = true;

      defaultFonts = {
        serif = [
          "DejaVu Serif"
          "Liberation Serif"
        ];
        sansSerif = [
          "DejaVu Sans"
          "Ubuntu"
        ];
        monospace = [
          "FiraCode Nerd Font Mono"
          "Source Code Pro"
          "Hack"
        ];
        emoji = [
          "Noto Color"
        ];
      };
    };
  };


  home = {
    packages = with pkgs; [
      # Regular fonts
      # =============
      dejavu_fonts
      inconsolata
      liberation_ttf
      noto-fonts

      # Programming
      # ===========

      # Fira
      fira
      fira-mono
      fira-code
      fira-code-symbols
      fira-math

      # Roboto
      roboto
      roboto-mono
      roboto-serif
      roboto-flex

      # Hack
      # hack-font
      # hackgen-nf-font

      # SourceCode
      source-code-pro

      borg-sans-mono

      # Icons, Symbols, Emoji
      # =====================
      emacs-all-the-icons-fonts
      font-awesome
      symbola

      powerline-fonts

      emojione
      noto-fonts-emoji
    ];  # ..home.packages
  };  # ..home
}

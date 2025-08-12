{ pkgs, ... }:

# https://nixos.wiki/wiki/Fonts
{
  fonts = {
    fontconfig = {
      enable = true;

      defaultFonts = {
        # How to check font-family:
        # find /nix/var/nix/profiles/system/sw/share/X11/fonts/ -type l | fzf --preview 'fc-query {} | grep "^\\s\\+family:" | grep "^\\s\\+family:" | cut -d\'"\' -f2'
        serif = [
          "DejaVu Serif"
          "Liberation Serif"
        ];
        sansSerif = [
          "DejaVu Sans"
          "Liberation Sans"
        ];
        monospace = [
          "FiraCode"
          "Source Code Pro for Powerline"
          "Hack"
        ];
        emoji = [
          "Noto Color Emoji"
          "Noto Emoji"
          "Noto Mono"
          "EmojiOne Color"
          "Twemoji Mozilla"
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
      nerd-fonts.symbols-only
      noto-fonts-emoji
      twemoji-color-font
    ]; # ..home.packages
  }; # ..home
}

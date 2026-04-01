{ pkgs, ... }:

# https://nixos.wiki/wiki/Fonts
{
  fonts = {
    fontconfig = {
      enable = true;

      defaultFonts = {
        # How to check font-family:
        # find /nix/var/nix/profiles/system/sw/share/X11/fonts/ -type l | sk --preview 'fc-query {} | grep "^\\s\\+family:" | grep "^\\s\\+family:" | cut -d\'"\' -f2'
        serif = [
          "Noto Serif"
          "DejaVu Serif"
          "Liberation Serif"
        ];
        sansSerif = [
          "Noto Sans"
          "Fira Sans"
          "DejaVu Sans"
          "Liberation Sans"
        ];
        monospace = [
          "Fira Code"
          "Source Code Pro for Powerline"
        ];
        emoji = [
          "Noto Color Emoji"
          "Noto Emoji"
          "Noto Mono"
          "Twemoji Mozilla"
        ];
      };
    };
  };

  home = {
    # In sync with ~/Projects/systemn/desktop/shell/graphical/fonts.nix
    packages = with pkgs; [
      # Regular fonts
      # =============
      dejavu_fonts
      inconsolata
      liberation_ttf
      noto-fonts
      open-sans

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

      # SourceCode
      source-code-pro

      borg-sans-mono

      # Icons, Symbols, Emoji
      # =====================
      emacs-all-the-icons-fonts
      font-awesome
      symbola

      powerline-fonts

      nerd-fonts.symbols-only
      noto-fonts-color-emoji
      twemoji-color-font
    ]; # ..home.packages
  }; # ..home
}

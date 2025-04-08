{ lib, ... }:

{
  programs = {
    alacritty = {
      # https://home-manager-options.extranix.com/?release=master&query=alacritty
      # https://github.com/alacritty/alacritty
      # https://alacritty.org/
      # ~/Code/github/Dietr1ch/home-manager/modules/programs/alacritty.nix
      enable = true;

      # https://alacritty.org/config-alacritty.html
      settings = {
        general = {
          live_config_reload = true;
        };
        window = {
          decorations = "full"; # buttonless transparent full none
          opacity = 0.85;
          dynamic_title = true;
          dynamic_padding = true;
        };
        scrolling = {
          history = 0;
          # multiplier = 10;
        };
        font = {
          # Should match Emacs' ~/.config/emacs/spacemacs-dev/config/init.el
          size = lib.mkDefault 11.0;
          normal.family = lib.mkDefault "Fira Code";
          bold.family = lib.mkDefault "Fira Code";
          italic.family = lib.mkDefault "Fira Code";
          bold_italic.family = lib.mkDefault "Fira Code";
        };
        bell = {
          animation = "EaseOutExpo";
          duration = 0; # ms
          # duration = 400;  # ms
        };
        selection = {
          # semantic_escape_chars =  ",│`|:\"' ()[]{}<>\t";
          semantic_escape_chars = ",│`|\"' ()[]{}<>\t";
          save_to_clipboard = false;
        };
        cursor = {
          style = {
            shape = "Block";
            blinking = "On";
          };
          blink_interval = 750; # ms
          blink_timeout = 5;
          unfocused_hollow = true;
        };
        mouse = {
          hide_when_typing = true;
        };
        hints = {
          # Dvorak main row, upper, lower
          alphabet = "hutenosadigpc.r,xbkmjw";
        };
        # key_bindings = [
        #   {
        #     key = "K";
        #     mods = "Control";
        #     chars = "\\x0c";
        #   }
        # ];
      };
    }; # ..programs.alacritty
  };
}

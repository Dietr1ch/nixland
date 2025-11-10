{ ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.less
    less = {
      enable = true;

      # Sets the $LESS environment variable
      options = {
        # -R --RAW-CONTROL-CHARS:   Keeps colours
        RAW-CONTROL-CHARS = true;
        # -X --no-init:             Avoids clearing the screen
        no-init = true;
        # -F --quit-if-one-screen:  Simply quits printing output if it fits
        quit-if-one-screen = true;
        #    --mouse:
        mouse = true;
        # -q --quiet:
        quiet = true;
      };
    };
  };
}

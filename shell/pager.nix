{ pkgs, ... }:

{
  home = {
    sessionVariables = {
      # "PAGER"
      #   -R --RAW-CONTROL-CHARS:   Keeps colours
      #   -X --no-init:             Avoids clearing the screen
      #   -F --quit-if-one-screen:  Simply quits printing output if it fits
      "PAGER" = "less -RXF";
    };

    packages = with pkgs; [ less ];
  };
}

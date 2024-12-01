{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # Guitar tabs
      tuxguitar
      jre
      fluidsynth
      qsynth
    ];
  };
}

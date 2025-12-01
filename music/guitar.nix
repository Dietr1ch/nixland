{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # Guitar tabs
      tuxguitar
      fluidsynth
      qsynth
    ];
  };
}

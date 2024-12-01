{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      SDL2
    ];

    sessionVariables = {
      SDL_VIDEODRIVER = "wayland";
      SDL_AUDIODRIVER = "pipewire";
    };
  };
}

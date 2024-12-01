{ ... }:

{
  xdg = {
    enable = true;
  };
  programs = {
    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
      mise = {
        enable = true;
      };
    };
    mise = {
      enable = true;
    };
  };
}

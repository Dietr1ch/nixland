{ pkgs, ... }:

{
  imports = [ ];

  home = {
    packages = with pkgs; [
      wireshark-qt
      xh # HTTPie clone
    ];
  };

  services = {
    opensnitch-ui = {
      enable = true;
    };
  };
}

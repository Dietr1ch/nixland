{ pkgs, ... }:

{
  imports = [ ];

  home = {
    packages = with pkgs; [ wireshark-qt ];
  };

  services = {
    opensnitch-ui = {
      enable = true;
    };
  };
}

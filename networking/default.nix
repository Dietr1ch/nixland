{ pkgs, ... }:

{
  imports = [ ];

  home = {
    packages = with pkgs; [
      nmap
      rustscan
      gping
      hping
      nethogs
      trippy
      bandwhich
      dig
      dogedns

      # Downloaders
      aria2
      rustscan

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

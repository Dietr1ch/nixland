{ pkgs, lib, ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.jujutsu
    jujutsu = {
      enable = true;
    };

    # https://home-manager-options.extranix.com/?release=master&query=programs.jjui
    jjui = {
      enable = true;
    };

    delta.enableJujutsuIntegration = lib.mkDefault true;
  };

  home = {
    packages = with pkgs; [
      lazyjj
    ];
  };
}

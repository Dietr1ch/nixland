{ pkgs, lib, ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.jujutsu
    jujutsu = {
      enable = true;

      # https://github.com/jj-vcs/jj/tree/main/docs/config.md
      # ~/.config/jj/config.toml
      settings = {
        ui = {
          allow-init-native = true;

          default-command = "log";
        };
      };
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

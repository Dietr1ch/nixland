{ pkgs, ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.password-store
    password-store = {
      enable = true;

      settings  = {
      };
    };
  };

  home = {
    packages = with pkgs; [
      keepassxc
    ];
  };
}

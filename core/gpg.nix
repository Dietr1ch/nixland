{ pkgs, ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.gpg
    gpg = {
      enable = true;
      settings = {
        # https://discourse.nixos.org/t/how-to-full-git-setup-in-home-manager-or-else/24861/23
        keyserver = "hkps://keys.openpgp.org";

        auto-key-locate = "local,wkd,keyserver";
        auto-key-retrieve = true;
        auto-key-import = true;
        keyserver-options = "honor-keyserver-url";
        no-autostart = true;
      };
    };
  };

  home = {
    packages = with pkgs; [
      pinentry-qt
    ];
  };

  services = {
    # https://home-manager-options.extranix.com/?release=master&query=services.gpg-agent
    gpg-agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-qt;

      grabKeyboardAndMouse = true;
      enableSshSupport = true;

      maxCacheTtl = 5 * 60;      #  5 minutes
      maxCacheTtlSsh = 15 * 60;  # 15 minutes
    };
  };
}

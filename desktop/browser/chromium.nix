{ pkgs, ... }:

{
  programs = {
    chromium = {
      enable = true;
    };
  };  # ..programs

  home = {
    file = {
      ".config/captive-browser.toml" = {
        # https://github.com/FiloSottile/captive-browser/blob/main/captive-browser-dhcpcd-chromium.toml
        text = ''
          dhcp-dns = "nmcli --terse --get-values IP4.DNS device show wlan0"
          browser = """
              chromium-browser \
              --user-data-dir=/tmp/chromium-captive-temp \
              --proxy-server="socks5://$PROXY" \
              --host-resolver-rules="MAP * ~NOTFOUND , EXCLUDE localhost" \
              --no-first-run \
              --new-window \
              --incognito \
              http://detectportal.firefox.com/canonical.html
          """
          socks5-addr = "localhost:1666"
        '';
      };
    };

    packages = with pkgs; [
      captive-browser
    ];
  };
}

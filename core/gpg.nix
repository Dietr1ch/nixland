{ lib, pkgs, ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.gpg
    gpg = {
      enable = true;

      # Settings (~/.gnupg/gpg.conf)
      # https://home-manager-options.extranix.com/?release=master&query=programs.gpg.settings
      #
      # https://www.gnupg.org/documentation/manuals/gnupg/OpenPGP-Options.html
      # Use `gpg --version` to list available algorithms
      #
      # https://riseup.net/en/security/message-security/openpgp/gpg-best-practices
      # https://www.owlfolio.org/possibly-useful/readonly-gpg2/
      # https://github.com/drduh/config/blob/master/gpg.conf
      settings = {
        # https://discourse.nixos.org/t/how-to-full-git-setup-in-home-manager-or-else/24861/23
        # NOTE: DO override. (Single point of failure. Make sure to use hkps)
        keyserver = lib.mkDefault "hkps://keys.openpgp.org";

        auto-key-locate = "local,wkd,keyserver";
        auto-key-retrieve = true;
        auto-key-import = true;
        # Don't give away control of keyservers
        #   - Allows using weak servers
        #   - Allows correlation
        keyserver-options = "no-honor-keyserver-url";
        no-autostart = true;


        personal-cipher-preferences = "AES256";
        personal-digest-preferences = "SHA512 SHA256";

        personal-compress-preferences = "ZLIB BZIP2 Uncompressed";

        # https://www.gnupg.org/documentation/manuals/gnupg/GPG-Esoteric-Options.html
        default-preference-list = "SHA512 SHA256 AES256 ZLIB BZIP2 Uncompressed";

        cert-digest-algo = "SHA512";
        s2k-digest-algo = "SHA512";
        s2k-cipher-algo = "AES256";

        charset = "utf-8";

        # Display
        no-comments = true;  # No comments in messages
        no-emit-version = true;  # No version in output
        no-greeting = true;  # Disable banner
        keyid-format = "0xlong";  # Long key id format
        list-options = "show-uid-validity";  # Display UID validity
        verify-options = "show-uid-validity";  # Display UID validity
        with-fingerprint = true; # Display all keys and their fingerprints
        with-key-origin = true;  # Display key origins and updates
        fixed-list-mode = true;  # Do not merge primary user ID and key in --with-colon listing mode and print unix timestamps

        require-cross-certification = true;  # Cross-certify subkeys are present and valid
        no-symkey-cache = true;   # Disable caching of passphrase for symmetrical ops
        use-agent = true;  # Enable smartcard
        throw-keyids = true;  # Disable recipient key ID in messages (breaks Mailvelope)
      };
    };
  };

  services = {
    # https://home-manager-options.extranix.com/?release=master&query=services.gpg-agent
    gpg-agent = {
      enable = true;

      # Configuration
      # ~/.gnupg/gpg-agent.conf
      pinentryPackage = pkgs.pinentry-qt;

      grabKeyboardAndMouse = true;
      enableSshSupport = true;

      maxCacheTtl = 5 * 60;      #  5 minutes
      maxCacheTtlSsh = 15 * 60;  # 15 minutes
    };
  };

  home = {
    packages = with pkgs; [
      pinentry-qt
    ];
  };
}

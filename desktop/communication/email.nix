{ pkgs, ... }:

{
  # Requires account setup.
  #
  # https://home-manager-options.extranix.com/?release=master&query=accounts.email.accounts
  #
  # NOTE: This is not tested
  # accounts = {
  #   email = {
  #     accounts = {
  #
  #       "accountName" = {
  #         primary = true;
  #
  #         address = "srid@srid.ca";
  #         realName = "Sridhar Ratnakumar";
  #         userName = "happyandharmless";
  #
  #         passwordCommand = "op item get iCloud --fields label=himalaya";
  #
  #         imap = {
  #           host = "imap.mail.me.com";
  #           port = 993;
  #           tls.enable = true;
  #         };
  #         smtp = {
  #           host = "smtp.mail.me.com";
  #           port = 587;
  #           tls.enable = true;
  #         };
  #
  #         himalaya = {
  #           enable = true;
  #           settings = {
  #             "email" = "my@email.com";
  #             "display-name" = "Myself";
  #             "signature" = ''
  #               Regards,
  #               Myself
  #             '';
  #           };
  #         };
  #       };
  #
  #     };
  #   };
  # };

  programs = {
    # ~/Code/github/Dietr1ch/home-manager/modules/programs/himalaya.nix
    himalaya = {
      enable = true;

      # https://pimalaya.org/himalaya/cli/latest/configuration/index.html#global-configuration
      settings = {
        "downloads-dir" = "~/Downloads/Email";
      };
    };
  };

  home = {
    packages = with pkgs; [
      mu
    ];
  }; # ..home
}

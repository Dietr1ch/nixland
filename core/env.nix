{ ... }:

{
  xdg = {
    enable = true;
  };

  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.direnv
    direnv = {
      enable = true;

      nix-direnv = {
        # TODO: Enable `nix-direnv` once it properly works with flakes
        enable = false;
      };
      mise = {
        enable = true;
      };

      # https://github.com/direnv/direnv/tree/master/man/direnv.toml.1.md#config
      config = {
        "global" = {
          "strict_env" = true;
        };
      };
    }; # ..programs.direnv

    mise = {
      enable = true;
    }; # ..programs.mise
  };
}

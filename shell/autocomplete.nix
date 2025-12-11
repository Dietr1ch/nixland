{ ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.carapace
    carapace = {
      # ~/Projects/home-manager/modules/programs/carapace.nix
      # https://github.com/carapace-sh/carapace-bin/
      enable = true;

      enableFishIntegration = true;
      enableNushellIntegration = true;
    }; # ..programs.carapace

    # https://home-manager-options.extranix.com/?release=master&query=programs.pay-respects
    pay-respects = {
      enable = true;

      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;
    }; # ..programs.carapace
  }; # ..programs

  home = {
    file = {

      # NOTE: Needed because of package management misinference (https://codeberg.org/iff/pay-respects/issues/34)
      "~/.config/pay-respects/config.toml" = {
        text = ''
          # Maximum time in milliseconds for getting previous output
          timeout = 3000

          # How suggestions are evaluated after being confirmed
          # - Internal: commands are evaluated inside `pay-respects`
          # - Shell: current working shell is responsible for execution
          eval_method = "Internal"

          [package_manager]
          # NOTE: Fixes misinference (https://codeberg.org/iff/pay-respects/issues/34)
          package_manager = "nix"
          install_method = "Shell"
        '';
      };

    }; # ..home.file
  }; # ..home
}

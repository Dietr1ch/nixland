{ pkgs, ... }:

{
  programs = {
    # https://home-manager-options.extranix.com/?release=master&query=programs.ruff
    ruff = {
      enable = true;

      # https://docs.astral.sh/ruff/settings
      settings = {
        fix = true;

        # https://docs.astral.sh/ruff/settings/#analyze
        analyze = {
          detect-string-imports = true;
        };
      };
    };

    # https://home-manager-options.extranix.com/?release=master&query=programs.matplotlib
    matplotlib = {
      enable = true;

      # config = {
      #   backend = "Qt5Agg";
      #   axes = {
      #     grid = true;
      #     facecolor = "black";
      #     edgecolor = "FF9900";
      #   };
      #   grid.color = "FF9900";
      # };
    };
  };

  home = {

    packages = with pkgs; [
      python3
      python313Packages.ipython
      python313Packages.tqdm
      python313Packages.types-tqdm

      python313Packages.pandas
      # BROKEN: python313Packages.pandas-stubs
      python313Packages.xlrd # Excel

      python313Packages.polars
      python313Packages.altair
      python313Packages.vega
      # TODO Add python313Packages.vl-convert

      python313Packages.numpy
      python313Packages.scipy
      python313Packages.traittypes

      python313Packages.matplotlib

      python313Packages.requests

      # Tools
      ruff # Lint, Formatter
      pylyzer # LSP
    ]; # ..home.packages
  }; # ..home
}

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
    # Packages in sync with ~/Projects/systemn/desktop/programming/python.nix
    packages = with pkgs; [
      (pkgs.python313.withPackages (
        ppkgs: with ppkgs; [
          ipython

          tqdm
          types-tqdm

          numpy
          scipy
          tensorflow

          pandas
          pandas-stubs

          polars
          altair
          vega
          vl-convert-python

          traittypes

          matplotlib

          requests
          xlrd

          z3-solver
        ]
      ))

      # Tools
      ruff # Lint, Formatter
      pylyzer # LSP
    ]; # ..home.packages
  }; # ..home
}

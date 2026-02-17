{ config, pkgs, ... }:

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

          # Tools
          ## Progress bar
          tqdm
          types-tqdm
          ## Type defs
          traittypes
          ## Cache
          joblib

          # Libraries
          ## Plotting
          matplotlib
          ## Numeric
          numpy
          scipy
          tensorflow
          ## Pandas
          pandas
          pandas-stubs
          ## Polars (https://docs.pola.rs/user-guide/installation/)
          polars
          altair
          vega
          vl-convert-python

          # HTTP
          requests

          # AI
          anthropic

          # Data
          pyarrow
          pydantic
          ## DuckDB
          duckdb
          ## Excel
          fastexcel
          openpyxl
          xlrd

          # Solvers
          z3-solver
        ]
      ))

      # Tools
      ruff # Lint, Formatter
      pylyzer # LSP

      # Solvers
      clingo
      clingcon
      z3
    ]; # ..home.packages

    sessionVariables = {
      "IPYTHONDIR" = "${config.xdg.configHome}/ipython";
    };
  }; # ..home
}

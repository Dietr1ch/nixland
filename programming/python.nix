{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      python3
      python312Packages.ipython
      python312Packages.tqdm
      python312Packages.types-tqdm

      python312Packages.pandas
      python312Packages.pandas-stubs
      python312Packages.xlrd  # Excel

      python312Packages.polars
      python312Packages.altair
      python312Packages.vega
      # TODO Add python312Packages.vl-convert


      python312Packages.numpy
      python312Packages.scipy
      python312Packages.traittypes

      python312Packages.matplotlib

      python312Packages.requests

      # Tools
      ruff  # Lint, Formatter
      pylyzer  # LSP
    ];  # ..home.packages
  };  # ..home
}

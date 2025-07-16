{ pkgs, ... }:

{
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

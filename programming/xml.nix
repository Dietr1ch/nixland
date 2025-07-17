{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      opensp  # onsgmls
      xq-xml # jq, but for xml
    ]; # ..home.packages
  }; # ..home
}

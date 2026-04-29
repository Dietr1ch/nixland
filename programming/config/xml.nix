{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/config/xml.nix
    packages = with pkgs; [
      opensp # onsgmls
      xq-xml # jq, but for xml
    ]; # ..home.packages
  }; # ..home
}

{ pkgs, ... }:

{
  home = {
    # Packages in sync with ~/Projects/systemn/desktop/programming/haskell.nix
    packages = with pkgs; [ ghc ];

    file = {
      ".config/ghc/ghci.conf" = {
        text = ''
          -- Prompt
          :set prompt "\x03BB> "
          :set prompt-cont " > "

          -- Extensions
          :seti -XGADTSyntax
          :seti -XGeneralizedNewtypeDeriving
          :seti -XInstanceSigs
          :seti -XLambdaCase
          :seti -XPartialTypeSignatures
          :seti -XScopedTypeVariables
          :seti -XTypeApplications
          :seti -XOverloadedStrings

          -- Constants
          let kb = 1024;
          let mb = 1024 * kb;
          let gb = 1024 * mb;
          let tb = 1024 * gb;
          let pb = 1024 * tb;
        '';
      }; # ..home.file.".config/ghc/ghci.conf"
    }; # ..home.file
  }; # ..home

}

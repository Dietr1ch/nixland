{ ... }:

{
  programs = {
    helix = {
      # https://rycee.gitlab.io/home-manager/options.html#opt-programs.helix.enable
      enable = true;
      settings = {
        # https://github.com/helix-editor/helix/wiki/Themes
        theme = "nord";
        # theme = "ayu_mirage";
        # theme = "rasmus";

        # https://docs.helix-editor.com/configuration.html#editor
        editor = {
          shell = [
            "fish"
          ];

          lsp = {
            display-messages = true;
          };

          true-color = true;
          mouse = true;

          file-picker = {
            hidden = false;
          };

          gutters = [
            "diagnostics"
            # "spacer"
            # "line-numbers"
            "spacer"
            "diff"
          ];

          line-number = "relative";
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };
          indent-guides = {
            render = true;
            character = "▏";
            # character = "⸽";
            skip-levels = 1;
          };
          whitespace = {
            render = {
              tab = "all";
            };
            characters = {
              space = "·";
              nbsp = "⍽";
              tab = "→";
              newline = "⏎";
              tabpad = "·";
            };
          };
        };

        # keys.normal = {
        #   space.space = "file_picker";
        #   space.w = ":w";
        # };
      };
    };  # ..programs.helix
  };  # ..programs
}

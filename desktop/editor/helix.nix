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
          shell = [ "fish" ];

          # https://docs.helix-editor.com/editor.html#editorlsp-section
          lsp = {
            enable = true;
            display-messages = true;
            display-inlay-hints = true;
          };

          true-color = true;
          mouse = true;

          color-modes = true;

          # https://docs.helix-editor.com/editor.html#editorfile-picker-section
          file-picker = {
            hidden = false;
          };

          # https://docs.helix-editor.com/editor.html#editorgutters-section
          gutters = [
            "diagnostics"
            # "spacer"
            # "line-numbers"
            "spacer"
            "diff"
          ];

          line-number = "relative";
          # https://docs.helix-editor.com/editor.html#editorcursor-shape-section
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };
          # https://docs.helix-editor.com/editor.html#editorindent-guides-section
          indent-guides = {
            render = true;
            character = "▏";
            # character = "⸽";
            skip-levels = 1;
          };

          # https://docs.helix-editor.com/editor.html#editorsmart-tab-section
          smart-tab = {
            enable = true;
          };

          # https://docs.helix-editor.com/editor.html#editorwhitespace-section
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
    }; # ..programs.helix
  }; # ..programs
}

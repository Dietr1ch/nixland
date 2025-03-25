{ pkgs, ... }:

let
  default_mode = "normal";     # https://zellij.dev/documentation/options#default_mode
  default_layout = "compact";  # https://zellij.dev/documentation/options#default_layout
in
{
  programs = {
    zellij = {
      # https://github.com/nix-community/home-manager/blob/master/modules/programs/zellij.nix
      # ~/Code/github/Dietr1ch/home-manager/modules/programs/zellij.nix
      enable = true;

      # New settings from https://github.com/nix-community/home-manager/pull/6037
      # enableShellCompletions = true;
      # autostartOnShellStart = {
      #   enable = true;

      #   attachExistingSession = true;
      #   exitShellOnExit = false;
      # };

      enableFishIntegration = true;

      # ~/.config/zellij/config.kdl
      settings = {
        # https://zellij.dev/documentation/configuration

        default_mode = default_mode; # https://zellij.dev/documentation/options#default_mode
        show_startup_tips = false; # https://zellij.dev/documentation/options#show_startup_tips

        # https://zellij.dev/documentation/themes
        theme = "nord";  # https://zellij.dev/documentation/options#theme
        default_layout = default_layout;  # https://zellij.dev/documentation/options#default_layout

        copy_command = "wl-copy";

        session_serialization = true;
        serialize_pane_viewport = true;

        scroll_buffer_size = 10000;
        scrollback_lines_to_serialize = 10000;
      };  # ..programs.zellij.settings


      # New settings from https://github.com/nix-community/home-manager/pull/6078
      # https://github.com/zellij-org/zellij/blob/main/zellij-utils/assets/config/default.kdl
      extraConfig = ''
        // Plugin aliases - can be used to change the implementation of Zellij
        // changing these requires a restart to take effect
        plugins {
          tab-bar location="zellij:tab-bar"
          status-bar location="zellij:status-bar"
          strider location="zellij:strider"
          compact-bar location="zellij:compact-bar"
          session-manager location="zellij:session-manager"
          welcome-screen location="zellij:session-manager" {
            welcome_screen true
          }
          filepicker location="zellij:strider" {
            cwd "/"
          }
          configuration location="zellij:configuration"
          plugin-manager location="zellij:plugin-manager"

          // Extra plugins (https://github.com/zellij-org/awesome-zellij)
          sessionizer location="file:///home/dietr1ch/.config/zellij/plugins/sessionizer.wasm"
          // forgot location="file:///home/dietr1ch/.config/zellij/plugins/forgot.wasm"
        }

        // Plugins to load in the background when a new session starts
        load_plugins {
          welcome-screen
          session-manager
          // "file:/path/to/my-plugin.wasm"
          // "https://example.com/my-plugin.wasm"
        }

        // Actions: https://zellij.dev/documentation/keybindings-possible-actions
        keybinds clear-defaults=true {
          // Normal
          // ------
          shared_except "normal" "locked" {
            bind "Enter" "Esc" { SwitchToMode "Normal"; }
          }
          normal {
            // uncomment this and adjust key if using copy_on_select=false
            // bind "Alt c" { Copy; }
          }

          // Locked
          // ------
          locked {
            // Back
            bind "Alt $" { SwitchToMode "Normal"; }
          }

          // Unlocked
          // --------
          shared_except "locked" {
            bind "Alt $" { SwitchToMode "Locked"; }

            // Session
            bind "Ctrl q" { Detach; }
            bind "Alt s" {
              LaunchOrFocusPlugin "session-manager" {
                floating true
                move_to_focused_tab true
              };
            }
            bind "Alt ;" {
              LaunchOrFocusPlugin "sessionizer" {
                floating true
                move_to_focused_tab true
                cwd "/"
                root_dirs "/home/dietr1ch/Code/github;/home/dietr1ch/Projects"
                session_layout "${default_layout}"
              };
            }
            // bind "Alt Shift /" {
            //   LaunchOrFocusPlugin "forgot" {
            //   };
            // }

            // Plugins
            bind "Alt f" {
                LaunchOrFocusPlugin "zellij:strider" {
                    floating true
                }
            }

            // Tabs
            /// Tab control
            bind "Alt t" { NewTab; }
            bind "Alt D" { CloseTab; }
            bind "Alt R" { SwitchToMode "RenameTab"; TabNameInput 0; }

            /// Tab focus
            bind "Alt Tab" { ToggleTab; }
            bind "Alt ," { GoToPreviousTab; }
            bind "Alt ." { GoToNextTab;     }
            // CONSIDER: Using Next/Preview Emacs-like bindings
            //bind "Alt p" { GoToPreviousTab; }
            //bind "Alt n" { GoToNextTab;     }

            /// Tab swapping
            bind "Alt Shift ," { MoveTab "Left";  }
            bind "Alt Shift ." { MoveTab "Right"; }

            /// Tab layout
            bind "Alt [" { PreviousSwapLayout; }
            bind "Alt ]" { NextSwapLayout;     }


            // Panes
            /// Pane control
            bind "Alt Shift \\"  { NewPane "Down";  SwitchToMode "Normal"; }
            bind "Alt \\"        { NewPane "Right"; SwitchToMode "Normal"; }
            bind "Alt d" { CloseFocus; }
            bind "Alt r" { SwitchToMode "RenamePane"; PaneNameInput 0;}
            bind "Alt Space" { ToggleFloatingPanes; }
            bind "Alt m" { ToggleFocusFullscreen; }
            bind "Alt z" { TogglePaneFrames;      }
            bind "Alt b" { TogglePaneEmbedOrFloating; }
            bind "Alt B" { BreakPane;  }  // Move pane to a new tab
            // bind "[" { BreakPaneLeft;  }  // Move pane to the left tab
            // bind "]" { BreakPaneRight; }  // Move pane to the right tab

            /// Pane focus
            bind "Alt h" { MoveFocus "Left";  }
            bind "Alt l" { MoveFocus "Right"; }
            bind "Alt j" { MoveFocus "Down";  }
            bind "Alt k" { MoveFocus "Up";    }
            // CONSIDER: Promotes mixing up tabs/panes, but it's handy if ,/. is hard to use on your keyboard layout.
            // bind "Alt h" { MoveFocusOrTab "Left";  }
            // bind "Alt l" { MoveFocusOrTab "Right"; }

            /// Pane swapping
            bind "Alt H" { MovePane "Left";  }
            bind "Alt L" { MovePane "Right"; }
            bind "Alt J" { MovePane "Down";  }
            bind "Alt K" { MovePane "Up";    }

            /// Pane adjusting
            bind "Alt =" "Alt +" { Resize "Increase"; }
            bind "Alt -"         { Resize "Decrease"; }
          }

          // Pane
          // ----
          shared_except "pane" "locked" {
            bind "Ctrl p" { SwitchToMode "Pane"; }
          }
          pane {
            // Back
            bind "Esc"    { SwitchToMode "Normal"; }
            bind "Ctrl p" { SwitchToMode "Normal"; }
            // Escape
            bind "Ctrl c" { SwitchToMode "Normal"; }

            bind "h" { Resize "Increase Left";  }
            bind "j" { Resize "Increase Down";  }
            bind "k" { Resize "Increase Up";    }
            bind "l" { Resize "Increase Right"; }

            bind "H" { Resize "Decrease Left";  }
            bind "J" { Resize "Decrease Down";  }
            bind "K" { Resize "Decrease Up";    }
            bind "L" { Resize "Decrease Right"; }

            bind "=" "+" { Resize "Increase"; }
            bind "-" { Resize "Decrease"; }
          }

          // Tab
          // ---
          // shared_except "tab" "locked" {
          //   bind "Ctrl t" { SwitchToMode "Tab"; }
          // }
          // tab {
          //   // Back
          //   bind "Esc"    { SwitchToMode "Normal"; }
          //   bind "Ctrl t" { SwitchToMode "Normal"; }
          //   // Escape
          //   bind "Ctrl c"       { SwitchToMode "Normal"; }

          //   bind "s" { ToggleActiveSyncTab; SwitchToMode "Normal"; }   // This only command is a relic of worse times
          // }

          // Scroll
          // ------
          shared_except "scroll" "locked" {
            bind "Alt PageUp"   { SwitchToMode "Scroll"; PageScrollUp;   }
            bind "Alt PageDown" { SwitchToMode "Scroll"; PageScrollDown; }
          }
          scroll {
            // Back
            bind "Esc"   { ScrollToBottom; SwitchToMode "Normal"; }
            bind "Enter" { ScrollToBottom; SwitchToMode "Normal"; }
            // Escape
            bind "Ctrl c"      { ScrollToBottom; SwitchToMode "Normal"; }

            // Scrolling
            bind "j" { ScrollDown; }
            bind "k" { ScrollUp;   }
            bind "d" { HalfPageScrollDown; }
            bind "u" { HalfPageScrollUp;   }
            bind "PageDown" "Alt PageDown" "J" { PageScrollDown; }
            bind "PageUp"   "Alt PageUp"   "K" { PageScrollUp; }

            bind "e" { EditScrollback; SwitchToMode "Normal"; }
            bind "/" { SwitchToMode "EnterSearch"; SearchInput 0; }

            // uncomment this and adjust key if using copy_on_select=false
            // bind "Alt c" { Copy; }
          }

          // Search
          // ------
          shared_except "search" "locked"  "scroll" {
            bind "Alt /" { SwitchToMode "EnterSearch"; SearchInput 0; }
          }
          search {
            // Back
            bind "Esc"    { SwitchToMode "Normal"; }
            bind "Ctrl s" { SwitchToMode "Normal"; }
            // Escape
            bind "Ctrl c" { ScrollToBottom; SwitchToMode "Normal"; }

            // Scrolling
            bind "j" { ScrollDown; }
            bind "k" { ScrollUp; }
            bind "d" { HalfPageScrollDown; }
            bind "u" { HalfPageScrollUp; }
            bind "PageDown" "Alt PageDown" "J" { PageScrollDown; }
            bind "PageUp"   "Alt PageUp"   "K" { PageScrollUp; }

            // Navigate matches
            bind "n" { Search "down"; }
            bind "p" { Search "up";   }

            // Edit and go back to scrolling
            bind "e" { EditScrollback; SwitchToMode "Scroll"; }

            // Configure Search
            bind "c" { SearchToggleOption "CaseSensitivity"; }
            bind "o" { SearchToggleOption "WholeWord"; }
            bind "w" { SearchToggleOption "Wrap"; }
          }
          entersearch {
            bind "Ctrl c" "Esc" { SwitchToMode "Scroll"; }
            bind "Enter" { SwitchToMode "Search"; }
          }

          // Rename
          // ------
          renametab {
            // Back
            bind "Esc" { UndoRenameTab; SwitchToMode "Normal"; }
            // Escape
            bind "Ctrl c" { SwitchToMode "Normal"; }
          }
          renamepane {
            // Back
            bind "Esc" { UndoRenamePane; SwitchToMode "Normal"; }
            // Escape
            bind "Ctrl c" { SwitchToMode "Normal"; }
          }

          // Plugin
          // ------
          shared_except "session" "locked" {
            bind "Ctrl p" { SwitchToMode "Session"; }
          }
          session {
            // Back
            bind "Esc"    { SwitchToMode "Normal"; }
            bind "Ctrl p" { SwitchToMode "Normal"; }
            bind "Ctrl s" { SwitchToMode "Scroll"; }
            // Escape
            bind "Ctrl c" { SwitchToMode "Normal"; }

            bind "d" { Detach; }

            // Plug-ins
            bind "p" {
              LaunchOrFocusPlugin "plugin-manager" {
                floating true
                move_to_focused_tab true
              };
              SwitchToMode "Normal"
            }
            bind "P" {
              LaunchOrFocusPlugin "configuration" {
                floating true
                move_to_focused_tab true
              };
              SwitchToMode "Normal"
            }
          }
        }
      '';  # ..programs.zellij.extraConfig

    };  # ..programs.zellij
  };

  home = {
    packages = with pkgs; [
      wl-clipboard-rs
    ];  # ..packages

    file = {
      # Extra plugins (https://github.com/zellij-org/awesome-zellij)

      ".config/zellij/plugins/sessionizer.wasm".source = pkgs.fetchurl {
        # https://github.com/laperlej/zellij-sessionizer/releases
        url = "https://github.com/laperlej/zellij-sessionizer/releases/download/v0.4.3/zellij-sessionizer.wasm";
        sha256 = "sha256-AGuWbuRX7Yi9tPdZTzDKULXh3XLUs4navuieCimUgzQ=";
      };

      # ".config/zellij/plugins/forgot.wasm".source = pkgs.fetchurl {
      #   # https://github.com/karimould/zellij-forgot/releases
      #   url = "https://github.com/karimould/zellij-forgot/releases/download/0.4.0/zellij_forgot.wasm";
      #   sha256 = "sha256-WdPKHrCtmg0dv446f8KkHNnAk/GKXtufJfCZyLXf7cM=";
      # };
    };  # ..home.file
  };  # ..home
}

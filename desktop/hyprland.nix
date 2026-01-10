{ pkgs, lib, ... }:

# ~/.config/hypr/hyprland.conf
let
  # https://wiki.hypr.land/Configuring/Performance/#how-do-i-make-hyprland-draw-as-little-power-as-possible-on-my-laptop
  high_perf = true;
in
{
  home = {
    packages = with pkgs; [
      mpc
      playerctl
    ];
  };
  wayland = {
    windowManager = {
      # https://nixos.wiki/wiki/Hyprland
      hyprland = {
        # Whether to enable Hyprland wayland compositor
        enable = true;

        # The hyprland package to use
        package = pkgs.hyprland;

        # https://wiki.hyprland.org/Nix/Hyprland-on-Home-Manager/
        # https://wiki.hyprland.org/Nix/Plugins/
        plugins = with pkgs.hyprlandPlugins; [
          borders-plus-plus
          hyprbars
          hyprexpo
        ];
        # ] ++ (with inputs.hyprkool.packages.${pkgs.system}; [
        #   hyprkool-plugin
        # ]);

        # Optional
        # Whether to enable hyprland-session.target on hyprland startup
        systemd = {
          enable = true;
        };

        # Configuration  (~/.config/hypr/hyprland.conf)
        # -------------
        # https://wiki.hypr.land/Configuring/
        settings = {
          xwayland = {
            enable = lib.mkDefault false;
          };

          source = [
            "~/.config/hypr/live.conf"

            # https://wiki.hypr.land/Configuring/Monitors/
            "~/.config/hypr/monitors.conf"
          ];

          # Autostart
          # ---------
          # Autostart necessary processes (like notifications daemons, status bars, etc.)
          # Or execute your favorite apps at launch like this:
          "exec-once" = [
            # "$terminal"
            # "nm-applet &"
            # "waybar & hyprpaper & librewolf"
            "krunner --daemon"
            "hyprpaper"
          ];

          # Look and Feel
          # -------------
          # Refer to https://wiki.hyprland.org/Configuring/Variables/
          # https://wiki.hyprland.org/Configuring/Variables/#general
          general = {
            gaps_in = 5;
            gaps_out = 20;

            border_size = 2;

            # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
            "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
            "col.inactive_border" = "rgba(595959aa)";

            # Set to true enable resizing windows by clicking and dragging on borders and gaps
            resize_on_border = false;

            # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
            allow_tearing = high_perf;

            layout = "dwindle";
          };
          # https://wiki.hyprland.org/Configuring/Variables/#decoration
          decoration = {
            rounding = 10;

            # Change transparency of focused and unfocused windows
            active_opacity = 1.0;
            inactive_opacity = 0.95;

            # https://wiki.hyprland.org/Configuring/Variables/#blur
            blur = {
              enabled = !high_perf;
              size = 3;
              passes = 1;

              vibrancy = 0.1696;
            };
            shadow = {
              enabled = !high_perf;
            };
          };
          # https://wiki.hyprland.org/Configuring/Variables/#animations
          animations = {
            enabled = true;
            # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
            bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
            animation = [
              "windows, 1, 7, myBezier"
              "windowsOut, 1, 7, default, popin 80%"
              "border, 1, 10, default"
              "borderangle, 1, 8, default"
              "fade, 1, 7, default"
              "workspaces, 1, 6, default"
            ];
          };
          # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
          dwindle = {
            pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mod + P in the keybinds section below
            preserve_split = true; # You probably want this
          };
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          # master = {
          # };

          # https://wiki.hypr.land/Configuring/Variables/#misc
          misc = {
            vfr = high_perf;
            force_default_wallpaper = 1; # Set to 0 or 1 to disable the anime mascot wallpapers

            disable_hyprland_logo = true;
            disable_splash_rendering = true;
          };

          # Input
          # -----
          # https://wiki.hyprland.org/Configuring/Variables/#input
          input = {
            follow_mouse = 1;
            sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
            touchpad = {
              natural_scroll = true;
            };

            kb_options = lib.mkDefault (
              lib.concatStringsSep "," [
                # "compose:ralt"
                "ctrl:nocaps"
                "fkeys:basic_13-24"
              ]
            );
          };
          # https://wiki.hyprland.org/Configuring/Variables/#gestures
          gestures = {
            # Defaults
            # workspace_swipe_distance = 300; # 300px. The distance of the touchpad gesture
            # workspace_swipe_touch = false; # Enable workspace swiping from the edge of a touchscreen
            # workspace_swipe_invert = true; # Invert the direction (touchpad only)
            # workspace_swipe_touch_invert = false; # Invert the direction (touchscreen only)
            # workspace_swipe_min_speed_to_force = 30; # 30px/tick. Minimum speed in px per timepoint to force the change ignoring cancel_ratio. Setting to 0 will disable this mechanic.
            # workspace_swipe_cancel_ratio = 0.5; # [0.0 - 1.0]. How much the swipe has to proceed in order to commence it. (0.7 -> if > 0.7 * distance, switch, if less, revert)
            # workspace_swipe_create_new = true; # Whether a swipe right on the last workspace should create a new one
            # workspace_swipe_direction_lock = true; # If enabled, switching direction will be locked when you swipe past the direction_lock_threshold (touchpad only)
            # workspace_swipe_direction_lock_threshold = 10; # 10px. The distance to swipe before direction lock activates (touchpad only)
            # workspace_swipe_forever = false; # If enabled, swiping will not clamp at the neighboring workspaces but continue to the further ones
            # workspace_swipe_use_r = false; # If enabled, swiping will use the r prefix instead of the m prefix for finding workspaces
            # close_max_timeout = 1000; # 1000ms. The timeout for a window to close when using a 1:1 gesture
          };

          # Programs
          # --------
          # See https://wiki.hyprland.org/Configuring/Keywords/
          # Set programs that you use
          "$terminal" = lib.mkDefault "alacritty";
          "$terminal_alt" = lib.mkDefault "konsole";
          "$editor" = lib.mkDefault "emacsclient -c";
          "$browser" = lib.mkDefault "librewolf";
          "$browser_alt" = lib.mkDefault "qutebrowser";
          "$fileManager" = lib.mkDefault "dolphin";
          "$runner" = lib.mkDefault "wofi --allow-images --allow-markup --show drun";
          "$runner_alt" = lib.mkDefault "krunner";

          "$mod" = lib.mkDefault "SUPER";
          "$MOD" = lib.mkDefault "SUPER SHIFT";
          "$cmod" = lib.mkDefault "CONTROL SUPER";
          "$CMOD" = lib.mkDefault "CONTROL SUPER SHIFT";

          # https://wiki.hyprland.org/Configuring/Binds/
          bind = [
            "$mod, q, exec, swaylock"
            "$MOD, Q, exit,"

            # Audio
            ",XF86AudioRaiseVolume, exec, mpc volume +2"
            ",XF86AudioLowerVolume, exec, mpc volume -2"
            ",XF86AudioPlay, exec, playerctl play-pause"
            ",XF86AudioNext, exec, playerctl next"
            ",XF86AudioPrev, exec, playerctl previous"
            # Video
            ",XF86MonBrightnessUp, exec, brightnessctl s +5%"
            ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"

            "$mod, D, killactive,"
            "$mod, M, togglefloating,"
            "$mod, P, pseudo," # dwindle
            "$mod, code:45, togglesplit," # - dwindle
            "$mod, F, fullscreen"

            "$mod, RETURN, exec, $terminal"
            "$MOD, RETURN, exec, $terminal_alt"
            "$mod, E, exec, $fileManager"
            "$mod, U, exec, $editor"
            "$mod, B, exec, $browser"
            "$MOD, B, exec, $browser_alt"
            "$mod, R, exec, $runner"
            "$MOD, R, exec, $runner_alt"

            # Move focus with mod + "arrow" keys
            "$mod, H, movefocus, l"
            "$mod, L, movefocus, r"
            "$mod, K, movefocus, u"
            "$mod, J, movefocus, d"
            # Move workspace
            "$cmod, h, workspace, e-1"
            "$cmod, l, workspace, e+1"
            # Swap windows with mod + SHIFT + "arrow" keys
            "$MOD, H, movewindow, l"
            "$MOD, L, movewindow, r"
            "$MOD, K, movewindow, u"
            "$MOD, J, movewindow, d"

            # Switch workspaces with mod + [0-9]
            "$mod, F1,  workspace, 1"
            "$mod, F2,  workspace, 2"
            "$mod, F3,  workspace, 3"
            "$mod, F4,  workspace, 4"
            "$mod, F5,  workspace, 5"
            "$mod, F6,  workspace, 6"
            "$mod, F7,  workspace, 7"
            "$mod, F8,  workspace, 8"
            "$mod, F9,  workspace, 9"

            # Move active window to a workspace with mod + SHIFT + [0-9]
            "$MOD, F1,  movetoworkspacesilent, 1"
            "$MOD, F2,  movetoworkspacesilent, 2"
            "$MOD, F3,  movetoworkspacesilent, 3"
            "$MOD, F4,  movetoworkspacesilent, 4"
            "$MOD, F5,  movetoworkspacesilent, 5"
            "$MOD, F6,  movetoworkspacesilent, 6"
            "$MOD, F7,  movetoworkspacesilent, 7"
            "$MOD, F8,  movetoworkspacesilent, 8"
            "$MOD, F9,  movetoworkspacesilent, 9"
            "$CMOD, H, movetoworkspace, e-1"
            "$CMOD, L, movetoworkspace, e+1"

            # Example special workspace (scratchpad) (49: DOLLAR $)
            "$mod, code:49, togglespecialworkspace, magic"
            "$MOD, code:49, movetoworkspace, special:magic"

            # Expo
            "$mod, S, hyprexpo:expo, toggle"

            # Scroll through existing workspaces with mod + scroll
            "$mod, mouse_down, workspace, e+1"
            "$mod, mouse_up, workspace, e-1"
          ];
          # Mouse bindings
          bindm = [
            # Move/resize windows with mod + LMB/RMB and dragging
            "$mod, mouse:272, movewindow"
            "$mod, mouse:273, resizewindow"
            "$mod ALT, mouse:272, resizewindow"
          ];

          # Windows and workspaces
          # ----------------------
          # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
          # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules
          windowrule = [
            # "float, ^(kitty)$"
            # "suppressevent maximize, class:.*" # You'll probably like this.
            "immediate, class:^(cs2)$" # Allow tearing in CS2
          ];

          plugin = {
            # https://github.com/hyprwm/hyprland-plugins/tree/main/hyprexpo
            "hyprexpo" = {
              columns = 3;

              enable_gesture = true;
              gesture_fingers = 3; # 3 or 4
              gesture_distance = 300; # how far is the "max"
              gesture_positive = true; # positive = swipe down. Negative = swipe up.
            };
          };
        };

        extraConfig = ''
          # extraConfig
        '';

      };
    };
  };
}

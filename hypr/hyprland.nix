{ config, pkgs, ...}:

{
    wayland.windowManager.hyprland = {
        enable = true;
        extraConfig = ''

        '';
        settings = {
            monitor = [ "eDP-1,1920x1080,auto,1" ];

            exec-once =[
                "hyprpaper"
                "hypridle"
                "waybar"
                "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
                "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
            ];

            env = [
                "XCURSOR_SIZE,24"
                "XCURSOR_THEME,Bibata-Modern-Classic"

                "XDG_CURRENT_DESKTOP,Hyprland"
                "XDG_SESSION_TYPE,wayland"
                "XDG_SESSION_DESKTOP,Hyprland"

                "GDK_BACKEND,wayland"
                "QT_QPA_PLATFORM, wayland"
                "QT_QPA_PLATFORMTHEME,qt5ct"
                "QT_AUTO_SCREEN_SCALE_FACTOR,1"
                "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
            ];

            general = {
                layout = "dwindle";
                gaps_in = 5;
                gaps_out = 10;
                border_size = 2;
                "col.active_border" = "rgba(8caaeeee)";
                "col.inactive_border" = "rgba(595959aa)";
                resize_on_border = true;
                hover_icon_on_border = true;
                allow_tearing = false;
            };

            dwindle = {
                pseudotile = false;
                preserve_split = true;
                force_split = 2;
                smart_resizing = true;
            };
            # master = {
            #     orientation = "right";
            # };

            decoration = {
                rounding = 10;
                active_opacity = 1.0;
                inactive_opacity = 1.0;
                blur = {
                    enabled = true;
                    size = 6;
                    passes = 3;
                    new_optimizations = true;
                    xray = true;
                    ignore_opacity = true;
                };
                drop_shadow = false;
            };

            animations = {
                enabled = true;
                bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
                animation = [
                    "windows, 1, 7, myBezier"
                    "windowsOut, 1, 7, default, popin 80%"
                    "border, 1, 10, default"
                    "borderangle, 1, 8, default"
                    "fade, 1, 7, default"
                    "workspaces, 1, 6, default,slidevert"
                ];
            };

            input = {
                kb_layout = "us";
                numlock_by_default = true;
                touchpad = {
                    natural_scroll = true;
                    disable_while_typing = true;
                    tap-and-drag = true;
                };
            };

            gestures = {
                workspace_swipe = true;
            };

            xwayland = {
                force_zero_scaling = true;
            };

            misc = {
                force_default_wallpaper = 0;
                disable_hyprland_logo = true;
                disable_splash_rendering = true;
                disable_autoreload = false;
                vfr = true;
                vrr = 0;
            };

            device = {
                name = "epic-mouse-v1";
                sensitivity = -0.5;
            };

            windowrule = [
                "float,^(galculator)$"
                "move 80% 30%,title:^(galculator)(.*)$"
                "float,^(pavucontrol)$"
            ];

            windowrulev2 = [
                "float,class:^(transmission-gtk)$,title:^(Transmission)$"
                "suppressevent maximize, class:.*"
                "suppressevent float, class:.* "
                "opacity 0.80 0.80,class:^(thunar)$"
                "opacity 0.80 0.70,class:^(pavucontrol)$"
            ];

            bind = [
                "SUPER , L, exec, hyprlock"
                "SUPER, W, killactive"

                "SUPER, RETURN, exec, alacritty"
                "SUPER, E, exec, thunar"
                "SUPER, R, exec, rofi -show drun"
                "SUPER, C, exec, galculator"

                "SUPER, F, togglefloating, "
                "SUPER  CTRL, F, exec, hyprctl dispatch workspaceopt allfloat"
                "SUPER, B, fullscreen"

                ", XF86MonBrightnessUp, exec, brightnessctl -q s +5%"
                ", XF86MonBrightnessDown, exec, brightnessctl -q s 5%-"

                ", PRINT, exec, ~/Configs/scripts/scrsht.sh"
                "SUPER, Alt_R, exec, ~/Configs/scripts/wifi.sh"

                "SUPER, left, movefocus, l"
                "SUPER, right, movefocus, r"
                "SUPER, up, movefocus, u"
                "SUPER, down, movefocus, d"

                "SUPER, 1, workspace, 1"
                "SUPER, 2, workspace, 2"
                "SUPER, 3, workspace, 3"
                "SUPER, 4, workspace, 4"
                "SUPER, 5, workspace, 5"

                "SUPER CTRL, left, resizeactive, -30 0"
                "SUPER CTRL, right, resizeactive, 30 0"
                "SUPER CTRL, up, resizeactive, 0 -30"
                "SUPER CTRL, down, resizeactive, 0 30"

                "SUPER SHIFT, 1, movetoworkspace, 1"
                "SUPER SHIFT, 2, movetoworkspace, 2"
                "SUPER SHIFT, 3, movetoworkspace, 3"
                "SUPER SHIFT, 4, movetoworkspace, 4"
                "SUPER SHIFT, 5, movetoworkspace, 5"

                "SUPER SHIFT, left, swapwindow, l"
                "SUPER SHIFT, right, swapwindow, r"
                "SUPER SHIFT, up, swapwindow, u"
                "SUPER SHIFT, down, swapwindow, d"

                "SUPER, S, togglespecialworkspace, magic"
                "SUPER SHIFT, S, movetoworkspace, special:magic"

                "SUPER, mouse_down, workspace, e+1"
                "SUPER, mouse_up, workspace, e-1"
            ];

            bindm = [
                "SUPER, mouse:272, movewindow"
            ];

            bindel = [
                ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
                ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ];

            bindl = [
                ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ];
        };
    };
}
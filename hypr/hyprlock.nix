{ config, pkgs, ...}:

{
    programs.hyprlock = {
        enable = true;
        settings = {
            general = {
                hide_cursor = true;
            };

            background = [
                {
                    path = "/home/hari/NixConfig/pic/lock.jpg";
                    blur_passes = 0;
                    
                    noise = 0.0117;
                    contrast = 0.8916;
                    brightness = 0.8172;
                    vibrancy = 0.1696;
                    vibrancy_darkness = 0.0;

                    new_optimizations = true;
                    ignore_opacity = false;
                }
            ];

            input-field = [
                {
                    size = "400, 10";
                    outline_thickness = 1;
                    dots_size = 0;

                    fade_on_empty = false;
                    fail_transition = 100;

                    inner_color = "rgba(170, 170, 170, 0.5)";
                    outer_color = "rgba(170, 170, 170, 0.5)";
                    capslock_color = "rgba(0, 0, 170, 0.5)";

                    position = "-50, 50";
                    halign = "right";
                    valign = "bottom";
                
                    shadow_passes = 5;
                    shadow_size = 10;
                    shadow_boost = 2;
                    shadow_color = "rgba(0, 0, 0)";
                }
            ];

            label = [
                {
                    text = ''cmd[update:1000] echo "<span>$(date '+%A,%d %B')</span>"'';
                    color = "rgba(250, 250, 250, 0.7)";
                    
                    font_size = 45;
                    font_family = "FiraCode SemiBold Italic";

                    position = "-50, 60";
                    halign = "right";
                    valign = "bottom";

                    shadow_passes = 3;
                    shadow_size = 7;
                    shadow_boost = 1.7;
                    shadow_color = "rgba(0, 0, 0)";
                }
                {
                    text = ''cmd[update:1000] echo "<span>$(date '+%I:%M %p ')</span>"'';
                    color = "rgba(250, 250, 250, 0.7)";
                    font_size = 45;
                    font_family = "FiraCode SemiBold Italic";

                    position = "-19, -15";
                    halign = "right";
                    valign = "bottom";

                    shadow_passes = 3;
                    shadow_size = 7;
                    shadow_boost = 1.7;
                    shadow_color = "rgba(0, 0, 0)";
                }
            ];
        };
    };
}
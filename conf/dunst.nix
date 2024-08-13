{ config, pkgs, ...}:

{
    services.dunst = {
        enable = true;
        iconTheme = {
            name = "Papirus-Dark";
            package = pkgs.papirus-icon-theme;
            size = "16x16";
        };
        settings = {
            global = {
                montior = 0;
                follow = "none";
                indicate_hidden = "yes";
                markup = "full";

                notification_limit = 5;
                separator_height = 2;
                line_height = 0;

                offset = "10x10";
                origin = "right-top";
                width = "(300,500)";
                height = "(0,300)";
                corner_radius = 10;

                padding = 10;
                horizontal_padding = 10;
                text_icon_padding = 10;

                frame_width = 3;
                frame_color = "#8AADF4";
                separator_color= "frame";

                sort = "update";
                idle_threshold = 30;

                font = "FiraCode Font 10";
                format = "<b>%s</b>\n<i>%b</i>";

                alignment = "left";
                vertical_alignment = "center";

                word_wrap = "yes";
                stack_duplicates = true;
                hide_duplicate_count = false;

                show_age_threshold = 60;
                show_indicators = "yes";

                min_icon_size = 0;
                max_icon_size = 64;

                title = "Dunst";
                class = "Dunst";

                mouse_left_click = "close_current";
                mouse_middle_click = "do_action, close_current";
                mouse_right_click = "close_all";
            };

            urgency_low = {
                background = "#24273A";
                foreground = "#CAD3F5";
                frame_color = "#fab387";
                timeout = 5;
            };

            urgency_normal = {
                background = "#24273A";
                foreground = "#CAD3F5";
                timeout = 7;
            };

            urgency_critical = {
                background = "#24273A";
                foreground = "#CAD3F5";
                frame_color = "#f38ba8";
                timeout = 0;
            };
        };
    };
}
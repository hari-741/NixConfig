{ config, pkgs, ...}:

{
    programs.btop = {
        enable = true;
        settings = {
            color_theme = "nord";
            theme_background = false;

            presets = "cpu:1:default,proc:0:default cpu:0:default,mem:0:default,net:0:default cpu:0:block,net:0:tty";
            shown_boxes = "mem net proc cpu";
            update_ms = 1000;

            proc_sorting = "memory";
            proc_per_core = false;

            temp_scale = "celsius";

            base_10_sizes = false;
            show_cpu_freq = true;

            background_update = true;
            show_uptime = false;

            cpu_graph_upper = "Auto";
            cpu_graph_lower = "Auto";

            mem_graphs = false;

            show_battery = true;
            selected_battery = "BAT1";
            show_battery_watts = true;

        };
    };
}
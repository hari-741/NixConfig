{ config, pkgs, ...}:

{
    programs.fastfetch = {
        enable = true;
        settings = {
            logo = {
                source = "nixos_old_small";
                padding = {
                    top = 2;
                    left = 2;
                };
            };
            display = {
                separator = "\t : ";
            };
            modules = [
                "break"
                {
                    type = "title";
                }
                {
                    type = "custom";
                    format = "╺ FastFetch ━━━━━━━━━━━━━━━━━━━━━━╸";
                }
                {
                    type = "host";
                    key = " Host";
                }
                {
                    type = "kernel";
                    key = " Kernel";
                }
                {
                    type = "cpu";
                    key = "󰻠 CPU";
                }
                {
                    type = "gpu";
                    key = "󰢮 GPU";
                }
                {
                    type = "disk";
                    key = " Disk";
                }
                {
                    type = "uptime";
                    key = " Uptime";
                }
                {
                    type = "custom";
                    format = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━";
                }
            ];
        };
    };
}

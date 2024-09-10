{ config, pkgs, ...}:

{   
    programs.waybar ={
        enable = true;
        settings = {
            mainBar = {
                layer = "top";
                position = "left";
                width = 46;
                spacing = 0;
                output = [
                "eDP-1"
                "HDMI-A-1"
                ];
                margin = "10px 0px 10px 10px";
                modules-left = [ "hyprland/workspaces" "clock" ];
                modules-right = [ "idle_inhibitor" "group/light" "group/audio" "network" "battery" "group/power" ];
                "group/light" = {
                    orientation = "vertical";
                    drawer = {
                        transition-duration = 300;
                        transition-left-to-right = false;
                    };
                    modules = [ "backlight" "backlight/slider" ];
                };
                "group/audio" = {
                    orientation = "vertical";
                    drawer = {
                        transition-duration = 300;
                        transitio-left-to-right = false;
                    };
                    modules = [ "pulseaudio" "pulseaudio/slider" ];
                };
                "group/power" = {
                    orientation = "vertical";
                    drawer = {
                        transition-duration = 300;
                        transition-left-to-right = false;
                    };
                    modules = [ "custom/shutdown" "custom/reboot" ];
                };
                "hyprland/workspaces" = {
                    persistent-workspaces = {
                        "*" = 5;
                    };
                    format = "{icon}";
                    format-icons = {
                        "1" = "α";
                        "2" = "β";
                        "3" = "γ";
                        "4" = "δ";
                        "5" = "ε";
                    };
                    on-click = "activate";
                };
                clock = {
                    timezone = "Asia/Kolkata";
                    tooltip-format = "{:%A, %d %B}";
                    format = "{:%I\n%M}";
                };
                idle_inhibitor = {
                    format = "{icon}";
                    format-icons = {
                        activated = "󰒳";
                        deactivated = "󰒲";
                    };
                    tooltip-format-activated = "Activated";
                    tooltip-format-deactivated = "Deactivated";
                };
                network = {
                    format = "{icon}";
                    format-icons = {
                        wifi = [""];
                        ethernet = ["󰈀"];
                        disconnected = ["󰖪"];
                        disabled = ["󰲛"];
                    };
                    tooltip-format = "{ifname}";
                    tooltip-format-wifi = "{essid}";
                    tooltip-format-ethernet = "{ifname} (No Ip)";
                };
                "backlight/slider" = {
                    min = 0;
                    max = 100;
                    orientation = "vertical";
                    device = "acpi_video1";

                };
                backlight = {
                    scroll-step = 5;
                    device = "acpi_video1";
                    tooltip-format = "{percent}%";
                    format = "{icon}";
                    states = {
                        low = 0;
                        mid = 35;
                        high = 70;
                    };
                    format-icons = [ "󰃞" "󰃝" "󰃠"]; 
                };
                "pulseaudio/slider" = {
                    min = 0;
                    max = 100;
                    orientation = "vertical";
                };
                pulseaudio = {
                    scroll-step = 10;
                    format = "{icon}";
                    format-muted = "󰝟";
                    format-bluetooth = "";
                    format-bluetooth-muted = "󰂲";
                    max-volume = 100;
                    format-icons = {
                        headphone = "󰋋";
                        headset = "󰋎";
                        phone = "";
                        default = [ "" "" "󰕾" ];
                    };
                    on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
                    on-click-right = "pavucontrol";
                    tooltip-format = "{volume}%";
                };
                battery = {
                    states = {
                        good = 80;
                        warning = 30;
                        critical = 15;
                    };
                    interval = 3;
                    tooltip-format = "{capacity}%";
                    format = "{icon}";
                    format-plugged = "";
                    format-charging = "󰂄";
                    format-icons = [ "󰁻" "󰁽" "󰁿" "󰂁" "󰁹"];
                };
                "custom/shutdown" = {
                    format = "";
                    tooltip = false;
                    on-click = "systemctl poweroff";
                };
                "custom/reboot" = {
                    format = "󰜉";
                    tooltip = false;
                    on-click = "systemctl reboot";
                };
            };
        };
        style = ''
            * {
                font-family: "FiraCode";
                font-weight: bold;
                border-radius: 10px;
            }

            window#waybar {
                background: transparent;
                transition-property: background-color;
                transition-duration: 0.5s;
            }

            tooltip {
                background: rgba(43, 48, 59, 0.5);
                border: 1px solid #8aadf4;
                border-radius: 5px;
            }
            tooltip label {
                color: white;
            }

            #workspaces {
                font-size: 17px;
                background: #24273a;
                color: #cad3f5;
                border: 1px solid #8aadf4;
                padding: 10px 0px 10px 0px;
            }
            #workspaces button.empty {
                opacity: 0.5;
            }
            #workspaces button.visible {
                opacity: 1;
                color: #8aadf4;
            }

            #clock {
                background: #24273a;
                color: #cad3f5;
                border: 1px solid #8aadf4;
                margin: 15px 0px 0px 0px;
                padding: 10px 0px 10px 0px;
                font-size: 18px;
            }

            #idle_inhibitor,
            #battery,
            #network,
            #pulseaudio,
            #pulseaudio-slider,
            #backlight,
            #backlight-slider,
            #custom-shutdown,
            #custom-reboot,
            #custom-hibernate {
                font-size: 25px;
                background: #24273a;
                border-left: 1px solid #8aadf4;
                border-right: 1px solid #8aadf4;
                border-radius: 0px;
            }

            #idle_inhibitor {
                border-top: 1px solid #8aadf4;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
                padding: 10px 5px 5px 0px;
                color: #8aadf4;
            }
            #idle_inhibitor.activated {
                color: #ad5d69;
            }

            #backlight-slider slider {
                min-height: 0px;
                min-width: 0px;
                opacity: 0;
                background-image: none;
                border: none;
                box-shadow: none;
            }
            #backlight-slider trough {
                min-height: 80px;
                min-width: 10px;
                border-radius: 5px;
                background-color: black;
            }
            #backlight-slider highlight {
                min-width: 10px;
                border-radius: 5px;
                background-color: red;
            }
            #backlight {
                padding: 0px 5px 5px 0px;
            }
            #backlight.high {
               color: #8aadf4;
            }
            #backlight.mid {
                color: #f5a97f;
            }
            #backlight.low {
                color: #ad5d69;
            }

            #pulseaudio-slider slider {
                min-height: 0px;
                min-width: 0px;
                opacity: 0;
                background-image: none;
                border: none;
                box-shadow: none;
            }
            #pulseaudio-slider trough {
                min-height: 80px;
                min-width: 10px;
                border-radius: 5px;
                background-color: black;
            }
            #pulseaudio-slider highlight {
                min-width: 10px;
                border-radius: 5px;
                background-color: green;
            }
            #pulseaudio {
                color: #8aadf4;
                padding: 0px 0px 5px 0px;
            }
            #pulseaudio.muted {
                color: #ad5d69;
            }

            #network {
                font-size: 24px;
                padding: 0px 5px 5px 0px;
            }
            #network.wifi {
                padding: 0px 10px 5px 0px;
                font-size: 20px;
                color: #8aadf4;
                font-size: 20px;
            }
            #network.ethernet {
                color: #f5a97f;
            }
            #network.disconnected {
                color: #ad5d69;
            }

            #battery {
                font-size: 26px;
                padding: 0px 0px 5px 0px;
                color: #8aadf4;
            }
            #battery.warning {
                color: #f5a97f;
            }
            #battery.critical {
                color: #ad5d69;
            }
            #battery.charging {
                color: #497964;
            }

            #custom-shutdown {
                border-bottom: 1px solid #8aadf4;
                border-bottom-left-radius: 10px;
                border-bottom-right-radius: 10px;
                font-size: 19px;
                color: #ad5d69;
                padding: 0px 4px 10px 0px;
            }
            #custom-reboot {
                color: #f5a97f;
                padding: 0px 0px 5px 1px;
            }
        '';
    };
	
}

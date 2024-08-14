{ config, pkgs, ...}:

{
    services.hyprpaper = {
        enable = true;
        settings = {
            splash = false;
            preload = [ "/home/hari/Pictures/Wallpaper/11.jpg" ];
            wallpaper = [ ",/home/hari/Pictures/Wallpaper/11.jpg" ];  
        };
    };
}
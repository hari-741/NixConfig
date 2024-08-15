{ config, pkgs, ...}:

{
    services.hyprpaper = {
        enable = true;
        settings = {
            splash = false;
            preload = [ "/home/hari/Configs/pic/background.jpg" ];
            wallpaper = [ ",/home/hari/Configs/pic/background.jpg" ];  
        };
    };
}
{ config, pkgs, ...}:

{
    services.hyprpaper = {
        enable = true;
        settings = {
            splash = false;
            preload = [ "/home/hari/NixConfig/pic/background.jpg" ];
            wallpaper = [ ",/home/hari/NixConfig/pic/background.jpg" ];  
        };
    };
}
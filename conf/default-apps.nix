{ config, pkgs, ...}:

{
    xdg.mimeApps = {
        enable = true;
        associations.added = {
            "application/json" = "code.desktop";
            "image/jpeg" = [ "feh.desktop" "feh-dir.desktop" ];
            "image/png" = "feh.desktop";
            "x-scheme-handler/magnet" = "userapp-transmission-gtk-ZHIYQ2.desktop";
        };
        defaultApplications = {
            "image/jpeg"="feh-dir.desktop";
            "image/png"="feh.desktop";
            "image/jpg"="feh.desktop";
            "application/pdf"="org.pwmt.zathura.desktop";
            "text/html"="brave-browser.desktop";
            "x-scheme-handler/http"="brave-browser.desktop";
            "x-scheme-handler/https"="brave-browser.desktop";
            "x-scheme-handler/about"="brave-browser.desktop";
            "x-scheme-handler/unknown"="brave-browser.desktop";
            "x-scheme-handler/magnet"="userapp-transmission-gtk-ZHIYQ2.desktop";
        };
    };
}
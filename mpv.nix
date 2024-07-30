{ config, pkgs, ...}:

{
    programs.mpv = {
        enable = true;
        bindings = {
            UP = "add volume +2";
            DOWN = "add volume -2";
            RIGHT = "osd-msg-bar seek +5  relative";
            LEFT = "osd-msg-bar seek -5  relative";
            SPACE = "cycle pause";
            "q" = "quit";
            "s" = "cycle sub";
            "a" = "cycle audio";
        };
    };
}
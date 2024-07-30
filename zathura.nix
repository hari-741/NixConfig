{ config, pkgs, ...}:

{
    programs.zathura = {
        enable = true;
        mappings = {
             D = "set 'first-page-column 1:1'";
             i = "recolor";
             "-" = "zoom out";
             "+" = "zoom in";
             "<C-Space>" = "toggle_statusbar";
        };
        options = {
            adjust-open = "width";
            # "font "FiraCode"
            guioptions = "none";
            incremental-search = true;
            recolor = true;
            selection-clipboard = "clipboard";
            statusbar-basename = true;
            smooth-scroll = true;
            window-title-basename = true;
            zoom-step = 5;

            default-bg = "rgba(0,0,0,.85)";

            recolor-darkcolor = "#c0caf5";
            recolor-lightcolor = "rgba(0,0,0,0)";

            inputbar-bg = "#141412";
            inputbar-fg = "#e5e0c9";
        };
        # extraConfig = "";
    };
}
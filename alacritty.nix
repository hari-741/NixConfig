{ config, pkgs, ...}:

{

    programs.alacritty = {
        enable = true;
        settings = {
            window = {
                opacity = 0.5;
                padding = {
                    x = 20;
                    y = 20;
                };
                position = {
                    x = 7;
                    y = 7;
                };
            };

            cursor.style = {
                shape = "Beam";
            };

            font = {
                size = 13;
                normal = {
                    family = "FiraCode Nerd Font";
                    style = "Regular";
                };
                bold = {
                    family = "FiraCode Nerd Font";
                    style = "Bold";
                };
                bold_italic = {
                    family = "FiraCode Nerd Font";
                    style = "Bold Italic";
                };
                italic = {
                    family = "FiraCode Nerd Font";
                    style = "Italic";
                };
            };
            
        };
    };  
  
}

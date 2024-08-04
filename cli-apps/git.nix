{ config, pkgs, ...}:

{
    programs.git = {
        enable = true;
        userName = "Hariprasaad";
        userEmail = "1hariprasaad@gmail.com";
        extraConfig = {
            init.defaultBranch = "main";
            core.editor = "code --wait";
            core.autocrlf = "input";
            # core.excludesfile = "~/.gitignore";
        };
    };
}
{ config, pkgs, ...}:

{
    programs.vim = {
        enable = true;
        defaultEditor = true;
        settings = {
            background = "dark";
            expandtab = true;
            history = 1000;
            ignorecase = true;
            mouse = "a";
            number = true;
            shiftwidth = 4;
            smartcase = true;
            tabstop = 4;
        };
        extraConfig = "
            set autoindent
            set hlsearch
            set incsearch
            set showmatch
            set nobackup
            set nocompatible
            set nowrap
            set wildmenu
            set wildmode=list:longest
            filetype on
            filetype indent on
            syntax on
        ";
    };
}

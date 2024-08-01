{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./fastfetch.nix
    ./feh.nix
    ./git.nix
    ./mpv.nix
    ./vim.nix
    ./zathura.nix
    ./zsh.nix
  ];
  home.username = "hari";
  home.homeDirectory = "/home/hari";

  home.stateVersion = "24.05"; 

  home.packages = with pkgs;[
    appimage-run
    fastfetch
    dunst
    fd
    feh
    libnotify
    mangohud
    protonup
    starship
    zsh

    alacritty
    brave
    galculator
    guvcview
    libreoffice-fresh
    mpv
    pavucontrol
    rofi-wayland
    steam
    transmission-gtk
    vscode
    waybar
    xfce.thunar
    xfce.thunar-volman
    xfce.tumbler
    zathura

    dejavu_fonts
    fira-code-nerdfont
  ];

  home.file."Configs/sudo.plugin.zsh" = {
    source = ./sudo.plugin.zsh;
    executable = true;
  };

  home.file."Configs/extract.plugin.zsh" = {
    source = ./extract.plugin.zsh;
    executable = true;
  };

  fonts.fontconfig ={
    enable = true;
    defaultFonts = {
      monospace = [ "FiraCode Nerd Font" ];
      sansSerif = [ "DejaVu Sans" ];
      serif = [ "DejaVu Serif" ];
    };
  };
  
  gtk = {
    enable = true;

    theme.package = import ./catppuccin-gtk.nix { inherit pkgs; };
    theme.name = "catppuccin-mocha-blue-standard+default";

    cursorTheme.package = pkgs.bibata-cursors;
    cursorTheme.name = "Bibata-Modern-Classic";

    iconTheme.package = pkgs.papirus-icon-theme ;
    iconTheme.name = "breeze-dark";
  };

  qt.enable = true;
  qt.platformTheme.name = "gtk";

  home.sessionVariables = {
    # DISPLAY = ":0";
    # EDITOR = "emacs";
  };
   
  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;

  programs.home-manager.enable = true;
}

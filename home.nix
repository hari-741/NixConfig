{ config, pkgs, ... }:

{
  imports = [
    ./conf/git.nix
    ./conf/dunst.nix

    ./cli/btop.nix
    ./cli/fastfetch.nix
    ./cli/vim.nix

    ./gui/alacritty.nix
    ./gui/mpv.nix
    ./gui/zathura.nix
    
    ./hypr/hyprland.nix
    ./hypr/hypridle.nix
    ./hypr/hyprlock.nix
    ./hypr/hyprpaper.nix

    ./theme/waybar.nix
    
    ./zsh/zsh.nix
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
    starship
    zsh

    alacritty
    brave
    galculator
    guvcview
    mpv
    pavucontrol
    rofi-wayland
    transmission-gtk
    vscode
    waybar
    xfce.thunar
    xfce.thunar-volman
    xfce.tumbler
    xfce.xfconf
    zathura

    dejavu_fonts
    fira-code-nerdfont    
  ];

  home.file."NixConfig/zsh/sudo.plugin.zsh" = {
    source = ./zsh/sudo.plugin.zsh;
    executable = true;
  };

  home.file."NixConfig/zsh/extract.plugin.zsh" = {
    source = ./zsh/extract.plugin.zsh;
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

    theme.package = import ./theme/catppuccin-gtk.nix { inherit pkgs; };
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

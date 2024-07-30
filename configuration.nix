{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.resumeDevice = "/dev/nvme0n1p2";
  boot.initrd.verbose = false;
  boot.consoleLogLevel = 0;
  # boot.tmp.cleanOnBoot = true;
  boot.kernelParams = ["quiet" "splash"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.timeout = 0;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [ intel-media-sdk ];
  };

  hardware.bluetooth.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    open = false;  # Use the NVidia open source kernel module
  };  
   
  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  networking.hostName = "Ark";
  networking.networkmanager.enable = true; 

  time.timeZone = "Asia/Kolkata";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    # font = "Lat2-Terminus16";
    keyMap = "us";
    # useXkbConfig = true; # use xkb.options in tty.
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # xdg.portable = true;
  # xdg.portable.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
  };

  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };
  services.thermald.enable = true;
  powerManagement.powertop.enable = true;

  services.blueman.enable = true;
  services.hypridle.enable = true;

  services.gvfs.enable = true;
  services.libinput.enable = true;
  services.printing.enable = true;
  services.xserver.videoDrivers = ["nvidia"];

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  security.polkit.enable = true;

  users.users.hari = {
    isNormalUser = true;
    home = "/home/hari";
    description = "Hariprasaad";
    extraGroups = [ "wheel" "networkmanager" ]; 
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    auto-cpufreq
    bat
    brightnessctl
    btop
    exfat
    exfatprogs
    eza
    gh
    git
    gvfs
    hplip
    hypridle
    hyprlock
    hyprpaper
    hyprshot
    jdk
    libsForQt5.qt5.qtgraphicaleffects
    ntfs3g
    python3
    tldr
    unrar
    unzip
    vim
  ];

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    QT_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland";
    # WLR_DRM_DEVICES,/dev/dri/card1
    # WLR_DRM_NO_ATOMIC,1
    NIXOS_OZONE_WL = "1";
    STEAM_EXTRA_COMPAT_TOOLS = "/home/hari/.steam/root/compatibilitytools.d/";
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.zsh.enable = true;

  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
 
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}

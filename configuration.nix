{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.hardwareClockInLocalTime = true;

  boot.resumeDevice = "/dev/disk/by-uuid/12827ae8-621d-4407-bc22-f15da497c711";
  boot.initrd.verbose = false;
  boot.consoleLogLevel = 0;
  # boot.tmp.cleanOnBoot = true;
  boot.kernelParams = ["quiet" "splash" "i915.enable_guc=2"];
  boot.blacklistedKernelModules = [ "nouveau" "nvidia" "nvidia_drm" "nvidia_modeset" ];
  boot.extraModprobeConfig = ''
    blacklist nouveau
    options nouveau modeset=0
  '';

  boot.loader = {
    timeout = 5;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
    grub2-theme = {
      enable = true;
      theme = "whitesur";
      icon = "whitesur";
      splashImage = builtins.fetchurl {
        url = "file:///home/hari/Configs/pic/boot.png";
        sha256 = "91e8142bad98b48ec6dcffe922a7167451a5a8de12d7fe3138e98e6e83f124a1";
      };
      footer = true;
    };
  };
  
  hardware.opengl = {
    enable = true;
    driSupport = true;
    extraPackages = with pkgs; [ intel-media-sdk ];
  };

  hardware.bluetooth.enable = true;
   
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
  
  services.udev.extraRules = ''
    # Remove NVIDIA USB xHCI Host Controller devices, if present
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c0330", ATTR{power/control}="auto", ATTR{remove}="1"
    # Remove NVIDIA USB Type-C UCSI devices, if present
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c8000", ATTR{power/control}="auto", ATTR{remove}="1"
    # Remove NVIDIA Audio devices, if present
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{power/control}="auto", ATTR{remove}="1"
    # Remove NVIDIA VGA/3D controller devices
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", ATTR{power/control}="auto", ATTR{remove}="1"
  '';

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
  };

  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      scaling_min_freq = 800000;
      scaling_max_freq = 1500000;
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };
  services.thermald.enable = true;
  powerManagement.powertop.enable = true;

  services.hypridle.enable = true;

  services.gvfs.enable = true;
  services.libinput.enable = true;

  # services.blueman.enable = true;
  # services.printing.enable = true;
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
    # hplip
    hypridle
    hyprlock
    hyprpaper
    hyprshot
    libsForQt5.qt5.qtgraphicaleffects
    ntfs3g
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
  };

  programs.hyprland = {
    enable = true;
  };

  programs.zsh.enable = true;
 
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
